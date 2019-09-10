<template lang="pug">
  section
    .container
      .row
        .col-lg-8.col-md-10.mx-auto
          ul.list-body(v-for="(article, index) in articles" v-bind:key="article.id")
            .post-preview
              router-link(:to="{ name: 'post', params: { post: article.id }}")
                h2.post-title {{ article.title }}
              p.post-meta {{ article.tag }} {{ article.created_at | moment }}
            hr
    infinite-loading(@infinite="infiniteHandler")
</template>

<script>
import Axios from 'axios';
import Moment from 'moment';
import InfiniteLoading from 'vue-infinite-loading';

const api = '//192.168.100.23:3000/api/v1/articles';

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
  },
  filters: {
    moment: function(date) {
      return Moment(date).fromNow();
    }
  }
};
</script>
