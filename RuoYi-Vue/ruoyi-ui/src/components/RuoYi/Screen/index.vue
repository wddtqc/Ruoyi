<template>
  <div>
    <svg-icon icon-class="chart" @click="goto" />
  </div>
</template>

<script>
export default {
  name: 'AgricultureScreen',
  methods: {
    goto() {
      this.$router.push('/screen')
    }
  }
}
</script>
