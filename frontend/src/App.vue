<template lang="pug">
  #app
    globalheader
    router-view
    globalfooter
</template>

<script>
  import globalheader from './components/globals/header.vue'
  import globalfooter from './components/globals/footer.vue'

  export default {
    name: 'app',
    components: {
      globalheader,
      globalfooter,
    }
  };
</script>

<style lang="scss">
  @import "~bootstrap/scss/bootstrap";
  @import "~bootstrap-vue/src/index.scss";
  @import "scss/main.scss";
</style>
