<template>
  <el-dialog title="设备详情" :visible.sync="visible" width="900px" append-to-body top="5vh" @open="loadData" @close="handleClose">
    <el-row v-loading="loading">
      <!-- 设备基本信息卡片 -->
      <el-card shadow="never" style="margin-bottom:15px;">
        <el-descriptions :column="4" border size="small">
          <el-descriptions-item label="设备名称" :span="1">{{ device.deviceName }}</el-descriptions-item>
          <el-descriptions-item label="设备编号" :span="1">{{ device.serialNumber }}</el-descriptions-item>
          <el-descriptions-item label="设备状态" :span="1">
            <el-tag :type="statusType(device.status)" size="small" effect="dark">{{ statusLabel(device.status) }}</el-tag>
          </el-descriptions-item>
          <el-descriptions-item label="设备类型" :span="1">
            <dict-tag :options="dict.type.iot_device_type" :value="device.deviceType" />
          </el-descriptions-item>
          <el-descriptions-item label="所属产品" :span="1">{{ device.productName }}</el-descriptions-item>
          <el-descriptions-item label="固件版本" :span="1">{{ device.firmwareVersion || '-' }}</el-descriptions-item>
          <el-descriptions-item label="所在地址" :span="1" v-if="device.networkAddress">{{ device.networkAddress }}</el-descriptions-item>
          <el-descriptions-item label="入网IP" :span="1">{{ device.networkIp || '-' }}</el-descriptions-item>
          <el-descriptions-item label="关联地块" :span="1">{{ device.landName || '未关联' }}</el-descriptions-item>
          <el-descriptions-item label="激活时间" :span="1">{{ parseTime(device.activeTime) || '-' }}</el-descriptions-item>
          <el-descriptions-item label="设备影子" :span="1">
            <el-tag :type="device.isShadow == 1 ? 'success' : 'info'" size="mini">{{ device.isShadow == 1 ? '启用' : '未启用' }}</el-tag>
          </el-descriptions-item>
          <el-descriptions-item label="备注" :span="1" v-if="device.remark">{{ device.remark }}</el-descriptions-item>
        </el-descriptions>
      </el-card>

      <!-- 运行状态及告警 Tab -->
      <el-card shadow="never">
        <el-tabs v-model="activeTab">
          <el-tab-pane label="运行状态" name="runningStatus">
            <el-row :gutter="20" style="margin-bottom:15px;">
              <el-col :span="6">
                <el-card shadow="never" style="border-left:4px solid #67C23A;text-align:center;">
                  <div style="font-size:12px;color:#999;">状态</div>
                  <el-tag :type="runStatus.status == 3 ? 'success' : 'danger'" size="medium" style="margin-top:5px;">
                    {{ runStatus.status == 3 ? '在线' : '离线' }}
                  </el-tag>
                </el-card>
              </el-col>
              <el-col :span="6">
                <el-card shadow="never" style="border-left:4px solid #409EFF;text-align:center;">
                  <div style="font-size:12px;color:#999;">信号强度 RSSI</div>
                  <div style="font-size:20px;font-weight:bold;margin-top:5px;">{{ runStatus.rssi != null ? runStatus.rssi + ' dBm' : '-' }}</div>
                </el-card>
              </el-col>
              <el-col :span="6">
                <el-card shadow="never" style="border-left:4px solid #E6A23C;text-align:center;">
                  <div style="font-size:12px;color:#999;">最后上线</div>
                  <div style="font-size:13px;margin-top:5px;">{{ parseTime(runStatus.onlineTime) || '-' }}</div>
                </el-card>
              </el-col>
              <el-col :span="6">
                <el-card shadow="never" style="border-left:4px solid #909399;text-align:center;">
                  <div style="font-size:12px;color:#999;">最后离线</div>
                  <div style="font-size:13px;margin-top:5px;">{{ parseTime(runStatus.offlineTime) || '-' }}</div>
                </el-card>
              </el-col>
            </el-row>

            <el-card shadow="never" v-if="thingsModelList.length > 0">
              <div slot="header"><span>物模型实时数据</span></div>
              <el-row :gutter="20">
                <el-col :span="8" v-for="(item, idx) in thingsModelList" :key="idx" style="margin-bottom:15px;">
                  <el-card shadow="hover" :body-style="{ padding: '15px' }">
                    <div style="font-size:12px;color:#999;">{{ item.name || item.identifier }}</div>
                    <div style="font-size:22px;font-weight:bold;color:#409EFF;margin-top:8px;">
                      {{ item.value }}
                      <span style="font-size:14px;font-weight:normal;color:#666;">{{ item.unit }}</span>
                    </div>
                  </el-card>
                </el-col>
              </el-row>
            </el-card>
            <el-empty description="暂无运行状态数据" v-else></el-empty>
          </el-tab-pane>

          <el-tab-pane label="告警记录" name="alert">
            <el-row style="margin-bottom:10px;">
              <el-col :span="24" style="text-align:right;">
                <el-button type="primary" plain icon="el-icon-plus" size="mini" @click="handleAddAlert" v-hasPermi="['iot:alert:add']">新增告警</el-button>
              </el-col>
            </el-row>
            <el-table :data="alertList" border size="small">
              <el-table-column label="告警名称" prop="alertName" min-width="130" />
              <el-table-column label="告警级别" align="center" prop="alertLevel" width="90">
                <template slot-scope="scope">
                  <el-tag :type="alertLevelType(scope.row.alertLevel)" size="small" effect="dark">{{ alertLevelLabel(scope.row.alertLevel) }}</el-tag>
                </template>
              </el-table-column>
              <el-table-column label="告警内容" prop="alertContent" min-width="180" show-overflow-tooltip />
              <el-table-column label="告警来源" prop="source" width="100"><template slot-scope="scope"><span>{{ scope.row.source || '-' }}</span></template></el-table-column>
              <el-table-column label="告警时间" prop="alertTime" width="150">
                <template slot-scope="scope"><span>{{ parseTime(scope.row.alertTime) }}</span></template>
              </el-table-column>
              <el-table-column label="处理状态" align="center" prop="status" width="90">
                <template slot-scope="scope">
                  <el-tag :type="handleStatusType(scope.row.status)" size="small">{{ handleStatusLabel(scope.row.status) }}</el-tag>
                </template>
              </el-table-column>
              <el-table-column label="操作" align="center" width="160">
                <template slot-scope="scope">
                  <el-button size="mini" type="primary" style="padding:5px" icon="el-icon-view" @click="handleViewAlert(scope.row)" v-hasPermi="['iot:alert:query']">查看</el-button>
                  <el-button size="mini" type="success" style="padding:5px" icon="el-icon-check" v-if="scope.row.status == 0" @click="handleAlert(scope.row)" v-hasPermi="['iot:alert:handle']">处理</el-button>
                </template>
              </el-table-column>
            </el-table>
            <el-empty description="暂无告警记录" v-if="alertList.length == 0"></el-empty>
          </el-tab-pane>
        </el-tabs>
      </el-card>
    </el-row>

    <!-- 告警处理对话框 -->
    <el-dialog title="处理告警" :visible.sync="openAlertHandle" width="500px" append-to-body>
      <el-form ref="alertForm" :model="alertForm" :rules="alertRules" label-width="80px">
        <el-form-item label="告警名称"><el-input v-model="alertForm.alertName" disabled /></el-form-item>
        <el-form-item label="处理方式" prop="status">
          <el-radio-group v-model="alertForm.status">
            <el-radio :label="1">已确认</el-radio>
            <el-radio :label="2">已处理</el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item label="处理备注" prop="handleRemark">
          <el-input v-model="alertForm.handleRemark" type="textarea" placeholder="请输入处理备注" />
        </el-form-item>
      </el-form>
      <div slot="footer">
        <el-button type="primary" @click="submitAlertHandle">确 定</el-button>
        <el-button @click="openAlertHandle = false">取 消</el-button>
      </div>
    </el-dialog>

    <!-- 告警详情对话框 -->
    <el-dialog title="告警详情" :visible.sync="openAlertView" width="600px" append-to-body>
      <el-descriptions :column="2" border size="small">
        <el-descriptions-item label="告警名称">{{ alertDetail.alertName }}</el-descriptions-item>
        <el-descriptions-item label="告警级别"><el-tag :type="alertLevelType(alertDetail.alertLevel)" size="small">{{ alertLevelLabel(alertDetail.alertLevel) }}</el-tag></el-descriptions-item>
        <el-descriptions-item label="告警内容" :span="2">{{ alertDetail.alertContent }}</el-descriptions-item>
        <el-descriptions-item label="告警来源">{{ alertDetail.source || '-' }}</el-descriptions-item>
        <el-descriptions-item label="来源标识">{{ alertDetail.sourceIdentifier || '-' }}</el-descriptions-item>
        <el-descriptions-item label="告警时间">{{ parseTime(alertDetail.alertTime) }}</el-descriptions-item>
        <el-descriptions-item label="处理状态"><el-tag :type="handleStatusType(alertDetail.status)" size="small">{{ handleStatusLabel(alertDetail.status) }}</el-tag></el-descriptions-item>
        <el-descriptions-item label="处理人" v-if="alertDetail.handler">{{ alertDetail.handler }}</el-descriptions-item>
        <el-descriptions-item label="处理时间" v-if="alertDetail.handleTime">{{ parseTime(alertDetail.handleTime) }}</el-descriptions-item>
        <el-descriptions-item label="处理备注" :span="2" v-if="alertDetail.handleRemark">{{ alertDetail.handleRemark }}</el-descriptions-item>
      </el-descriptions>
    </el-dialog>

    <!-- 新增告警对话框 -->
    <el-dialog title="新增告警" :visible.sync="openAlertAdd" width="550px" append-to-body>
      <el-form ref="addAlertForm" :model="addAlertForm" :rules="addAlertRules" label-width="80px">
        <el-form-item label="告警名称" prop="alertName"><el-input v-model="addAlertForm.alertName" placeholder="请输入告警名称" /></el-form-item>
        <el-form-item label="告警级别" prop="alertLevel">
          <el-select v-model="addAlertForm.alertLevel" placeholder="告警级别">
            <el-option label="提示" :value="1" /><el-option label="一般" :value="2" /><el-option label="严重" :value="3" /><el-option label="紧急" :value="4" />
          </el-select>
        </el-form-item>
        <el-form-item label="告警内容" prop="alertContent"><el-input v-model="addAlertForm.alertContent" type="textarea" placeholder="请输入告警内容" /></el-form-item>
        <el-form-item label="告警类型" prop="alertType"><el-input v-model="addAlertForm.alertType" placeholder="告警类型" /></el-form-item>
      </el-form>
      <div slot="footer">
        <el-button type="primary" @click="submitAlertAdd">确 定</el-button>
        <el-button @click="openAlertAdd = false">取 消</el-button>
      </div>
    </el-dialog>
  </el-dialog>
