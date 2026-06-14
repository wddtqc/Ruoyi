import request from '@/utils/request'

// 查询批次任务列表
export function listBatchTask(query) {
  return request({
    url: '/system/task/list',
    method: 'get',
    params: query
  })
}

// 查询批次任务详细
export function getBatchTask(taskId) {
  return request({
    url: '/system/task/' + taskId,
    method: 'get'
  })
}

// 新增批次任务
export function addBatchTask(data) {
  return request({
    url: '/system/task',
    method: 'post',
    data: data
  })
}

// 修改批次任务
export function updateBatchTask(data) {
  return request({
    url: '/system/task',
    method: 'put',
    data: data
  })
}

// 删除批次任务
export function delBatchTask(taskId) {
  return request({
    url: '/system/task/' + taskId,
    method: 'delete'
  })
}
