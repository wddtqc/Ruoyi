<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="编码" prop="employeeCode">
        <el-input v-model="queryParams.employeeCode" placeholder="请输入编码" clearable @keyup.enter.native="handleQuery" />
      </el-form-item>
      <el-form-item label="姓名" prop="employeeName">
        <el-input v-model="queryParams.employeeName" placeholder="请输入姓名" clearable @keyup.enter.native="handleQuery" />
      </el-form-item>
      <el-form-item label="手机号码" prop="employeeTel">
        <el-input v-model="queryParams.employeeTel" placeholder="请输入手机号码" clearable @keyup.enter.native="handleQuery" />
      </el-form-item>
      <el-form-item label="员工类型" prop="employeeType">
        <el-select v-model="queryParams.employeeType" placeholder="请选择员工类型" clearable>
          <el-option
            v-for="dict in dict.type.agriculture_employee_type"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button type="primary" plain icon="el-icon-plus" size="mini" @click="handleAdd" v-hasPermi="['system:employee:add']">新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="success" plain icon="el-icon-edit" size="mini" :disabled="single" @click="handleUpdate" v-hasPermi="['system:employee:edit']">修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="danger" plain icon="el-icon-delete" size="mini" :disabled="multiple" @click="handleDelete" v-hasPermi="['system:employee:remove']">删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="warning" plain icon="el-icon-download" size="mini" @click="handleExport" v-hasPermi="['system:employee:export']">导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="employeeList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="雇员ID" align="center" prop="employeeId" />
      <el-table-column label="编码" align="center" prop="employeeCode" />
      <el-table-column label="姓名" align="center" prop="employeeName" />
      <el-table-column label="员工类型" align="center" prop="employeeType">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.agriculture_employee_type" :value="scope.row.employeeType"/>
        </template>
      </el-table-column>
      <el-table-column label="手机号码" align="center" prop="employeeTel" />
      <el-table-column label="性别" align="center" prop="employeeSex">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.sys_user_sex" :value="scope.row.employeeSex"/>
        </template>
      </el-table-column>
      <el-table-column label="地址" align="center" prop="employeeAddress" />
      <el-table-column label="状态" align="center" prop="status">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.sys_normal_disable" :value="scope.row.status"/>
        </template>
      </el-table-column>
      <el-table-column label="排序" align="center" prop="orderNum" />
      <el-table-column label="备注" align="center" prop="remark" :show-overflow-tooltip="true" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button size="mini" type="text" icon="el-icon-edit" @click="handleUpdate(scope.row)" v-hasPermi="['system:employee:edit']">修改</el-button>
          <el-button size="mini" type="text" icon="el-icon-delete" @click="handleDelete(scope.row)" v-hasPermi="['system:employee:remove']">删除</el-button>
        </template>
      </el-table-column>
    </el-table>

    <pagination v-show="total>0" :total="total" :page.sync="queryParams.pageNum" :limit.sync="queryParams.pageSize" @pagination="getList" />

    <el-dialog :title="title" :visible.sync="open" width="550px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="100px">
        <el-row>
          <el-col :span="12">
            <el-form-item label="编码" prop="employeeCode">
              <el-input v-model="form.employeeCode" placeholder="请输入编码" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="姓名" prop="employeeName">
              <el-input v-model="form.employeeName" placeholder="请输入姓名" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="手机号码" prop="employeeTel">
              <el-input v-model="form.employeeTel" placeholder="请输入手机号码" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="排序" prop="orderNum">
              <el-input-number v-model="form.orderNum" controls-position="right" :min="0" placeholder="排序" style="width: 100%"/>
            </el-form-item>
          </el-col>
          <el-col :span="24">
            <el-form-item label="员工类型" prop="employeeType">
              <el-select v-model="form.employeeType" placeholder="请选择员工类型" style="width: 100%">
                <el-option
                  v-for="dict in dict.type.agriculture_employee_type"
                  :key="dict.value"
                  :label="dict.label"
                  :value="dict.value"
                ></el-option>
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="性别" prop="employeeSex">
              <el-radio-group v-model="form.employeeSex">
                <el-radio
                  v-for="dict in dict.type.sys_user_sex"
                  :key="dict.value"
                  :label="dict.value"
                >{{dict.label}}</el-radio>
              </el-radio-group>
            </el-form-item>
          </el-col>
          <el-col :span="12">
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
          <el-col :span="24">
            <el-form-item label="地址" prop="employeeAddress">
              <el-input v-model="form.employeeAddress" placeholder="请输入地址" />
            </el-form-item>
          </el-col>
          <el-col :span="24">
            <el-form-item label="备注" prop="remark">
              <el-input v-model="form.remark" type="textarea" placeholder="请输入内容" />
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
import { listEmployee, getEmployee, delEmployee, addEmployee, updateEmployee } from "@/api/system/employee"

