<template>
  <div class="app-container">
    <el-card class="card-margin-bottom">
      <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px" class="form-minus-bottom">
        <el-form-item label="批次名称" prop="batchName">
          <el-input
            v-model="queryParams.batchName"
            placeholder="请输入批次名称"
            clearable
            @keyup.enter.native="handleQuery"
          />
        </el-form-item>
        <el-form-item label="种质" prop="germplasmId">
          <el-select v-model="queryParams.germplasmId" placeholder="请选择种质" clearable>
            <el-option
              v-for="germplasm in germplasmList"
              :key="germplasm.germplasmId"
              :label="germplasm.germplasmName"
              :value="germplasm.germplasmId"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="地块" prop="landId">
          <el-select v-model="queryParams.landId" placeholder="请选择地块" clearable>
            <el-option
              v-for="land in landList"
              :key="land.landId"
              :label="land.landName"
              :value="land.landId"
            ></el-option>
          </el-select>
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
            v-hasPermi="['agriculture:batch:add']"
          >新增</el-button>
          <el-button
            type="warning"
            plain
            icon="el-icon-download"
            size="mini"
            @click="handleExport"
            v-hasPermi="['agriculture:batch:export']"
          >导出</el-button>
        </el-form-item>
      </el-form>
    </el-card>

    <el-card class="card-padding-bottom">
      <el-table v-loading="loading" :data="batchList">
        <el-table-column label="批次名称" align="center" prop="batchName" />
        <el-table-column label="种质" align="center" prop="germplasmId">
          <template slot-scope="scope">
            <data-tag
              :options="germplasmList"
              :value="scope.row.germplasmId"
              labelName="germplasmName"
              valueName="germplasmId"
              type=""
            />
          </template>
        </el-table-column>
        <el-table-column label="负责人" align="center" prop="batchHead">
          <template slot-scope="scope">
            <data-tag
              :options="userList"
              :value="scope.row.batchHead"
              labelName="userName"
              valueName="userId"
              type="notag"
            />
          </template>
        </el-table-column>
        <el-table-column label="种质图片" align="center" prop="germplasmId" width="100">
          <template slot-scope="scope">
            <image-preview :src="getGermplasmImage(scope.row.germplasmId)" :width="50" :height="50"/>
          </template>
        </el-table-column>
        <el-table-column label="地块" align="center" prop="landId">
          <template slot-scope="scope">
            <data-tag
              :options="landList"
              :value="scope.row.landId"
              labelName="landName"
              valueName="landId"
              type="warning"
            />
          </template>
        </el-table-column>
        <el-table-column label="种植面积(亩)" align="center" prop="cropArea" />
        <el-table-column label="开始时间" align="center" prop="startTime" width="180">
          <template slot-scope="scope">
            <span>{{ parseTime(scope.row.startTime, '{y}-{m}-{d}') }}</span>
          </template>
        </el-table-column>
        <el-table-column label="操作" align="center" class-name="small-padding fixed-width" width="320">
          <template slot-scope="scope">
            <el-button
              size="mini"
              class="padding-5"
              type="primary"
              plain
              icon="el-icon-edit"
              @click="handleUpdate(scope.row)"
              v-hasPermi="['agriculture:batch:edit']"
            >修改</el-button>

            <el-button
              size="mini"
              class="padding-5"
              type="danger"
              plain
              icon="el-icon-delete"
              @click="handleDelete(scope.row)"
              v-hasPermi="['agriculture:batch:remove']"
            >删除</el-button>

            <el-dropdown class="margin-left-10" @command="handleCommand($event, scope.row)">
              <el-button class="padding-5" size="mini" type="warning" plain>
                更多功能<i class="el-icon-arrow-down el-icon--right"></i>
              </el-button>
              <el-dropdown-menu slot="dropdown">
                <el-dropdown-item command="handleMethod" icon="el-icon-key">种植方法</el-dropdown-item>
                <el-dropdown-item command="handleIntro" icon="el-icon-circle-check">种质介绍</el-dropdown-item>
                <el-dropdown-item command="handleTask" icon="el-icon-s-claim">作业流程</el-dropdown-item>
              </el-dropdown-menu>
            </el-dropdown>
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
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="批次名称" prop="batchName">
          <el-input v-model="form.batchName" placeholder="请输入批次名称" />
        </el-form-item>
        <el-form-item label="种质" prop="germplasmId">
          <el-select v-model.number="form.germplasmId" placeholder="请选择种质">
            <el-option
              v-for="germplasm in germplasmList"
              :key="germplasm.germplasmId"
              :label="germplasm.germplasmName"
              :value="Number(germplasm.germplasmId)"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="地块" prop="landId">
          <el-select v-model.number="form.landId" placeholder="请选择地块">
            <el-option
              v-for="land in landList"
              :key="land.landId"
              :label="land.landName"
              :value="Number(land.landId)"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="种植面积" prop="cropArea">
          <el-input v-model="form.cropArea" placeholder="请输入种植面积">
            <template slot="append">亩</template>
          </el-input>
        </el-form-item>
        <el-form-item label="开始时间" prop="startTime">
          <el-date-picker clearable size="medium"
                          v-model="form.startTime"
                          type="date"
                          value-format="yyyy-MM-dd"
                          placeholder="选择开始时间">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="负责人" prop="batchHead">
          <el-select v-model.number="form.batchHead" placeholder="请选择负责人">
            <el-option
              v-for="user in userList"
              :key="user.userId"
              :label="user.nickName"
              :value="Number(user.userId)"
            ></el-option>
          </el-select>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>

    <el-dialog :title="image.title" :visible.sync="image.open" width="240px">
      <img style="width:200px;height:200px;" :src="image.imgUrl" />
    </el-dialog>

    <el-dialog v-if="mDialog.open" :title="mDialog.title" :visible.sync="mDialog.open" width="1100px" append-to-body>
      <div style="height:550px; width:100%; overflow:auto; padding:10px;">
        <method v-if="mDialog.type == 'method'" :germplasm-id="mDialog.germplasmId"></method>
        <intro v-if="mDialog.type == 'intro'" :germplasm-id="mDialog.germplasmId"></intro>
        <task v-if="mDialog.type == 'task'" :batchId="mDialog.batchId" :tableBorder="true"></task>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listBatch, getBatch, delBatch, addBatch, updateBatch } from "@/api/system/batch";
