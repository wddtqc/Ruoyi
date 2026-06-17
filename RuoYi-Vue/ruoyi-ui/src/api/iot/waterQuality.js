import request from '@/utils/request'

/**
 * 查询所有设备的最新水质数据
 */
export function getLatestWaterQualityData() {
  return request({
    url: '/iot/waterQualityData/latest/list',
    method: 'get'
  })
}

/**
 * 查询指定设备的最新水质数据
 */
export function getLatestBySerialNumber(serialNumber) {
  return request({
    url: `/iot/waterQualityData/latest/${serialNumber}`,
    method: 'get'
  })
}
