import request from '@/utils/request'

/**
 * 获取大屏所需的聚合数据
 * 整合地块、批次、农资数据
 */
export function getScreenData() {
  return request({
    url: '/system/land/screen',
    method: 'get'
  })
}

/**
 * 获取所有地块列表(不分页)
 */
export function listAllLand() {
  return request({
    url: '/system/land/list',
    method: 'get',
    params: { pageNum: 1, pageSize: 1000 }
  })
}

/**
 * 获取所有批次列表(不分页)
 */
export function listAllBatch() {
  return request({
    url: '/system/batch/list',
    method: 'get',
    params: { pageNum: 1, pageSize: 1000 }
  })
}

/**
 * 获取农资列表(NPK肥料数据)
 */
export function listAllMaterial() {
  return request({
    url: '/system/material/list',
    method: 'get',
    params: { pageNum: 1, pageSize: 1000 }
  })
}
