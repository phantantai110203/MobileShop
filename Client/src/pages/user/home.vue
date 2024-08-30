<template>
    <div id="carouselExampleIndicators" class="carousel slide">
        <div class="carousel-indicators">
            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active"
                aria-current="true" aria-label="Slide 1"></button>
            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1"
                aria-label="Slide 2"></button>
            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2"
                aria-label="Slide 3"></button>
        </div>
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="/public/SlideShow/slider02.png" class="d-block w-100" alt="...">
            </div>
            <div class="carousel-item">
                <img src="/public/SlideShow/slider03.png" class="d-block w-100" alt="...">
            </div>
            <div class="carousel-item">
                <img src="/public/SlideShow/slider04.png" class="d-block w-100" alt="...">
            </div>
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators"
            data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators"
            data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
        </button>
    </div>

    <div class="container mb-5">
        <div v-if="!isSearching">

            <div class="row">

                <div v-for="phone in phonemod" :key="phone.id" class="col-md-2">
                    <div class="card mb-4">
                        <router-link :to="{ name: 'user-detail' }" class="no-underline">
                            <div class="item-label">
                                <span class="lb-tragop">Trả góp 0%</span>
                            </div>
                            <img :src="getFullImageUrl(phone.image)" class="card-img-top" :alt="phone.name">
                            <div class="card-body">
                                <h5 class="card-title">{{ phone.name }}</h5>
                                <p class="card-text price">{{ phone.price }}₫</p>
                                <!-- <a href="#" class="btn btn-primary">Xem chi tiết</a> -->
                            </div>
                        </router-link>
                    </div>
                </div>

            </div>

        </div>
        <!-- Hiển thị kết quả tìm kiếm -->
        <div v-else>
            <div class="row">
                <h6>Sản phẩm tìm kiếm được <b>{{ searchResultsCount }}</b></h6>
                <div v-for="result in searchResults" :key="result.id" class="col-md-2">
                    <div class="card mb-4">

                        <img :src="getFullImageUrl(result.image)" class="card-img-top" :alt="result.name">
                        <div class="card-body">
                            <h5 class="card-title">{{ result.name }}</h5>
                            <p class="card-text price">{{ result.price }}₫</p>
                            <a href="#" class="btn btn-primary">Xem chi tiết</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
</template>
<script>
import axios from 'axios';

export default {
    data() {
        return {
            phonemod: [],       // Danh sách sản phẩm mặc định
            searchResults: [],  // Kết quả tìm kiếm
            isSearching: false,  // Cờ để kiểm tra nếu đang tìm kiếm
            searchResultsCount: 0 // Số lượng sản phẩm tìm được
        };
    },
    computed: {
        baseImageUrl() {
            return 'http://localhost:8000';
        }
    },
    methods: {
        getFullImageUrl(imagePath) {
            return `${this.baseImageUrl}${imagePath}`;
        },
        fetchProducts() {
            axios.get('http://localhost:8000/api/phonemod')
                .then(response => {
                    this.phonemod = response.data;
                })
                .catch(error => {
                    console.log(error);
                });
        },
        searchProducts(query) {
            if (query) {
                axios.get(`http://localhost:8000/api/search`, { params: { query } })
                    .then(response => {
                        this.searchResults = response.data;
                        this.searchResultsCount = this.searchResults.length; // Cập nhật số lượng sản phẩm tìm được
                        this.isSearching = true;
                    })
                    .catch(error => {
                        console.log(error);
                    });
            } else {
                this.isSearching = false;
            }
        }
    },
    mounted() {
        this.fetchProducts();
        if (this.$route.query.search) {
            this.searchProducts(this.$route.query.search);
        }
    },
    watch: {
        '$route.query.search': function (newQuery) {
            this.searchProducts(newQuery);
        }
    }
}
</script>

<style scoped>
.carousel-inner {
    height: 500px;
    /* Đặt chiều cao cụ thể cho carousel */
}

.carousel-item img {
    width: 100%;
    height: 100%;
    object-fit: cover;
    /* Đảm bảo ảnh bao phủ toàn bộ vùng chứa */
}



.card {
    display: flex;
    flex-direction: column;
    height: 100%;
    overflow: hidden;
    transition: transform 0.3s ease, box-shadow 0.3s ease;
    /* Thêm hiệu ứng chuyển tiếp cho biến đổi và bóng */
}

.card:hover {
    transform: scale(1.05);
    /* Phóng to card khi hover */
    box-shadow: 0 8px 16px rgba(0, 0, 0, 0.3);
    /* Thêm bóng mạnh hơn khi hover */
}

.card-body {

    display: flex;
    flex-direction: column;
    justify-content: space-between;
    /* Đảm bảo các phần tử phân bố đều trong card */
    flex: 1 0 auto;
}

.card-img-top {
    padding: 7px;
    width: 100%;
    height: 200px;
    /* Điều chỉnh chiều cao tùy theo nhu cầu */
    object-fit: cover;
    /* Đảm bảo ảnh bao phủ toàn bộ vùng chứa mà không bị mất góc */
}

.card-title {
    margin-bottom: auto;
    color: black;
    /* Đẩy phần tử "Buy Now" xuống dưới cùng */
}

.price {
    color: #d0021c;
    font-size: 18px;
    font-weight: bold;
    line-height: 18px;
}

.no-underline {
    text-decoration: none;
    /* Loại bỏ gạch chân mặc định */
    display: flex;
    /* Sử dụng flexbox để chiếm toàn bộ chiều cao của card */
    flex-direction: column;
    /* Để các phần tử trong card được phân bố theo chiều dọc */
    height: 100%;
}





.item-label {
    height: 23px;
    font-size: 0;
    
}

.item-label span {
    border-radius: 2px;
    font-size: 11px;
    line-height: 12px;
    display: inline-block;
    margin-right: 4px;
    padding: 3px;
}
.lb-tragop {
    background-color: #f1f1f1;
    color: #333;
}
</style>
