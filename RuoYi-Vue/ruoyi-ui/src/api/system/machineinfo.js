import request from '@/utils/request'

// 查询机械信息列表
export function listInfo(query) {
  return request({
    url: '/system/machine/list',
    method: 'get',
    params: query
  })
}

// 查询机械信息详细
export function getInfo(machineId) {
  return request({
    url: '/system/machine/' + machineId,
    method: 'get'
  })
}

// 新增机械信息
export function addInfo(data) {
  return request({
    url: '/system/machine',
    method: 'post',
    data: data
  })
}

// 修改机械信息
export function updateInfo(data) {
  return request({
    url: '/system/machine',
    method: 'put',
    data: data
  })
}

// 删除机械信息
export function delInfo(machineId) {
  return request({
    url: '/system/machine/' + machineId,
    method: 'delete'
  })
}
