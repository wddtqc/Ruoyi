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
        <el-form-item label="运行状态" prop="status">
          <el-select v-model="queryParams.status" placeholder="运行状态" clearable size="small">
            <el-option label="在线" :value="3" /><el-option label="离线" :value="4" />
          </el-select>
        </el-form-item>
        <el-form-item>
          <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
          <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
        </el-form-item>
        <el-form-item style="float:right;">
          <el-button icon="el-icon-refresh" size="mini" @click="refreshData" :loading="refreshing">刷新</el-button>
        </el-form-item>
      </el-form>
    </el-card>

    <el-card style="padding-bottom:100px;">
      <el-row :gutter="20" style="margin-bottom:15px;">
        <el-col :span="8">
          <el-card shadow="never" style="border-left:4px solid #67C23A;">
            <div style="display:flex;justify-content:space-between;">
              <div><div style="font-size:12px;color:#999;">在线设备</div><div style="font-size:24px;font-weight:bold;color:#67C23A;">{{ onlineCount }}</div></div>
              <i class="el-icon-success" style="font-size:36px;color:#67C23A;line-height:48px;"></i>
            </div>
          </el-card>
        </el-col>
        <el-col :span="8">
          <el-card shadow="never" style="border-left:4px solid #F56C6C;">
            <div style="display:flex;justify-content:space-between;">
              <div><div style="font-size:12px;color:#999;">离线设备</div><div style="font-size:24px;font-weight:bold;color:#F56C6C;">{{ offlineCount }}</div></div>
              <i class="el-icon-warning" style="font-size:36px;color:#F56C6C;line-height:48px;"></i>
            </div>
          </el-card>
        </el-col>
        <el-col :span="8">
          <el-card shadow="never" style="border-left:4px solid #E6A23C;">
            <div style="display:flex;justify-content:space-between;">
              <div><div style="font-size:12px;color:#999;">在线率</div><div style="font-size:24px;font-weight:bold;color:#E6A23C;">{{ onlineRate }}%</div></div>
              <i class="el-icon-data-line" style="font-size:36px;color:#E6A23C;line-height:48px;"></i>
            </div>
          </el-card>
        </el-col>
      </el-row>

      <el-table v-loading="loading" :data="statusList" border stripe>
        <el-table-column label="设备名称" align="center" prop="deviceName" min-width="130">
          <template slot-scope="scope">
            <el-link type="primary" :underline="false" @click="showDetail(scope.row)">{{ scope.row.deviceName }}</el-link>
          </template>
        </el-table-column>
        <el-table-column label="设备编号" align="center" prop="serialNumber" min-width="140" />
        <el-table-column label="运行状态" align="center" width="80">
          <template slot-scope="scope">
            <el-tag :type="scope.row.status == 3 ? 'success' : 'danger'" size="small" effect="dark" style="width:55px;">{{ scope.row.status == 3 ? '在线' : '离线' }}</el-tag>
          </template>
        </el-table-column>
        <el-table-column label="信号强度RSSI" align="center" width="120">
          <template slot-scope="scope">
            <span v-if="scope.row.rssi != null" :style="{color: scope.row.rssi >= -60 ? '#67C23A' : scope.row.rssi >= -80 ? '#E6A23C' : '#F56C6C'}">{{ scope.row.rssi }} dBm</span>
            <span v-else>-</span>
          </template>
        </el-table-column>
        <el-table-column label="设备影子" align="center" width="80">
          <template slot-scope="scope">
            <el-tag :type="scope.row.isShadow == 1 ? 'success' : 'info'" size="mini">{{ scope.row.isShadow == 1 ? '是' : '否' }}</el-tag>
          </template>
        </el-table-column>
        <el-table-column label="最后上线" align="center" prop="onlineTime" width="155">
          <template slot-scope="scope"><span>{{ parseTime(scope.row.onlineTime) || '-' }}</span></template>
        </el-table-column>
        <el-table-column label="最后离线" align="center" prop="offlineTime" width="155">
          <template slot-scope="scope"><span>{{ parseTime(scope.row.offlineTime) || '-' }}</span></template>
        </el-table-column>
        <el-table-column label="更新时间" align="center" prop="updateTime" width="155">
          <template slot-scope="scope"><span>{{ parseTime(scope.row.updateTime) || '-' }}</span></template>
        </el-table-column>
        <el-table-column label="操作" align="center" width="140">
          <template slot-scope="scope">
            <el-button size="small" type="primary" style="padding:5px" icon="el-icon-view" @click="showDetail(scope.row)" v-hasPermi="['iot:device:query']">查看</el-button>
          </template>
        </el-table-column>
      </el-table>

      <pagination v-show="total>0" :total="total" :page.sync="queryParams.pageNum" :limit.sync="queryParams.pageSize" @pagination="getList" />
    </el-card>

    <device-detail ref="deviceDetail" :visible.sync="openDetail" :device-id="currentDeviceId" />
  </div>
</template>

<script>
import { listDevice, getDeviceRunningStatus } from "@/api/iot/device";
import DeviceDetail from "./device-detail.vue";

export default {
  name: "DeviceRunningStatus",
  components: { DeviceDetail },
  data() {
    return {
      loading: false, refreshing: false, showSearch: true, total: 0, statusList: [],
      onlineCount: 0, offlineCount: 0, onlineRate: 0,
      openDetail: false, currentDeviceId: null, timer: null,
      queryParams: { pageNum: 1, pageSize: 10, deviceName: null, serialNumber: null, status: null }
    };
  },
  created() { this.getList(); },
  beforeDestroy() { this.stopTimer(); },
  methods: {
    getList() {
      this.loading = true;
      listDevice(this.queryParams).then(res => {
        const devices = res.rows || [];
        this.total = res.total;
        const promises = devices.map(d => getDeviceRunningStatus(d.deviceId).then(r => r.data || {}).catch(() => ({})));
        Promise.all(promises).then(statusResults => {
          this.statusList = devices.map((d, i) => ({ deviceId: d.deviceId, deviceName: d.deviceName, serialNumber: d.serialNumber, ...statusResults[i] }));
          this.calcStat();
          this.loading = false;
        }).catch(() => { this.loading = false; });
      }).catch(() => { this.loading = false; });
    },
    calcStat() {
      const online = this.statusList.filter(s => s.status == 3).length;
      const offline = this.statusList.filter(s => s.status == 4).length;
      this.onlineCount = online;
      this.offlineCount = offline;
      this.onlineRate = (online + offline) > 0 ? Math.round((online / (online + offline)) * 100) : 0;
    },
    refreshData() { this.refreshing = true; this.getList(); setTimeout(() => { this.refreshing = false; }, 500); },
    showDetail(row) { this.currentDeviceId = row.deviceId; this.openDetail = true; },
    handleQuery() { this.queryParams.pageNum = 1; this.getList(); },
    resetQuery() { this.$refs.queryForm && this.$refs.queryForm.resetFields(); this.handleQuery(); },
    startTimer() { this.stopTimer(); this.timer = setInterval(() => { this.getList(); }, 30000); },
    stopTimer() { if (this.timer) { clearInterval(this.timer); this.timer = null; } }
  }
};
</script>
