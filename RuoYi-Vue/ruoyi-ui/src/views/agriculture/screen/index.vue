<template>
  <div class="screen-container">
    <!-- 顶部标题栏 -->
    <header class="screen-header">
      <div class="header-left">
        <h1>环湖智慧农业大数据监测平台</h1>
      </div>
      <div class="header-right">
        <span class="refresh-hint">数据刷新: {{ lastRefresh }}</span>
        <span class="datetime">{{ nowTime }}</span>
      </div>
    </header>

    <!-- 主体内容区域：地图为主，面板叠加 -->
    <main class="screen-main">
      <!-- 地图：全屏主内容 -->
      <section class="map-area">
        <div class="map-wrapper">
          <div id="screenMap" class="map-container"></div>
          <div class="map-overlay-top">
            <div class="stat-badge" v-for="stat in overviewStats" :key="stat.label">
              <span class="stat-num" :style="{ color: stat.color }">{{ stat.value }}</span>
              <span class="stat-label">{{ stat.label }}</span>
            </div>
          </div>
          <div class="map-legend">
            <div class="legend-item" v-for="item in cropTypeLegend" :key="item.name">
              <span class="dot" :style="{ background: item.color }"></span> {{ item.name }}
            </div>
          </div>
        </div>
      </section>

      <!-- 右侧叠加面板 -->
      <aside class="overlay-sidebar">
        <!-- 气象信息 -->
        <div class="panel-card weather-panel">
          <div class="card-title">
            <span class="title-icon"><i class="el-icon-cloudy"></i></span>
            气象监测
          </div>
          <div class="weather-content" v-if="weatherData">
            <div class="weather-main">
              <div class="weather-temp">{{ weatherData.main.temp }}°C</div>
              <div class="weather-desc">{{ weatherData.weather[0].description }}</div>
              <img :src="`https://openweathermap.org/img/wn/${weatherData.weather[0].icon}@2x.png`" class="weather-icon" alt="weather" />
            </div>
            <div class="weather-details">
              <div class="detail-item"><span class="label">体感温度</span><span class="value">{{ weatherData.main.feels_like }}°C</span></div>
              <div class="detail-item"><span class="label">空气湿度</span><span class="value">{{ weatherData.main.humidity }}%</span></div>
              <div class="detail-item"><span class="label">大气压</span><span class="value">{{ weatherData.main.pressure }} hPa</span></div>
              <div class="detail-item"><span class="label">风速</span><span class="value">{{ weatherData.wind.speed }} m/s</span></div>
              <div class="detail-item" v-if="weatherData.rain"><span class="label">降水量</span><span class="value">{{ weatherData.rain['1h'] || 0 }} mm</span></div>
              <div class="detail-item"><span class="label">能见度</span><span class="value">{{ (weatherData.visibility / 1000).toFixed(1) }} km</span></div>
            </div>
          </div>
          <div class="loading-placeholder" v-else><i class="el-icon-loading"></i> 气象数据加载中...</div>
        </div>

        <!-- 作物种类占比 -->
        <div class="panel-card chart-card">
          <div class="card-title"><span class="title-icon"><i class="el-icon-pie-chart"></i></span> 作物占比</div>
          <div ref="pieChart" class="chart-box pie-overflow"></div>
        </div>

        <!-- 温湿度趋势 -->
        <div class="panel-card chart-card">
          <div class="card-title"><span class="title-icon"><i class="el-icon-s-marketing"></i></span> 温湿度趋势</div>
          <div ref="lineChart" class="chart-box"></div>
        </div>
      </aside>

      <!-- 底部叠加图表条 -->
      <div class="overlay-bottom">
        <div class="panel-card chart-card">
          <div class="card-title"><span class="title-icon"><i class="el-icon-s-data"></i></span> 面积与产量对比</div>
          <div ref="barChart" class="chart-box"></div>
        </div>
        <div class="panel-card chart-card">
          <div class="card-title"><span class="title-icon"><i class="el-icon-s-operation"></i></span> 土壤氮磷钾 (mg/kg)</div>
          <div ref="npkChart" class="chart-box"></div>
        </div>
        <div class="panel-card chart-card">
          <div class="card-title"><span class="title-icon"><i class="el-icon-odometer"></i></span> 土壤墒情监测</div>
          <div ref="gaugeChart" class="chart-box"></div>
        </div>
      </div>
    </main>
  </div>
</template>

<script>
import * as echarts from 'echarts'
import AMapLoader from '@amap/amap-jsapi-loader'
import amapConfig from '@/config/amap'
import { getCurrentWeather } from '@/api/agriculture/weather'
import { listAllLand } from '@/api/agriculture/screen'
import { getLatestSensorData } from '@/api/iot/sensor'
import { listAllDeviceShort } from '@/api/iot/device'
import { getAllBatch } from '@/api/system/batch'
import { getAllGermplasm } from '@/api/system/germplasm'

// 颜色映射
const CROP_COLORS = ['#00ff88', '#ff8c00', '#ff6b6b', '#45b7ff', '#a78bfa', '#f97316']
const CROP_COLORS_MAP = {}

