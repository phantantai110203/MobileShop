<template>
    <div class="container-fuild">
        <div class="row text-white" style="background-color: #0c713d;padding: 1rem;">
            <div class="col-1 d-flex d-sm-none align-items-center justify-content-center">
                <span @click="showDrawer()"><font-awesome-icon :icon="['fas', 'align-justify']" /></span>
            </div>


            <div class="col-10 col-sm-9 d-flex align-items-center justify-content-center justify-content-sm-start">
                <img src="../assets/logo.jpg" alt="logo" height="32" width="34" class="ms-3 me-3">
                <span class="d-none d-sm-flex">TRANG QUẢN TRỊ</span>
            </div>
            <div class="col-sm-3 d-none d-sm-flex align-items-center justify-content-sm-end">
                <span>Xin chào:Kid Phan</span>
            </div>


            <div class="col-1 d-flex d-sm-none align-items-center justify-content-center">
                <span @click="showDrawerUser()"><font-awesome-icon :icon="['fas', 'user']" /></span>
            </div>



        </div>
    </div> 
    
    <a-drawer v-model:visible="visible" title="DANH MỤC" placement="left">
        <TheMenu />
    </a-drawer>

    <a-drawer v-model:visible="visible_user" title="ADMIN" placement="right">
        <p>Some contents...</p>
        <p>Some contents...</p>
        <p>Some contents...</p>
    </a-drawer> 
    <!-- <div class="top_nav">
        <div class="nav_menu">
            <nav>
                <div class="nav toggle">
                    <a id="menu_toggle"><i class="fa fa-bars"></i></a>
                </div>
                <ul class="nav navbar-nav navbar-right">
                    <li class="">
                        <a href="javascript:;" class="user-profile dropdown-toggle" data-toggle="dropdown"
                            aria-expanded="false">
                            <img src="img/img.jpg" alt="">John Doe
                            <span class=" fa fa-angle-down"></span>
                        </a>
                        <ul class="dropdown-menu dropdown-usermenu pull-right">
                            <li><a href="javascript:;"> Profile</a></li>
                            <li>
                                <a href="javascript:;">
                                    <span class="badge bg-red pull-right">50%</span>
                                    <span>Settings</span>
                                </a>
                            </li>
                            <li><a href="javascript:;">Help</a></li>
                            <li><a href="login.html"><i class="fa fa-sign-out pull-right"></i> Log Out</a></li>
                        </ul>
                    </li>
                    <li role="presentation" class="dropdown">
                        <a href="javascript:;" class="dropdown-toggle info-number" data-toggle="dropdown"
                            aria-expanded="false">
                            <i class="fa fa-envelope-o"></i>
                            <span class="badge bg-green">6</span>
                        </a>
                        <ul id="menu1" class="dropdown-menu list-unstyled msg_list" role="menu">
                            <li>
                                <a>
                                    <span class="image"><img src="/src/assets/logo.jpg" alt="Profile Image" /></span>
                                    <span>
                                        <span>John Smith</span>
                                        <span class="time">3 mins ago</span>
                                    </span>
                                    <span class="message">
                                        Film festivals used to be do-or-die moments for movie makers. They were where...
                                    </span>
                                </a>
                            </li>
                            <li>
                                <a>
                                    <span class="image"><img src="/src/assets/logo.jpg" alt="Profile Image" /></span>
                                    <span>
                                        <span>John Smith</span>
                                        <span class="time">3 mins ago</span>
                                    </span>
                                    <span class="message">
                                        Film festivals used to be do-or-die moments for movie makers. They were where...
                                    </span>
                                </a>
                            </li>
                            <li>
                                <a>
                                    <span class="image"><img src="/src/assets/logo.jpg" alt="Profile Image" /></span>
                                    <span>
                                        <span>John Smith</span>
                                        <span class="time">3 mins ago</span>
                                    </span>
                                    <span class="message">
                                        Film festivals used to be do-or-die moments for movie makers. They were where...
                                    </span>
                                </a>
                            </li>
                            <li>
                                <a>
                                    <span class="image"><img src="/src/assets/logo.jpg" alt="Profile Image" /></span>
                                    <span>
                                        <span>John Smith</span>
                                        <span class="time">3 mins ago</span>
                                    </span>
                                    <span class="message">
                                        Film festivals used to be do-or-die moments for movie makers. They were where...
                                    </span>
                                </a>
                            </li>
                            <li>
                                <div class="text-center">
                                    <a>
                                        <strong>See All Alerts</strong>
                                        <i class="fa fa-angle-right"></i>
                                    </a>
                                </div>
                            </li>
                        </ul>
                    </li>
                </ul>
            </nav>
        </div>
    </div> -->
    <!-- /top navigation -->
</template>
<script>
import TheMenu from './TheMenu.vue';
import { defineComponent, ref } from 'vue';
export default defineComponent({
    components: {
        TheMenu
    },
    setup() {
        const visible = ref(false);
        const visible_user = ref(false);
        
        const showDrawer = () => {
            visible.value = true;
        };
        const showDrawerUser = () => {
            visible_user.value = true;
        };
        return {
            visible,
            visible_user,
            showDrawer,
            showDrawerUser,
        };



    },
});

</script>