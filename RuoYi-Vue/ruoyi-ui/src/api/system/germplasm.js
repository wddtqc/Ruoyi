import request from '@/utils/request'

// 查询种质列表
export function listGermplasm(query) {
  return request({
    url: '/system/germplasm/list',
    method: 'get',
    params: query
  })
}

// 查询种质详细
export function getGermplasm(germplasmId) {
  return request({
    url: '/system/germplasm/' + germplasmId,
    method: 'get'
  })
}

// 新增种质
export function addGermplasm(data) {
  return request({
    url: '/system/germplasm',
    method: 'post',
    data: data
  })
}

// 修改种质
export function updateGermplasm(data) {
  return request({
    url: '/system/germplasm',
    method: 'put',
    data: data
  })
}

// 删除种质
export function delGermplasm(germplasmId) {
  return request({
    url: '/system/germplasm/' + germplasmId,
    method: 'delete'
  })
}
