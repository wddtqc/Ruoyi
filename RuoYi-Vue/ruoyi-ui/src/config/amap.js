/**
 * 高德地图配置
 * 从环境变量中读取配置
 * 配置文件：.env.development / .env.production
 */
export default {
  // 高德地图 Web 端 Key（从环境变量读取）
  key: process.env.VUE_APP_GAO_DE_KEY,

  // 安全密钥（从环境变量读取）
  securityJsCode: process.env.VUE_APP_GAO_DE_SECURITYJSCODE,

  // JSAPI 版本
  version: '2.0',

  // 需要加载的插件
  plugins: [
    'AMap.Scale',           // 比例尺控件
    'AMap.MapType',         // 地图类型切换控件
    'AMap.PlaceSearch',     // 地点搜索服务
    'AMap.PolygonEditor',   // 多边形编辑器
    'AMap.Polygon',         // 多边形
    'AMap.TileLayer'        // 图层
  ],

  // 默认地图配置
  mapConfig: {
    viewMode: '3D',         // 3D模式
    zoom: 18,               // 缩放级别
    center: [106.525447,29.343613], // 默认中心点（可根据项目实际位置修改）
    mapStyle: 'amap://styles/c530d22f7de2bfbb679356a2d366dfe3' // 自定义地图样式
  },

  // 搜索配置
  searchConfig: {
    city: '全国'
  }
}
