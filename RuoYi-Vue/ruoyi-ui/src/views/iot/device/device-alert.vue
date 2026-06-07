<template>
  <div style="padding:6px;">
    <el-card v-show="showSearch" style="margin-bottom:5px;">
      <el-form :model="queryParams" ref="queryForm" :inline="true" label-width="80px" style="margin-bottom:-20px;">
        <el-form-item label="告警名称" prop="alertName">
          <el-input v-model="queryParams.alertName" placeholder="请输入告警名称" clearable size="small" @keyup.enter.native="handleQuery" />
        </el-form-item>
        <el-form-item label="设备名称" prop="deviceName">
          <el-input v-model="queryParams.deviceName" placeholder="请输入设备名称" clearable size="small" @keyup.enter.native="handleQuery" />
        </el-form-item>
        <el-form-item label="告警级别" prop="alertLevel">
          <el-select v-model="queryParams.alertLevel" placeholder="告警级别" clearable size="small">
            <el-option label="提示" :value="1" /><el-option label="一般" :value="2" /><el-option label="严重" :value="3" /><el-option label="紧急" :value="4" />
          </el-select>
        </el-form-item>
        <el-form-item label="处理状态" prop="status">
          <el-select v-model="queryParams.status" placeholder="处理状态" clearable size="small">
            <el-option label="未处理" :value="0" /><el-option label="已确认" :value="1" /><el-option label="已处理" :value="2" />
          </el-select>
        </el-form-item>
        <el-form-item>
          <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
          <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
        </el-form-item>
        <el-form-item style="float:right;">
          <el-button type="danger" plain icon="el-icon-delete" size="mini"
            @click="handleBatchDelete" v-hasPermi="['iot:alert:remove']" :disabled="multiple">批量删除</el-button>
        </el-form-item>
      </el-form>
    </el-card>

    <el-card style="padding-bottom:100px;">
      <el-row :gutter="20" style="margin-bottom:15px;">
        <el-col :span="6">
          <el-card shadow="never" style="border-left:4px solid #F56C6C;">
            <div style="font-size:12px;color:#999;">未处理</div><div style="font-size:24px;font-weight:bold;color:#F56C6C;">{{ stat.unhandled }}</div>
          </el-card>
        </el-col>
        <el-col :span="6">
          <el-card shadow="never" style="border-left:4px solid #E6A23C;">
            <div style="font-size:12px;color:#999;">已确认</div><div style="font-size:24px;font-weight:bold;color:#E6A23C;">{{ stat.confirmed }}</div>
          </el-card>
        </el-col>
        <el-col :span="6">
          <el-card shadow="never" style="border-left:4px solid #67C23A;">
            <div style="font-size:12px;color:#999;">已处理</div><div style="font-size:24px;font-weight:bold;color:#67C23A;">{{ stat.handled }}</div>
          </el-card>
        </el-col>
        <el-col :span="6">
          <el-card shadow="never" style="border-left:4px solid #909399;">
            <div style="font-size:12px;color:#999;">告警总数</div><div style="font-size:24px;font-weight:bold;">{{ stat.total }}</div>
          </el-card>
        </el-col>
      </el-row>

      <el-table v-loading="loading" :data="alertList" @selection-change="handleSelectionChange" border>
        <el-table-column type="selection" width="50" align="center" />
        <el-table-column label="告警名称" align="center" prop="alertName" min-width="140">
          <template slot-scope="scope">
            <el-link type="primary" :underline="false" @click="handleView(scope.row)">{{ scope.row.alertName }}</el-link>
          </template>
        </el-table-column>
        <el-table-column label="设备名称" align="center" prop="deviceName" min-width="130" />
        <el-table-column label="告警级别" align="center" prop="alertLevel" width="80">
          <template slot-scope="scope">
            <el-tag :type="alertLevelType(scope.row.alertLevel)" size="small" effect="dark">{{ alertLevelLabel(scope.row.alertLevel) }}</el-tag>
          </template>
        </el-table-column>
        <el-table-column label="告警内容" prop="alertContent" min-width="200" show-overflow-tooltip />
        <el-table-column label="告警来源" align="center" prop="source" width="90"><template slot-scope="scope"><span>{{ scope.row.source || '-' }}</span></template></el-table-column>
        <el-table-column label="告警时间" align="center" prop="alertTime" width="150"><template slot-scope="scope"><span>{{ parseTime(scope.row.alertTime) }}</span></template></el-table-column>
        <el-table-column label="处理状态" align="center" prop="status" width="90">
          <template slot-scope="scope"><el-tag :type="handleStatusType(scope.row.status)" size="small">{{ handleStatusLabel(scope.row.status) }}</el-tag></template>
        </el-table-column>
        <el-table-column label="操作" align="center" width="200">
          <template slot-scope="scope">
            <el-button size="mini" type="primary" style="padding:5px" icon="el-icon-view" @click="handleView(scope.row)" v-hasPermi="['iot:alert:query']">详情</el-button>
            <el-button size="mini" type="success" style="padding:5px" icon="el-icon-check" v-if="scope.row.status == 0" @click="handleProcess(scope.row)" v-hasPermi="['iot:alert:handle']">处理</el-button>
            <el-button size="mini" type="danger" style="padding:5px" icon="el-icon-delete" @click="handleDelete(scope.row)" v-hasPermi="['iot:alert:remove']">删除</el-button>
          </template>
        </el-table-column>
      </el-table>

      <pagination v-show="total>0" :total="total" :page.sync="queryParams.pageNum" :limit.sync="queryParams.pageSize" @pagination="getList" />

      <!-- 告警详情 -->
      <el-dialog title="告警详情" :visible.sync="openDetail" width="600px" append-to-body>
        <el-descriptions :column="2" border size="small" v-if="alertDetail.alertId">
          <el-descriptions-item label="告警名称">{{ alertDetail.alertName }}</el-descriptions-item>
          <el-descriptions-item label="告警级别"><el-tag :type="alertLevelType(alertDetail.alertLevel)" size="small">{{ alertLevelLabel(alertDetail.alertLevel) }}</el-tag></el-descriptions-item>
          <el-descriptions-item label="设备名称">{{ alertDetail.deviceName || '-' }}</el-descriptions-item>
          <el-descriptions-item label="所属产品">{{ alertDetail.productName || '-' }}</el-descriptions-item>
          <el-descriptions-item label="告警内容" :span="2">{{ alertDetail.alertContent }}</el-descriptions-item>
          <el-descriptions-item label="告警来源">{{ alertDetail.source || '-' }}</el-descriptions-item>
          <el-descriptions-item label="来源标识">{{ alertDetail.sourceIdentifier || '-' }}</el-descriptions-item>
          <el-descriptions-item label="告警类型">{{ alertDetail.alertType || '-' }}</el-descriptions-item>
          <el-descriptions-item label="告警时间">{{ parseTime(alertDetail.alertTime) }}</el-descriptions-item>
          <el-descriptions-item label="处理状态"><el-tag :type="handleStatusType(alertDetail.status)" size="small">{{ handleStatusLabel(alertDetail.status) }}</el-tag></el-descriptions-item>
          <el-descriptions-item label="处理人" v-if="alertDetail.handler">{{ alertDetail.handler }}</el-descriptions-item>
          <el-descriptions-item label="处理时间" v-if="alertDetail.handleTime">{{ parseTime(alertDetail.handleTime) }}</el-descriptions-item>
          <el-descriptions-item label="处理备注" :span="2" v-if="alertDetail.handleRemark">{{ alertDetail.handleRemark }}</el-descriptions-item>
        </el-descriptions>
        <el-empty description="暂无数据" v-else></el-empty>
      </el-dialog>

      <!-- 处理 -->
      <el-dialog title="处理告警" :visible.sync="openProcess" width="500px" append-to-body>
        <el-form ref="processForm" :model="processForm" :rules="processRules" label-width="80px">
          <el-form-item label="告警名称"><el-input v-model="processForm.alertName" disabled /></el-form-item>
          <el-form-item label="处理方式" prop="status">
            <el-radio-group v-model="processForm.status"><el-radio :label="1">已确认</el-radio><el-radio :label="2">已处理</el-radio></el-radio-group>
          </el-form-item>
          <el-form-item label="处理备注" prop="handleRemark"><el-input v-model="processForm.handleRemark" type="textarea" placeholder="请输入处理备注" /></el-form-item>
        </el-form>
        <div slot="footer">
          <el-button type="primary" @click="submitProcess">确 定</el-button>
          <el-button @click="openProcess = false">取 消</el-button>
        </div>
      </el-dialog>
    </el-card>
  </div>
