<template>
    <div style="margin-top: -30px;">
        <a-switch :checked="theme === 'dark'" checked-children="Dark" un-checked-children="Light"
            @change="changeTheme" />
        <br />
        <br />
        <a-menu v-model:openKeys="openKeys" v-model:selectedKeys="selectedKeys" style="width: 256px" mode="inline"
            :theme="theme">
            <template #default>
                <a-menu-item v-for="item in items" :key="item.key">
                    <router-link :to="item.path">{{ item.label }}</router-link>
                </a-menu-item>
            </template>
        </a-menu>
    </div>
</template>

<script setup>
import { ref } from 'vue';

// Biến phản ứng
const theme = ref('light'); // Khởi tạo với chủ đề mặc định
const openKeys = ref([]);
const selectedKeys = ref([]);

// Mục menu với đường dẫn
const items = ref([
    {
        key: '1',
        label: 'Tài Khoản',
        path: 'users', // Đặt đường dẫn tới route
    },
    {
        key: '2',
        label: 'Vai Trò',
        path: 'roles', // Đặt đường dẫn tới route
    },
]);

// Hàm xử lý thay đổi chủ đề
const changeTheme = (checked) => {
    theme.value = checked ? 'dark' : 'light';
};
</script>

<style scoped>
/* Thêm các kiểu CSS scoped ở đây */
</style>
