<template>
  <v-app dark>
    <div id="main">
      <blog-nav></blog-nav>
      <router-view id="app"></router-view>
      <blog-footer></blog-footer>
    </div>
  </v-app>
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