export default {
  name: 'AgricultureScreen',
  data() {
    return {
      nowTime: '',
      lastRefresh: '--',
      clockTimer: null,
      weatherData: null,
      weatherTimer: null,
      sensorTimer: null,
      landList: [],
      sensorDataList: [],
      deviceLandMap: {}, // serialNumber → landName
      batchList: [],
      germplasmList: [],
      map: null,
      AMapInstance: null,
      barChart: null, pieChart: null, gaugeChart: null, lineChart: null, npkChart: null,
      resizeHandler: null,
      overviewStats: [],
      cropTypeLegend: []
    }
  },
  mounted() {
    this.updateClock()
    this.clockTimer = setInterval(() => this.updateClock(), 1000)
    this.fetchAllData()
    this.weatherTimer = setInterval(() => this.fetchWeather(), 10 * 60 * 1000)
    this.sensorTimer = setInterval(() => this.fetchSensorData(), 30 * 1000)
    this.$nextTick(() => { this.loadAMap() })
    this.resizeHandler = () => this.handleResize()
    window.addEventListener('resize', this.resizeHandler)
  },
  activated() {
    // 路由切回时检查地图容器是否有效，若丢失则重新加载
    const container = document.getElementById('screenMap')
    const mapEl = container?.querySelector('.amap-container')
    if (!mapEl && this.map) {
      this.map.destroy()
      this.map = null
    }
    if (!this.map) {
      this.$nextTick(() => { this.loadAMap() })
    }
  },
  beforeDestroy() {
    clearInterval(this.clockTimer)
    clearInterval(this.weatherTimer)
    clearInterval(this.sensorTimer)
    window.removeEventListener('resize', this.resizeHandler)
    if (this.map) this.map.destroy()
    this.barChart?.dispose(); this.pieChart?.dispose()
    this.gaugeChart?.dispose(); this.lineChart?.dispose(); this.npkChart?.dispose()
  },
  methods: {
    updateClock() {
      const d = new Date()
      const pad = n => String(n).padStart(2, '0')
      this.nowTime = `${d.getFullYear()}-${pad(d.getMonth() + 1)}-${pad(d.getDate())} ${pad(d.getHours())}:${pad(d.getMinutes())}:${pad(d.getSeconds())}`
    },

    // ========== 数据获取 ==========
    async fetchAllData() {
      await this.loadDeviceLandMap()
      // 批次数据必须在饼图初始化之前就绪
      await this.fetchBatchData()
      await Promise.all([this.fetchWeather(), this.fetchLandData(), this.fetchSensorData()])
    },

    async fetchBatchData() {
      try {
        const batchRes = await getAllBatch()
        this.batchList = batchRes.data || []
        const germplasmRes = await getAllGermplasm()
        this.germplasmList = germplasmRes.data || []
      } catch (e) {
        this.batchList = []
        this.germplasmList = []
      }
    },

    async loadDeviceLandMap() {
      try {
        const res = await listAllDeviceShort()
        const devices = res.data || []
        const map = {}
        devices.forEach(d => {
          if (d.serialNumber && d.landName) {
            map[d.serialNumber] = d.landName
          }
        })
        this.deviceLandMap = map
      } catch (e) {
        this.deviceLandMap = {}
      }
    },

    async fetchWeather() {
      try {
        const res = await getCurrentWeather()
        this.weatherData = res.data
      } catch (e) {
        console.warn('气象数据获取失败', e)
        this.weatherData = {
          main: { temp: 26.3, feels_like: 28.1, humidity: 72, pressure: 1013 },
          weather: [{ description: '多云', icon: '02d' }],
          wind: { speed: 3.2 }, visibility: 8000
        }
      }
    },

    async fetchSensorData() {
      try {
        const res = await getLatestSensorData()
        this.sensorDataList = res.data || []
        // 刷新 NPK 图表
        if (this.npkChart) {
          this.initNpkChart()
        }
      } catch (e) {
        console.warn('传感器数据获取失败', e)
        this.sensorDataList = []
      }
    },

    async fetchLandData() {
      try {
        const res = await listAllLand()
        this.landList = res.rows || res.data || []
        if (this.landList.length === 0) {
          this.landList = this.getMockLandData()
        }
      } catch (e) {
        console.warn('地块数据获取失败，使用模拟数据', e)
        this.landList = this.getMockLandData()
      }
      // 智能推断：如果后端 cropName 为空，从地块名称推断
      this.landList.forEach(land => {
        if (!land.cropName) {
          const name = land.landName || ''
          if (name.includes('水稻')) land.cropName = '水稻'
          else if (name.includes('油菜')) land.cropName = '油菜'
          else if (name.includes('大棚') || name.includes('蔬菜')) land.cropName = '蔬菜'
          else if (name.includes('果园') || name.includes('果树')) land.cropName = '果树'
          else if (name.includes('旱地') || name.includes('实验')) land.cropName = '其他'
          else land.cropName = '未分类'
        }
      })
      this.buildCropColorMap()
      this.computeOverviewStats()
      this.$nextTick(() => {
        this.initCharts()
        if (this.map) this.addLandMarkers()
      })
      this.lastRefresh = new Date().toLocaleTimeString()
    },

    getMockLandData() {
      return [
        { landId: '1', landName: '环湖北水稻基地', landType: '0', landArea: 320, cropName: '水稻', landPath: '106.52,29.36|106.525,29.362|106.523,29.358|106.518,29.355|106.52,29.36', fillColor: '#00ff88', fillOpacity: 0.3, strokeColor: '#00ff88', strokeOpacity: 0.8, strokeWeight: 2, status: '0' },
        { landId: '2', landName: '环湖东油菜田', landType: '0', landArea: 180, cropName: '油菜', landPath: '106.55,29.35|106.555,29.352|106.553,29.348|106.548,29.346|106.55,29.35', fillColor: '#ffcc00', fillOpacity: 0.3, strokeColor: '#ffcc00', strokeOpacity: 0.8, strokeWeight: 2, status: '0' },
        { landId: '3', landName: '环湖南蔬菜大棚', landType: '1', landArea: 95, cropName: '蔬菜', landPath: '106.53,29.33|106.535,29.332|106.533,29.328|106.528,29.326|106.53,29.33', fillColor: '#ff6b6b', fillOpacity: 0.3, strokeColor: '#ff6b6b', strokeOpacity: 0.8, strokeWeight: 2, status: '0' },
        { landId: '4', landName: '环湖西果园', landType: '0', landArea: 150, cropName: '果树', landPath: '106.50,29.35|106.505,29.352|106.503,29.348|106.498,29.346|106.50,29.35', fillColor: '#45b7ff', fillOpacity: 0.3, strokeColor: '#45b7ff', strokeOpacity: 0.8, strokeWeight: 2, status: '0' },
        { landId: '5', landName: '环湖北东水稻田', landType: '0', landArea: 250, cropName: '水稻', landPath: '106.54,29.37|106.545,29.372|106.543,29.368|106.538,29.366|106.54,29.37', fillColor: '#00ff88', fillOpacity: 0.3, strokeColor: '#00ff88', strokeOpacity: 0.8, strokeWeight: 2, status: '0' },
        { landId: '6', landName: '环湖西南蔬菜基地', landType: '1', landArea: 80, cropName: '蔬菜', landPath: '106.51,29.34|106.515,29.342|106.513,29.338|106.508,29.336|106.51,29.34', fillColor: '#ff6b6b', fillOpacity: 0.3, strokeColor: '#ff6b6b', strokeOpacity: 0.8, strokeWeight: 2, status: '0' },
        { landId: '7', landName: '环湖东北果园', landType: '0', landArea: 200, cropName: '果树', landPath: '106.56,29.36|106.565,29.362|106.563,29.358|106.558,29.356|106.56,29.36', fillColor: '#45b7ff', fillOpacity: 0.3, strokeColor: '#45b7ff', strokeOpacity: 0.8, strokeWeight: 2, status: '0' },
        { landId: '8', landName: '环湖东南油菜田', landType: '0', landArea: 140, cropName: '油菜', landPath: '106.55,29.34|106.555,29.342|106.553,29.338|106.548,29.336|106.55,29.34', fillColor: '#ffcc00', fillOpacity: 0.3, strokeColor: '#ffcc00', strokeOpacity: 0.8, strokeWeight: 2, status: '0' }
      ]
    },

    buildCropColorMap() {
      const crops = [...new Set(this.landList.map(l => l.cropName).filter(Boolean))]
      crops.forEach((c, i) => { CROP_COLORS_MAP[c] = CROP_COLORS[i % CROP_COLORS.length] })
      this.cropTypeLegend = crops.map(c => ({ name: c, color: CROP_COLORS_MAP[c] }))
    },

    computeOverviewStats() {
      const totalArea = this.landList.reduce((s, l) => s + Number(l.landArea || 0), 0)
      const cropTypes = new Set(this.landList.map(l => l.cropName).filter(Boolean))
      // 估产：水稻600kg/亩，油菜300kg/亩，蔬菜3000kg/亩，果树800kg/亩
      const yieldRates = { '水稻': 0.6, '油菜': 0.3, '蔬菜': 3, '果树': 0.8 }
      const totalYield = this.landList.reduce((s, l) => s + Number(l.landArea || 0) * (yieldRates[l.cropName] || 0.5), 0)
      this.overviewStats = [
        { label: '地块总数', value: `${this.landList.length} 块`, color: '#00ff88' },
        { label: '农田总面积', value: `${totalArea.toFixed(0)} 亩`, color: '#45b7ff' },
        { label: '作物种类', value: `${cropTypes.size} 类`, color: '#ff8c00' },
        { label: '估产总量', value: `${totalYield.toFixed(0)} 吨`, color: '#ff6b6b' }
      ]
    },

    // ========== 高德地图 ==========
    loadAMap() {
      window._AMapSecurityConfig = { securityJsCode: amapConfig.securityJsCode }
      AMapLoader.load({
        key: 'a52903e93211146ac0a0ef7c3f52e7d1',
        version: '2.0',
        plugins: ['AMap.Scale', 'AMap.TileLayer', 'AMap.Polygon', 'AMap.Marker', 'AMap.InfoWindow']
      }).then(AMap => {
        this.AMapInstance = AMap
        this.initMap()
      }).catch(e => console.error('高德地图加载失败', e))
    },

    initMap() {
      const AMap = this.AMapInstance
      const container = document.getElementById('screenMap')
      if (!container) return

      this.map = new AMap.Map('screenMap', {
        viewMode: '3D',
        mapStyle: 'amap://styles/dark',
        zoom: 13,
        center: [106.525488, 29.343695],
        layers: [new AMap.TileLayer.Satellite()],
        features: ['bg', 'road', 'building', 'point']
      })
      this.map.addControl(new AMap.Scale())

      // 学院标注
      new AMap.Marker({
        position: [106.525488, 29.343695],
        content: '<div style="background:#00d4ff;color:#000;padding:2px 8px;border-radius:3px;font-size:11px;font-weight:bold;white-space:nowrap;">🏫 重庆财经学院</div>',
        offset: new AMap.Pixel(-50, -10)
      }).setMap(this.map)

      if (this.landList.length > 0) this.addLandMarkers()
    },

    addLandMarkers() {
      if (!this.map || !this.AMapInstance) return
      const AMap = this.AMapInstance
      // 清除已有覆盖物
      this.map.clearMap()
      // 重新添加基础元素
      this.map.addControl(new AMap.Scale())

      this.landList.forEach(land => {
        const color = land.fillColor || CROP_COLORS_MAP[land.cropName] || '#00ff88'
        const opacity = land.fillOpacity || 0.3
        const sc = land.strokeColor || color
        const so = land.strokeOpacity || 0.8
        const sw = land.strokeWeight || 2

        // 绘制地块多边形
        if (land.landPath) {
          const path = land.landPath.split('|').map(p => {
            const [lng, lat] = p.split(',').map(Number)
            return [lng, lat]
          }).filter(p => p.length === 2 && !isNaN(p[0]) && !isNaN(p[1]))

          if (path.length >= 3) {
            const polygon = new AMap.Polygon({
              path: path,
              fillColor: color,
              fillOpacity: Number(opacity),
              strokeColor: sc,
              strokeOpacity: Number(so),
              strokeWeight: Number(sw)
            })
            polygon.on('click', () => this.showLandInfo(land, path))
            this.map.add(polygon)
          }
        }

        // 地块中心标记
        const center = this.getLandCenter(land)
        if (center) {
          const marker = new AMap.Marker({
            position: center,
            content: `<div style="
              width:12px;height:12px;
              background:${color};
              border:2px solid #fff;
              border-radius:50%;
              box-shadow:0 0 10px ${color};
              cursor:pointer;
            "></div>`,
            offset: new AMap.Pixel(-6, -6)
          })
          marker.on('click', () => this.showLandInfo(land, center))
          this.map.add(marker)
        }
      })

      this.map.setFitView(null, false, [60, 60, 60, 60])
    },

    getLandCenter(land) {
      if (land.landPath) {
        const pts = land.landPath.split('|').map(p => p.split(',').map(Number))
        const sum = pts.reduce((a, p) => [a[0] + p[0], a[1] + p[1]], [0, 0])
        return [sum[0] / pts.length, sum[1] / pts.length]
      }
      // fallback: distribute around center
      const i = parseInt(land.landId) || 0
      const angle = (i * 45) * Math.PI / 180
      return [106.525488 + Math.cos(angle) * 0.008, 29.343695 + Math.sin(angle) * 0.008]
    },

    showLandInfo(land, position) {
      const AMap = this.AMapInstance
      const area = Number(land.landArea || 0).toFixed(1)
      const info = new AMap.InfoWindow({
        content: `<div style="padding:10px 14px;font-size:13px;line-height:1.8;min-width:160px;">
          <strong style="font-size:14px;">${land.landName}</strong><br/>
          作物：${land.cropName || '--'}<br/>
          面积：${area} 亩<br/>
          状态：${land.status === '0' ? '🟢 种植中' : land.status === '1' ? '🟡 休耕' : '🔴 闲置'}
        </div>`,
        offset: new AMap.Pixel(0, -20)
      })
      info.open(this.map, position)
    },

    // ========== ECharts ==========
    initCharts() {
      this.initBarChart()
      this.initPieChart()
      this.initNpkChart()
      this.initGaugeChart()
      this.initLineChart()
    },

    t() {
      return {
        text: '#80d8ff', textWeak: '#6090b0', border: 'rgba(60,70,90,0.5)',
        splitLine: 'rgba(60,70,90,0.2)'
      }
    },

    initBarChart() {
      if (!this.$refs.barChart) return
      this.barChart = echarts.init(this.$refs.barChart)
      const t = this.t()
      const names = this.landList.map(l => l.landName.length > 6 ? l.landName.slice(0, 6) + '..' : l.landName)
      const areas = this.landList.map(l => Number(l.landArea || 0))
      const yieldRates = { '水稻': 0.6, '油菜': 0.3, '蔬菜': 3, '果树': 0.8 }
      const yields = this.landList.map(l => Number(l.landArea || 0) * (yieldRates[l.cropName] || 0.5))

      this.barChart.setOption({
        backgroundColor: 'transparent',
        tooltip: {
          trigger: 'axis',
          backgroundColor: 'rgba(6,16,40,0.9)',
          borderColor: 'rgba(0,212,255,0.3)',
          textStyle: { color: '#fff', fontSize: 12 }
        },
        legend: {
          right: 0,
          textStyle: { color: t.text, fontSize: 11 },
          itemWidth: 12, itemHeight: 8
        },
        grid: { left: 50, right: 20, top: 35, bottom: 50 },
        xAxis: {
          type: 'category', data: names,
          axisLine: { lineStyle: { color: t.border } },
          axisTick: { show: false },
          axisLabel: { color: t.text, fontSize: 10, rotate: 30 }
        },
        yAxis: {
          type: 'value', name: '吨 / 亩',
          splitLine: { lineStyle: { color: t.splitLine } },
          axisLabel: { color: t.textWeak, fontSize: 10 },
          nameTextStyle: { color: t.textWeak, fontSize: 10 }
        },
        series: [
          {
            name: '种植面积(亩)', type: 'bar', data: areas, barWidth: 14,
            itemStyle: {
              borderRadius: [4, 4, 0, 0],
              color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [
                { offset: 0, color: '#00ff88' }, { offset: 1, color: '#005533' }
              ])
            }
          },
          {
            name: '估产量(吨)', type: 'bar', data: yields.map(y => +y.toFixed(1)), barWidth: 14,
            itemStyle: {
              borderRadius: [4, 4, 0, 0],
              color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [
                { offset: 0, color: '#45b7ff' }, { offset: 1, color: '#002255' }
              ])
            }
          }
        ]
      })
    },

    initPieChart() {
      if (!this.$refs.pieChart) return
      this.pieChart = echarts.init(this.$refs.pieChart)
      const t = this.t()
      const cropArea = {}
      if (this.batchList && this.batchList.length > 0) {
        // 从批次数据聚合（按种质名称）
        const nameMap = {}
        this.germplasmList.forEach(g => { nameMap[g.germplasmId] = g.germplasmName })
        this.batchList.forEach(b => {
          const name = nameMap[b.germplasmId] || '未分类'
          cropArea[name] = (cropArea[name] || 0) + Number(b.cropArea || 0)
        })
      } else {
        // 回退：从地块数据聚合
        this.landList.forEach(l => {
          const name = l.cropName || '未分类'
          cropArea[name] = (cropArea[name] || 0) + Number(l.landArea || 0)
        })
      }
      const data = Object.entries(cropArea).map(([name, value]) => ({ name, value }))

      this.pieChart.setOption({
        backgroundColor: 'transparent',
        tooltip: {
          trigger: 'item',
          appendToBody: true,
          backgroundColor: 'rgba(6,16,40,0.9)',
          borderColor: 'rgba(0,212,255,0.3)',
          textStyle: { color: '#fff', fontSize: 12 },
          formatter: '{b}: {c} 亩 ({d}%)'
        },
        series: [{
          type: 'pie',
          radius: ['50%', '75%'],
          center: ['50%', '50%'],
          itemStyle: { borderRadius: 4, borderColor: '#0a1228', borderWidth: 3 },
          label: { show: true, position: 'outside', color: t.text, fontSize: 11, formatter: '{b}\n{d}%' },
          labelLine: { lineStyle: { color: t.border } },
          data: data,
          color: data.map((_, i) => CROP_COLORS[i % CROP_COLORS.length])
        }]
      })
    },

    initNpkChart() {
      if (!this.$refs.npkChart) return
      this.npkChart = echarts.init(this.$refs.npkChart)
      const t = this.t()

      let names = []
      let nData = []
      let pData = []
      let kData = []

      // 优先使用真实传感器数据
      if (this.sensorDataList && this.sensorDataList.length > 0) {
        this.sensorDataList.forEach(sensor => {
          const sn = sensor.serialNumber || ''
          const landName = this.deviceLandMap[sn]
          const name = landName || sn || '未知设备'
          names.push(name.length > 8 ? name.slice(0, 8) + '..' : name)
          nData.push(sensor.nitrogen || 0)
          pData.push(sensor.phosphorus || 0)
          kData.push(sensor.potassium || 0)
        })
      } else {
        // 回退到地块模拟数据
        names = this.landList.map(l => l.landName.length > 5 ? l.landName.slice(0, 5) + '..' : l.landName)

        const npkBase = {
          '水稻': { n: 120, p: 18, k: 85 },
          '油菜': { n: 95, p: 22, k: 70 },
          '蔬菜': { n: 150, p: 35, k: 120 },
          '果树': { n: 80, p: 15, k: 90 }
        }
        const defaultNpk = { n: 100, p: 20, k: 80 }

        nData = this.landList.map(l => {
          const base = npkBase[l.cropName] || defaultNpk
          return +(base.n + (Math.random() - 0.5) * 20).toFixed(1)
        })
        pData = this.landList.map(l => {
          const base = npkBase[l.cropName] || defaultNpk
          return +(base.p + (Math.random() - 0.5) * 5).toFixed(1)
        })
        kData = this.landList.map(l => {
          const base = npkBase[l.cropName] || defaultNpk
          return +(base.k + (Math.random() - 0.5) * 15).toFixed(1)
        })
      }

      this.npkChart.setOption({
        backgroundColor: 'transparent',
        tooltip: {
          trigger: 'axis',
          backgroundColor: 'rgba(6,16,40,0.9)',
          borderColor: 'rgba(0,212,255,0.3)',
          textStyle: { color: '#fff', fontSize: 12 }
        },
        legend: {
          right: 0,
          textStyle: { color: t.text, fontSize: 11 },
          data: ['氮(N)', '磷(P)', '钾(K)'],
          itemWidth: 12, itemHeight: 8
        },
        grid: { left: 50, right: 20, top: 35, bottom: 50 },
        xAxis: {
          type: 'category', data: names,
          axisLine: { lineStyle: { color: t.border } },
          axisTick: { show: false },
          axisLabel: { color: t.text, fontSize: 10, rotate: 30 }
        },
        yAxis: {
          type: 'value', name: 'mg/kg',
          splitLine: { lineStyle: { color: t.splitLine } },
          axisLabel: { color: t.textWeak, fontSize: 10 },
          nameTextStyle: { color: t.textWeak, fontSize: 10 }
        },
        series: [
          {
            name: '氮(N)', type: 'bar', data: nData, barWidth: 10,
            itemStyle: { color: '#00ff88', borderRadius: [3, 3, 0, 0] }
          },
          {
            name: '磷(P)', type: 'bar', data: pData, barWidth: 10,
            itemStyle: { color: '#ffcc00', borderRadius: [3, 3, 0, 0] }
          },
          {
            name: '钾(K)', type: 'bar', data: kData, barWidth: 10,
            itemStyle: { color: '#ff6b6b', borderRadius: [3, 3, 0, 0] }
          }
        ]
      })
    },

    initGaugeChart() {
      if (!this.$refs.gaugeChart) return
      this.gaugeChart = echarts.init(this.$refs.gaugeChart)

      const top4 = this.landList.slice(0, 4)
      // 计算各地块土壤湿度(基于作物类型模拟)
      const moistureBase = { '水稻': 75, '油菜': 60, '蔬菜': 80, '果树': 55 }
      const gaugeData = top4.map(l => ({
        name: l.landName.length > 6 ? l.landName.slice(0, 6) + '..' : l.landName,
        value: moistureBase[l.cropName] || (55 + Math.random() * 25)
      }))

      this.gaugeChart.setOption({
        backgroundColor: 'transparent',
        series: gaugeData.map((item, i) => ({
          type: 'gauge',
          center: [(i % 2 === 0 ? 25 : 75) + '%', i < 2 ? '28%' : '72%'],
          radius: '42%',
          min: 0, max: 100,
          startAngle: 210, endAngle: -30,
          title: { show: true, offsetCenter: [0, '80%'], color: '#8ec8ff', fontSize: 10 },
          detail: { formatter: '{value}%', color: '#fff', fontSize: 16, offsetCenter: [0, '42%'] },
          data: [{ value: +item.value.toFixed(0), name: item.name }],
          axisLine: {
            lineStyle: {
              width: 8,
              color: [[0.3, '#ff6b6b'], [0.7, '#ffcc00'], [1, '#00ff88']]
            }
          },
          axisTick: { show: false },
          splitLine: { show: false },
          axisLabel: { show: false },
          pointer: { length: '55%', width: 4, itemStyle: { color: '#00d4ff' } }
        }))
      })
    },

    initLineChart() {
      if (!this.$refs.lineChart) return
      this.lineChart = echarts.init(this.$refs.lineChart)
      const t = this.t()
      const hours = Array.from({ length: 24 }, (_, i) => `${i}:00`)
      const temps = [20, 21, 20, 19, 19, 18, 19, 21, 23, 25, 27, 28, 29, 30, 31, 30, 29, 28, 26, 25, 23, 22, 21, 20]
      const humids = [75, 78, 80, 82, 83, 85, 82, 78, 72, 65, 60, 58, 55, 54, 53, 54, 56, 60, 65, 68, 70, 72, 73, 74]

      this.lineChart.setOption({
        backgroundColor: 'transparent',
        tooltip: {
          trigger: 'axis',
          backgroundColor: 'rgba(6,16,40,0.9)',
          borderColor: 'rgba(0,212,255,0.3)',
          textStyle: { color: '#fff', fontSize: 12 }
        },
        legend: {
          right: 0,
          textStyle: { color: t.text, fontSize: 11 },
          itemWidth: 16, itemHeight: 2
        },
        grid: { left: 45, right: 45, top: 35, bottom: 25 },
        xAxis: {
          type: 'category', data: hours, boundaryGap: false,
          axisLine: { lineStyle: { color: t.border } },
          axisTick: { show: false },
          axisLabel: { color: t.textWeak, fontSize: 9, interval: 3 }
        },
        yAxis: [
          {
            type: 'value', name: '°C',
            splitLine: { lineStyle: { color: t.splitLine } },
            axisLabel: { color: t.textWeak, fontSize: 10 },
            nameTextStyle: { color: t.textWeak, fontSize: 10 }
          },
          {
            type: 'value', name: '%',
            splitLine: { show: false },
            axisLabel: { color: t.textWeak, fontSize: 10 },
            nameTextStyle: { color: t.textWeak, fontSize: 10 }
          }
        ],
        series: [
          {
            name: '温度(°C)', type: 'line', data: temps, smooth: true, symbol: 'none',
            lineStyle: { color: '#ff6b6b', width: 2 },
            areaStyle: {
              color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [
                { offset: 0, color: 'rgba(255,107,107,0.3)' },
                { offset: 1, color: 'rgba(255,107,107,0)' }
              ])
            }
          },
          {
            name: '湿度(%)', type: 'line', yAxisIndex: 1, data: humids, smooth: true, symbol: 'none',
            lineStyle: { color: '#45b7ff', width: 2 },
            areaStyle: {
              color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [
                { offset: 0, color: 'rgba(69,183,255,0.3)' },
                { offset: 1, color: 'rgba(69,183,255,0)' }
              ])
            }
          }
        ]
      })
    },

    handleResize() {
      this.barChart?.resize(); this.pieChart?.resize()
      this.gaugeChart?.resize(); this.lineChart?.resize(); this.npkChart?.resize()
      if (this.map) this.map.resize()
    }
  }
}
</script>

