<template>
  <el-card class="card-container">
    <div slot="header" class="clearfix">
      <span>基地信息管理</span>
    </div>

    <el-form ref="form" :model="form" :rules="rules" label-width="120px" class="form">
      <el-form-item label="基地简称" prop="baseShortName">
        <el-input v-model="form.baseShortName" placeholder="请输入基地简称" />
      </el-form-item>

      <el-form-item label="基地编号" prop="baseCode">
        <el-input v-model="form.baseCode" placeholder="请输入基地编号" />
      </el-form-item>

      <el-form-item label="基地全称" prop="baseName">
        <el-input v-model="form.baseName" placeholder="请输入基地全称" />
      </el-form-item>

      <el-form-item label="基地负责人" prop="baseLeader">
        <el-input v-model="form.baseLeader" placeholder="请输入基地负责人" />
      </el-form-item>

      <el-form-item label="负责人电话" prop="leaderTel">
        <el-input v-model="form.leaderTel" placeholder="请输入基地负责人电话" />
      </el-form-item>

      <el-form-item label="负责人地址" prop="baseAddress">
        <el-input v-model="form.baseAddress" placeholder="请输入基地负责人地址" />
      </el-form-item>

      <el-form-item label="基地面积" prop="baseArea">
        <el-input v-model="form.baseArea" placeholder="请输入基地面积">
          <template slot="append">亩</template>
        </el-input>
      </el-form-item>

      <el-form-item label="基地海拔" prop="baseAltitude">
        <el-input v-model="form.baseAltitude" placeholder="请输入基地海拔">
          <template slot="append">米</template>
        </el-input>
      </el-form-item>

      <el-form-item label="基地坐标" prop="baseCoordinate">
        <el-input v-model="form.baseCoordinate" placeholder="形如: 116.397428, 39.90923" />
      </el-form-item>

      <el-form-item label="现场图片" prop="baseImg">
        <imageUpload v-model="form.baseImg" :fileSize="30" :limit="1"/>
      </el-form-item>

      <el-form-item label="基地描述" prop="baseDes">
        <el-input v-model="form.baseDes" type="textarea" placeholder="请输入基地描述内容" />
      </el-form-item>

      <el-form-item label="备注" prop="remark">
        <el-input v-model="form.remark" type="textarea" placeholder="请输入备注信息" />
      </el-form-item>

      <el-form-item>
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </el-form-item>
    </el-form>
  </el-card>
</template>

<script>
// 引入若依生成的后端接口：
// listBaseinfo: 条件查询基地列表（这里用来抓取第一条已有数据进行回显）
// addBaseinfo: 向数据库新增一条基地记录
// updateBaseinfo: 根据主键 ID 修改已有基地数据
import { listBaseinfo, addBaseinfo, updateBaseinfo } from "@/api/system/baseinfo";

