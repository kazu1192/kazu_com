import Vue from 'vue';
import BoostrapVue from 'bootstrap-vue';
import App from './App.vue';
import router from './router.js';

Vue.use(BoostrapVue);

new Vue({
  el: '#app',
  render: h => h(App),
  router,
});
