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
              p.post-meta Posted by
                router-link(to="#") {{ article.name }} on {{ article.updated_at }}
            hr
    infinite-loading(@infinite="infiniteHandler")
</template>

<script>
import Axios from 'axios';
import InfiniteLoading from 'vue-infinite-loading';

const api = '//localhost:3000/api/v1/articles';

export default {
  data() {
    return {
      page: 1,
      articles: [],
    };
  },
  components: {
    InfiniteLoading,
  },
  methods: {
    infiniteHandler($state) {
      Axios.get(api, {
        params: {
          page: this.page,
        },
      }).then(({ data }) => {
        if (data.length) {
          this.page += 1;
          this.articles.push(...data);
          $state.loaded();
        } else {
          $state.complete();
        }
      });
    }
  }
};
</script>
