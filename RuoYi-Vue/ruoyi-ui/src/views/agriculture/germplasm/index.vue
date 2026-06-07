<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="作物名称" prop="cropName">
        <el-input
          v-model="queryParams.cropName"
          placeholder="请输入作物名称"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="作物英文名称" prop="cropEnName">
        <el-input
          v-model="queryParams.cropEnName"
          placeholder="请输入作物英文名称"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="种质名称" prop="germplasmName">
        <el-input
          v-model="queryParams.germplasmName"
          placeholder="请输入种质名称"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="种质英文名称" prop="germplasmEnName">
        <el-input
          v-model="queryParams.germplasmEnName"
          placeholder="请输入种质英文名称"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="种质图片" prop="germplasmImg">
        <el-input
          v-model="queryParams.germplasmImg"
          placeholder="请输入种质图片"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
<!--      <el-form-item label="排序" prop="orderNum">-->
<!--        <el-input-->
<!--          v-model="queryParams.orderNum"-->
<!--          placeholder="请输入排序"-->
<!--          clearable-->
<!--          @keyup.enter.native="handleQuery"-->
<!--        />-->
<!--      </el-form-item>-->
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
          v-hasPermi="['system:germplasm:add']"
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
          v-hasPermi="['system:germplasm:edit']"
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
          v-hasPermi="['system:germplasm:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['system:germplasm:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="germplasmList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
<!--      <el-table-column label="种质ID" align="center" prop="germplasmId" />-->
      <el-table-column label="作物名称" align="center" prop="cropName" />
      <el-table-column label="作物英文名称" align="center" prop="cropEnName" />
      <el-table-column label="种质名称" align="center" prop="germplasmName" />
      <el-table-column label="种质英文名称" align="center" prop="germplasmEnName" />
      <el-table-column label="种质图片" align="center" prop="germplasmImg" width="100">
        <template slot-scope="scope">
          <image-preview :src="scope.row.germplasmImg" :width="50" :height="50"/>
        </template>
      </el-table-column>
      <el-table-column label="宣传语" align="center" prop="germplasmDes" />