</template>

<script>
import { getDevice, getDeviceRunningStatus } from "@/api/iot/device";
import { listAlertByDeviceId, addAlert, handleAlert } from "@/api/iot/alert";
import { getProduct } from "@/api/iot/product";

export default {
  name: "DeviceDetail",
  dicts: ["iot_device_type"],
  props: { visible: Boolean, deviceId: [Number, String] },
  data() {
    return {
      loading: false, activeTab: "runningStatus", device: {}, runStatus: {}, thingsModelList: [], alertList: [],
      openAlertHandle: false,
      alertForm: { alertId: null, alertName: "", status: 2, handleRemark: "" },
      alertRules: { status: [{ required: true, message: "请选择处理方式" }] },
      openAlertView: false, alertDetail: {},
      openAlertAdd: false,
      addAlertForm: { alertName: "", alertLevel: 2, alertContent: "", alertType: "" },
      addAlertRules: {
        alertName: [{ required: true, message: "请输入告警名称", trigger: "blur" }],
        alertLevel: [{ required: true, message: "请选择告警级别" }],
        alertContent: [{ required: true, message: "请输入告警内容", trigger: "blur" }]
      }
    };
  },
  methods: {
    loadData() {
      if (!this.deviceId) return;
      this.loading = true;
      Promise.all([
        getDevice(this.deviceId),
        getDeviceRunningStatus(this.deviceId),
        listAlertByDeviceId(this.deviceId)
      ]).then(([deviceRes, statusRes, alertRes]) => {
        this.device = deviceRes.data;
        this.runStatus = statusRes.data || {};
        this.alertList = alertRes.data || [];
        // 获取产品信息（含物模型模板配置）
        if (this.device.productId) {
          getProduct(this.device.productId).then(productRes => {
            const product = productRes.data || {};
            this.parseThingsModel(product.thingsModelsJson || product.things_models_json);
          }).catch(() => { this.parseThingsModel(); });
        } else {
          this.parseThingsModel();
        }
        this.loading = false;
      }).catch(() => { this.loading = false; });
    },
    parseThingsModel(productThingsModelsJson) {
      this.thingsModelList = [];
      // 1. 解析产品物模型模板定义（name / unit / datatype）
      let modelDefs = {};
      if (productThingsModelsJson) {
        try {
          const parsed = typeof productThingsModelsJson === 'string' ? JSON.parse(productThingsModelsJson) : productThingsModelsJson;
          if (Array.isArray(parsed)) {
            parsed.forEach(item => {
              modelDefs[item.identifier] = { name: item.name || item.identifier, unit: item.unit || '', datatype: item.datatype || 'string' };
            });
          }
        } catch(e) { console.warn('产品物模型定义解析失败', e); }
      }
      // 2. 解析运行状态值
      const statusValues = {};
      if (this.runStatus.thingsModelValue) {
        try {
          const tm = typeof this.runStatus.thingsModelValue === 'string' ? JSON.parse(this.runStatus.thingsModelValue) : this.runStatus.thingsModelValue;
          Object.keys(tm).forEach(key => {
            const val = tm[key];
            if (typeof val === 'object' && val !== null) {
              statusValues[key] = val.value ?? val.val ?? '-';
            } else {
              statusValues[key] = val;
            }
          });
        } catch(e) { console.warn('物模型运行值解析失败', e); }
      }
      // 3. 合并：以产品定义为主，未定义的标识符直接用id作为名称
      const allKeys = new Set([...Object.keys(modelDefs), ...Object.keys(statusValues)]);
      allKeys.forEach(key => {
        const def = modelDefs[key] || { name: key, unit: '' };
        const value = statusValues[key] !== undefined ? statusValues[key] : '-';
        this.thingsModelList.push({ identifier: key, name: def.name, value: value, unit: def.unit });
      });
    },
    statusType(s) { const m={1:'warning',2:'info',3:'success',4:'danger'}; return m[s]||'info'; },
    statusLabel(s) { const m={1:'未激活',2:'禁用',3:'在线',4:'离线'}; return m[s]||'未知'; },
    alertLevelType(l) { const m={1:'',2:'warning',3:'danger',4:'danger'}; return m[l]||'info'; },
    alertLevelLabel(l) { const m={1:'提示',2:'一般',3:'严重',4:'紧急'}; return m[l]||'未知'; },
    handleStatusType(s) { const m={0:'danger',1:'warning',2:'success'}; return m[s]||'info'; },
    handleStatusLabel(s) { const m={0:'未处理',1:'已确认',2:'已处理'}; return m[s]||'未知'; },
    handleAddAlert() { this.addAlertForm = { alertName: "", alertLevel: 2, alertContent: "", alertType: "" }; this.openAlertAdd = true; },
    submitAlertAdd() {
      this.$refs.addAlertForm.validate(valid => {
        if (!valid) return;
        addAlert({ ...this.addAlertForm, deviceId: this.deviceId, deviceName: this.device.deviceName, productId: this.device.productId, productName: this.device.productName, alertTime: new Date() })
          .then(() => { this.$modal.msgSuccess("新增告警成功"); this.openAlertAdd = false; listAlertByDeviceId(this.deviceId).then(res => { this.alertList = res.data || []; }); });
      });
    },
    handleViewAlert(row) { this.alertDetail = { ...row }; this.openAlertView = true; },
    handleAlert(row) { this.alertForm = { alertId: row.alertId, alertName: row.alertName, status: 2, handleRemark: "" }; this.openAlertHandle = true; },
    submitAlertHandle() {
      handleAlert(this.alertForm).then(() => { this.$modal.msgSuccess("处理成功"); this.openAlertHandle = false; listAlertByDeviceId(this.deviceId).then(res => { this.alertList = res.data || []; }); });
    },
    handleClose() { this.device = {}; this.runStatus = {}; this.thingsModelList = []; this.alertList = []; this.$emit('update:visible', false); }
  }
};
</script>
