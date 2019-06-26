import Vue from 'vue';
import Router from 'vue-router';
import BlogFeed from '../components/BlogFeed';
import BlogPost from '../components/BlogPost';

Vue.use(Router);

export default new Router({
  mode: 'history',
  linkActiveClass: 'active',
  routes: [
    {
      path: '/',
      name: 'feed',
      component: BlogFeed
    },
    {
      path: '/post/:post',
      name: 'post',
      props: true,
      component: BlogPost
    }
  ]
});
