<template lang="pug">
  section
    header.masthead(style="background-color: skyblue")
      .overlay
      .container
        .row
          .col-lg-8.col-md-10.mx-auto
            .site-heading
              h1 Kazu Blog
              span.subheading A Blog Theme by Start Bootstrap
    .container
      .row
        .col-lg-8.col-md-10.mx-auto
          ul.list-body(v-for="(article, index) in articles" v-bind:key="article.id")
            .post-preview
              router-link(to="Post")
                h2.post-title {{ article.title }}
              p {{ article.context }}
              p.post-meta
                | Posted by
                router-link(to="#") {{ article.name }}
                |             on {{ article.updated_at }}
            hr
          // Pager
          .clearfix
            a.btn.btn-primary.float-right(href="#") Older Posts →
</template>

<script>
import Axios from 'axios'

export default {
  name: 'Articles',
  data () {
    return { articles: [] }
  },
  created () {
    Axios.get('http://localhost:3000/api/v1/articles?page=1')
    .then((response) => {
      this.articles = response.data
    })
  }
}
</script>
