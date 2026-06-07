import request from '@/utils/request'

// 查询地块列表
export function listLand(query) {
  return request({
    url: '/system/land/list', // 👈 已经修改：与后端 @GetMapping("/list") 保持一致
    method: 'get',
    params: query
  })
}

// 查询地块详细
export function getLand(landId) {
  return request({
    url: '/system/land/' + landId, // 与后端 @GetMapping(value = "/{landId}") 对应
    method: 'get'
  })
}

// 新增地块
export function addLand(data) {
  return request({
    url: '/system/land', // 与后端 @PostMapping 对应
    method: 'post',
    data: data
  })
}

// 修改地块
export function updateLand(data) {
  return request({
    url: '/system/land', // 与后端 @PutMapping 对应
    method: 'put',
    data: data
  })
}

// 删除地块
export function delLand(landId) {
  return request({
    url: '/system/land/' + landId, // 与后端 @DeleteMapping("/{landIds}") 对应
    method: 'delete'
  })
}