</template>

<script>
import { listAlert, getAlert, delAlert, handleAlert } from "@/api/iot/alert";

export default {
  name: "DeviceAlert",
  data() {
    return {
      loading: false, showSearch: true, ids: [], single: true, multiple: true, total: 0, alertList: [],
      stat: { total: 0, unhandled: 0, confirmed: 0, handled: 0 },
      queryParams: { pageNum: 1, pageSize: 10, alertName: null, deviceName: null, alertLevel: null, status: null },
      openDetail: false, alertDetail: {},
      openProcess: false,
      processForm: { alertId: null, alertName: "", status: 2, handleRemark: "" },
      processRules: { status: [{ required: true, message: "请选择处理方式" }] }
    };
  },
  created() { this.getList(); },
  methods: {
    getList() {
      this.loading = true;
      listAlert(this.queryParams).then(response => { this.alertList = response.rows; this.total = response.total; this.loading = false; this.getStat(); }).catch(() => { this.loading = false; });
    },
    getStat() {
      Promise.all([
        listAlert({ pageNum: 1, pageSize: 1 }),
        listAlert({ pageNum: 1, pageSize: 1, status: 0 }),
        listAlert({ pageNum: 1, pageSize: 1, status: 1 }),
        listAlert({ pageNum: 1, pageSize: 1, status: 2 })
      ]).then(([all, un, conf, han]) => { this.stat.total = all.total; this.stat.unhandled = un.total; this.stat.confirmed = conf.total; this.stat.handled = han.total; });
    },
    alertLevelType(l) { const m={1:'',2:'warning',3:'danger',4:'danger'}; return m[l]||'info'; },
    alertLevelLabel(l) { const m={1:'提示',2:'一般',3:'严重',4:'紧急'}; return m[l]||'未知'; },
    handleStatusType(s) { const m={0:'danger',1:'warning',2:'success'}; return m[s]||'info'; },
    handleStatusLabel(s) { const m={0:'未处理',1:'已确认',2:'已处理'}; return m[s]||'未知'; },
    handleQuery() { this.queryParams.pageNum = 1; this.getList(); },
    resetQuery() { this.$refs.queryForm && this.$refs.queryForm.resetFields(); this.handleQuery(); },
    handleSelectionChange(selection) { this.ids = selection.map(item => item.alertId); this.single = selection.length !== 1; this.multiple = !selection.length; },
    handleView(row) {
      if (row.alertId) { getAlert(row.alertId).then(res => { this.alertDetail = res.data; this.openDetail = true; }); }
      else { this.alertDetail = { ...row }; this.openDetail = true; }
    },
    handleProcess(row) { this.processForm = { alertId: row.alertId, alertName: row.alertName, status: 2, handleRemark: "" }; this.openProcess = true; },
    submitProcess() { handleAlert(this.processForm).then(() => { this.$modal.msgSuccess("处理成功"); this.openProcess = false; this.getList(); }); },
    handleDelete(row) {
      const ids = row.alertId || this.ids;
      this.$modal.confirm('是否确认删除告警ID为"' + ids + '"的数据项？').then(() => delAlert(ids)).then(() => { this.getList(); this.$modal.msgSuccess("删除成功"); }).catch(() => {});
    },
    handleBatchDelete() { this.$modal.confirm('是否确认删除选中的' + this.ids.length + '条告警？').then(() => delAlert(this.ids.join(','))).then(() => { this.getList(); this.$modal.msgSuccess("批量删除成功"); }).catch(() => {}); }
  }
};
</script>
