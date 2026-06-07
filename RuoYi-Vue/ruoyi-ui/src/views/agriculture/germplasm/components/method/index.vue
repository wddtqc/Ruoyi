<template>
  <div class="app-container">
    <el-card class="card-margin-bottom">
      <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px" class="form-minus-bottom">
        <el-form-item label="种质ID" prop="germplasmId">
          <el-input
            v-model="queryParams.germplasmId"
            placeholder="请输入种质ID"
            clearable
            @keyup.enter.native="handleQuery"
          />
        </el-form-item>
        <el-form-item label="名称" prop="methodName">
          <el-input
            v-model="queryParams.methodName"
            placeholder="请输入名称"
            clearable
            @keyup.enter.native="handleQuery"
          />
        </el-form-item>
        <el-form-item label="图片" prop="methodImg">
          <el-input
            v-model="queryParams.methodImg"
            placeholder="请输入图片"
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
        <el-form-item class="fr">
          <el-button
            type="primary"
            plain
            icon="el-icon-plus"
            size="mini"
            @click="handleAdd"
            v-hasPermi="['system:method:add']"
          >新增</el-button>
          <el-button
            type="warning"
            plain
            icon="el-icon-download"
            size="mini"
            @click="handleExport"
            v-hasPermi="['system:method:export']"
          >导出</el-button>
        </el-form-item>
      </el-form>
    </el-card>

    <el-row :gutter="10" class="mb8" style="margin-left: 5px; margin-bottom: 10px;">
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['system:method:edit']"
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
          v-hasPermi="['system:method:remove']"
        >删除</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-card class="card-padding-bottom">
      <el-table v-loading="loading" :data="methodList" @selection-change="handleSelectionChange">
        <el-table-column type="selection" width="55" align="center" />
        <el-table-column label="方法ID" align="center" prop="methodId" />
        <el-table-column label="种质ID" align="center" prop="germplasmId" />
        <el-table-column label="名称" align="center" prop="methodName" />
        <el-table-column label="图片" align="center" prop="methodImg" width="100">
          <template slot-scope="scope">
            <image-preview :src="scope.row.methodImg" :width="50" :height="50"/>
          </template>
        </el-table-column>
        <el-table-column label="描述" align="center" prop="methodDes" />
        <el-table-column label="备注" align="center" prop="remark" />
        <el-table-column label="状态" align="center" prop="status" />
        <el-table-column label="排序" align="center" prop="orderNum" />
        <el-table-column label="操作" align="center" class-name="small-padding fixed-width" width="220">
          <template slot-scope="scope">
            <el-button
              size="mini"
              class="padding-5"
              type="primary"
              plain
              icon="el-icon-edit"
              @click="handleUpdate(scope.row)"
              v-hasPermi="['system:method:edit']"
            >修改</el-button>
            <el-button
              size="mini"
              class="padding-5"
              type="danger"
              plain
              icon="el-icon-delete"
              @click="handleDelete(scope.row)"
              v-hasPermi="['system:method:remove']"
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
    </el-card>

    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="100px">
        <el-row>
          <el-col :span="24">
            <el-form-item label="种质ID" prop="germplasmId">
              <el-input v-model="form.germplasmId" placeholder="请输入种质ID" />
            </el-form-item>
          </el-col>
          <el-col :span="24">
            <el-form-item label="名称" prop="methodName">
              <el-input v-model="form.methodName" placeholder="请输入名称" />
            </el-form-item>
          </el-col>
          <el-col :span="24">
            <el-form-item label="图片" prop="methodImg">
              <image-upload v-model="form.methodImg" :limit="1" :action="uploadAction"/>
            </el-form-item>
          </el-col>
          <el-col :span="24">
            <el-form-item label="描述" prop="methodDes">
              <el-input v-model="form.methodDes" type="textarea" placeholder="请输入内容" />
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
            <el-form-item label="删除标志" prop="delFlag">
              <el-input v-model="form.delFlag" placeholder="请输入删除标志" />
            </el-form-item>
          </el-col>
        </el-row>
      </</el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listMethod, getMethod, delMethod, addMethod, updateMethod } from "@/api/system/method"

export default {
  name: "Method",
  data() {
    return {
      // 上传接口地址
      uploadAction: "/agriculture/germplasm/upload",
      loading: true,
      ids: [],
      single: true,
      multiple: true,
      showSearch: true,
      total: 0,
      methodList: [],
      title: "",
      open: false,
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        germplasmId: null,
        methodName: null,
        methodImg: null,
        methodDes: null,
        status: null,
        orderNum: null,
      },
      form: {},
      rules: {
        germplasmId: [
          { required: true, message: "种质ID不能为空", trigger: "blur" }
        ],
        methodName: [
          { required: true, message: "名称不能为空", trigger: "blur" }
        ],
        methodImg: [
          { required: true, message: "图片不能为空", trigger: "blur" }
        ],
        methodDes: [
          { required: true, message: "描述不能为空", trigger: "blur" }
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
    /** 查询种植方法列表 */
    getList() {
      this.loading = true
      listMethod(this.queryParams).then(response => {
        // 🌟 防御性洗数据：把每一项中的字符串 ID 强转为数字
        this.methodList = (response.rows || []).map(item => {
          if (item.germplasmId !== null && item.germplasmId !== undefined) {
            item.germplasmId = Number(item.germplasmId);
          }
          return item;
        });
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
        methodId: null,
        germplasmId: null,
        methodName: null,
        methodImg: null,
        methodDes: null,
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
    handleQuery() {
      this.queryParams.pageNum = 1
      this.getList()
    },
    resetQuery() {
      this.resetForm("queryForm")
      this.handleQuery()
    },
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.methodId)
      this.single = selection.length !== 1
      this.multiple = !selection.length
    },
    handleAdd() {
      this.reset()
      this.open = true
      this.title = "添加种植方法"
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset()
      const methodId = row.methodId || this.ids
      getMethod(methodId).then(response => {
        const formData = response.data;
        // 🌟 防御性洗数据：把详情里可能为字符串的 ID 强转为数字
        if (formData && formData.germplasmId !== null && formData.germplasmId !== undefined) {
          formData.germplasmId = Number(formData.germplasmId);
        }
        this.form = formData
        this.open = true
        this.title = "修改种植方法"
      })
    },
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.methodId != null) {
            updateMethod(this.form).then(response => {
              this.$modal.msgSuccess("修改成功")
              this.open = false
              this.getList()
            })
          } else {
            addMethod(this.form).then(response => {
              this.$modal.msgSuccess("新增成功")
              this.open = false
              this.getList()
            })
          }
        }
      })
    },
    handleDelete(row) {
      const methodIds = row.methodId || this.ids
      this.$modal.confirm('是否确认删除种植方法编号为"' + methodIds + '"的数据项？').then(function() {
        return delMethod(methodIds)
      }).then(() => {
        this.getList()
        this.$modal.msgSuccess("删除成功")
      }).catch(() => {})
    },
    handleExport() {
      this.download('system/method/export', {
        ...this.queryParams
      }, `method_${new Date().getTime()}.xlsx`)
    }
  }
}
</script>

<style lang="scss" scoped>
.fr {
  float: right;
}
.padding-5 {
  padding: 5px 10px;
}
</style>
