<template>
  <div class="map">
    <el-autocomplete
      style="width: 100%"
      class="mb8"
      v-model="keyword"
      :fetch-suggestions="fetchLocationData"
      placeholder="请输入查询关键字"
      @select="handleSelect"
    >
      <i slot="prefix" class="el-input__icon el-icon-search"></i>
    </el-autocomplete>

    <div id="mapBox" class="map-box" style="width: 100%; height: 100%;"></div>

    <div class="map-tool">
      <el-button type="primary" plain size="mini" :disabled="!!polygon" @click="handleCreateBthClick">新建</el-button>
      <el-button type="success" plain size="mini" @click="handleCreateBthClick">编辑</el-button>
      <el-button type="warning" plain size="mini" @click="handleClearBthClick">清除</el-button>
      <el-button type="danger" plain size="mini" @click="handleCloseBthClick">结束</el-button>
    </div>
  </div>
</template>

<script>
import AMapLoader from "@amap/amap-jsapi-loader";
import amapConfig from "@/config/amap";

export default {
  name: "DrawArea",
  props: {
    polygonPath: {
      type: String,
      default: ''
    },
    polygonStyle: {
      type: Object,
      default: () => {
        return {
          fillColor: '#26EB23',
          fillOpacity: 0.5,
          strokeColor: '#00D3FC',
          strokeOpacity: 0.9,
          strokeWeight: 2
        }
      }
    }
  },
  data() {
    return {
      keyword: "",
      searchOverlays: [],
      polygon: null,
      map: null,
      polygonEditor: null,
      placeSearch: null,
      AMapInstance: null // 缓存 SDK 实例
    };
  },
  watch: {
    polygonStyle: {
      handler: function (n, o) {
        if (this.polygon) {
          this.resetPolygonStyle();
        }
      },
      deep: true
    }
  },
  mounted() {
    // ⚡ 优化1：移除 mounted 上的 async/await，改为非阻塞加载，大幅提升页面打开速度
    this.loadAMapSDK();
  },
  beforeDestroy() {
    if (this.map) {
      this.map.destroy();
    }
  },
  methods: {
    /** ⚡ 优化2：整合加载逻辑，使用青蛙项目的非阻塞链式调用 */
    loadAMapSDK() {
      window._AMapSecurityConfig = {
        securityJsCode: amapConfig.securityJsCode,
      };

      AMapLoader.load({
        key: amapConfig.key,
        version: amapConfig.version || "2.0",
        plugins: amapConfig.plugins || ['AMap.Scale', 'AMap.MapType', 'AMap.PlaceSearch', 'AMap.PolygonEditor'],
      }).then((AMap) => {
        this.AMapInstance = AMap;

        // 渲染地图和围栏同步并行，不再排队等待
        this.initMap();
        this.initPolygonEditor();
      }).catch((e) => {
        console.error("高德地图加载失败", e);
      });
    },

    /** 初始化 map */
    initMap() {
      const AMap = this.AMapInstance;
      const { mapConfig, searchConfig } = amapConfig;

      this.map = new AMap.Map("mapBox", {
        viewMode: mapConfig.viewMode || "3D",
        mapStyle: mapConfig.mapStyle,
        zoom: mapConfig.zoom || 16,
        center: mapConfig.center || [120.153106, 33.348826],
        layers: [
          new AMap.TileLayer.Satellite()
        ],
      });

      // 快速添加内置控件
      this.map.addControl(new AMap.Scale());
      this.map.addControl(new AMap.MapType());

      // 快速初始化搜索
      this.placeSearch = new AMap.PlaceSearch({ city: searchConfig.city || '全国' });
    },

    /** 初始化围栏编辑器 */
    initPolygonEditor(isData = true) {
      const AMap = this.AMapInstance;

      if (this.polygonPath && isData) {
        const pathArray = this.polygonPath.split('|').map(item => item.split(','));
        this.polygon = new AMap.Polygon({
          path: pathArray,
          ...this.polygonStyle // 直接解构样式，效率更高
        });
        this.map.add(this.polygon);
        this.polygonEditor = new AMap.PolygonEditor(this.map, this.polygon);
      } else {
        this.polygonEditor = new AMap.PolygonEditor(this.map);
      }

      this.polygonEditor.on('add', ({ target: polygon }) => {
        this.polygon = polygon;
        this.resetPolygonStyle();
        this.emitPath();
      });

      this.polygonEditor.on('adjust', ({ target: polygon }) => {
        this.polygon = polygon;
        this.emitPath();
      });
    },

    /** 统一经纬度数据向外传递 */
    emitPath() {
      if (this.polygon) {
        const path = this.polygon.getPath().map(lngLat => `${lngLat.lng},${lngLat.lat}`);
        this.$emit('change-path', path.join('|'));
      }
    },

    /** 位置查询处理 */
    fetchLocationData(queryString, cb) {
      if (queryString && this.placeSearch) {
        clearTimeout(this.timer);
        this.timer = setTimeout(() => {
          this.placeSearch.search(queryString, (status, result) => {
            if (status === 'complete' && result.poiList) {
              cb(result.poiList.pois.map(item => ({ ...item, value: item.name + ' (' + (item.address || '') + ')' })))
            } else {
              cb([])
            }
          });
        }, 800); // 调低节流时间，搜索更灵敏
      } else {
        cb([]);
      }
    },

    handleSelect(item) {
      if (this.map && item.location) {
        const { lng, lat } = item.location;
        this.map.panTo([lng, lat]);
      }
    },

    handleCreateBthClick() {
      if (this.polygonEditor) {
        this.polygonEditor.close();
        this.polygonEditor.open();
      }
    },

    handleCloseBthClick() {
      if (this.polygonEditor) {
        this.polygonEditor.close();
        this.emitPath();
      }
    },

    handleClearBthClick() {
      if (this.polygon) {
        this.map.remove(this.polygon);
        this.polygon = null;
      }
      if (this.polygonEditor) {
        this.polygonEditor.close();
      }
      this.$emit('change-path', '');
      this.initPolygonEditor(false);
    },

    /** ⚡ 优化3：舍弃非法操作 _opts 的卡顿旧语法，全面改用标准的 setOptions */
    resetPolygonStyle() {
      if (this.polygon) {
        this.polygon.setOptions({
          fillColor: this.polygonStyle.fillColor,
          fillOpacity: this.polygonStyle.fillOpacity,
          strokeColor: this.polygonStyle.strokeColor,
          strokeOpacity: this.polygonStyle.strokeOpacity,
          strokeWeight: this.polygonStyle.strokeWeight
        });
      }
    }
  }
};
</script>

<style lang="scss" scoped>
.map {
  width: 100%;
  height: 500px;
  display: flex;
  flex-direction: column;
  position: relative;
}
.map-box {
  flex: auto;
}
.map-tool {
  display: flex;
  flex-direction: column;
  position: absolute;
  right: 10px;
  bottom: 10px;
  background-color: #fff;
  padding: 10px;
  border-radius: 5px;
  z-index: 999;
}
::v-deep .el-button + .el-button {
  margin: 0;
}
::v-deep .el-button + .el-button {
  margin-top: 5px;
}
</style>
