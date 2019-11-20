<template>
  <section>
    <div class="container">
      <h2 class="post-title">{{ article.title }}</h2>
      <p class="post-context">{{ article.context }}</p>
      <p class="post-meta">{{ article.tag }} {{ article.created_at | moment }}</p>
    </div>
  </section>
</template>

<script>
import Axios from "axios";
import Moment from "moment";

const api = "//192.168.100.23:3000/api/v1/articles/";

export default {
  data() {
    return {
      article: ""
    };
  },
  created() {
    Axios.get(api + `${this.$route.params.id}`).then(
      res => (this.article = res.data)
    );
  },
  filters: {
    moment: function(date) {
      return Moment(date).fromNow();
    }
  }
};
</script>
