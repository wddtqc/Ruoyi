<template>
  <div class="device-form">
    <el-form ref="form" :model="form" :rules="rules" label-width="100px">
      <el-row :gutter="100" :class="proportion == 24 ? 'setting' : ''">
        <el-col :span="proportion">
          <el-form-item label="设备名称" prop="deviceName">
            <el-input v-model="form.deviceName" placeholder="请输入设备名称"/>
          </el-form-item>
          <el-form-item label="所属产品" prop="productName">
            <el-input
              ref="chooseProInput"
              readonly
              v-model="form.productName"
              placeholder="请选择产品"
              :disabled="form.status != 1 || proportion == 24"
            >
              <el-button
                v-if="proportion != 24"
                slot="append"
                @click="selectProduct()"
                :disabled="form.status != 1"
                >选择</el-button
              >
            </el-input>
          </el-form-item>
          <el-form-item label="设备编号" prop="serialNumber">
            <el-input
            ref="genSerInput"
              v-model="form.serialNumber"
              placeholder="请输入设备编号"
              :disabled="form.status != 1"
              maxlength="32"
            >
              <el-button
                v-if="form.deviceType !== 3"
                slot="append"
                @click.prevent="generateNum"
                :loading="genDisabled"
                :disabled="form.status != 1"
                >生成
              </el-button>
              <el-button
                v-if="form.deviceType === 3"
                slot="append"
                @click="genSipID()"
                :disabled="form.status != 1"
                >生成
              </el-button>
            </el-input>
          </el-form-item>

          <el-form-item label="固件版本" prop="firmwareVersion">
            <el-input
              v-model="form.firmwareVersion"
              placeholder="请输入固件版本"
              type="number"
              step="0.1"
              :disabled="form.status != 1 || form.deviceType === 3"
            >
              <template slot="prepend">Version</template>
            </el-input>
          </el-form-item>
          <el-form-item label="禁用设备" prop="deviceStatus">
            <el-switch
              v-model="deviceStatus"
              active-text=""
              inactive-text=""
              :disabled="form.status == 1 || form.deviceType === 3"
              :active-value="1"
              :inactive-value="0"
              active-color="#F56C6C"
            >
            </el-switch>
          </el-form-item>
          <el-form-item label="设备影子" prop="isShadow">
            <el-switch
              v-model="form.isShadow"
              active-text=""
              inactive-text=""
              :active-value="1"
              :inactive-value="0"
              :disabled="form.deviceType === 3"
            >
            </el-switch>
          </el-form-item>
        </el-col>
        <el-col :span="proportion">
          <el-form-item v-if="proportion != 24" label="定位方式" prop="locationWay">
            <el-select
              v-model="form.locationWay"
              placeholder="请选择设备定位方式"
              clearable
              size="small"
              style="width: 100%"
              @change="handleLocationWayChange"
            >
              <el-option
                v-for="dict in dict.type.iot_location_way"
                :key="dict.value"
                :label="dict.label"
                :value="Number(dict.value)"
              />
            </el-select>
          </el-form-item>
          <el-form-item
            label="设备坐标"
            prop="coordinate"
            v-if="proportion != 24"
          >
            <point-select
              v-model="form.coordinate"
              @land-matched="handleLandMatched"
              @open-click="handleMapOpen"
            ></point-select>
            <div style="font-size: 12px; color: #909399; margin-top: 4px;">
              <template v-if="form.locationWay === 1">提示：自动定位模式，设备将自动上报位置信息</template>
              <template v-else-if="form.locationWay === 2">提示：手动定位模式，请输入经纬度坐标（格式：经度,纬度）</template>
              <template v-else-if="form.locationWay === 3">提示：地图选点模式，点击地图图标选择位置</template>
            </div>
          </el-form-item>
          <el-form-item label="所在地址" prop="networkAddress">
            <el-input
              v-model="form.networkAddress"
              placeholder="请输入设备所在地址"
              :disabled="form.locationWay != 3"
            >
              <template slot="append" v-if="form.locationWay != 3">
                <el-tooltip content="选择地图选点定位方式后可编辑" placement="top">
                  <i class="el-icon-question"></i>
                </el-tooltip>
              </template>
            </el-input>
          </el-form-item>
          <el-form-item label="地块" prop="landId">
            <el-select
              v-model="form.landId"
              placeholder="请选择地块"
              class="display-block"
              @change="handleLandChange"
            >
              <el-option
                v-for="land in landList"
                :key="land.landId"
                :label="land.landName"
                :value="land.landId"
              ></el-option>
            </el-select>
          </el-form-item>
          <!-- <el-form-item label="入网地址" prop="networkIp">
                            <el-input v-model="form.networkIp" placeholder="设备入网IP" disabled />
                        </el-form-item>
                        <el-form-item label="激活时间" prop="activeTime">
                            <el-date-picker clearable v-model="form.activeTime" type="date" value-format="yyyy-MM-dd" placeholder="设备激活时间" disabled style="width:100%">
                            </el-date-picker>
                        </el-form-item> -->
        </el-col>
      </el-row>
    </el-form>

    <div class="position-absolute padding-tb-10 right-10 bottom-10">
        <el-button
          type="primary"
          @click="submitForm"
          :disabled="!checkPermi(['iot:device:edit'])"
          v-show="deviceId != 0"
          >确定</el-button
        >
        <el-button
          type="primary"
          @click="submitForm"
          :disabled="!checkPermi(['iot:device:add'])"
          v-show="deviceId == 0"
          >确定</el-button
        >
        <el-button @click="$emit('close')" >取消</el-button>

     </div>

    <!-- 选择产品 -->
    <product-list
      ref="productList"
      :productId="form.productId"
      @productEvent="getProductData($event)"
    />

    <sipid ref="sipidGen" :product="form" @addGenEvent="getSipIDData($event)" />
  </div>
