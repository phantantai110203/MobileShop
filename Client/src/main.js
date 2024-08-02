import { createPinia } from 'pinia';
import { createApp } from 'vue'
import router from './router/index'
import axios from 'axios';
window.axios = axios;
import {
    Table,
    Card,
    Menu,
    List,
    Drawer,
    Button,
    message
} from 'ant-design-vue';
import App from './App.vue'

import 'ant-design-vue/dist/reset.css';
import 'bootstrap/dist/css/bootstrap-grid.min.css'
import 'bootstrap/dist/css/bootstrap-utilities.min.css'

const app = createApp(App);
app.use(createPinia());
app.use(router);
app.use(Button);
app.use(Table);
app.use(Card);
app.use(Menu);
app.use(List);
app.use(Drawer);
app.mount('#app');
app.config.globalProperties.$message = message;
