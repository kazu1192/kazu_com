import Vue from 'vue';
import BoostrapVue from 'bootstrap-vue';
import App from './App.vue';
import router from './router.js';
import axios from 'axios';

Vue.prototype.$axios = axios;

Vue.use(BoostrapVue);

new Vue({
  el: '#app',
  render: h => h(App),
  router,
});
