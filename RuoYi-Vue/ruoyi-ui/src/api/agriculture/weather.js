import axios from 'axios'

const API_KEY = process.env.VUE_APP_OPENWEATHER_API_KEY
const BASE_URL = 'https://api.openweathermap.org/data/2.5'

/**
 * 获取当前天气数据（重庆财经学院坐标: 106.53, 29.35）
 */
export function getCurrentWeather() {
  return axios.get(`${BASE_URL}/weather`, {
    params: {
      lat: 29.345333,
      lon: 106.526506,
      appid: API_KEY,
      units: 'metric',
      lang: 'zh_cn'
    }
  })
}

/**
 * 获取未来5天天气预报（3小时间隔）
 */
export function getForecast() {
  return axios.get(`${BASE_URL}/forecast`, {
    params: {
      lat: 29.345333,
      lon: 106.526506,
      appid: API_KEY,
      units: 'metric',
      lang: 'zh_cn',
      cnt: 40
    }
  })
}
