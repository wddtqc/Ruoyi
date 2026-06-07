import request from '@/utils/request'

// 查询机械类别列表
export function listType(query) {
  return request({
    url: '/system/machine/type/list',
    method: 'get',
    params: query
  })
}

// 查询机械类别详细
export function getType(machineTypeId) {
  return request({
    url: '/system/machine/type/' + machineTypeId,
    method: 'get'
  })
}

// 新增机械类别
export function addType(data) {
  return request({
    url: '/system/machine/type',
    method: 'post',
    data: data
  })
}

// 修改机械类别
export function updateType(data) {
  return request({
    url: '/system/machine/type',
    method: 'put',
    data: data
  })
}

// 删除机械类别
export function delType(machineTypeId) {
  return request({
    url: '/system/machine/type/' + machineTypeId,
    method: 'delete'
  })
}
