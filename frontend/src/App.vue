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
@import "scss/main.scss"
</style>
