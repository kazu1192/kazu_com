import Vue from 'vue';
import App from './App';
import router from './router';
import vuetify from './plugins/vuetify';

new Vue({
  router,
  render: h => h(App),
}).$mount('#app');
