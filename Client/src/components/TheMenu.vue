<template>
    <!-- <div class="col-md-3 left_col">
        <div class="left_col scroll-view">
            <div class="navbar nav_title" style="border: 0;">
                <a href="index.html" class="site_title"><i class="fa fa-paw"></i> <span>Gentelella Alela!</span></a>
            </div>
            <div class="clearfix"></div>
            <!-- menu profile quick info 
    <div class="profile clearfix">
        <div class="profile_pic">
            <img src="/src/assets/logo.jpg" alt="..." class="img-circle profile_img">
        </div>
        <div class="profile_info">
            <span>Welcome,</span>
            <h2>John Doe</h2>
        </div>
    </div>

    <br />

    <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
        <div class="menu_section">
            <h3>General</h3>
            <ul class="nav side-menu">
                <li><a><i class="fa fa-home"></i> Home</a></li>
                <li><a><i class="fa fa-user"></i> User</a></li>
                <li><a><i class="fa fa fa-building-o"></i> Category</a></li>
                <li><a><i class="fa fa-newspaper-o"></i> Article</a></li>
                <li><a><i class="fa fa-sliders"></i> Silders</a></li>
            </ul>
        </div>
    </div>-->
    <a-menu v-model:openKeys="openKeys" v-model:selectedKeys="selectedKeys" mode="inline">
        <a-menu-item key="admin-users">
            <router-link :to="{ name: 'admin-users' }">
                <span>
                    <UserOutlined class="me-1" /> Tài khoản
                </span>
            </router-link>
        </a-menu-item>

        <a-menu-item key="admin-roles">
            <router-link :to="{ name: 'admin-roles' }">
                <span>
                    <TagOutlined class="me-1" /> Vai trò
                </span>
            </router-link>
        </a-menu-item>

        <a-menu-item key="admin-settings">
            <router-link :to="{ name: 'admin-settings' }">
                <span>
                    <SettingOutlined class="me-1" /> Cài đặt
                </span>
            </router-link>

        </a-menu-item>
    </a-menu>

</template>

<script>
import { UserOutlined, TagOutlined, SettingOutlined } from "@ant-design/icons-vue";
import { defineComponent } from "vue";
import { storeToRefs } from "pinia";
import { useMenu } from "../stores/use-menu.js";
export default defineComponent({
    components: {
        UserOutlined,
        TagOutlined,
        SettingOutlined
    },
    setup() {
        const store = useMenu();

        return {
            ...storeToRefs(store),
        };
    },
});
</script>