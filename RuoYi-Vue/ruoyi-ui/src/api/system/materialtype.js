import request from '@/utils/request'

// 查询农资类别列表
export function listType(query) {
  return request({
    url: '/system/material/type/list',
    method: 'get',
    params: query
  })
}

// 查询农资类别详细
export function getType(materialTypeId) {
  return request({
    url: '/system/material/type/' + materialTypeId,
    method: 'get'
  })
}

// 新增农资类别
export function addType(data) {
  return request({
    url: '/system/material/type',
    method: 'post',
    data: data
  })
}

// 修改农资类别
export function updateType(data) {
  return request({
    url: '/system/material/type',
    method: 'put',
    data: data
  })
}

// 删除农资类别
export function delType(materialTypeId) {
  return request({
    url: '/system/material/type/' + materialTypeId,
    method: 'delete'
  })
}
