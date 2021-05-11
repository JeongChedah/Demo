import { createApp } from 'vue'
import App from './App.vue'
import router from './router'
import './assets/tailwind.css'
import BaseBlock from './components/BaseBlock.vue'
import 'bootstrap/dist/css/bootstrap.css'
import 'bootstrap-vue/dist/bootstrap-vue.css'
import 'bootstrap/dist/js/bootstrap'

const app = createApp(App)
app.component('base-block', BaseBlock)
app.use(router).mount('#app')
