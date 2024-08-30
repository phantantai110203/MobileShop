<template>
    <nav class="navbar-custom navbar navbar-expand-lg bg-body-tertiary sticky-top">
        <div class="container-fluid">
            <router-link :to="{ name: 'user-home' }">
                <a class="navbar-brand" href="#">

                    <img src="/public/img/logo1.png" alt="Logo" width="150" height="50"
                        class="d-inline-block align-text-top">

                </a>
            </router-link>

            <a class="navbar-brand" href="#">MobileShop</a>

            <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
                aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item dropdown">
                        <a class="nav-link " href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            <font-awesome-icon :icon="['fas', 'bars']" class="me-1" /> Danh mục
                        </a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="#"><font-awesome-icon
                                        :icon="['fas', 'mobile-screen-button']" class="me-2" />Điện thoại</a></li>
                            <li><a class="dropdown-item" href="#"><font-awesome-icon :icon="['fas', 'laptop']"
                                        class="me-1" />Laptop</a></li>
                            <li><a class="dropdown-item" href="#"><font-awesome-icon
                                        :icon="['fas', 'headphones-simple']" class="me-1" />Phụ kiện</a></li>
                            <li>
                                <hr class="dropdown-divider">
                            </li>
                            <li><a class="dropdown-item" href="#">Something else here</a></li>
                        </ul>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Link</a>
                    </li>
                </ul>
                <form @submit.prevent="searchProducts" class="d-flex" role="search">
                    <input v-model="searchQuery" class="form-control me-2 custom-search-bar" type="search"
                        placeholder="Nhập tên điện thoại cần tìm..." aria-label="Search">
                    <button class="btn btn-outline-success" type="submit"><font-awesome-icon
                            :icon="['fas', 'magnifying-glass']" /></button>
                </form>

                <router-link :to="{ name: 'user-cart' }">
                    <a href="#" class="btn btn-danger rounded-pill ms-4 text-dark"><font-awesome-icon
                            :icon="['fas', 'cart-shopping']" class="me-1" />Giỏ hàng</a>
                </router-link>
                <router-link :to="{ name: 'login' }">
                    <a class="btn btn-outline-secondary rounded-pill ms-4 text-dark" href="#"><font-awesome-icon
                            :icon="['fas', 'user']" /></a>
                </router-link>
            </div>
        </div>
    </nav>
</template>
<script>
export default {
    data() {
        return {
            searchQuery: ''
        };
    },
    methods: {
        searchProducts() {
            this.$router.push({ name: 'user-home', query: { search: this.searchQuery } });
        }
    }
}
</script>


<style scoped>
/* Đảm bảo nội dung không bị che khuất bởi navbar */
body {

    padding-top: 70px;
    /* Chiều cao của navbar, điều chỉnh nếu cần */
}

.custom-search-bar {
    width: 400px;
    /* Điều chỉnh chiều rộng tùy ý */
}
</style>