<!--      <el-table-column label="备注" align="center" prop="remark" />-->
<!--      <el-table-column label="状态" align="center" prop="status" />-->
<!--      <el-table-column label="排序" align="center" prop="orderNum" />-->
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['system:germplasm:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['system:germplasm:remove']"
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

    <!-- 添加或修改种质对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="100px">
        <el-row>
          <el-col :span="24">
            <el-form-item label="作物名称" prop="cropName">
              <el-input v-model="form.cropName" placeholder="请输入作物名称" />
            </el-form-item>
          </el-col>
          <el-col :span="24">
            <el-form-item label="作物英文名称" prop="cropEnName">
              <el-input v-model="form.cropEnName" placeholder="请输入作物英文名称" />
            </el-form-item>
          </el-col>
          <el-col :span="24">
            <el-form-item label="种质名称" prop="germplasmName">
              <el-input v-model="form.germplasmName" placeholder="请输入种质名称" />
            </el-form-item>
          </el-col>
          <el-col :span="24">
            <el-form-item label="种质英文名称" prop="germplasmEnName">
              <el-input v-model="form.germplasmEnName" placeholder="请输入种质英文名称" />
            </el-form-item>
          </el-col>
          <el-col :span="24">
            <el-form-item label="种质图片" prop="germplasmImg">
              <image-upload v-model="form.germplasmImg" :limit="1" :action="uploadAction"/>
            </el-form-item>
          </el-col>
          <el-col :span="24">
            <el-form-item label="宣传语" prop="germplasmDes">
              <el-input v-model="form.germplasmDes" type="textarea" placeholder="请输入内容" />
            </el-form-item>
          </el-col>
<!--          <el-col :span="24">-->
<!--            <el-form-item label="备注" prop="remark">-->
<!--              <el-input v-model="form.remark" type="textarea" placeholder="请输入内容" />-->
<!--            </el-form-item>-->
<!--          </el-col>-->
<!--          <el-col :span="24">-->
<!--            <el-form-item label="排序" prop="orderNum">-->
<!--              <el-input v-model="form.orderNum" placeholder="请输入排序" />-->
<!--            </el-form-item>-->
<!--          </el-col>-->
<!--          <el-col :span="24">-->
<!--            <el-form-item label="删除标志" prop="delFlag">-->
<!--              <el-input v-model="form.delFlag" placeholder="请输入删除标志" />-->
<!--            </el-form-item>-->
<!--          </el-col>-->
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
import { listGermplasm, getGermplasm, delGermplasm, addGermplasm, updateGermplasm } from "@/api/system/germplasm"

export default {
  name: "Germplasm",
  data() {
    return {
      // 上传接口地址（不需要包含 VUE_APP_BASE_API，组件会自动拼接）
      uploadAction: "/system/germplasm/upload",
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
      // 种质表格数据
      germplasmList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        cropName: null,
        cropEnName: null,
        germplasmName: null,
        germplasmEnName: null,
        germplasmImg: null,
        germplasmDes: null,
        status: null,
        orderNum: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        cropName: [
          { required: true, message: "作物名称不能为空", trigger: "blur" }
        ],
        cropEnName: [
          { required: true, message: "作物英文名称不能为空", trigger: "blur" }
        ],
        germplasmName: [
          { required: true, message: "种质名称不能为空", trigger: "blur" }
        ],
        germplasmEnName: [
          { required: true, message: "种质英文名称不能为空", trigger: "blur" }
        ],
        germplasmImg: [
          { required: true, message: "种质图片不能为空", trigger: "blur" }
        ],
        germplasmDes: [
          { required: true, message: "宣传语不能为空", trigger: "blur" }
        ],
        remark: [
          { required: true, message: "备注不能为空", trigger: "blur" }
        ],
        status: [
          { required: true, message: "状态不能为空", trigger: "change" }
        ],
        orderNum: [
          { required: true, message: "排序不能为空", trigger: "blur" }
        ],
        createBy: [
          { required: true, message: "创建者ID不能为空", trigger: "blur" }
        ],
        delFlag: [
          { required: true, message: "删除标志不能为空", trigger: "blur" }
        ]
      }
    }
  },
  created() {
    this.getList()
  },
  methods: {
    /** 查询种质列表 */
    getList() {
      this.loading = true
      listGermplasm(this.queryParams).then(response => {
        this.germplasmList = response.rows
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
        germplasmId: null,
        cropName: null,
        cropEnName: null,
        germplasmName: null,
        germplasmEnName: null,
        germplasmImg: null,
        germplasmDes: null,
        remark: null,
        status: null,
        orderNum: null,
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
      this.ids = selection.map(item => item.germplasmId)
      this.single = selection.length !== 1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset()
      this.open = true
      this.title = "添加种质"
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset()
      const germplasmId = row.germplasmId || this.ids
      getGermplasm(germplasmId).then(response => {
        this.form = response.data
        this.open = true
        this.title = "修改种质"
      })
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.germplasmId != null) {
            updateGermplasm(this.form).then(response => {
              this.$modal.msgSuccess("修改成功")
              this.open = false
              this.getList()
            })
          } else {
            addGermplasm(this.form).then(response => {
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
      const germplasmIds = row.germplasmId || this.ids
      this.$modal.confirm('是否确认删除种质编号为"' + germplasmIds + '"的数据项？').then(function() {
        return delGermplasm(germplasmIds)
      }).then(() => {
        this.getList()
        this.$modal.msgSuccess("删除成功")
      }).catch(() => {})
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('system/germplasm/export', {
        ...this.queryParams
      }, `germplasm_${new Date().getTime()}.xlsx`)
    }
  }
}
</script>
