<template lang="pug">
  section
    .container
      .row
        .col-lg-8.col-md-10.mx-auto
          h2.post-title {{ article.title }}
          p.post-context {{ article.context }}
          p.post-meta {{ article.tag }} {{ article.created_at | moment }}
</template>

<script>
import Axios from 'axios';
import Moment from 'moment';

const api = '//192.168.100.23:3000/api/v1/articles/';

export default {
  data() {
    return {
      article: '',
    };
  },
  created() {
    Axios.get(api + `${this.$route.params.post}`)
      .then(res => this.article = res.data)
  },
  filters: {
    moment: function(date) {
      return Moment(date).fromNow();
    }
  }
};
</script>

<style lang="scss" scoped>
 .post-title {
  margin: 20px;
}
</style>
