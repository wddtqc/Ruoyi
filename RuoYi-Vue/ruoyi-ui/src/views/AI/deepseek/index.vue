
<template>
  <div class="app-container">
    <el-card class="card-margin-bottom">
      <div slot="header" class="clearfix">
        <span style="font-size: 18px; font-weight: bold;">数智农业 AI 数据分析</span>
        <el-button style="float: right;" type="primary" size="small" icon="el-icon-refresh" @click="handleRefreshData">刷新数据</el-button>
      </div>
      <!-- 数据概览 -->
      <el-row :gutter="20" class="data-overview">
        <el-col :span="8">
          <div class="overview-item">
            <div class="overview-icon alert-icon">
              <i class="el-icon-warning"></i>
            </div>
            <div class="overview-content">
              <div class="overview-label">最新告警</div>
              <div class="overview-value">{{ alertCount }} 条</div>
            </div>
          </div>
        </el-col>
        <el-col :span="8">
          <div class="overview-item">
            <div class="overview-icon task-icon">
              <i class="el-icon-s-claim"></i>
            </div>
            <div class="overview-content">
              <div class="overview-label">待处理任务</div>
              <div class="overview-value">{{ taskCount }} 条</div>
            </div>
          </div>
        </el-col>
        <el-col :span="8">
          <div class="overview-item">
            <div class="overview-icon data-icon">
              <i class="el-icon-data-analysis"></i>
            </div>
            <div class="overview-content">
              <div class="overview-label">数据更新时间</div>
              <div class="overview-value" style="font-size: 14px;">{{ dataUpdateTime }}</div>
            </div>
          </div>
        </el-col>
      </el-row>
    </el-card>

    <!-- 数据详情 -->
    <el-row :gutter="20">
      <el-col :span="12">
        <el-card class="card-margin-bottom">
          <div slot="header">
            <span>最新告警数据</span>
          </div>
          <el-table :data="alertList" style="width: 100%" max-height="300" v-loading="loadingData">
            <el-table-column prop="deviceName" label="设备名称" width="120"></el-table-column>
            <el-table-column prop="alertType" label="告警类型" width="100">
              <template slot-scope="scope">
                <el-tag :type="getAlertTypeTag(scope.row.alertType)" size="small">{{ scope.row.alertType }}</el-tag>
              </template>
            </el-table-column>
            <el-table-column prop="alertLevel" label="告警级别" width="80">
              <template slot-scope="scope">
                <el-tag :type="getAlertLevelTag(scope.row.alertLevel)" size="small">{{ getAlertLevelText(scope.row.alertLevel) }}</el-tag>
              </template>
            </el-table-column>
            <el-table-column prop="alertTime" label="时间" width="160">
              <template slot-scope="scope">
                <span>{{ parseTime(scope.row.alertTime) }}</span>
              </template>
            </el-table-column>
          </el-table>
        </el-card>
      </el-col>
      <el-col :span="12">
        <el-card class="card-margin-bottom">
          <div slot="header">
            <span>任务管理数据</span>
          </div>
          <el-table :data="taskList" style="width: 100%" max-height="300" v-loading="loadingData">
            <el-table-column prop="taskName" label="任务名称" width="150"></el-table-column>
            <el-table-column prop="status" label="状态" width="100">
              <template slot-scope="scope">
                <el-tag :type="getTaskStatusTag(scope.row.status)" size="small">{{ getTaskStatusText(scope.row.status) }}</el-tag>
              </template>
            </el-table-column>
            <el-table-column prop="planStart" label="计划时间" width="160">
              <template slot-scope="scope">
                <span>{{ parseTime(scope.row.planStart) }}</span>
              </template>
            </el-table-column>
          </el-table>
        </el-card>
      </el-col>
    </el-row>

    <!-- AI对话区域 -->
    <el-row :gutter="20">
      <el-col :span="12">
        <el-card class="card-margin-bottom chat-card">
          <div slot="header">
            <span>AI 智能对话</span>
            <el-tag size="mini" type="success" style="margin-left: 10px;">实时咨询</el-tag>
          </div>

          <div class="chat-container">
            <div class="chat-messages" ref="chatMessages">
              <div v-if="chatHistory.length === 0" class="empty-chat">
                <i class="el-icon-chat-dot-round" style="font-size: 48px; color: #dcdfe6;"></i>
                <p style="color: #909399; margin-top: 16px;">向AI助手咨询告警情况或农场实际情况</p>
              </div>
              <div v-for="(msg, index) in chatHistory" :key="index" :class="['chat-message', msg.role]">
                <div class="message-avatar">
                  <i :class="msg.role === 'user' ? 'el-icon-user-solid' : 'el-icon-s-custom'"></i>
                </div>
                <div class="message-content">
                  <div class="message-text" v-html="msg.role === 'assistant' ? formatMarkdown(msg.content) : msg.content"></div>
                  <div class="message-time">{{ msg.time }}</div>
                </div>
              </div>
            </div>

            <div class="chat-input-area">
              <el-input
                v-model="userQuestion"
                placeholder="例如：当前有哪些告警？土壤湿度如何？"
                @keyup.enter.native="handleSendMessage"
                :disabled="chatLoading"
              >
                <el-button
                  slot="append"
                  icon="el-icon-s-promotion"
                  @click="handleSendMessage"
                  :loading="chatLoading"
                >发送</el-button>
              </el-input>
            </div>
          </div>
        </el-card>
      </el-col>

      <el-col :span="12">
        <el-card class="card-margin-bottom">
          <div slot="header">
            <span>AI 智能分析</span>
            <el-button
              style="float: right;"
              type="success"
              size="small"
              icon="el-icon-magic-stick"
              @click="handleAnalyze"
              :loading="analyzing"
              :disabled="!hasData"
            >{{ analyzing ? '分析中...' : '开始分析' }}</el-button>
          </div>

      <div v-if="!analysisResult && !analyzing" class="empty-analysis">
        <i class="el-icon-data-analysis" style="font-size: 64px; color: #dcdfe6;"></i>
        <p style="color: #909399; margin-top: 16px;">点击"开始分析"按钮，让 DeepSeek AI 为您分析土壤、气象、水质数据及告警任务</p>
      </div>

      <div v-if="analyzing" class="analyzing-status">
        <el-progress :percentage="analyzeProgress" :stroke-width="18" status="success"></el-progress>
        <p style="text-align: center; margin-top: 16px; color: #67c23a;">AI 正在分析数据，请稍候...</p>
      </div>

      <div v-if="analysisResult && !analyzing" class="analysis-result">
        <el-alert
          title="分析完成"
          type="success"
          :closable="false"
          show-icon
          style="margin-bottom: 20px;"
        >
          <div slot="default">分析时间: {{ analysisTime }}</div>
        </el-alert>

        <div class="result-content">
          <div class="markdown-body" v-html="formattedResult"></div>
        </div>

        <div style="margin-top: 20px; text-align: right;">
          <el-button size="small" icon="el-icon-document-copy" @click="handleCopyResult">复制结果</el-button>
          <el-button size="small" type="primary" icon="el-icon-download" @click="handleExportResult">导出报告</el-button>
        </div>
      </div>
        </el-card>
      </el-col>
    </el-row>
  </div>
