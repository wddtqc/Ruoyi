<template>
  <div ref="gantt" class="gantt-container"></div>
</template>

<script>
// 2. 🛠️ 关键修改：强行用物理路径指向没有高级语法的传统纯 JS 文件
import 'dhtmlx-gantt'

export default {
  name: 'gantt',
  props: {
    tasks: {
      type: Object,
      default () {
        return {data: [], links: []}
      }
    }
  },

  mounted(){
    this.init();
  },
  created(){
    gantt.config.drag_progress = false;
    gantt.config.drag_move = false;
    gantt.config.drag_links = false;
    this.setScaleConfig("day");
  },
  watch:{
    tasks:{
      handler:function(n,o){
        this.init();
      },
      deep:true
    }
  },
  methods:{
    init(){
      gantt.i18n.setLocale("cn");
      gantt.clearAll()
      gantt.init(this.$refs.gantt)
      gantt.parse(this.tasks)
    },
    setScaleConfig(level) {
      switch (level) {
        case "day":
          gantt.config.scales = [{ unit: "day", step: 1, format: "%M%d日" }];
          gantt.config.scale_height = 27;
          break;
        case "week":
          var weekScaleTemplate = function (date) {
            var dateToStr = gantt.date.date_to_str("%d %M");
            var endDate = gantt.date.add(
              gantt.date.add(date, 1, "week"),
              -1,
              "day"
            );
            return dateToStr(date) + " - " + dateToStr(endDate);
          };
          gantt.config.scales = [
            { unit: "week", step: 1, format: weekScaleTemplate },
          ];
          gantt.config.scale_height = 27;
          break;
        case "month":
          gantt.config.scales = [{ unit: "month", step: 1, format: "%F, %Y" }];
          gantt.config.scale_height = 27;
          break;
        case "year":
          gantt.config.scales = [{ unit: "year", step: 1, format: "%Y" }];
          gantt.config.scale_height = 27;
          break;
      }
    },
  }
}
</script>

<style scoped>
/* 3. 保留你刚才测试成功的 CSS 路径 */
@import "~dhtmlx-gantt/codebase/dhtmlxgantt.css";

/* 4. 加上这个样式，不然甘特图即使编译成功了，页面上也会因为高度为0显示为空白 */
.gantt-container {
  width: 100%;
  height: 100%;
  min-height: 500px;
}
</style>
