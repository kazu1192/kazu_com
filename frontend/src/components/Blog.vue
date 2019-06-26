<template lang="pug">
  main.blog
    blog-nav
    blog-feed
</template>

<script>
import BlogNav from './BlogNav'
import BlogFeed from './BlogFeed'

export default {
  name: 'blog',
  components: { BlogNav, BlogFeed, },
  resource: 'Blog',
}
</script>


