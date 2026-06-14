import request from '@/utils/request'

// 查询农资用量列表
export function listCostMaterial(query) {
  return request({
    url: '/system/costMaterial/list',
    method: 'get',
    params: query
  })
}

// 查询农资用量详细
export function getCostMaterial(costId) {
  return request({
    url: '/system/costMaterial/' + costId,
    method: 'get'
  })
}

// 新增农资用量
export function addCostMaterial(data) {
  return request({
    url: '/system/costMaterial',
    method: 'post',
    data: data
  })
}

// 修改农资用量
export function updateCostMaterial(data) {
  return request({
    url: '/system/costMaterial',
    method: 'put',
    data: data
  })
}

// 删除农资用量
export function delCostMaterial(costId) {
  return request({
    url: '/system/costMaterial/' + costId,
    method: 'delete'
  })
}