</template>

<script>
import { getLatestData, analyzeData, chatWithAI } from "@/api/ai/deepseek";
import { marked } from 'marked';

export default {
  name: "DeepseekAnalysis",
  data() {
    return {
      loadingData: false,
      analyzing: false,
      analyzeProgress: 0,
      alertList: [],
      taskList: [],
      alertCount: 0,
      taskCount: 0,
      dataUpdateTime: '-',
      analysisResult: '',
      analysisTime: '',
      hasData: false,
      // 对话相关
      chatHistory: [],
      userQuestion: '',
      chatLoading: false
    };
  },
  computed: {
    formattedResult() {
      if (!this.analysisResult) return '';
      // 使用marked库将markdown转换为HTML
      return marked(this.analysisResult);
    }
  },
  created() {
    this.loadLatestData();
  },
  methods: {
    // 加载最新数据
    loadLatestData() {
      this.loadingData = true;
      getLatestData().then(response => {
        if (response.code === 200) {
          const data = response.data;
          this.alertList = data.alertList || [];
          this.taskList = data.taskList || [];
          this.alertCount = this.alertList.length;
          this.taskCount = this.taskList.length;
          this.dataUpdateTime = this.parseTime(new Date());
          this.hasData = this.alertCount > 0 || this.taskCount > 0;

          if (!this.hasData) {
            this.$message.warning('暂无告警或任务数据');
          }
        }
        this.loadingData = false;
      }).catch(() => {
        this.loadingData = false;
        this.$message.error('加载数据失败');
      });
    },

    // 刷新数据
    handleRefreshData() {
      this.loadLatestData();
      this.$message.success('数据已刷新');
    },

    // 开始AI分析
    handleAnalyze() {
      if (!this.hasData) {
        this.$message.warning('没有可分析的数据');
        return;
      }

      this.analyzing = true;
      this.analyzeProgress = 0;
      this.analysisResult = '';

      // 模拟进度条
      const progressTimer = setInterval(() => {
        if (this.analyzeProgress < 90) {
          this.analyzeProgress += Math.random() * 10;
        }
      }, 500);

      const analysisData = {
        alertList: this.alertList,
        taskList: this.taskList
      };

      analyzeData(analysisData).then(response => {
        clearInterval(progressTimer);
        this.analyzeProgress = 100;

        if (response.code === 200) {
          this.analysisResult = response.data.analysis || response.msg;
          this.analysisTime = this.parseTime(new Date());
          this.$message.success('分析完成');
        } else {
          this.$message.error(response.msg || '分析失败');
        }

        setTimeout(() => {
          this.analyzing = false;
          this.analyzeProgress = 0;
        }, 500);
      }).catch(error => {
        clearInterval(progressTimer);
        this.analyzing = false;
        this.analyzeProgress = 0;
        this.$message.error('分析失败: ' + (error.message || '未知错误'));
      });
    },

    // 复制结果
    handleCopyResult() {
      const textarea = document.createElement('textarea');
      textarea.value = this.analysisResult;
      document.body.appendChild(textarea);
      textarea.select();
      document.execCommand('copy');
      document.body.removeChild(textarea);
      this.$message.success('已复制到剪贴板');
    },

    // 导出报告
    handleExportResult() {
      const blob = new Blob([this.analysisResult], { type: 'text/markdown' });
      const url = window.URL.createObjectURL(blob);
      const a = document.createElement('a');
      a.href = url;
      a.download = `数智农业AI分析报告_${new Date().getTime()}.md`;
      a.click();
      window.URL.revokeObjectURL(url);
      this.$message.success('报告已导出');
    },

    // 获取告警类型标签
    getAlertTypeTag(type) {
      const typeMap = {
        '温度': 'danger',
        '湿度': 'warning',
        '水质': 'info',
        '土壤': 'success'
      };
      return typeMap[type] || 'info';
    },

    // 获取告警级别标签
    getAlertLevelTag(level) {
      const levelMap = {
        1: 'info',
        2: 'warning',
        3: 'danger',
        4: 'danger'
      };
      return levelMap[level] || 'info';
    },

    // 获取告警级别文本
    getAlertLevelText(level) {
      const textMap = {
        1: '提示',
        2: '一般',
        3: '严重',
        4: '紧急'
      };
      return textMap[level] || '未知';
    },

    // 获取任务状态标签
    getTaskStatusTag(status) {
      const statusMap = {
        '0': 'info',
        '1': 'warning',
        '2': 'success',
        '3': 'danger'
      };
      return statusMap[status] || 'info';
    },

    // 获取任务状态文本
    getTaskStatusText(status) {
      const textMap = {
        '0': '待处理',
        '1': '进行中',
        '2': '已完成',
        '3': '已取消'
      };
      return textMap[status] || '未知';
    },

    // 发送消息
    handleSendMessage() {
      if (!this.userQuestion || this.userQuestion.trim() === '') {
        this.$message.warning('请输入您的问题');
        return;
      }

      const question = this.userQuestion.trim();

      // 添加用户消息到历史
      this.chatHistory.push({
        role: 'user',
        content: question,
        time: this.formatTime(new Date())
      });

      this.userQuestion = '';
      this.chatLoading = true;

      // 滚动到底部
      this.$nextTick(() => {
        this.scrollToBottom();
      });

      // 构建对话历史（只保留最近5轮对话）
      const history = this.chatHistory.slice(-10).map(msg => ({
        role: msg.role === 'user' ? 'user' : 'assistant',
        content: msg.content
      }));

      // 调用AI对话接口
      chatWithAI({
        question: question,
        history: history.slice(0, -1) // 不包含当前问题
      }).then(response => {
        if (response.code === 200) {
          this.chatHistory.push({
            role: 'assistant',
            content: response.data.answer,
            time: this.formatTime(new Date())
          });

          this.$nextTick(() => {
            this.scrollToBottom();
          });
        } else {
          this.$message.error(response.msg || 'AI对话失败');
          // 移除用户消息
          this.chatHistory.pop();
        }
        this.chatLoading = false;
      }).catch(error => {
        this.$message.error('AI对话失败: ' + (error.message || '未知错误'));
        this.chatHistory.pop();
        this.chatLoading = false;
      });
    },

    // 格式化时间
    formatTime(date) {
      const hours = String(date.getHours()).padStart(2, '0');
      const minutes = String(date.getMinutes()).padStart(2, '0');
      return `${hours}:${minutes}`;
    },

    // 滚动到底部
    scrollToBottom() {
      const container = this.$refs.chatMessages;
      if (container) {
        container.scrollTop = container.scrollHeight;
      }
    },

    // 格式化Markdown
    formatMarkdown(text) {
      if (!text) return '';
      return marked(text);
    }
  }
};
</script>

