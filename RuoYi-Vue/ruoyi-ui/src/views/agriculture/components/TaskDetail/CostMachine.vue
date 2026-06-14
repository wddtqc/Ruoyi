<template>
  <div class="padding-bottom-10">
    <el-alert
      title="登记机械工时"
      type="info"
      show-icon
      description="此处可以登记机械工时"
    >
    </el-alert>
    <el-table v-loading="loading" :data="costMachineList"  class="margin-top-10" >
      <el-table-column label="机械名称" align="center" prop="machineName">
        <template slot-scope="scope">
          <span>{{ scope.row.machineName }}</span>
        </template>
      </el-table-column>
      <el-table-column label="使用时长(小时)" align="center" prop="useHours">
        <template slot-scope="scope">
          <span>{{ scope.row.useHours }}</span>
        </template>
      </el-table-column>
      <el-table-column label="小时成本" align="center" prop="hourlyCost">
        <template slot-scope="scope">
          <span>{{ scope.row.hourlyCost }}</span>
        </template>
      </el-table-column>
      <el-table-column label="总成本" align="center" prop="totalCost">
        <template slot-scope="scope">
          <span>{{ scope.row.totalCost }}</span>
        </template>
      </el-table-column>
      <el-table-column label="使用日期" align="center" prop="useDate" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.useDate, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template #header>
          <el-tag
            @click="handleAdd"
            v-hasPermi="['agriculture:costMachine:add']"
            class="cursor-pointer"
          >新增</el-tag
          >
        </template>
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['agriculture:costMachine:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['agriculture:costMachine:remove']"
          >删除</el-button>
        </template>
      </el-table-column>
    </el-table>

    <pagination
      v-show="total>0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />
    <!-- 添加或修改机械工时对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="机械ID" prop="machineId">
          <el-select v-model="form.machineId" placeholder="请选择机械" class="display-block" @change="handleMachineChange">
            <el-option v-for="item in machineInfoList"
                       :key="item.machineId"
                       :label="item.machineName"
                       :value="item.machineId">
            </el-option>
          </el-select>

        </el-form-item>
        <el-form-item label="使用时长" prop="useHours">
          <el-input v-model="form.useHours" placeholder="请输入使用时长(小时)" @input="calculateTotalCost" />
        </el-form-item>
        <el-form-item label="小时成本" prop="hourlyCost">
          <el-input v-model="form.hourlyCost" placeholder="请输入小时成本(元/小时)" @input="calculateTotalCost" />
        </el-form-item>
        <el-form-item label="总成本" prop="totalCost">
          <el-input v-model="form.totalCost" placeholder="自动计算" disabled />
        </el-form-item>
        <el-form-item label="使用日期" prop="useDate">
          <el-date-picker clearable class="w100"
                          v-model="form.useDate"
                          type="date"
                          value-format="yyyy-MM-dd"
                          placeholder="选择使用日期">
          </el-date-picker>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listCostMachine, getCostMachine, delCostMachine, addCostMachine, updateCostMachine } from "@/api/system/costMachine";
import {listInfo} from "@/api/system/machineinfo";
import { addLog } from "@/api/system/log";

export default {
  name: "CostMachine",
  props:{
    taskId:{
      type:[Number,String]
    }
  },
  data() {
    return {
      // 遮罩层
      loading: true,
      // 选中数组
      ids: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 机械工时表格数据
      costMachineList: [],
      machineInfoList:[],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        taskId:this.taskId
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        taskId: [
          { required: true, message: "任务ID不能为空", trigger: "blur" }
        ],
        machineId: [
          { required: true, message: "机械ID不能为空", trigger: "blur" }
        ],
        useHours: [
          { required: true, message: "使用时长不能为空", trigger: "blur" }
        ],
        useDate: [
          { required: true, message: "使用日期不能为空", trigger: "blur" }
        ]
      }
    };
  },
  created() {
    this.getList();
    this.getMachineInfList();
  },
  methods: {
    /** 查询机械工时列表 */
    getList() {
      this.loading = true;
      listCostMachine(this.queryParams).then(response => {
        this.costMachineList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    /** 查询解携列表 */
    getMachineInfList(){
      listInfo().then(response=>{
        this.machineInfoList = response.rows;
      });
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        costId: null,
        taskId: this.taskId,
        batchId: null,
        machineId: null,
        machineName: null,
        machineType: null,
        machineModel: null,
        useHours: null,
        useDate: null,
        hourlyCost: null,
        fuelCost: null,
        maintenanceCost: null,
        totalCost: null,
        operatorName: null,
        isRental: "0",
        paymentStatus: "0",
        remark: null,
        status: "0",
        orderNum: null,
        createBy: null,
        createTime: null,
        updateBy: null,
        updateTime: null,
        delFlag: null
      };
      this.resetForm("form");
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1;
      this.getList();
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.resetForm("queryForm");
      this.handleQuery();
    },
    /** 插入任务日志 */
    addTaskLog(des){
      addLog({ taskId: this.taskId,operDes:des })
      this.$emit('log')
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加机械工时";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const costId = row.costId || this.ids
      getCostMachine(costId).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改机械工时";
      });
    },
    /** 选择机械时自动填充相关信息 */
    handleMachineChange(machineId) {
      const machine = this.machineInfoList.find(item => item.machineId === machineId);
      if (machine) {
        this.form.machineName = machine.machineName;
      }
    },
    /** 计算总成本 */
    calculateTotalCost() {
      const useHours = parseFloat(this.form.useHours) || 0;
      const hourlyCost = parseFloat(this.form.hourlyCost) || 0;
      this.form.totalCost = (useHours * hourlyCost).toFixed(2);
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.costId != null) {
            updateCostMachine(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.addTaskLog("修改机械工时")
              this.open = false;
              this.getList();
            });
          } else {
            addCostMachine(this.form).then(response => {
              this.$modal.msgSuccess("新增成功");
              this.addTaskLog("新增机械工时")
              this.open = false;
              this.getList();
            });
          }
        }
      });
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const costIds = row.costId || this.ids;
      this.$modal.confirm('是否确认删除机械工时编号为"' + costIds + '"的数据项？').then(function() {
        return delCostMachine(costIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
        this.addTaskLog("删除机械工时")
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('agriculture/costMachine/export', {
        ...this.queryParams
      }, `costMachine_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
