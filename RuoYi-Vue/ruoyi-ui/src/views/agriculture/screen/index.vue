<template>
  <div class="screen-container">
    <!-- 顶部标题栏 -->
    <header class="screen-header">
      <div class="header-left">
        <span class="back-btn" @click="$router.push('/index')">
          <i class="el-icon-arrow-left"></i> 返回
        </span>
        <span class="header-line"></span>
        <h1>环湖智慧农业大数据监测平台</h1>
        <span class="header-line"></span>
      </div>
      <div class="header-right">
        <span class="refresh-hint">数据刷新: {{ lastRefresh }}</span>
        <span class="datetime">{{ nowTime }}</span>
      </div>
    </header>

    <!-- 主体内容区域 -->
    <main class="screen-main">
      <!-- 左侧面板 -->
      <section class="panel-left">
        <!-- 气象信息 -->
        <div class="panel-card weather-panel">
          <div class="card-title">
            <span class="title-icon"><i class="el-icon-cloudy"></i></span>
            实时气象监测 — 重庆财经学院
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

        <!-- 产量对比柱状图 -->
        <div class="panel-card chart-card">
          <div class="card-title"><span class="title-icon"><i class="el-icon-s-data"></i></span> 各地块面积与产量对比</div>
          <div ref="barChart" class="chart-box"></div>
        </div>
      </section>

      <!-- 中间地图区域 -->
      <section class="panel-center">
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

      <!-- 右侧面板 -->
      <section class="panel-right">
        <!-- 作物种类占比 -->
        <div class="panel-card chart-card">
          <div class="card-title"><span class="title-icon"><i class="el-icon-pie-chart"></i></span> 作物种类占比</div>
          <div ref="pieChart" class="chart-box"></div>
        </div>

        <!-- 土壤氮磷钾 -->
        <div class="panel-card chart-card">
          <div class="card-title"><span class="title-icon"><i class="el-icon-s-operation"></i></span> 各地块土壤氮磷钾含量 (mg/kg)</div>
          <div ref="npkChart" class="chart-box"></div>
        </div>

        <!-- 土壤墒情仪表盘 -->
        <div class="panel-card chart-card">
          <div class="card-title"><span class="title-icon"><i class="el-icon-odometer"></i></span> 土壤墒情监测</div>
          <div ref="gaugeChart" class="chart-box"></div>
        </div>

        <!-- 温湿度趋势 -->
        <div class="panel-card chart-card">
          <div class="card-title"><span class="title-icon"><i class="el-icon-s-marketing"></i></span> 温湿度变化趋势</div>
          <div ref="lineChart" class="chart-box"></div>
        </div>
      </section>
    </main>
  </div>
</template>

<script>
import * as echarts from 'echarts'
import AMapLoader from '@amap/amap-jsapi-loader'
import amapConfig from '@/config/amap'
import { getCurrentWeather } from '@/api/agriculture/weather'
import { listAllLand } from '@/api/agriculture/screen'