<style lang="scss" scoped>
.data-overview {
  margin-bottom: 0;
}

.overview-item {
  display: flex;
  align-items: center;
  padding: 20px;
  background: #f5f7fa;
  border-radius: 4px;
  transition: all 0.3s;

  &:hover {
    transform: translateY(-2px);
    box-shadow: 0 2px 12px rgba(0, 0, 0, 0.1);
  }
}

.overview-icon {
  width: 60px;
  height: 60px;
  border-radius: 50%;
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 28px;
  margin-right: 16px;

  &.alert-icon {
    background: #fef0f0;
    color: #f56c6c;
  }

  &.task-icon {
    background: #f0f9ff;
    color: #409eff;
  }

  &.data-icon {
    background: #f0f9f0;
    color: #67c23a;
  }
}

.overview-content {
  flex: 1;
}

.overview-label {
  font-size: 14px;
  color: #909399;
  margin-bottom: 8px;
}

.overview-value {
  font-size: 24px;
  font-weight: bold;
  color: #303133;
}

// 对话样式
.chat-card {
  height: 600px;
  display: flex;
  flex-direction: column;

  ::v-deep .el-card__body {
    flex: 1;
    display: flex;
    flex-direction: column;
    padding: 0;
    overflow: hidden;
  }
}

.chat-container {
  display: flex;
  flex-direction: column;
  height: 100%;
}