<style lang="scss" scoped>
/* ============================================
   环湖智慧农业大数据监测平台 — DataV 赛博朋克主题
   配色：深空黑底 + 青蓝(#00d4ff) + 亮绿(#00ff88) + 橙色强调(#ff8c00)
   ============================================ */

// ---------- CSS 变量 ----------
$cyan: #00d4ff;
$green: #00ff88;
$orange: #ff8c00;
$bg-dark: #010510;
$bg-card: rgba(6, 16, 40, 0.6);
$text-bright: #c8e8ff;
$text-dim: #6088a8;
$border-glow: rgba(0, 212, 255, 0.15);

// ---------- 全局容器 ----------
.screen-container {
  width: 100%;
  min-height: calc(100vh - 84px); // 减去导航栏和标签栏的高度
  background: radial-gradient(ellipse at 50% 20%, #0d2048 0%, #0b1229 35%, #020818 70%, #000000 100%);
  display: flex; flex-direction: column; overflow: hidden;
  color: $text-bright;
  font-family: 'Microsoft YaHei', 'PingFang SC', sans-serif;
  position: relative;

  // 网格点阵背景（增强可见度）
  &::before {
    content: '';
    position: absolute; top: 0; left: 0; right: 0; bottom: 0;
    background-image:
      linear-gradient(rgba($cyan, 0.04) 1px, transparent 1px),
      linear-gradient(90deg, rgba($cyan, 0.04) 1px, transparent 1px);
    background-size: 40px 40px;
    pointer-events: none; z-index: 0;
  }

  // 扫描线
  &::after {
    content: '';
    position: absolute; top: 0; left: 0; right: 0; bottom: 0;
    background: repeating-linear-gradient(
      0deg, transparent, transparent 2px,
      rgba(0, 0, 0, 0.05) 2px, rgba(0, 0, 0, 0.05) 4px
    );
    pointer-events: none; z-index: 0;
  }
}

// ---------- 顶部标题栏 ----------
.screen-header {
  height: 64px; display: flex; align-items: center; justify-content: space-between;
  padding: 0 30px; flex-shrink: 0; position: relative; z-index: 1;
  background: linear-gradient(180deg, rgba(0, 30, 60, 0.95) 0%, rgba(5, 15, 35, 0.4) 100%);
  border-bottom: 1px solid rgba($cyan, 0.2);

  // 底部流动发光条
  &::after {
    content: '';
    position: absolute; bottom: -1px; left: 5%; right: 5%; height: 2px;
    background: linear-gradient(90deg,
      transparent, rgba($cyan, 0.5), $cyan, $green, $orange, $cyan, rgba($cyan, 0.5), transparent
    );
    box-shadow: 0 0 12px rgba($cyan, 0.6), 0 0 30px rgba($green, 0.3), 0 0 45px rgba($orange, 0.2);
    z-index: 1; animation: headerGlow 4s ease-in-out infinite;
  }

  .header-left {
    display: flex; align-items: center; gap: 20px;

    .back-btn {
      color: $cyan; cursor: pointer; font-size: 13px;
      padding: 5px 16px; border: 1px solid rgba($cyan, 0.4); border-radius: 2px;
      transition: all 0.3s ease; white-space: nowrap; letter-spacing: 1px;
      text-shadow: 0 0 8px rgba($cyan, 0.4);
      background: rgba($cyan, 0.05);
      &:hover {
        background: rgba($cyan, 0.18); border-color: $cyan; color: #fff;
        box-shadow: 0 0 18px rgba($cyan, 0.4), inset 0 0 16px rgba($cyan, 0.1);
        text-shadow: 0 0 14px rgba($cyan, 0.9);
      }
    }

    h1 {
      font-size: 28px; font-weight: 700; letter-spacing: 7px;
      background: linear-gradient(90deg, $cyan, $green, $cyan);
      background-size: 200% 100%;
      -webkit-background-clip: text; -webkit-text-fill-color: transparent;
      background-clip: text; margin: 0;
      animation: titleShimmer 3s ease-in-out infinite;
      filter: drop-shadow(0 0 10px rgba($cyan, 0.4));
    }

    .header-line {
      display: block; width: 120px; height: 1px;
      background: linear-gradient(90deg, transparent, rgba($cyan, 0.5), $cyan, rgba($cyan, 0.5), transparent);
      box-shadow: 0 0 8px rgba($cyan, 0.4);
    }
  }

  .header-right {
    display: flex; gap: 24px; align-items: center;
    .refresh-hint {
      font-size: 12px; color: $text-dim; letter-spacing: 1px;
      &::before { content: '●'; color: $green; margin-right: 6px; font-size: 8px; animation: dotPulse 2s ease-in-out infinite; }
    }
    .datetime {
      font-size: 16px; color: $cyan; font-family: 'Courier New', monospace; letter-spacing: 3px;
      text-shadow: 0 0 12px rgba($cyan, 0.6), 0 0 25px rgba($cyan, 0.3);
    }
  }
}

@keyframes titleShimmer {
  0%, 100% { background-position: 0% 50%; }
  50% { background-position: 100% 50%; }
}
@keyframes headerGlow {
  0%, 100% { opacity: 0.8; }
  50% { opacity: 1; }
}
@keyframes dotPulse {
  0%, 100% { opacity: 1; }
  50% { opacity: 0.3; }
}
@keyframes neonPulse {
  0%, 100% { text-shadow: 0 0 7px currentColor, 0 0 18px currentColor, 0 0 35px currentColor; }
  50% { text-shadow: 0 0 12px currentColor, 0 0 28px currentColor, 0 0 55px currentColor, 0 0 80px currentColor; }
}

// ---------- 主体布局（地图为主，面板叠加） ----------
.screen-main {
  flex: 1; position: relative; min-height: 0; z-index: 1;
  padding: 10px 14px 14px;
}

// 地图占据整个主体区域
.map-area {
  position: absolute; top: 10px; left: 14px; right: 14px; bottom: 10px;
  z-index: 1;
}

// 右侧叠加面板
.overlay-sidebar {
  position: absolute; top: 14px; right: 20px; width: 260px; bottom: 224px;
  z-index: 10; display: flex; flex-direction: column; gap: 8px;
  pointer-events: auto;
  background: transparent;
}

// 底部叠加图表条
.overlay-bottom {
  position: absolute; left: 20px; right: 20px; bottom: 18px; height: 200px;
  z-index: 10; display: flex; gap: 8px;
  pointer-events: auto;
}

// ---------- 通用卡片 ----------
.panel-card {
  background: rgba(6, 16, 40, 0.55);
  backdrop-filter: blur(14px);
  -webkit-backdrop-filter: blur(14px);
  border: 1px solid rgba($cyan, 0.15); border-radius: 10px;
  display: flex; flex-direction: column; overflow: hidden;
  position: relative;
  box-shadow:
    0 2px 20px rgba(0, 0, 0, 0.4),
    0 0 15px rgba($cyan, 0.06),
    inset 0 1px 0 rgba(255, 255, 255, 0.04),
    inset 0 0 40px rgba($cyan, 0.02);
  transition: box-shadow 0.4s ease, border-color 0.4s ease;

  &:hover {
    border-color: rgba($cyan, 0.25);
    box-shadow:
      0 4px 25px rgba(0, 0, 0, 0.5),
      0 0 20px rgba($cyan, 0.14),
      0 0 50px rgba($cyan, 0.05),
      inset 0 0 50px rgba($cyan, 0.03);
  }

  .card-title {
    height: 34px; line-height: 34px; padding: 0 14px;
    font-size: 13px; font-weight: 600; color: $text-bright; letter-spacing: 2px;
    background: linear-gradient(90deg, rgba($cyan, 0.15) 0%, rgba($cyan, 0.03) 60%, transparent 100%);
    border-bottom: 1px solid rgba($cyan, 0.1);
    display: flex; align-items: center; gap: 8px; flex-shrink: 0;

    // 发光装饰方块
    &::before {
      content: '';
      display: inline-block;
      width: 4px; height: 16px;
      background: $cyan;
      box-shadow: 0 0 8px $cyan, 0 0 18px rgba($cyan, 0.6);
      border-radius: 1px; flex-shrink: 0;
      animation: dotPulse 2.5s ease-in-out infinite;
    }

    .title-icon {
      color: $cyan; font-size: 14px;
      text-shadow: 0 0 8px rgba($cyan, 0.6);
    }
  }
}

.chart-card { flex: 1; min-height: 0; }
.chart-box { flex: 1; min-height: 0; border-radius: 0 0 10px 10px; }

// ---------- 气象面板 ----------
.weather-panel {
  height: 170px; flex-shrink: 0;

  .weather-content { padding: 6px 12px; display: flex; flex-direction: column; height: 100%; }
  .weather-main {
    display: flex; align-items: center; gap: 10px; padding-bottom: 6px;
    border-bottom: 1px solid rgba($cyan, 0.1);
    .weather-temp {
      font-size: 32px; font-weight: 700; color: $green;
      font-family: 'Courier New', monospace;
      text-shadow: 0 0 18px rgba($green, 0.7), 0 0 40px rgba($green, 0.35);
    }
    .weather-desc { font-size: 13px; color: #8ec8ff; flex: 1; }
    .weather-icon { width: 38px; height: 38px; filter: drop-shadow(0 0 6px rgba($cyan, 0.5)); }
  }
  .weather-details {
    display: grid; grid-template-columns: 1fr 1fr; gap: 3px 14px; padding-top: 5px;
    .detail-item { display: flex; justify-content: space-between; font-size: 11px;
      .label { color: $text-dim; }
      .value { color: $text-bright; font-weight: 500; }
    }
  }
}

.loading-placeholder {
  display: flex; align-items: center; justify-content: center;
  height: 100%; color: $text-dim; font-size: 13px; gap: 6px; letter-spacing: 1px;
}

// ---------- 地图容器 ----------
.map-wrapper {
  width: 100%; height: 100%; position: relative;
  border: 1px solid rgba($cyan, 0.15); border-radius: 10px; overflow: hidden;
  box-shadow:
    0 0 25px rgba($cyan, 0.08),
    0 0 50px rgba(0, 0, 0, 0.35),
    inset 0 0 60px rgba(0, 0, 0, 0.2);

  // 左上角 — 青色
  &::before {
    content: ''; position: absolute;
    top: -1px; left: -1px; width: 24px; height: 24px;
    border-top: 2px solid $cyan; border-left: 2px solid $cyan;
    box-shadow: 0 0 10px rgba($cyan, 0.5);
    z-index: 11; pointer-events: none; border-radius: 2px 0 0 0;
  }

  // 右上角 — 橙色
  &::after {
    content: ''; position: absolute;
    top: -1px; right: -1px; width: 24px; height: 24px;
    border-top: 2px solid $orange; border-right: 2px solid $orange;
    box-shadow: 0 0 10px rgba($orange, 0.5);
    z-index: 11; pointer-events: none; border-radius: 0 2px 0 0;
  }

  .map-container { width: 100%; height: 100%; }

  .map-overlay-top {
    position: absolute; top: 14px; left: 14px;
    display: flex; gap: 10px; z-index: 10; pointer-events: none;

    .stat-badge {
      background: rgba(4, 12, 30, 0.5);
      border: 1px solid rgba($cyan, 0.2); border-radius: 10px;
      padding: 8px 18px;
      display: flex; flex-direction: column; align-items: center;
      backdrop-filter: blur(14px);
      -webkit-backdrop-filter: blur(14px);
      box-shadow: 0 0 20px rgba(0, 0, 0, 0.4), 0 0 12px rgba($cyan, 0.06);
      border-left: 2px solid $cyan;

      // 第3个卡片左侧橙色强调
      &:nth-child(3) { border-left-color: $orange; }

      .stat-num {
        font-size: 22px; font-weight: 700; font-family: 'Courier New', monospace;
        text-shadow:
          0 0 8px currentColor,
          0 0 22px currentColor,
          0 0 45px currentColor,
          0 0 70px currentColor;
        animation: neonPulse 3s ease-in-out infinite;
      }
      .stat-label {
        font-size: 11px; color: #80b8d8; letter-spacing: 2px; margin-top: 3px;
        text-transform: uppercase;
      }
    }
  }

  .map-legend {
    position: absolute; bottom: 14px; right: 14px;
    background: rgba(4, 12, 30, 0.5);
    border: 1px solid rgba($cyan, 0.2); border-radius: 10px;
    padding: 8px 14px;
    display: flex; flex-direction: column; gap: 5px; z-index: 10;
    backdrop-filter: blur(14px);
    -webkit-backdrop-filter: blur(14px);
    box-shadow: 0 0 16px rgba(0, 0, 0, 0.4);
    border-right: 2px solid $orange;

    .legend-item {
      font-size: 11px; color: #8ec8ff; display: flex; align-items: center; gap: 6px;
      .dot {
        width: 9px; height: 9px; border-radius: 50%; display: inline-block;
        box-shadow: 0 0 8px currentColor, 0 0 16px currentColor;
      }
    }
  }
}
</style>

<!-- 不带 scoped：穿透 ECharts canvas 和 Element UI 全局样式 -->
<style>
/* Element UI 对 <aside> 注入了 #EEF1F6 背景，必须覆盖 */
aside.overlay-sidebar {
  background: transparent !important;
}
.panel-card,
.panel-card * {
  background-color: transparent !important;
}
.panel-card {
  background: rgba(6, 16, 40, 0.55) !important;
}
.panel-card .card-title {
  background: linear-gradient(90deg, rgba(0, 212, 255, 0.15) 0%, rgba(0, 212, 255, 0.03) 60%, transparent 100%) !important;
}
.panel-card canvas {
  background: transparent !important;
}

// 饼图容器允许 tooltip 溢出
.pie-overflow {
  overflow: visible !important;
}
</style>