import { listGermplasm } from "@/api/system/germplasm";
import { listUser } from "@/api/system/user";
import { listLand } from "@/api/system/land";

import Method from "../germplasm/components/method/index";
import Intro from "../germplasm/components/intro/index";
import Task from "../germplasm/components/task/index";

export default {
  name: "Batch",
  components: { Method, Intro, Task },
  data() {
    return {
      image:{
        baseUrl:window.location.origin+process.env.VUE_APP_BASE_API,
        open:false,
        imgUrl:'',
        title:''
      },
      mDialog: {
        open: false,
        title: '',
        type: '',
        germplasmId: null,
        batchId: null
      },
      loading: true,
      ids: [],
      single: true,
      multiple: true,
      showSearch: true,
      total: 0,
      batchList: [],
      landList:[],
      germplasmList:[],
      userList:[],
      title: "",
      open: false,
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        batchName: null,
        germplasmId: null,
        landId: null,
      },
      form: {},
      rules: {
        batchName: [
          { required: true, message: "批次名称不能为空", trigger: "blur" }
        ],
        germplasmId: [
          { required: true, message: "种质ID不能为空", trigger: "blur" }
        ],
        landId: [
          { required: true, message: "地块ID不能为空", trigger: "blur" }
        ],
        cropArea: [
          { required: true, message: "种植面积不能为空", trigger: "blur" }
        ],
        startTime: [
          { required: true, message: "开始时间不能为空", trigger: "blur" }
        ],
        batchHead: [
          { required: true, message: "负责人不能为空", trigger: "blur" }
        ],
      }
    };
  },
  created() {
    this.getList();
    this.getLandList();
    this.getGermplasmList();
    this.getUserList();
  },
  methods: {
    getList() {
      this.loading = true;
      listBatch(this.queryParams).then(response => {
        this.batchList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    getLandList() {
      return listLand().then(response => {
        this.landList = response.rows;
      });
    },
    getGermplasmList() {
      return listGermplasm().then(response => {
        this.germplasmList = response.rows;
      });
    },
    getUserList(){
      return listUser().then(response => {
        this.userList = response.rows;
      });
    },
    cancel() {
      this.open = false;
      this.reset();
    },
    reset() {
      this.form = {
        batchId: null,
        batchName: null,
        germplasmId: null,
        landId: null,
        cropArea: null,
        startTime: null,
        batchHead:null,
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
    handleQuery() {
      this.queryParams.pageNum = 1;
      this.getList();
    },
    resetQuery() {
      this.resetForm("queryForm");
      this.handleQuery();
    },
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加作物批次";
    },
    handleUpdate(row) {
      this.reset();
      const batchId = row.batchId || this.ids;

      // 确保下拉选项已加载，再获取详情数据
      Promise.all([
        this.getGermplasmList(),
        this.getLandList(),
        this.getUserList(),
        getBatch(batchId)
      ]).then(([_, __, ___, batchRes]) => {
        this.form = batchRes.data;

        // 🔥 核心修复：后端返回的外键是 String（如 "2"），而下拉选项 value 是 Number（如 2）
        // Element-UI el-select 使用 === 严格匹配，必须统一类型才能正确回显
        this.form.germplasmId = this.toNumber(this.form.germplasmId);
        this.form.landId = this.toNumber(this.form.landId);
        this.form.batchHead = this.toNumber(this.form.batchHead);

        this.open = true;
        this.title = "修改作物批次";
      }).catch(err => {
        this.$modal.msgError("加载数据失败：" + (err.message || "未知错误"));
      });
    },
    /** 安全的类型转换：String → Number，处理 null/undefined/NaN */
    toNumber(value) {
      if (value == null || value === '') return null;
      const num = Number(value);
      return isNaN(num) ? null : num;
    },
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.batchId != null) {
            updateBatch(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addBatch(this.form).then(response => {
              this.$modal.msgSuccess("新增成功");
              this.open = false;
              this.getList();
            });
          }
        }
      });
    },
    handleDelete(row) {
      const batchIds = row.batchId || this.ids;
      this.$modal.confirm('是否确认删除作物批次编号为"' + batchIds + '"的数据项？').then(function() {
        return delBatch(batchIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    previewImage(imgUrl,row){
      this.image.title = row.version
      this.image.open = true;
      this.image.imgUrl = imgUrl;
    },
    handleExport() {
      this.download('agriculture/batch/export', {
        ...this.queryParams
      }, `batch_${new Date().getTime()}.xlsx`)
    },
    handleCommand(command, row) {
      this.mDialog.germplasmId = row.germplasmId;
      this.mDialog.batchId = row.batchId;
      this.mDialog.open = true;

      switch(command) {
        case 'handleMethod':
          this.mDialog.title = '种植方法';
          this.mDialog.type = 'method';
          break;
        case 'handleIntro':
          this.mDialog.title = '种质介绍';
          this.mDialog.type = 'intro';
          break;
        case 'handleTask':
          this.mDialog.title = '作业流程 (种植计划)';
          this.mDialog.type = 'task';
          break;
      }
    },
    /** 根据种质ID获取种质图片 */
    getGermplasmImage(germplasmId) {
      if (!germplasmId || !this.germplasmList || this.germplasmList.length === 0) {
        return '';
      }
      const germplasm = this.germplasmList.find(item => String(item.germplasmId) === String(germplasmId));
      return germplasm ? germplasm.germplasmImg : '';
    }
  }
};
</script>

<style lang="scss" scoped>
::v-deep .el-select{
  width:100%;
}
::v-deep .el-date-editor.el-input{
  width:100%;
}
.margin-left-10 {
  margin-left: 10px;
}
.fr {
  float: right;
}
</style>
