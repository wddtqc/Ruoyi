<template>
  <div style="padding:6px;">
    <el-card v-show="showSearch" style="margin-bottom:5px;">
      <el-form :model="queryParams" ref="queryForm" :inline="true" label-width="80px" style="margin-bottom:-20px;">
        <el-form-item label="设备名称" prop="deviceName">
          <el-input v-model="queryParams.deviceName" placeholder="请输入设备名称" clearable size="small" @keyup.enter.native="handleQuery" />
        </el-form-item>
        <el-form-item label="设备编号" prop="serialNumber">
          <el-input v-model="queryParams.serialNumber" placeholder="请输入设备编号" clearable size="small" @keyup.enter.native="handleQuery" />
        </el-form-item>
        <el-form-item label="设备状态" prop="status">
          <el-select v-model="queryParams.status" placeholder="设备状态" clearable size="small">
            <el-option v-for="dict in dict.type.iot_device_status" :key="dict.value" :label="dict.label" :value="parseInt(dict.value)" />
          </el-select>
        </el-form-item>
        <el-form-item label="设备类型" prop="deviceType">
          <el-select v-model="queryParams.deviceType" placeholder="设备类型" clearable size="small">
            <el-option v-for="dict in dict.type.iot_device_type" :key="dict.value" :label="dict.label" :value="parseInt(dict.value)" />
          </el-select>
        </el-form-item>
        <el-form-item>
          <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
          <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
        </el-form-item>
        <el-form-item style="float:right;">
          <el-button type="primary" plain icon="el-icon-plus" size="mini" @click="handleAdd" v-hasPermi="['iot:device:add']">新增</el-button>
        </el-form-item>
      </el-form>
    </el-card>

    <el-card style="padding-bottom:100px;">
      <!-- 统计卡片 -->
      <el-row :gutter="20" style="margin-bottom:15px;">
        <el-col :span="6">
          <el-card shadow="never" style="border-left:4px solid #409EFF;">
            <div style="display:flex;justify-content:space-between;">
              <div>
                <div style="font-size:12px;color:#999;">设备总数</div>
                <div style="font-size:24px;font-weight:bold;">{{ statistic.total }}</div>
              </div>
              <i class="el-icon-monitor" style="font-size:36px;color:#409EFF;line-height:48px;"></i>
            </div>
          </el-card>
        </el-col>
        <el-col :span="6">
          <el-card shadow="never" style="border-left:4px solid #67C23A;">
            <div style="display:flex;justify-content:space-between;">
              <div>
                <div style="font-size:12px;color:#999;">在线</div>
                <div style="font-size:24px;font-weight:bold;color:#67C23A;">{{ statistic.online }}</div>
              </div>
              <i class="el-icon-success" style="font-size:36px;color:#67C23A;line-height:48px;"></i>
            </div>
          </el-card>
        </el-col>
        <el-col :span="6">
          <el-card shadow="never" style="border-left:4px solid #F56C6C;">
            <div style="display:flex;justify-content:space-between;">
              <div>
                <div style="font-size:12px;color:#999;">离线</div>
                <div style="font-size:24px;font-weight:bold;color:#F56C6C;">{{ statistic.offline }}</div>
              </div>
              <i class="el-icon-warning" style="font-size:36px;color:#F56C6C;line-height:48px;"></i>
            </div>
          </el-card>
        </el-col>
        <el-col :span="6">
          <el-card shadow="never" style="border-left:4px solid #E6A23C;">
            <div style="display:flex;justify-content:space-between;">
              <div>
                <div style="font-size:12px;color:#999;">待处理告警</div>
                <div style="font-size:24px;font-weight:bold;color:#E6A23C;">{{ statistic.alertCount }}</div>
              </div>
              <i class="el-icon-bell" style="font-size:36px;color:#E6A23C;line-height:48px;"></i>
            </div>
          </el-card>
        </el-col>
      </el-row>

      <el-table v-loading="loading" :data="deviceList" @selection-change="handleSelectionChange" border>
        <el-table-column type="selection" width="50" align="center" />
        <el-table-column label="设备名称" align="center" prop="deviceName" min-width="130">
          <template slot-scope="scope">
            <el-link type="primary" :underline="false" @click="handleDetail(scope.row)">{{ scope.row.deviceName }}</el-link>
          </template>
        </el-table-column>
        <el-table-column label="设备编号" align="center" prop="serialNumber" min-width="140" />
        <el-table-column label="所属产品" align="center" prop="productName" min-width="120" />
        <el-table-column label="设备类型" align="center" prop="deviceType" width="100">
          <template slot-scope="scope">
            <dict-tag :options="dict.type.iot_device_type" :value="scope.row.deviceType" />
          </template>
        </el-table-column>
        <el-table-column label="所在地块" align="center" prop="landName" min-width="100" />
        <el-table-column label="设备状态" align="center" prop="status" width="100">
          <template slot-scope="scope">
            <el-tag :type="statusType(scope.row.status)" size="small" effect="dark">
              {{ statusLabel(scope.row.status) }}
            </el-tag>
          </template>
        </el-table-column>
        <el-table-column label="固件版本" align="center" prop="firmwareVersion" width="100" />
        <el-table-column label="激活时间" align="center" prop="activeTime" width="160">
          <template slot-scope="scope">
            <span>{{ parseTime(scope.row.activeTime, '{y}-{m}-{d} {h}:{i}') }}</span>
          </template>
        </el-table-column>
        <el-table-column label="操作" align="center" width="260">
          <template slot-scope="scope">
            <el-button size="small" type="primary" style="padding:5px" icon="el-icon-view"
              @click="handleDetail(scope.row)" v-hasPermi="['iot:device:query']">详情</el-button>
            <el-button size="small" type="success" style="padding:5px" icon="el-icon-edit"
              @click="handleUpdate(scope.row)" v-hasPermi="['iot:device:edit']">编辑</el-button>
            <el-button size="small" type="warning" style="padding:5px" icon="el-icon-delete"
              @click="handleDelete(scope.row)" v-hasPermi="['iot:device:remove']">删除</el-button>
          </template>
        </el-table-column>
      </el-table>

      <pagination v-show="total>0" :total="total" :page.sync="queryParams.pageNum" :limit.sync="queryParams.pageSize" @pagination="getList" />

      <!-- 添加或修改设备对话框 -->
      <el-dialog :title="title" :visible.sync="open" width="700px" append-to-body>
        <device-form ref="deviceForm" :device="form" @ok="getList" />
      </el-dialog>

      <!-- 设备详情对话框 -->
      <device-detail ref="deviceDetail" :visible.sync="openDetail" :device-id="currentDeviceId" />
    </el-card>
  </div>
