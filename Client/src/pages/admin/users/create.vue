<template>
    <a-card title="Tạo mới tài khoản" style="width: 100%;">
        <div class="row">
            <div class="col-12 col-sm-4">
                <div class="row">
                    <div class="col-12 d-flex justify-content-center mb-3">
                        <a-avatar shape="square" :size="200">
                            <template #icon>
                                <img src="/src/assets/logo.jpg" alt="">
                            </template>
                        </a-avatar>
                    </div>

                    <div class="col-12 d-flex justify-content-center">
                        <a-button type="primary">
                            <font-awesome-icon :icon="['fas', 'plus']" class="me-2" />
                            <span>
                                chọn ảnh
                            </span>
                        </a-button>
                    </div>
                </div>
            </div>
            <div class="col-12 col-sm-8">
                <div class="row mb-3">
                    <div class="col-12 col-sm-3 text-start text-sm-end">
                        <label>
                            <span class="text-danger me-1">*</span>
                            <span>Họ và tên</span>
                        </label>

                    </div>
                    <div class="col-12 col-sm-5">
                        <a-input placeholder="Họ và Tên" allow-clear />
                    </div>
                </div>


                <div class="row mb-3">
                    <div class="col-12 col-sm-3 text-start text-sm-end">
                        <label>
                            <span class="text-danger me-1">*</span>
                            <span>Email</span>
                        </label>

                    </div>
                    <div class="col-12 col-sm-5">
                        <a-input placeholder="Email" allow-clear />
                    </div>
                </div>


                <div class="row mb-3">
                    <div class="col-12 col-sm-3 text-start text-sm-end">
                        <label>
                            <span class="text-danger me-1">*</span>
                            <span>Địa chỉ</span>
                        </label>

                    </div>
                    <div class="col-12 col-sm-5">
                        <a-input placeholder="Địa chỉ" allow-clear />
                    </div>
                </div>
                <div class="row mb-3">
                    <div class="col-12 col-sm-3 text-start text-sm-end">
                        <label>
                            <span class="text-danger me-1">*</span>
                            <span>Số điện thoại</span>
                        </label>

                    </div>
                    <div class="col-12 col-sm-5">
                        <a-input placeholder="SDT" allow-clear />
                    </div>
                </div>

                <div class="row mb-3">
                    <div class="col-12 col-sm-3 text-start text-sm-end">
                        <label>
                            <span class="text-danger me-1">*</span>
                            <span>Mật khẩu</span>
                        </label>

                    </div>
                    <div class="col-12 col-sm-5">
                        <a-input-password placeholder="Mật khẩu" allow-clear />
                    </div>
                </div>
                <div class="row mb-3">
                    <div class="col-12 col-sm-3 text-start text-sm-end">
                        <label>
                            <span class="text-danger me-1">*</span>
                            <span>Xác nhận mật khẩu</span>
                        </label>

                    </div>
                    <div class="col-12 col-sm-5">
                        <a-input-password placeholder="Xác nhận mật khẩu" allow-clear />
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-12 d-grid d-sm-flex justify-content-sm-end mx-auto">
                <a-button class="me-0 me-sm-2 mb-3 mb-sm-0">
                    <router-link :to="{ name: 'admin-users' }">
                        <span>Hủy</span>
                    </router-link>
                </a-button>
                <a-button type="primary">
                    <span>Lưu</span>
                </a-button>
            </div>
        </div>

    </a-card>


</template>
<script>
import { defineComponent } from 'vue';
import { useMenu } from '@/stores/use-menu';
export default defineComponent({
    setup() {
        useMenu().onSelectedKeys(["admin-users"]);

    },
})
</script>