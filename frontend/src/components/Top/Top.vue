<template>
  <div class="top">
    <h1>{{ message }}</h1>
  </div>
</template>

<script>
export default {
  name: 'Top',
  data () {
    return {
      message: "Hello Vue! @home.vue"
    }
  },
}
</script>

<style scoped>
</style>