</template>

<script>
import { listDevice, delDevice } from "@/api/iot/device";
import { listAlert } from "@/api/iot/alert";
import DeviceForm from "./device-form.vue";
import DeviceDetail from "./device-detail.vue";

export default {
  name: "Device",
  dicts: ["iot_device_status", "iot_device_type"],
  components: { DeviceForm, DeviceDetail },
  data() {
    return {
      loading: true,
      ids: [],
      single: true,
      multiple: true,
      showSearch: true,
      total: 0,
      deviceList: [],
      statistic: { total: 0, online: 0, offline: 0, alertCount: 0 },
      title: "",
      open: false,
      openDetail: false,
      currentDeviceId: null,
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        deviceName: null,
        serialNumber: null,
        status: null,
        deviceType: null,
        productId: this.$route.query && this.$route.query.productId ? parseInt(this.$route.query.productId) : null
      },
      form: {},
      rules: {}
    };
  },
  created() {
    this.getList();
    this.getStatistic();
  },
  methods: {
    getList() {
      this.loading = true;
      listDevice(this.queryParams).then(response => {
        this.deviceList = response.rows;
        this.total = response.total;
        this.loading = false;
      }).catch(() => { this.loading = false; });
    },
    getStatistic() {
      listDevice({ pageNum: 1, pageSize: 1 }).then(res => { this.statistic.total = res.total; });
      listDevice({ pageNum: 1, pageSize: 1, status: 3 }).then(res => { this.statistic.online = res.total; });
      listDevice({ pageNum: 1, pageSize: 1, status: 4 }).then(res => { this.statistic.offline = res.total; });
      listAlert({ pageNum: 1, pageSize: 1, status: 0 }).then(res => { this.statistic.alertCount = res.total; });
    },
    statusType(status) { const m = {1:'warning',2:'info',3:'success',4:'danger'}; return m[status]||'info'; },
    statusLabel(status) { const m = {1:'未激活',2:'禁用',3:'在线',4:'离线'}; return m[status]||'未知'; },
    handleQuery() { this.queryParams.pageNum = 1; this.getList(); },
    resetQuery() {
      this.queryParams.productId = this.$route.query && this.$route.query.productId ? parseInt(this.$route.query.productId) : null;
      this.$refs.queryForm && this.$refs.queryForm.resetFields();
      this.handleQuery();
    },
    handleAdd() { this.form = {}; this.title = "添加设备"; this.open = true; },
    handleUpdate(row) { this.form = { ...row }; this.title = "修改设备"; this.open = true; },
    handleDetail(row) { this.currentDeviceId = row.deviceId; this.openDetail = true; },
    handleDelete(row) {
      const ids = row.deviceId || this.ids;
      this.$modal.confirm('是否确认删除设备编号为"' + ids + '"的数据项？').then(() => delDevice(ids))
        .then(() => { this.getList(); this.getStatistic(); this.$modal.msgSuccess("删除成功"); }).catch(() => {});
    },
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.deviceId);
      this.single = selection.length !== 1;
      this.multiple = !selection.length;
    }
  }
};
</script>
