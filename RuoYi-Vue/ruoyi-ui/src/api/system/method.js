import request from '@/utils/request'

// 查询种植方法列表
export function listMethod(query) {
  return request({
    url: '/system/method/list',
    method: 'get',
    params: query
  })
}

// 查询种植方法详细
export function getMethod(methodId) {
  return request({
    url: '/system/method/' + methodId,
    method: 'get'
  })
}

// 新增种植方法
export function addMethod(data) {
  return request({
    url: '/system/method',
    method: 'post',
    data: data
  })
}

// 修改种植方法
export function updateMethod(data) {
  return request({
    url: '/system/method',
    method: 'put',
    data: data
  })
}

// 删除种植方法
export function delMethod(methodId) {
  return request({
    url: '/system/method/' + methodId,
    method: 'delete'
  })
}
