<template>
  <div class="app-container-sm">
    <el-card v-show="showSearch" class="card-margin-bottom">
      <el-form
        :model="queryParams"
        ref="queryForm"
        size="small"
        :inline="true"
        v-show="showSearch"
        label-width="68px"
        class="form-minus-bottom"
      >
        <el-form-item label="地块名称" prop="landName">
          <el-input
            v-model="queryParams.landName"
            placeholder="请输入地块名称"
            clearable
            @keyup.enter.native="handleQuery"
          />
        </el-form-item>
        <el-form-item label="地块类别" prop="landType">
          <el-select
            v-model="queryParams.landType"
            placeholder="请选择地块类别"
            clearable
          >
            <el-option
              v-for="dict in dict.type.agriculture_land_type"
              :key="dict.value"
              :label="dict.label"
              :value="dict.value"
            />
          </el-select>
        </el-form-item>
        <el-form-item label="地块状态" prop="status">
          <el-select
            v-model="queryParams.status"
            placeholder="请选择地块状态"
            clearable
          >
            <el-option
              v-for="dict in dict.type.agriculture_land_status"
              :key="dict.value"
              :label="dict.label"
              :value="dict.value"
            />
          </el-select>
        </el-form-item>
        <el-form-item label="种植作物" prop="cropName">
          <el-input
            v-model="queryParams.cropName"
            placeholder="请输入种植作物"
            clearable
            @keyup.enter.native="handleQuery"
          />
        </el-form-item>
        <el-form-item>
          <el-button
            type="primary"
            icon="el-icon-search"
            size="mini"
            @click="handleQuery"
          >搜索</el-button>
          <el-button icon="el-icon-refresh" size="mini" @click="resetQuery"
          >重置</el-button
          >
        </el-form-item>
        <el-form-item style="float:right;">
          <el-button
            type="primary"
            plain
            icon="el-icon-plus"
            size="mini"
            @click="handleAdd"
            v-hasPermi="['system:land:add']"
          >新增</el-button>
        </el-form-item>
      </el-form>
    </el-card>

    <el-card class="card-padding-bottom">
      <el-table v-loading="loading" :data="landList">
        <el-table-column label="地块名称" align="center" prop="landName" />
        <el-table-column label="地块类别" align="center" prop="landType">
          <template slot-scope="scope">
            <dict-tag
              :options="getLandTypeOptions"
              :value="scope.row.landType"
            />
          </template>
        </el-table-column>
        <el-table-column label="地块状态" align="center" prop="status">
          <template slot-scope="scope">
            <dict-tag
              :options="getLandStatusOptions"
              :value="getComputedStatus(scope.row)"
            />
          </template>
        </el-table-column>
        <el-table-column label="种植作物" align="center" prop="cropName" />
        <el-table-column
          label="操作"
          align="center"
          class-name="small-padding fixed-width"
        >
          <template slot-scope="scope">
            <el-button
              size="small"
              class="padding-5"
              type="primary"
              icon="el-icon-edit"
              @click="handleUpdate(scope.row)"
              v-hasPermi="['system:land:edit']"
            >修改</el-button>
            <el-button
              size="small"
              class="padding-5"
              type="danger"
              icon="el-icon-delete"
              @click="handleDelete(scope.row)"
              v-hasPermi="['system:land:remove']"
            >删除</el-button>
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

      <el-dialog v-if="open" :title="title" :visible.sync="open" width="1200px" append-to-body>
        <div class="map-form">
          <draw-area
            v-if="open"
            :polygon-style="polygonStyle"
            :polygon-path="form.landPath"
            @change-path="getPloygon"
          />
          <div style="width:430px; margin-left: 20px;">
            <el-form ref="form" :model="form" :rules="rules" label-width="120px">
              <el-form-item label="地块名称" prop="landName">
                <el-input v-model="form.landName" placeholder="请输入地块名称" />
              </el-form-item>
              <el-form-item label="地块类别" prop="landType">
                <el-select v-model="form.landType" placeholder="请选择地块类别" style="width:100%">
                  <el-option
                    v-for="dict in dict.type.agriculture_land_type"
                    :key="dict.value"
                    :label="dict.label"
                    :value="dict.value"
                  ></el-option>
                </el-select>
              </el-form-item>

              <el-form-item label="地块状态" prop="status">
                <el-select v-model="form.status" placeholder="请选择地块状态" style="width:100%">
                  <el-option
                    v-for="dict in dict.type.agriculture_land_status"
                    :key="dict.value"
                    :label="dict.label"
                    :value="dict.value"
                  ></el-option>
                </el-select>
              </el-form-item>

              <el-form-item label="地块面积" prop="landArea">
                <el-input v-model="form.landArea" placeholder="请输入地块面积">
                  <template slot="append">亩</template>
                </el-input>
              </el-form-item>
              <el-form-item label="边框宽度" prop="strokeWeight">
                <el-slider v-model="form.strokeWeight" :step="1" :max="5"></el-slider>
              </el-form-item>
              <el-form-item label="边框颜色" prop="strokeColor">
                <el-color-picker v-model="form.strokeColor"></el-color-picker>
              </el-form-item>
              <el-form-item label="边框透明度" prop="strokeOpacity">
                <el-slider v-model="form.strokeOpacity" :step="0.1" :max="1" ></el-slider>
              </el-form-item>
              <el-form-item label="地块颜色" prop="fillColor">
                <el-color-picker v-model="form.fillColor"></el-color-picker>
              </el-form-item>
              <el-form-item label="地块透明度" prop="fillOpacity">
                <el-slider v-model="form.fillOpacity" :step="0.1" :max="1" ></el-slider>
              </el-form-item>
            </el-form>
          </div>
        </div>
        <div slot="footer" class="dialog-footer">
          <el-button type="primary" @click="submitForm">确 定</el-button>
          <el-button @click="cancel">取 消</el-button>
        </div>
      </el-dialog>
    </el-card>
  </div>
