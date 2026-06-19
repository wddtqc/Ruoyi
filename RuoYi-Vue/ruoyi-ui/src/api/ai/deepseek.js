import request from '@/utils/request'

// 获取最新的告警和任务数据用于AI分析
export function getLatestData() {
  return request({
    url: '/ai/deepseek/latestData',
    method: 'get'
  })
}

// 调用DeepSeek API进行数据分析
export function analyzeData(data) {
  return request({
    url: '/ai/deepseek/analyze',
    method: 'post',
    data: data,
    timeout: 60000 // 60秒超时，AI分析可能需要较长时间
  })
}

// AI对话接口
export function chatWithAI(data) {
  return request({
    url: '/ai/deepseek/chat',
    method: 'post',
    data: data,
    timeout: 30000 // 30秒超时
  })
}

// 获取历史分析记录
export function getAnalysisHistory(query) {
  return request({
    url: '/ai/deepseek/history',
    method: 'get',
    params: query
  })
}
