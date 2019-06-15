<template lang="pug">
  #top
    h1 {{ message }}
</template>

<script>
export default {
  data () {
    return {
      message: "Hello Vue! I am Top.vue"
    }
  },
}
</script>

<style lang="scss" scoped>
#top {
  background-color: skyblue;
}
</style>