export default {
  name: "Baseinfo",
  components: {
    // 移除了找不到的 PointSelect 组件注册，避免 Webpack 报错卡死
  },
  data() {
    return {
      // 页面加载遮罩层状态，提交时可开启防连击
      loading: false,
      // 表单核心绑定的数据对象，里面的字段和数据库表结构一一对应
      form: {},
      // 表单字段的非空与格式验证规则（由若依脚手架根据数据库 NOT NULL 约束自动提炼）
      rules: {
        baseShortName: [{ required: true, message: "基地简称不能为空", trigger: "blur" }],
        baseCode: [{ required: true, message: "基地编号不能为空", trigger: "blur" }],
        baseName: [{ required: true, message: "基地全称不能为空", trigger: "blur" }],
        baseLeader: [{ required: true, message: "基地负责人不能为空", trigger: "blur" }],
        leaderTel: [{ required: true, message: "基地负责人电话不能为空", trigger: "blur" }],
        baseAddress: [{ required: true, message: "基地负责人地址不能为空", trigger: "blur" }],
        baseArea: [{ required: true, message: "基地面积不能为空", trigger: "blur" }],
        baseAltitude: [{ required: true, message: "基地海拔不能为空", trigger: "blur" }],
        baseImg: [{ required: true, message: "现场图片不能为空", trigger: "blur" }],
        baseDes: [{ required: true, message: "基地描述不能为空", trigger: "blur" }],
        remark: [{ required: true, message: "备注不能为空", trigger: "blur" }],
        baseCoordinate: [{ required: true, message: "基地坐标不能为空", trigger: "blur" }]
      }
    };
  },
  // Vue 生命周期钩子：当组件实例在内存中创建完毕后，立刻去拉取数据库已有数据
  created() {
    this.handleInitData();
  },
  methods: {
    /** * 初始化：获取已有的一条基地数据
     * 因为单表配置页面不需要表格，我们直接去查新库，取第 1 条历史数据填充表单
     */
    handleInitData() {
      this.reset(); // 查询前先清空表单，防止残留
      this.loading = true;

      // 分页条件强制设定只拿第一条记录（pageNum:1, pageSize:1）
      listBaseinfo({ pageNum: 1, pageSize: 1 }).then(response => {
        if (response.rows && response.rows.length > 0) {
          // 如果数据库里已经存在过基地记录，把这条数据塞进 form 对象，页面输入框会自动回显
          this.form = response.rows[0];
        }
        this.loading = false;
      }).catch(() => {
        this.loading = false;
      });
    },

    /** * 表单重置与默认值赋空
     * 清理所有数据键值对，同时初始化新库要求的默认业务数据（如状态、排序）
     */
    reset() {
      this.form = {
        baseId: null,             // 主键 ID（如果为 null 说明当前是“新增”状态，有值说明是“修改”状态）
        baseShortName: null,
        baseCode: null,
        baseName: null,
        baseLeader: null,
        leaderTel: null,
        baseAddress: null,
        baseArea: null,
        baseAltitude: null,
        baseImg: null,
        baseDes: null,
        remark: null,
        status: "0",              // 默认状态设为 0（正常）
        orderNum: 0,              // 默认排序号设为 0
        baseCoordinate: ''        // 坐标初始化为空字符串
      };
      this.resetForm("form");     // 调用若依全局挂载的方法，清除前端 el-form 的红字校验历史
    },

    /** * 取消按钮：联动若依多标签页机制（TagsView）
     * 自动关闭当前的页签，并让浏览器路由后退一步
     */
    cancel() {
      this.$store.dispatch('tagsView/delView', this.$route);
      this.$router.go(-1);
    },

    /** * 确定按钮：提交数据
     * 融合了若依最核心的“表单拦截”与“智能状态切分逻辑”
     */
    submitForm() {
      // 1. 触发前端 Element 的全面规则校验
      this.$refs["form"].validate(valid => {
        if (valid) {
          // 2. 校验通过后，判断当前 form 对象里有没有 baseId
          if (this.form.baseId != null) {
            // 情况 A：含有主键 ID，说明当前数据在数据库里早就有了，走【修改/更新】接口
            updateBaseinfo(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.handleInitData(); // 保存完毕后，重新拉取最新数据，维持页面连贯
            });
          } else {
            // 情况 B：不含主键 ID，说明这是一个全新的基地，走【新增/插入】接口
            addBaseinfo(this.form).then(response => {
              this.$modal.msgSuccess("新增成功");
              this.handleInitData(); // 保存完毕后，重新刷新，让主键 ID 成功绑定到 form 中
            });
          }
        }
      });
    }
  }
};
</script>

<style lang="scss" scoped>
/* 容器样式：动态计算高度，减去顶部面包屑导航和外边距，防止页面出现双滚动条 */
.card-container {
  margin: 6px;
  min-height: calc(100vh - 84px - 12px);
}
/* 表单美化：控制单列表单的固定宽度，并在左侧留出视觉空白，看着更高级 */
.form {
  width: 600px;
  margin-left: 100px;
}
</style>
