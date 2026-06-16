import request from '@/utils/request'

/**
 * 查询所有设备的最新传感器数据
 */
export function getLatestSensorData() {
  return request({
    url: '/iot/sensor/latest',
    method: 'get'
  })
}

/**
 * 查询指定设备的最新传感器数据
 */
export function getLatestBySerialNumber(serialNumber) {
  return request({
    url: `/iot/sensor/latest/${serialNumber}`,
    method: 'get'
  })
}

/**
 * 查询最近24小时温湿度趋势数据（按小时聚合）
 */
export function getTrendData() {
  return request({
    url: '/iot/sensor/trend',
    method: 'get'
  })
}
