import Vue from 'vue';
import Router from 'vue-router';
import BlogFeed from '../components/BlogFeed';
import BlogPost from '../components/BlogPost';
import NotFound from '../components/NotFound';

Vue.use(Router);

export default new Router({
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
      component: BlogPost
    },
    {
      path: '*',
      component: NotFound
    }
  ]
});