export default {
  name: "Employee",
  // 关键修复点：在此处注册页面所需要用到的所有字典类型
  dicts: ['agriculture_employee_type', 'sys_user_sex', 'sys_normal_disable'],
  data() {
    return {
      loading: true,
      ids: [],
      single: true,
      multiple: true,
      showSearch: true,
      total: 0,
      employeeList: [],
      title: "",
      open: false,
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        employeeCode: null,
        employeeName: null,
        employeeType: null,
        employeeTel: null,
        employeeSex: null,
        employeeAddress: null,
        status: null,
        orderNum: null,
      },
      form: {},
      rules: {
        employeeCode: [{ required: true, message: "编码不能为空", trigger: "blur" }],
        employeeName: [{ required: true, message: "姓名不能为空", trigger: "blur" }],
        employeeType: [{ required: true, message: "员工类型不能为空", trigger: "change" }],
        employeeTel: [{ required: true, message: "手机号码不能为空", trigger: "blur" }],
        employeeSex: [{ required: true, message: "性别不能为空", trigger: "change" }],
        employeeAddress: [{ required: true, message: "地址不能为空", trigger: "blur" }],
        status: [{ required: true, message: "状态不能为空", trigger: "change" }],
        orderNum: [{ required: true, message: "排序不能为空", trigger: "blur" }]
      }
    }
  },
  created() {
    this.getList()
  },
  methods: {
    /** 查询雇员列表 */
    getList() {
      this.loading = true
      listEmployee(this.queryParams).then(response => {
        this.employeeList = response.rows
        this.total = response.total
        this.loading = false
      })
    },
    cancel() {
      this.open = false
      this.reset()
    },
    reset() {
      this.form = {
        employeeId: null,
        employeeCode: null,
        employeeName: null,
        employeeType: null,
        employeeTel: null,
        employeeSex: null,
        employeeAddress: null,
        remark: null,
        status: "0", // 默认状态为正常
        orderNum: 0, // 默认排序为0
        delFlag: null
      }
      this.resetForm("form")
    },
    handleQuery() {
      this.queryParams.pageNum = 1
      this.getList()
    },
    resetQuery() {
      this.resetForm("queryForm")
      this.handleQuery()
    },
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.employeeId)
      this.single = selection.length !== 1
      this.multiple = !selection.length
    },
    handleAdd() {
      this.reset()
      this.open = true
      this.title = "添加雇员"
    },
    handleUpdate(row) {
      this.reset()
      const employeeId = row.employeeId || this.ids
      getEmployee(employeeId).then(response => {
        this.form = response.data
        this.open = true
        this.title = "修改雇员"
      })
    },
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.employeeId != null) {
            updateEmployee(this.form).then(response => {
              this.$modal.msgSuccess("修改成功")
              this.open = false
              this.getList()
            })
          } else {
            addEmployee(this.form).then(response => {
              this.$modal.msgSuccess("新增成功")
              this.open = false
              this.getList()
            })
          }
        }
      })
    },
    handleDelete(row) {
      const employeeIds = row.employeeId || this.ids
      this.$modal.confirm('是否确认删除雇员编号为"' + employeeIds + '"的数据项？').then(function() {
        return delEmployee(employeeIds)
      }).then(() => {
        this.getList()
        this.$modal.msgSuccess("删除成功")
      }).catch(() => {})
    },
    handleExport() {
      this.download('system/employee/export', {
        ...this.queryParams
      }, `employee_${new Date().getTime()}.xlsx`)
    }
  }
}
</script>
