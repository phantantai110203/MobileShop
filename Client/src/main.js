import { createPinia } from 'pinia';
import { createApp } from 'vue'
import router from './router/index'
import axios from 'axios';
window.axios = axios;
import {
    Input,
    InputPassword,
    Table,
    Card,
    Menu,
    List,
    Drawer,
    Button,
    Avatar,
    Select,
    message
} from 'ant-design-vue';
import App from './App.vue'

import { library } from '@fortawesome/fontawesome-svg-core'
import { FontAwesomeIcon } from '@fortawesome/vue-fontawesome'
import { fas } from '@fortawesome/free-solid-svg-icons'
import { fab } from '@fortawesome/free-brands-svg-icons'
import { far } from '@fortawesome/free-regular-svg-icons'
library.add(fas, fab, far)

import 'ant-design-vue/dist/reset.css';
import 'bootstrap/dist/css/bootstrap-grid.min.css'
import 'bootstrap/dist/css/bootstrap-utilities.min.css'
import 'bootstrap/dist/css/bootstrap.min.css'
//import 'bootstrap/dist/js/popper.min.js'
import 'bootstrap/dist/js/bootstrap.bundle.min';

const app = createApp(App);
app.component('font-awesome-icon', FontAwesomeIcon)
app.use(createPinia());
app.use(router);
app.use(Button);
app.use(Avatar);
app.use(Table);
app.use(Input);
app.use(InputPassword);
app.use(Select);
app.use(Card);
app.use(Menu);
app.use(List);
app.use(Drawer);
app.mount('#app');
app.config.globalProperties.$message = message;
