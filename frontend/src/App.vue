<template lang="pug">
main.blog
  blog-nav
  router-view#app
</template>

<script>
import BlogNav from './components/BlogNav'
import BlogFeed from './components/BlogFeed'

export default {
  name: 'app',
  components: { BlogNav, BlogFeed, },
  resource: 'Blog',
}
</script>

<style lang="scss">
@import "~bootstrap/scss/bootstrap";
@import "~bootstrap-vue/src/index.scss";
@import "scss/main.scss";
</style>
