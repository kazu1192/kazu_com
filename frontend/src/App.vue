<template lang="pug">
main.blog
  blog-nav
  router-view#app
  blog-footer
</template>

<script>
import BlogNav from './components/BlogNav'
import BlogFeed from './components/BlogFeed'
import BlogFooter from './components/BlogFooter'

export default {
  name: 'app',
  components: { BlogNav, BlogFeed, BlogFooter },
  resource: 'Blog',
}
</script>

<style lang="scss">
@import "~bootstrap/scss/bootstrap";
@import "~bootstrap-vue/src/index.scss";
@import "scss/main.scss";
</style>
