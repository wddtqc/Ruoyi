<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="机械编码" prop="machineCode">
        <el-input
          v-model="queryParams.machineCode"
          placeholder="请输入机械编码"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="机械名称" prop="machineName">
        <el-input
          v-model="queryParams.machineName"
          placeholder="请输入机械名称"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="机械类别" prop="machineTypeId">
        <el-select
          v-model="queryParams.machineTypeId"
          placeholder="请选择机械类别"
          clearable
          style="width: 240px"
        >
          <el-option
            v-for="item in machineTypeOptions"
            :key="item.machineTypeId"
            :label="item.machineTypeName"
            :value="item.machineTypeId"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="计量单位" prop="measureUnit">
        <el-input
          v-model="queryParams.measureUnit"
          placeholder="请输入计量单位"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="排序" prop="orderNum">
        <el-input
          v-model="queryParams.orderNum"
          placeholder="请输入排序"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
          v-hasPermi="['agriculture:machineInfo:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['agriculture:machineInfo:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['agriculture:machineInfo:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['agriculture:machineInfo:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="infoList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="机械ID" align="center" prop="machineId" />
      <el-table-column label="机械编码" align="center" prop="machineCode" />
      <el-table-column label="机械名称" align="center" prop="machineName" />
      <el-table-column label="机械类别" align="center" prop="machineTypeName" />
      <el-table-column label="计量单位" align="center" prop="measureUnit" />
      <el-table-column label="备注" align="center" prop="remark" />
      <el-table-column label="状态" align="center" prop="status">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.sys_normal_disable" :value="scope.row.status"/>
        </template>
      </el-table-column>
      <el-table-column label="排序" align="center" prop="orderNum" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['agriculture:machineInfo:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['agriculture:machineInfo:remove']"
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

    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="100px">
        <el-row>
          <el-col :span="24">
            <el-form-item label="机械编码" prop="machineCode">
              <el-input v-model="form.machineCode" placeholder="请输入机械编码" />
            </el-form-item>
          </el-col>
          <el-col :span="24">
            <el-form-item label="机械名称" prop="machineName">
              <el-input v-model="form.machineName" placeholder="请输入机械名称" />
            </el-form-item>
          </el-col>
          <el-col :span="24">
            <el-form-item label="机械类别" prop="machineTypeId">
              <el-select
                v-model="form.machineTypeId"
                placeholder="请选择机械类别"
                style="width: 100%"
              >
                <el-option
                  v-for="item in machineTypeOptions"
                  :key="item.machineTypeId"
                  :label="item.machineTypeName"
                  :value="item.machineTypeId"
                />
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="24">
            <el-form-item label="计量单位" prop="measureUnit">
              <el-input v-model="form.measureUnit" placeholder="请输入计量单位" />
            </el-form-item>
          </el-col>
          <el-col :span="24">
            <el-form-item label="备注" prop="remark">
              <el-input v-model="form.remark" type="textarea" placeholder="请输入内容" />
            </el-form-item>
          </el-col>
          <el-col :span="24">
            <el-form-item label="排序" prop="orderNum">
              <el-input v-model="form.orderNum" placeholder="请输入排序" />
            </el-form-item>
          </el-col>
          <el-col :span="24">
            <el-form-item label="状态" prop="status">
              <el-radio-group v-model="form.status">
                <el-radio
                  v-for="dict in dict.type.sys_normal_disable"
                  :key="dict.value"
                  :label="dict.value"
                >{{dict.label}}</el-radio>
              </el-radio-group>
            </el-form-item>
          </el-col>
        </el-row>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listInfo, getInfo, delInfo, addInfo, updateInfo } from "@/api/system/machineinfo"
import { listType } from "@/api/system/machinetype"

export default {
  name: "MachineInfo",
  // 【改动点 1】显式在 dicts 数组中注册系统公共的正常/停用字典
  dicts: ['sys_normal_disable'],
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
      // 机械信息表格数据
      infoList: [],
      // 机械类别选项
      machineTypeOptions: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        machineCode: null,
        machineName: null,
        machineTypeId: null,
        measureUnit: null,
        status: null,
        orderNum: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        machineCode: [
          { required: true, message: "机械编码不能为空", trigger: "blur" }
        ],
        machineName: [
          { required: true, message: "机械名称不能为空", trigger: "blur" }
        ],
        machineTypeId: [
          { required: true, message: "机械类别不能为空", trigger: "change" }
        ],
        measureUnit: [
          { required: true, message: "计量单位不能为空", trigger: "blur" }
        ],
        remark: [
          { required: true, message: "备注不能为空", trigger: "blur" }
        ],
        status: [
          { required: true, message: "状态不能为空", trigger: "change" }
        ],
        orderNum: [
          { required: true, message: "排序不能为空", trigger: "blur" }
        ]
      }
    }
  },
  created() {
    this.getList()
    this.getMachineTypeList()
  },
  methods: {
    /** 查询机械类别列表 */
    getMachineTypeList() {
      listType({ status: '0' }).then(response => {
        this.machineTypeOptions = response.rows
      })
    },
    /** 查询机械信息列表 */
    getList() {
      this.loading = true
      listInfo(this.queryParams).then(response => {
        this.infoList = response.rows
        this.total = response.total
        this.loading = false
      })
    },
    // 取消按钮
    cancel() {
      this.open = false
      this.reset()
    },
    // 表单重置
    reset() {
      this.form = {
        machineId: null,
        machineCode: null,
        machineName: null,
        machineTypeId: null,
        measureUnit: null,
        remark: null,
        status: "0", // 【改动点 4】新增表单重置时，状态默认赋值为 "0"（正常），匹配校验规则
        orderNum: 0, // 默认排序给个初始值 0
        createBy: null,
        createTime: null,
        updateBy: null,
        updateTime: null,
        delFlag: null
      }
      this.resetForm("form")
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1
      this.getList()
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.resetForm("queryForm")
      this.handleQuery()
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.machineId)
      this.single = selection.length !== 1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset()
      this.open = true
      this.title = "添加机械信息"
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset()
      const machineId = row.machineId || this.ids
      getInfo(machineId).then(response => {
        this.form = response.data
        this.open = true
        this.title = "修改机械信息"
      })
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.machineId != null) {
            updateInfo(this.form).then(response => {
              this.$modal.msgSuccess("修改成功")
              this.open = false
              this.getList()
            })
          } else {
            addInfo(this.form).then(response => {
              this.$modal.msgSuccess("新增成功")
              this.open = false
              this.getList()
            })
          }
        }
      })
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const machineIds = row.machineId || this.ids
      this.$modal.confirm('是否确认删除机械信息编号为"' + machineIds + '"的数据项？').then(function() {
        return delInfo(machineIds)
      }).then(() => {
        this.getList()
        this.$modal.msgSuccess("删除成功")
      }).catch(() => {})
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('system/info/export', {
        ...this.queryParams
      }, `info_${new Date().getTime()}.xlsx`)
    }
  }
}
</script>
