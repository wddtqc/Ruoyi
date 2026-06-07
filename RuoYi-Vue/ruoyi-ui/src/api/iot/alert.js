import request from '@/utils/request'

// 查询设备告警列表
export function listAlert(query) {
  return request({
    url: '/iot/alert/list',
    method: 'get',
    params: query
  })
}

// 查询设备告警详细
export function getAlert(alertId) {
  return request({
    url: '/iot/alert/' + alertId,
    method: 'get'
  })
}

// 新增设备告警
export function addAlert(data) {
  return request({
    url: '/iot/alert',
    method: 'post',
    data: data
  })
}

// 修改设备告警
export function updateAlert(data) {
  return request({
    url: '/iot/alert',
    method: 'put',
    data: data
  })
}

// 根据设备ID查询告警列表
export function listAlertByDeviceId(deviceId) {
  return request({
    url: '/iot/alert/listByDeviceId',
    method: 'get',
    params: { deviceId }
  })
}

// 处理告警
export function handleAlert(data) {
  return request({
    url: '/iot/alert/handle',
    method: 'put',
    data: data
  })
}

// 删除设备告警
export function delAlert(alertId) {
  return request({
    url: '/iot/alert/' + alertId,
    method: 'delete'
  })
}