.chat-messages {
  flex: 1;
  overflow-y: auto;
  padding: 20px;
  background: #f5f7fa;
}

.empty-chat {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  height: 100%;
}

.chat-message {
  display: flex;
  margin-bottom: 20px;
  animation: fadeIn 0.3s;

  &.user {
    flex-direction: row-reverse;

    .message-avatar {
      background: #409eff;
      margin-left: 10px;
      margin-right: 0;
    }

    .message-content {
      background: #409eff;
      color: #fff;
      align-items: flex-end;
    }

    .message-time {
      text-align: right;
      color: rgba(255, 255, 255, 0.8);
    }
  }

  &.assistant {
    .message-avatar {
      background: #67c23a;
      margin-right: 10px;
    }

    .message-content {
      background: #fff;
      color: #303133;
    }
  }
}

.message-avatar {
  width: 36px;
  height: 36px;
  border-radius: 50%;
  display: flex;
  align-items: center;
  justify-content: center;
  color: #fff;
  font-size: 18px;
  flex-shrink: 0;
}

.message-content {
  max-width: 70%;
  padding: 12px 16px;
  border-radius: 8px;
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
}

.message-text {
  line-height: 1.6;
  word-wrap: break-word;

  ::v-deep p {
    margin: 5px 0;
  }

  ::v-deep ul, ::v-deep ol {
    padding-left: 20px;
    margin: 5px 0;
  }

  ::v-deep strong {
    font-weight: bold;
  }

  ::v-deep code {
    background: rgba(0, 0, 0, 0.1);
    padding: 2px 4px;
    border-radius: 3px;
    font-family: monospace;
  }
}

.message-time {
  font-size: 12px;
  color: #909399;
  margin-top: 5px;
}

.chat-input-area {
  padding: 16px;
  border-top: 1px solid #ebeef5;
  background: #fff;
}

@keyframes fadeIn {
  from {
    opacity: 0;
    transform: translateY(10px);
  }
  to {
    opacity: 1;
    transform: translateY(0);
  }
}

.empty-analysis {
  text-align: center;
  padding: 60px 20px;
}

.analyzing-status {
  padding: 40px 20px;
}

.analysis-result {
  .result-content {
    background: #f5f7fa;
    padding: 20px;
    border-radius: 4px;
    min-height: 200px;

    .markdown-body {
      line-height: 1.8;
      color: #303133;

      ::v-deep h1, ::v-deep h2, ::v-deep h3 {
        margin-top: 20px;
        margin-bottom: 10px;
        font-weight: bold;
      }

      ::v-deep h1 {
        font-size: 24px;
        border-bottom: 2px solid #409eff;
        padding-bottom: 10px;
      }

      ::v-deep h2 {
        font-size: 20px;
        color: #409eff;
      }

      ::v-deep h3 {
        font-size: 18px;
      }

      ::v-deep p {
        margin: 10px 0;
      }

      ::v-deep ul, ::v-deep ol {
        padding-left: 24px;
        margin: 10px 0;
      }

      ::v-deep li {
        margin: 5px 0;
      }

      ::v-deep strong {
        color: #409eff;
        font-weight: bold;
      }

      ::v-deep code {
        background: #e6f7ff;
        padding: 2px 6px;
        border-radius: 3px;
        font-family: 'Courier New', monospace;
      }

      ::v-deep pre {
        background: #f5f5f5;
        padding: 15px;
        border-radius: 4px;
        overflow-x: auto;
      }

      ::v-deep blockquote {
        border-left: 4px solid #409eff;
        padding-left: 16px;
        margin: 16px 0;
        color: #606266;
      }
    }
  }
}

.card-margin-bottom {
  margin-bottom: 20px;
}
</style>
