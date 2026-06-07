import request from '@/utils/request'

// 查询农资信息列表
export function listInfo(query) {
  return request({
    url: '/system/material/list',
    method: 'get',
    params: query
  })
}

// 查询农资信息详细
export function getInfo(materialId) {
  return request({
    url: '/system/material/' + materialId,
    method: 'get'
  })
}

// 新增农资信息
export function addInfo(data) {
  return request({
    url: '/system/material',
    method: 'post',
    data: data
  })
}

// 修改农资信息
export function updateInfo(data) {
  return request({
    url: '/system/material',
    method: 'put',
    data: data
  })
}

// 删除农资信息
export function delInfo(materialId) {
  return request({
    url: '/system/material/' + materialId,
    method: 'delete'
  })
}