// 颜色映射
const CROP_COLORS = ['#00ff88', '#ffcc00', '#ff6b6b', '#45b7ff', '#a78bfa', '#f97316']
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
      landList: [],
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
    this.$nextTick(() => { this.loadAMap() })
    this.resizeHandler = () => this.handleResize()
    window.addEventListener('resize', this.resizeHandler)
  },
  beforeDestroy() {
    clearInterval(this.clockTimer)
    clearInterval(this.weatherTimer)
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
      await Promise.all([this.fetchWeather(), this.fetchLandData()])
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
        { label: '作物种类', value: `${cropTypes.size} 类`, color: '#ffcc00' },
        { label: '估产总量', value: `${totalYield.toFixed(0)} 吨`, color: '#ff6b6b' }
      ]
    },

    // ========== 高德地图 ==========
    loadAMap() {
      window._AMapSecurityConfig = { securityJsCode: amapConfig.securityJsCode }
      AMapLoader.load({
        key: amapConfig.key,
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
        zoom: 15,
        center: [106.526506, 29.345333],
        layers: [new AMap.TileLayer.Satellite()],
        features: ['bg', 'road', 'building', 'point']
      })
      this.map.addControl(new AMap.Scale())

      // 环湖范围圈
      new AMap.Circle({
        center: [106.526506, 29.345333],
        radius: 1800,
        strokeColor: '#00d4ff',
        strokeWeight: 2,
        strokeOpacity: 0.6,
        fillColor: '#00d4ff',
        fillOpacity: 0.04,
        strokeStyle: 'dashed'
      }).setMap(this.map)

      // 学院标注
      new AMap.Marker({
        position: [106.526506, 29.345333],
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
      new AMap.Circle({
        center: [106.526506, 29.345333],
        radius: 1800,
        strokeColor: '#00d4ff', strokeWeight: 2, strokeOpacity: 0.6,
        fillColor: '#00d4ff', fillOpacity: 0.04, strokeStyle: 'dashed'
      }).setMap(this.map)

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
      return [106.526506 + Math.cos(angle) * 0.008, 29.345333 + Math.sin(angle) * 0.008]
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
        text: '#8ec8ff', textWeak: '#5a7a9a', border: 'rgba(0,212,255,0.15)',
        splitLine: 'rgba(0,212,255,0.08)'
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
      this.landList.forEach(l => {
        const name = l.cropName || '未分类'
        cropArea[name] = (cropArea[name] || 0) + Number(l.landArea || 0)
      })
      const data = Object.entries(cropArea).map(([name, value]) => ({ name, value }))

      this.pieChart.setOption({
        tooltip: {
          trigger: 'item',
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
      const names = this.landList.map(l => l.landName.length > 5 ? l.landName.slice(0, 5) + '..' : l.landName)

      // 基于地块面积和作物类型生成模拟NPK数据 (实际应来自土壤传感器)
      const npkBase = {
        '水稻': { n: 120, p: 18, k: 85 },
        '油菜': { n: 95, p: 22, k: 70 },
        '蔬菜': { n: 150, p: 35, k: 120 },
        '果树': { n: 80, p: 15, k: 90 }
      }
      const defaultNpk = { n: 100, p: 20, k: 80 }

      const nData = this.landList.map(l => {
        const base = npkBase[l.cropName] || defaultNpk
        return +(base.n + (Math.random() - 0.5) * 20).toFixed(1)
      })
      const pData = this.landList.map(l => {
        const base = npkBase[l.cropName] || defaultNpk
        return +(base.p + (Math.random() - 0.5) * 5).toFixed(1)
      })
      const kData = this.landList.map(l => {
        const base = npkBase[l.cropName] || defaultNpk
        return +(base.k + (Math.random() - 0.5) * 15).toFixed(1)
      })

      this.npkChart.setOption({
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
    }
  }
}
</script>

<style lang="scss" scoped>
.screen-container {
  width: 100vw;
  height: 100vh;
  background: #081022;
  display: flex;
  flex-direction: column;
  overflow: hidden;
  color: #c0d8f0;
  font-family: 'Microsoft YaHei', 'PingFang SC', sans-serif;
  position: fixed;
  top: 0; left: 0;
  z-index: 100;
}

.screen-header {
  height: 60px;
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding: 0 30px;
  background: linear-gradient(180deg, rgba(0,20,50,0.9) 0%, rgba(8,16,34,0) 100%);
  border-bottom: 1px solid rgba(0,212,255,0.15);
  flex-shrink: 0;

  .header-left {
    display: flex;
    align-items: center;
    gap: 20px;

    .back-btn {
      color: #00d4ff; cursor: pointer; font-size: 13px;
      padding: 4px 12px;
      border: 1px solid rgba(0,212,255,0.3); border-radius: 3px;
      transition: all 0.3s; white-space: nowrap;
      &:hover { background: rgba(0,212,255,0.1); border-color: #00d4ff; }
    }

    h1 {
      font-size: 26px; font-weight: 700; letter-spacing: 4px;
      background: linear-gradient(90deg, #00d4ff, #00ff88);
      -webkit-background-clip: text; -webkit-text-fill-color: transparent;
      background-clip: text; margin: 0;
    }

    .header-line {
      display: block; width: 150px; height: 1px;
      background: linear-gradient(90deg, transparent, rgba(0,212,255,0.6), transparent);
    }
  }

  .header-right {
    display: flex; gap: 20px; align-items: center;
    .refresh-hint { font-size: 12px; color: #5a7a9a; }
    .datetime { font-size: 16px; color: #00d4ff; font-family: 'Courier New', monospace; letter-spacing: 2px; }
  }
}

.screen-main {
  flex: 1; display: flex; gap: 12px; padding: 8px 12px 12px; min-height: 0;
}

.panel-left, .panel-right {
  width: 26%; display: flex; flex-direction: column; gap: 10px; flex-shrink: 0;
}
.panel-center {
  flex: 1; display: flex; min-width: 0;
}

.panel-card {
  background: rgba(10,22,46,0.7);
  border: 1px solid rgba(0,212,255,0.12); border-radius: 4px;
  display: flex; flex-direction: column; overflow: hidden;

  .card-title {
    height: 34px; line-height: 34px; padding: 0 12px;
    font-size: 13px; font-weight: 600; color: #8ec8ff;
    background: linear-gradient(90deg, rgba(0,212,255,0.08), transparent);
    border-bottom: 1px solid rgba(0,212,255,0.08);
    display: flex; align-items: center; gap: 6px; flex-shrink: 0;
    .title-icon { color: #00d4ff; font-size: 14px; }
  }
}

.chart-card { flex: 1; min-height: 0; }
.chart-box { flex: 1; min-height: 0; }

.weather-panel {
  height: 200px; flex-shrink: 0;
  .weather-content { padding: 8px 12px; display: flex; flex-direction: column; height: 100%; }
  .weather-main {
    display: flex; align-items: center; gap: 10px; padding-bottom: 6px;
    border-bottom: 1px solid rgba(0,212,255,0.08);
    .weather-temp { font-size: 32px; font-weight: 700; color: #00ff88; font-family: 'Courier New', monospace; }
    .weather-desc { font-size: 13px; color: #8ec8ff; flex: 1; }
    .weather-icon { width: 42px; height: 42px; }
  }
  .weather-details {
    display: grid; grid-template-columns: 1fr 1fr; gap: 4px 14px; padding-top: 6px;
    .detail-item { display: flex; justify-content: space-between; font-size: 11px;
      .label { color: #5a7a9a; } .value { color: #c0d8f0; font-weight: 500; }
    }
  }
}

.loading-placeholder {
  display: flex; align-items: center; justify-content: center;
  height: 100%; color: #5a7a9a; font-size: 13px; gap: 6px;
}

.map-wrapper {
  width: 100%; height: 100%; position: relative;
  border: 1px solid rgba(0,212,255,0.12); border-radius: 4px; overflow: hidden;
  .map-container { width: 100%; height: 100%; }
  .map-overlay-top {
    position: absolute; top: 10px; left: 10px; display: flex; gap: 10px; z-index: 10; pointer-events: none;
    .stat-badge {
      background: rgba(6,16,40,0.85); border: 1px solid rgba(0,212,255,0.2);
      border-radius: 4px; padding: 6px 12px; display: flex; flex-direction: column; align-items: center;
      .stat-num { font-size: 18px; font-weight: 700; font-family: 'Courier New', monospace; }
      .stat-label { font-size: 10px; color: #5a7a9a; }
    }
  }
  .map-legend {
    position: absolute; bottom: 10px; right: 10px;
    background: rgba(6,16,40,0.85); border: 1px solid rgba(0,212,255,0.2);
    border-radius: 4px; padding: 8px 12px; display: flex; flex-direction: column; gap: 4px; z-index: 10;
    .legend-item { font-size: 11px; color: #8ec8ff; display: flex; align-items: center; gap: 6px;
      .dot { width: 8px; height: 8px; border-radius: 50%; display: inline-block; }
    }
  }
}
</style>
