<template lang="pug">
  #app
    h1 {{ header }}
    h2 This is a App.vue
    router-view
    h1 {{ footer }}
</template>

<script>
export default {
  data () {
    return {
      header: "* Header *",
      footer: "* Footer *"
    }
  }
}
</script>

<style scoped>
</style>
