<template>
  <section>
    <div class="container">
      <div class="row">
        <div class="ul list-body">
          <v-for="(article, index) in articles"><v-bind:key="article.id"/>
          <div class="post-preview">
            <router-link :to="{ name: 'post', params: {[ post: article.id }}">
              <h2 class="post-title">{{ article.title }}</h2>
            </router-link>
            <p class="post-meta">{{ article.tag }} {{ article.created_at | moment }}</p>
          </div>
          <hr />
        </div>
      </div>
    </div>
    <infinite-loading @infinite="infiniteHandler"></infinite-loading>
  </section>
</template>

<script>
import Axios from "axios";
import Moment from "moment";
import InfiniteLoading from "vue-infinite-loading";

const api = "//192.168.100.23:3000/api/v1/articles";

export default {
  data() {
    return {
      page: 1,
      articles: []
    };
  },
  components: {
    InfiniteLoading
  },
  methods: {
    infiniteHandler($state) {
      Axios.get(api, {
        params: {
          page: this.page
        }
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
