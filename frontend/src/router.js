import Vue from 'vue';
import Router from 'vue-router';
import Home from './components/home/Home.vue';
import About from './components/About.vue';
import Post from './components/Post.vue';
import Contact from './components/Contact.vue';

Vue.use(Router);

export default new Router({
  mode: 'history',
  routes: [
    {
      path: '/',
      name: 'Home',
      component: Home
    },
    {
      path: '/About',
      name: 'About',
      component: About
    },
    {
      path: '/Post',
      name: 'Post',
      component: Post
    },
    {
      path: '/Contact',
      name: 'Contact',
      component: Contact
    }
  ]
});
