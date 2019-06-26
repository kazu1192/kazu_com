import Vue from 'vue';
import BoostrapVue from 'bootstrap-vue';
import App from './App';
import router from './router';

Vue.use(BoostrapVue);

new Vue({
  router,
  render: h => h(App),
}).$mount('#app');
