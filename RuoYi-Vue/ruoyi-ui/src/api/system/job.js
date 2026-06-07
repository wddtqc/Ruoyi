import request from '@/utils/request'

// 查询标准作业任务列表
export function listJob(query) {
  return request({
    url: '/system/job/list',
    method: 'get',
    params: query
  })
}

// 查询标准作业任务详细
export function getJob(jobId) {
  return request({
    url: '/system/job/' + jobId,
    method: 'get'
  })
}

// 新增标准作业任务
export function addJob(data) {
  return request({
    url: '/system/job',
    method: 'post',
    data: data
  })
}

// 修改标准作业任务
export function updateJob(data) {
  return request({
    url: '/system/job',
    method: 'put',
    data: data
  })
}

// 删除标准作业任务
export function delJob(jobId) {
  return request({
    url: '/system/job/' + jobId,
    method: 'delete'
  })
}