</template>

<script>
import { checkPermi} from "@/utils/permission"; // 权限判断函数
import productList from './product-list';
import sipid from '../sip/sipid-dialog';
import {
  deviceSynchronization,
  getDevice,
  addDevice,
  updateDevice,
  generatorDeviceNum,
} from '@/api/iot/device';
import PointSelect from './components/PointSelect';
import { listLand } from '@/api/system/land';
export default {
  name: 'DeviceForm',
  mixins: [],
  components: { productList, sipid, PointSelect },
  props: {
    deviceId: {
      type: [Number, String],
      default: 0,
    },
    proportion: {
      type: Number,
      default: 12,
    },
    deviceInfo: {
      type: Object,
      default: () => ({
        productId: null,
        productName: null,
        deviceType: null,
        tenantId: null,
        tenantName: null,
        coordinate: null,
        locationWay: null,
      }),
    },
  },
  dicts: ['iot_device_status', 'iot_location_way'],
  data() {
    return {
      // 生成设备编码是否禁用
      genDisabled: false,
      // 表单参数
      form: {},
      //地块列表
      landList: [],
      // 表单校验
      rules: {
        deviceName: [
          {
            required: true,
            message: '设备名称不能为空',
            trigger: 'blur',
          },
          {
            min: 2,
            max: 32,
            message: '设备名称长度在 2 到 32 个字符',
            trigger: 'blur',
          },
        ],
        firmwareVersion: [
          {
            required: true,
            message: '固件版本不能为空',
            trigger: 'blur',
          },
        ],
        serialNumber: [
          {
            required: true,
            message: '设备编号不能为空',
            trigger: 'change',
          },
          {
            validator: (rule, value, callback) => {
              if (!value) return callback();
              let reg = /^[0-9a-zA-Z\-]+$/;
              if (!reg.test(value)) {
                callback(new Error('设备编号只能是字母、数字和短横线'));
              }
              callback();
            },
            trigger: 'blur',
          },
        ],
        productName: [
          {
            required: true,
            message: '所属产品不能为空',
            trigger: 'blur',
          },
        ],
        landId: [
          {
            required: true,
            message: '地块不能为空',
            trigger: 'blur',
          },
        ],
      },
    };
  },
  computed: {
    deviceStatus: {
      set(val) {
        if (val == 1) {
          // 1-未激活，2-禁用，3-在线，4-离线
          this.form.status = 2;
        } else if (val == 0) {
          this.form.status = 4;
        } else {
          this.form.status = this.oldDeviceStatus;
        }
      },
      get() {
        if (this.form.status == 2) {
          return 1;
        }
        return 0;
      },
    },
  },
  watch: {
    deviceInfo: {
      handler(value) {
        if (this.deviceId != 0) {
          this.form.coordinate = value.coordinate;
        } else {
          this.form.productId = value.productId;
          this.form.productName = value.productName;
          this.form.deviceType = value.deviceType;
          this.form.tenantId = value.tenantId;
          this.form.tenantName = value.tenantName;
          this.form.coordinate = value.coordinate;
          this.form.locationWay = value.locationWay;
        }
      },
      deep: true,
    },
    deviceId: {
      handler(value) {
        if (value != 0) {
          this.getDevice();
        }else{
          this.reset();
        }
      },
      immediate:true
    },
  },
  created() {
    this.getLandList();
  },
  mounted() {},
  methods: {
      checkPermi,
    /**获取设备详情*/
    async getDevice() {
      const { deviceId } = this;
      const { data } = await getDevice(deviceId);
      if(data.longitude && data.latitude){
        data.coordinate = data.longitude+','+data.latitude;
      }else{
          data.coordinate = '';
      }
      this.form = data;
      console.log(this.form)
    },
    /**选择产品 */
    selectProduct() {
      this.$refs.productList.open = true;
    },
    /**获取选中的产品 */
    getProductData(product) {
      this.form.productId = product.productId;
      this.form.productName = product.productName;
      this.form.deviceType = product.deviceType;
      this.form.tenantId = product.tenantId;
      this.form.tenantName = product.tenantName;
      this.$refs.chooseProInput.focus();
    },
    /** 查询地块列表 */
    getLandList() {
      listLand().then((response) => {
        this.landList = response.rows;
      });
    },
    // 生成随机字母和数字
    generateNum() {
      if (!this.form.productId || this.form.productId == 0) {
        this.$modal.msgWarning('请先选择产品');
        return;
      }
      // 清除该字段的验证状态
      this.$refs.form.clearValidate('serialNumber');
      this.genDisabled = true;
      generatorDeviceNum().then((response) => {
        console.log('生成设备编号返回:', response);

        // 若依框架返回格式: {code: 200, msg: "生成成功", data: "DEV..."}
        // 优先从 data 字段获取设备编号
        let serialNumber = response.data || response.msg;

        if (serialNumber && serialNumber.startsWith('DEV')) {
          this.form.serialNumber = serialNumber;
          this.$nextTick(() => {
            this.$refs.genSerInput.focus();
          });
          this.$modal.msgSuccess('生成设备编号成功');
        } else {
          this.$modal.msgError('生成设备编号失败：返回数据格式错误');
          console.error('返回数据:', response);
        }
        this.genDisabled = false;
      }).catch((error) => {
        this.genDisabled = false;
        console.error('生成设备编号失败:', error);
        this.$modal.msgError('生成设备编号失败：' + (error.message || '请稍后重试'));
      });
    },
    genSipID() {
      this.$refs.sipidGen.open = true;
    },
    getSipIDData(devsipid) {
      this.form.serialNumber = devsipid;
    },
    // 表单重置
    reset() {
      this.form = {
        deviceId: 0,
        deviceName: null,
        productId: null,
        productName: null,
        landId:null,
        landName:null,
        userId: null,
        userName: null,
        tenantId: null,
        tenantName: null,
        serialNumber: null,
        firmwareVersion: 1.0,
        status: 1,
        rssi: null,
        isShadow: null,
        locationWay: 1,
        thingsModelValue: null,
        networkAddress: null,
        networkIp: null,
        coordinate: null,
        // longitude: null,
        // latitude: null,
        activeTime: null,
        summary: null,
        imgUrl: null,
        delFlag: null,
        createBy: null,
        createTime: null,
        updateBy: null,
        updateTime: null,
        remark: null,
      };
      this.resetForm('form');
    },
    /** 处理地块下拉change */
    handleLandChange(e){
       this.form.landName = this.landList.find(item=>item.landId==e).landName;
    },
    /** 定位方式变化处理 */
    handleLocationWayChange(value) {
      // 切换到非地图选点方式时，清空地址输入
      if (value !== 3) {
        // this.form.networkAddress = null; // 可选：是否清空地址
      }
    },
    /** 打开地图选点 */
    handleMapOpen() {
      // 自动切换到地图选点模式
      this.form.locationWay = 3;
    },
    /** 坐标选择后自动匹配地块 */
    handleLandMatched(landId){
      this.form.landId = landId
      this.form.landName = this.landList.find(item=>item.landId==landId)?.landName || ''
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs['form'].validate((valid) => {
        if (valid) {
          const { coordinate } = this.form;
          if (coordinate) {
            let _arr = coordinate.split(',');
            this.form.longitude = _arr[0];
            this.form.latitude = _arr[1];
          } else {
            this.form.longitude = '';
            this.form.latitude = '';
          }
          if (this.deviceId != 0) {
            updateDevice(this.form).then((response) => {
              if (response.data == 0) {
                this.$modal.alertError(response.msg);
              } else {
                this.$modal.alertSuccess('修改成功');
                this.form = JSON.parse(JSON.stringify(this.form));
                this.$emit('success');
              }
            });
          } else {
            addDevice(this.form).then((response) => {
              this.form = response.data;
              this.oldDeviceStatus = this.form.status;
              if (this.form.deviceId == null || this.form.deviceId == 0) {
                this.$modal.alertError('设备编号已经存在，添加设备失败');
              } else {
                if (this.form.status == 2) {
                  this.deviceStatus = 1;
                }
                this.$modal.alertSuccess('添加设备成功');
                this.$emit('success');
              }
            });
          }
        }
      });
    },
  },
};
</script>
<style lang="scss" scoped>
.device-form ::v-deep {
  width: 100%;
  .setting {
    // padding: 0!important;
    margin: 0 !important;
    .el-col {
      padding: 0 !important;
      // margin: 0!important;
    }
  }
}
</style>
