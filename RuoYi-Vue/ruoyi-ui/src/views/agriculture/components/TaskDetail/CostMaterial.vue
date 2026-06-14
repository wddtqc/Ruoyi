<template>
  <div class="padding-bottom-10">
    <el-alert
      title="登记农资消耗"
      type="info"
      show-icon
      description="此处可以登记农资消耗"
    >
    </el-alert>

    <el-table
      v-loading="loading"
      :data="costMaterialList"
      class="margin-top-10"
    >
      <el-table-column label="物料名称" align="center" prop="materialName">
        <template slot-scope="scope">
          <span>{{ scope.row.materialName }}</span>
        </template>
      </el-table-column>
      <el-table-column label="物料规格" align="center" prop="materialSpec">
        <template slot-scope="scope">
          <span>{{ scope.row.materialSpec }}</span>
        </template>
      </el-table-column>
      <el-table-column label="使用数量" align="center" prop="useQuantity">
        <template slot-scope="scope">
          <span>{{ scope.row.useQuantity }}</span>
        </template>
      </el-table-column>
      <el-table-column label="计量单位" align="center" prop="materialUnit">
        <template slot-scope="scope">
          <span>{{ scope.row.materialUnit }}</span>
        </template>
      </el-table-column>
      <el-table-column label="单价" align="center" prop="unitPrice">
        <template slot-scope="scope">
          <span>{{ scope.row.unitPrice }}</span>
        </template>
      </el-table-column>
      <el-table-column label="总成本" align="center" prop="totalCost">
        <template slot-scope="scope">
          <span>{{ scope.row.totalCost }}</span>
        </template>
      </el-table-column>
      <el-table-column
        label="使用日期"
        align="center"
        prop="useDate"
        width="180"
      >
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.useDate, "{y}-{m}-{d}") }}</span>
        </template>
      </el-table-column>
      <el-table-column
        label="操作"
        align="center"
        class-name="small-padding fixed-width"
      >
        <template #header>
          <el-tag
            @click="handleAdd"
            v-hasPermi="['agriculture:costMaterial:add']"
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
            v-hasPermi="['agriculture:costMaterial:edit']"
          >修改</el-button
          >
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['agriculture:costMaterial:remove']"
          >删除</el-button
          >
        </template>
      </el-table-column>
    </el-table>

    <pagination
      v-show="total > 0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />
    <!-- 添加或修改农资用量对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="农资" prop="materialId">
          <el-select
            v-model="form.materialId"
            placeholder="请选择农资"
            class="display-block"
            @change="handleMaterialChange"
          >
            <el-option
              v-for="item in materialInfoList"
              :key="item.materialId"
              :label="item.materialName"
              :value="item.materialId"
            >
            </el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="物料规格" prop="materialSpec">
          <el-input v-model="form.materialSpec" placeholder="请输入物料规格" />
        </el-form-item>
        <el-form-item label="使用数量" prop="useQuantity">
          <el-input v-model="form.useQuantity" placeholder="请输入使用数量" @input="calculateTotalCost" />
        </el-form-item>
        <el-form-item label="计量单位" prop="materialUnit">
          <el-input v-model="form.materialUnit" placeholder="请输入计量单位" />
        </el-form-item>
        <el-form-item label="单价" prop="unitPrice">
          <el-input v-model="form.unitPrice" placeholder="请输入单价" @input="calculateTotalCost" />
        </el-form-item>
        <el-form-item label="总成本" prop="totalCost">
          <el-input v-model="form.totalCost" placeholder="自动计算" disabled />
        </el-form-item>
        <el-form-item label="使用日期" prop="useDate">
          <el-date-picker
            clearable
            class="w100"
            v-model="form.useDate"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="选择使用日期"
          >
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
import {
  listCostMaterial,
  getCostMaterial,
  delCostMaterial,
  addCostMaterial,
  updateCostMaterial,
} from "@/api/system/costMaterial";
import { listInfo } from "@/api/system/materialinfo";
import { addLog } from "@/api/system/log";

export default {
  name: "CostMaterial",
  props: {
    taskId: {
      type: [Number, String],
    },
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
      // 农资用量表格数据
      costMaterialList: [],
      materialInfoList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        taskId: this.taskId,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        taskId: [
          { required: true, message: "任务ID不能为空", trigger: "blur" },
        ],
        materialId: [
          { required: true, message: "农资ID不能为空", trigger: "blur" },
        ],
        useQuantity: [
          { required: true, message: "使用数量不能为空", trigger: "blur" },
        ],
        materialUnit: [
          { required: true, message: "计量单位不能为空", trigger: "blur" },
        ],
        useDate: [
          { required: true, message: "使用日期不能为空", trigger: "blur" },
        ],
      },
    };
  },
  created() {
    this.getList();
    this.getMaterialInfoList();
  },
  methods: {
    /** 查询农资用量列表 */
    getList() {
      this.loading = true;
      listCostMaterial(this.queryParams).then((response) => {
        this.costMaterialList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    /** 查询农资列表 */
    getMaterialInfoList() {
      listInfo().then((response) => {
        this.materialInfoList = response.rows;
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
        materialId: null,
        materialName: null,
        materialType: null,
        materialSpec: null,
        materialUnit: null,
        useQuantity: null,
        useDate: null,
        unitPrice: null,
        totalCost: null,
        supplierName: null,
        paymentStatus: "0",
        remark: null,
        status: "0",
        orderNum: null,
        createBy: null,
        createTime: null,
        updateBy: null,
        updateTime: null,
        delFlag: null,
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
      this.title = "添加农资用量";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const costId = row.costId || this.ids;
      getCostMaterial(costId).then((response) => {
        this.form = response.data;
        this.open = true;
        this.title = "修改农资用量";
      });
    },
    /** 选择农资时自动填充相关信息 */
    handleMaterialChange(materialId) {
      const material = this.materialInfoList.find(item => item.materialId === materialId);
      if (material) {
        this.form.materialName = material.materialName;
        this.form.materialSpec = material.materialSpec || '';
        this.form.materialUnit = material.materialUnit || '';
      }
    },
    /** 计算总成本 */
    calculateTotalCost() {
      const useQuantity = parseFloat(this.form.useQuantity) || 0;
      const unitPrice = parseFloat(this.form.unitPrice) || 0;
      this.form.totalCost = (useQuantity * unitPrice).toFixed(2);
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate((valid) => {
        if (valid) {
          if (this.form.costId != null) {
            updateCostMaterial(this.form).then((response) => {
              this.$modal.msgSuccess("修改成功");
              this.addTaskLog("修改农资用量")
              this.open = false;
              this.getList();
            });
          } else {
            addCostMaterial(this.form).then((response) => {
              this.$modal.msgSuccess("新增成功");
              this.addTaskLog("新增农资用量")
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
      this.$modal
        .confirm('是否确认删除农资用量编号为"' + costIds + '"的数据项？')
        .then(function () {
          return delCostMaterial(costIds);
        })
        .then(() => {
          this.getList();
          this.$modal.msgSuccess("删除成功");
          this.addTaskLog("删除农资用量")
        })
        .catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download(
        "agriculture/costMaterial/export",
        {
          ...this.queryParams,
        },
        `costMaterial_${new Date().getTime()}.xlsx`
      );
    },
  },
};
</script>
