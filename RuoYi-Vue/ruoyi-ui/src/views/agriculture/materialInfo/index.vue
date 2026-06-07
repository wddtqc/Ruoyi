<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="农资编码" prop="materialCode">
        <el-input
          v-model="queryParams.materialCode"
          placeholder="请输入农资编码"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="农资名称" prop="materialName">
        <el-input
          v-model="queryParams.materialName"
          placeholder="请输入农资名称"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="农资类别" prop="materialTypeId">
        <el-select
          v-model="queryParams.materialTypeId"
          placeholder="请选择农资类别"
          clearable
          style="width: 240px"
        >
          <el-option
            v-for="item in materialTypeOptions"
            :key="item.materialTypeId"
            :label="item.materialTypeName"
            :value="item.materialTypeId"
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
          v-hasPermi="['system:info:add']"
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
          v-hasPermi="['system:info:edit']"
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
          v-hasPermi="['system:info:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['system:info:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="infoList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="农资ID" align="center" prop="materialId" />
      <el-table-column label="农资编码" align="center" prop="materialCode" />
      <el-table-column label="农资名称" align="center" prop="materialName" />
      <el-table-column label="农资类别" align="center" prop="materialTypeName" />
      <el-table-column label="计量单位" align="center" prop="measureUnit" />
      <el-table-column label="备注" align="center" prop="remark" />
      <el-table-column label="排序" align="center" prop="orderNum" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['system:info:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['system:info:remove']"
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
            <el-form-item label="农资编码" prop="materialCode">
              <el-input v-model="form.materialCode" placeholder="请输入农资编码" />
            </el-form-item>
          </el-col>
          <el-col :span="24">
            <el-form-item label="农资名称" prop="materialName">
              <el-input v-model="form.materialName" placeholder="请输入农资名称" />
            </el-form-item>
          </el-col>
          <el-col :span="24">
            <el-form-item label="农资类别" prop="materialTypeId">
              <el-select
                v-model="form.materialTypeId"
                placeholder="请选择农资类别"
                style="width: 100%"
              >
                <el-option
                  v-for="item in materialTypeOptions"
                  :key="item.materialTypeId"
                  :label="item.materialTypeName"
                  :value="item.materialTypeId"
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
import { listInfo, getInfo, delInfo, addInfo, updateInfo } from "@/api/system/materialinfo"
import { listType } from "@/api/system/materialtype"

export default {
  name: "Info",
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
      // 农资信息表格数据
      infoList: [],
      // 农资类别选项
      materialTypeOptions: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        materialCode: null,
        materialName: null,
        materialTypeId: null,
        measureUnit: null,
        status: null,
        orderNum: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        materialCode: [
          { required: true, message: "农资编码不能为空", trigger: "blur" }
        ],
        materialName: [
          { required: true, message: "农资名称不能为空", trigger: "blur" }
        ],
        materialTypeId: [
          { required: true, message: "农资类别不能为空", trigger: "change" }
        ],
        measureUnit: [
          { required: true, message: "计量单位不能为空", trigger: "blur" }
        ],
        orderNum: [
          { required: true, message: "排序不能为空", trigger: "blur" }
        ]
        // 已移除：remark、status、createBy、delFlag 的非空校验，避免因界面未填值而拦截提交
      }
    }
  },
  created() {
    this.getList()
    this.getMaterialTypeList()
  },
  methods: {
    /** 查询农资类别列表 */
    getMaterialTypeList() {
      listType({ status: '0' }).then(response => {
        this.materialTypeOptions = response.rows
      })
    },
    /** 查询农资信息列表 */
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
        materialId: null,
        materialCode: null,
        materialName: null,
        materialTypeId: null,
        measureUnit: null,
        remark: null,
        status: "0",     // 默认赋上正常状态"0"，在前端隐藏的同时保证后端不报非空错误
        orderNum: 0,     // 默认排序为 0
        createBy: null,
        createTime: null,
        updateBy: null,
        updateTime: null,
        delFlag: "0"     // 默认赋值未删除"0"，确保通过数据库非空和逻辑删除限制
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
      this.ids = selection.map(item => item.materialId)
      this.single = selection.length !== 1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset()
      this.open = true
      this.title = "添加农资信息"
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset()
      const materialId = row.materialId || this.ids
      getInfo(materialId).then(response => {
        this.form = response.data
        this.open = true
        this.title = "修改农资信息"
      })
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.materialId != null) {
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
      const materialIds = row.materialId || this.ids
      this.$modal.confirm('是否确认删除农资信息编号为"' + materialIds + '"的数据项？').then(function() {
        return delInfo(materialIds)
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
