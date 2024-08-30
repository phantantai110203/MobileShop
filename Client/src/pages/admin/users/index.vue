<template>
    <a-card title="Tài Khoản" style="width: 100%">
        <div class="row mb-3">
            <div class="col-12 d-flex justify-content-end">
                <a-button type="primary">
                    <router-link :to="{ name: 'admin-users-create' }">
                        <font-awesome-icon :icon="['fas', 'plus']" />
                    </router-link>
                </a-button>
            </div>
        </div>
        <div class="row">
            <div class="col-12">
                <a-table :dataSource="users" :columns="columns" :scroll="{ x: 576 }">
                    <template #bodyCell="{ column, index, record }">
                        <template v-if="column.key === 'index'">
                            <span>{{ index + 1 }}</span>
                        </template>

                        <template v-if="column.key === 'role'">
                            <span v-if="record.role == 1" class="text-primary">Admin</span>
                            <span v-else-if="record.role == 0" class="text-danger">Khách Hàng</span>
                        </template>
                    </template>
                </a-table>
            </div>
        </div>
    </a-card>
</template>

<script>
import { defineComponent, ref } from 'vue';
import { useMenu } from '@/stores/use-menu';
export default defineComponent({
    setup() {
        useMenu().onSelectedKeys(["admin-users"]);

        const users = ref([]);
        const columns = [
            {
                title: '#',
                key: 'index',
            },
            {
                title: 'Tên Người Dùng',
                dataIndex: 'name',
                key: 'name',
            },
            {
                title: 'Email',
                dataIndex: 'email',
                key: 'email',


            },
            {
                title: 'Địa chỉ',
                dataIndex: 'address',
                key: 'address',
            },
            {
                title: 'SDT',
                dataIndex: 'phone',
                key: 'phone',
            },
            {
                title: 'Vai trò',
                dataIndex: 'role',
                key: 'role',
                // customRender: ({ text }) => text === 1 ? 'Admin' : 'Khách hàng',
            },
            {
                title: 'Chức năng',
                key: 'action',
                fixed: 'right',
            },
        ]



        const getusers = () => {
            // Tạo một request để truy xuất người dùng ứng với ID cho sẵn:
            axios
                .get('http://localhost:8000/api/users')
                .then((response) => {
                    // xử trí khi thành công
                    users.value = response.data;
                    // console.log(response);
                })
                .catch((error) => {
                    // xử trí khi bị lỗi
                    console.log(error);
                });

        };
        getusers();

        return {
            users,
            columns

        };
    },
});

</script>