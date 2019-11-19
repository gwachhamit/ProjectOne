import Vue from 'vue'
import App from './App.vue'

import router from './router';
import store from './store';
import './plugins'

import 'admin-lte/plugins/fontawesome-free/css/fontawesome.min.css';
import 'admin-lte/dist/css/adminlte.min.css';

Vue.config.productionTip = false

new Vue({
  router,
  store,
  render: h => h(App),
}).$mount('#app')