</template>

<script>
import {
  listLand,
  getLand,
  delLand,
  addLand,
  updateLand,
} from "@/api/system/land";
import { getToken } from "@/utils/auth";
import DrawArea from "./components/DrawArea";

export default {
  name: "AgricultureLand",
  dicts: ["agriculture_land_status", "agriculture_land_type"],
  components: { DrawArea },
  data() {
    return {
      loading: true,
      ids: [],
      single: true,
      multiple: true,
      showSearch: true,
      total: 0,
      landList: [],
      title: "",
      open: false,
      upload: {
        open: false,
        title: "",
        isUploading: false,
        updateSupport: 0,
        headers: { Authorization: "Bearer " + getToken() },
        url: process.env.VUE_APP_BASE_API + "/agriculture/land/importData",
      },
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        landName: null,
        landType: null,
        status: null,
        cropName: null,
      },
      form: {},
      rules: {
        landName: [{ required: true, message: '请输入地块名称', trigger: 'blur' }],
        landType: [{ required: true, message: '请选择地块类别', trigger: 'change' }],
        landArea: [{ required: true, message: '请输入地块面积', trigger: 'blur' }],
      }
    };
  },
  computed: {
    polygonStyle: function () {
      return {
        fillColor: this.form.fillColor || '#094015',
        fillOpacity: this.form.fillOpacity !== undefined ? this.form.fillOpacity : 0.5,
        strokeColor: this.form.strokeColor || '#1AC233',
        strokeOpacity: this.form.strokeOpacity !== undefined ? this.form.strokeOpacity : 0.8,
        strokeWeight: this.form.strokeWeight || 2
      }
    },
    /** 地块类别字典（增强版：自动补全样式） */
    getLandTypeOptions() {
      if (!this.dict.type.agriculture_land_type) return [];

      // 预定义样式映射（根据字典值配置颜色）
      const styleMap = {
        '0': 'success',   // 农田 - 绿色
        '1': 'warning',   // 果园 - 橙色
        '2': 'info',      // 菜地 - 灰色
        '3': 'danger',    // 荒地 - 红色
      };

      return this.dict.type.agriculture_land_type.map(item => {
        // 如果后端已有 listClass，则保留；否则使用预定义映射
        if (!item.raw.listClass || item.raw.listClass === '' || item.raw.listClass === 'default') {
          item.raw.listClass = styleMap[item.value] || 'info';
        }
        return item;
      });
    },
    /** 地块状态字典（增强版：自动补全样式） */
    getLandStatusOptions() {
      if (!this.dict.type.agriculture_land_status) return [];

      // 预定义样式映射（根据实际字典配置）
      const styleMap = {
        '0': 'success',   // 空闲中 - 绿色
        '1': 'warning',   // 种植中 - 橙色
        '2': 'danger',    // 已损坏 - 红色
      };

      return this.dict.type.agriculture_land_status.map(item => {
        if (!item.raw.listClass || item.raw.listClass === '' || item.raw.listClass === 'default') {
          item.raw.listClass = styleMap[item.value] || 'info';
        }
        return item;
      });
    }
  },
  created() {
    this.getList();
  },
  mounted() {
    // 🔍 调试：检查字典数据结构
    this.$nextTick(() => {
      console.log('=== 地块类别字典数据 ===');
      console.log(this.dict.type.agriculture_land_type);
      console.log('=== 地块状态字典数据 ===');
      console.log(this.dict.type.agriculture_land_status);
    });
  },
  methods: {
    /** 计算地块真实状态（根据业务逻辑自动判断） */
    getComputedStatus(row) {
      // 优先使用数据库中的 status 字段（如果已手动维护）
      if (row.status && row.status !== '') {
        return row.status;
      }

      // 如果没有手动维护，则根据业务逻辑自动判断：
      // 1. 如果有当前批次（currentBatch 不为空），则状态为"种植中"
      if (row.currentBatch && row.currentBatch > 0) {
        return '1'; // 种植中
      }

      // 2. 默认为"空闲中"
      return '0'; // 空闲中
    },
    /** 查询地块列表 */
    getList() {
      this.loading = true;
      listLand(this.queryParams).then((response) => {
        this.landList = response.rows;
        this.total = response.total;
        this.loading = false;
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
        landId: null,
        landName: null,
        landType: null,
        landArea: null,
        strokeWeight: 2,
        strokeColor: '#1AC233',
        strokeOpacity: 0.8,
        landPath: null,
        fillColor: '#094015',
        fillOpacity: 0.5,
        remark: null,
        status: "0",
        orderNum: null,
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
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加地块";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const landId = row.landId || this.ids;
      getLand(landId).then((response) => {
        // ⚡ 修复点2：为老旧数据添加地图样式的防空兜底，防止地图无法渲染
        const data = response.data;
        if (!data.strokeColor) data.strokeColor = '#1AC233';
        if (!data.strokeWeight) data.strokeWeight = 2;
        if (data.strokeOpacity === undefined) data.strokeOpacity = 0.8;
        if (!data.fillColor) data.fillColor = '#094015';
        if (data.fillOpacity === undefined) data.fillOpacity = 0.5;

        this.form = data;
        this.open = true;
        this.title = "修改地块";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate((valid) => {
        if (valid) {
          if (this.form.landId != null) {
            updateLand(this.form).then((response) => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addLand(this.form).then((response) => {
              this.$modal.msgSuccess("新增成功");
              this.open = false;
              this.getList();
            });
          }
        }
      });
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const landIds = row.landId || this.ids;
      this.$modal
        .confirm('是否确认删除地块编号为"' + landIds + '"的数据项？')
        .then(function () {
          return delLand(landIds);
        })
        .then(() => {
          this.getList();
          this.$modal.msgSuccess("删除成功");
        })
        .catch(() => {});
    },
    /** ⚡ 修复点3：核心改动。因为新 DrawArea 已经抛出拼接好的字符串，此处直接赋值即可，绝不能二次调用 .join('|') */
    getPloygon(pathStr) {
      this.form.landPath = pathStr;
    }
  }
};
</script>

<style lang="scss" scoped>
.map-form {
  display: flex;
  justify-content: space-between;
}
</style>
