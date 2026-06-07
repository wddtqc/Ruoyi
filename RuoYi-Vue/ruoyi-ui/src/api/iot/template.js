import request from '@/utils/request'

// 查询物模型模板列表
export function listTemplate(query) {
  return request({
    url: '/iot/template/list',
    method: 'get',
    params: query
  })
}

// 查询物模型模板详细
export function getTemplate(templateId) {
  return request({
    url: '/iot/template/' + templateId,
    method: 'get'
  })
}

// 新增物模型模板
export function addTemplate(data) {
  return request({
    url: '/iot/template',
    method: 'post',
    data: data
  })
}

// 修改物模型模板
export function updateTemplate(data) {
  return request({
    url: '/iot/template',
    method: 'put',
    data: data
  })
}

// 删除物模型模板
export function delTemplate(templateId) {
  return request({
    url: '/iot/template/' + templateId,
    method: 'delete'
  })
}
