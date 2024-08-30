<template>
    <section class="vh-100">
        <div class="container-fluid h-custom">
            <div class="row d-flex justify-content-center align-items-center h-100">
                <div class="col-md-9 col-lg-6 col-xl-5">
                    <img src="/public/img/logo1.png" class="img-fluid" alt="Sample image">
                </div>
                <div class="col-md-8 col-lg-6 col-xl-4 offset-xl-1">
                    <form>
                        <div class="d-flex flex-row align-items-center justify-content-center justify-content-lg-start">
                            <p class="lead fw-normal mb-0 me-3">Đăng ký</p>
                            
                        </div>

                        <div class="divider d-flex align-items-center my-4">
                            <p class="text-center fw-bold mx-3 mb-0"></p>
                        </div>

                        <div data-mdb-input-init class="form-outline mb-4">
                            <input type="name" id="form3Example3" class="form-control form-control-lg"
                                placeholder="Nhập tên" />
                            <label class="form-label" for="form3Example3">Tên</label>
                        </div>

                        <!-- Email input -->
                        <div data-mdb-input-init class="form-outline mb-4">
                            <input type="email" id="form3Example3" class="form-control form-control-lg"
                                placeholder="Nhập địa chỉ email hợp lệ" />
                            <label class="form-label" for="form3Example3">Địa chỉ Email</label>
                        </div>

                        <!-- Password input -->
                        <div data-mdb-input-init class="form-outline mb-3">
                            <input type="password" id="form3Example4" class="form-control form-control-lg"
                                placeholder="Nhập mật khẩu" />
                            <label class="form-label" for="form3Example4">Mật khẩu</label>
                        </div>

                        <div data-mdb-input-init class="form-outline mb-3">
                            <input type="Rpeatpassword" id="form3Example4" class="form-control form-control-lg"
                                placeholder="Nhập lại mật khẩu" />
                            <label class="form-label" for="form3Example4">Nhập lại mật khẩu</label>
                        </div>


                        <!-- Checkbox -->
                        <div class="form-check d-flex justify-content-center mb-4">
                            <input class="form-check-input me-2" type="checkbox" value="" id="registerCheck"
                                aria-describedby="registerCheckHelpText" />
                            <label class="form-check-label" for="registerCheck">
                                Tôi đã đọc và đồng ý với các điều khoản
                            </label>
                        </div>


                        <button type="submit" data-mdb-button-init data-mdb-ripple-init class="btn btn-primary btn-lg"
                            style="padding-left: 2.5rem; padding-right: 2.5rem;">Đăng
                            ký</button>


                    </form>
                </div>
            </div>
        </div>

        <!-- Right -->

    </section>
</template>
<style scoped>
.divider:after,
.divider:before {
    content: "";
    flex: 1;
    height: 1px;
    background: #eee;
}

.h-custom {
    height: calc(100% - 73px);
}

@media (max-width: 450px) {
    .h-custom {
        height: 100%;
    }
}
</style>