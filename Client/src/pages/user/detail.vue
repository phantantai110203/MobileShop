<template>
    <div class="container mt-5 mb-3">
        <div v-if="product">
            <div class="row">

                <!-- Hình ảnh sản phẩm -->
                <div class="col-md-6">
                    <img :src="getFullImageUrl(product.image)" class="img-fluid" alt="Product Image">
                </div>

                <!-- Thông tin chi tiết sản phẩm -->
                <div class="col-md-6">
                    <h1 class="product-title">{{ product.name }}</h1>

                    <div class="product-info">
                        <h3 class="section-title">Thông số kỹ thuật</h3>

                        <table class="table table-bordered">
                            <tbody>
                                <tr>
                                    <td class="key">Giá:</td>
                                    <td class="value">{{ product.price }}₫</td>
                                </tr>
                                <tr>
                                    <td class="key">Kích thước màn hình:</td>
                                    <td class="value">{{ product.screen }}</td>
                                </tr>
                                <tr>
                                    <td class="key">Hệ điều hành:</td>
                                    <td class="value">{{ product.operatingSystem }}</td>
                                </tr>
                                <tr>
                                    <td class="key">Chip:</td>
                                    <td class="value">{{ product.chip }}</td>
                                </tr>
                                <tr>
                                    <td class="key">Camera trước:</td>
                                    <td class="value">{{ product.frontCamera }}</td>
                                </tr>
                                <tr>
                                    <td class="key">Camera sau:</td>
                                    <td class="value">{{ product.rearCamera }}</td>
                                </tr>
                                <!-- Thêm các thông số kỹ thuật khác nếu có -->
                            </tbody>
                        </table>
                    </div>

                    <div class="button-group">
                        <button class="btn btn-primary me-2">Thêm vào giỏ hàng</button>
                        <button class="btn btn-secondary">Mua ngay</button>
                    </div>
                </div>
            </div>

            <!-- Phần đánh giá và nhận xét -->
            <div class="review w-75 mt-5">
                <h3 class="section-title">Đánh giá và Nhận xét</h3>

                <!-- Danh sách nhận xét -->
                <div v-if="reviews.length > 0">
                    <ul class="list-unstyled">
                        <li v-for="review in reviews" :key="review.id" class=" border-bottom py-2">

                            <h5><img src="/src/assets/logo.jpg" style="height: 30px; width: 30px;" alt="">{{
                                review.user.name
                                }}</h5>
                            <!-- Hiển thị tên người dùng -->
                            <div class="stars">
                                <font-awesome-icon v-for="star in 5" :key="star" :icon="['fas', 'star']"
                                    :class="{ 'filled': star <= review.star, 'empty': star > review.star }" />
                            </div>
                            <p>{{ review.content }}</p>
                            <p class="text-muted"><font-awesome-icon :icon="['far', 'clock']" class="me-1" />{{
                                formatDate(review.created_at) }}</p>
                        </li>
                    </ul>
                </div>
                <div v-else>
                    <p>Chưa có nhận xét nào.</p>
                </div>

                <!-- Form thêm nhận xét -->
                <div class="mt-4">
                    <h4>Thêm nhận xét của bạn</h4>
                    <form @submit.prevent="submitReview">
                        <div class="mb-3">
                            <label class="form-label">Đánh giá sao</label>
                            <div class="star-rating">
                                <font-awesome-icon v-for="star in 5" :key="star" :icon="['fas', 'star']"
                                    :class="{ 'filled': star <= newReview.star }" @click="setRating(star)" />
                            </div>
                        </div>
                        <div class="mb-3">
                            <label for="review-comment" class="form-label">Nhận xét</label>
                            <textarea style="width: 50%;" v-model="newReview.content" id="review-content"
                                class="form-control" rows="4" required></textarea>
                        </div>
                        <button type="submit" class="btn btn-danger"><font-awesome-icon :icon="['fas', 'paper-plane']"
                                class="me-1" />Gửi nhận xét</button>
                    </form>
                </div>
            </div>

        </div>
        <div v-else>
            <p>Đang tải dữ liệu...</p>
        </div>
    </div>
</template>

<script>
import axios from 'axios';
import { mapGetters } from 'vuex';
import { format } from 'date-fns';

export default {
    data() {
        return {
            product: null, // Dữ liệu sản phẩm
            reviews: [],   // Danh sách đánh giá
            newReview: {   // Đánh giá mới
                star: 1,
                content: '',
            }
        };
    },
    computed: {
        ...mapGetters(['userId']), // Lấy userId từ Vuex store
        baseImageUrl() {
            return 'http://localhost:8000';
        }
    },
    methods: {

        getFullImageUrl(imagePath) {
            return `${this.baseImageUrl}${imagePath}`;
        },
        fetchProductDetails() {

            const productId = this.$route.params.id; // Lấy ID từ URL
            axios.get(`http://localhost:8000/api/phonemod/${productId}`)
                .then(response => {
                    this.product = response.data;
                    this.fetchReviews(); // Lấy đánh giá sau khi có sản phẩm
                })
                .catch(error => {
                    console.log(error);
                });
        },
        fetchReviews() {
            const productId = this.$route.params.id;
            axios.get(`http://localhost:8000/api/reviews/${productId}`)
                .then(response => {
                    this.reviews = response.data;
                })
                .catch(error => {
                    console.log(error);
                });
        },
        submitReview() {
            const productId = this.$route.params.id;
            if (!this.user_id) {
                console.error('User ID không có sẵn.');
                return;
            }
            axios.post(`http://localhost:8000/api/reviews/${productId}`, {
                ...this.newReview,
                user_id: this.user_id
            })
                .then(response => {
                    this.reviews.push(response.data);
                    this.newReview.star = 1; // Reset star to 1
                    this.newReview.content = '';
                })
                .catch(error => {
                    console.log('Lỗi khi gửi đánh giá:', error);
                });
        },
        setRating(star) {
            this.newReview.star = star;
        },
        formatDate(dateString) {
            return format(new Date(dateString), 'dd/MM/yyyy HH:mm');
        }
    },
    mounted() {
        this.fetchProductDetails();
    }
}
</script>

<style scoped>
.container {
    max-width: 1200px;
    margin-top: 30px;
}

.img-fluid {
    max-width: 100%;
    height: auto;
}

.product-title {
    font-size: 28px;
    font-weight: bold;
    margin-bottom: 20px;
}

.product-info {
    background: #f9f9f9;
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.section-title {
    font-size: 22px;
    margin-bottom: 15px;
}

.table {
    width: 100%;
    margin-bottom: 1rem;
    color: #212529;
}

.table-bordered {
    border: 1px solid #dee2e6;
}

.table-bordered td,
.table-bordered th {
    border: 1px solid #dee2e6;
}

.review {
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0 0 10px rgba(19, 1, 1, 0.1);
}

.table td.key {
    font-weight: bold;
    background-color: #f1f1f1;
}

.table td.value {
    background-color: #fff;
}

.button-group {
    margin-top: 20px;
}

.btn-primary {
    background-color: #007bff;
    border-color: #007bff;
}

.btn-secondary {
    background-color: #6c757d;
    border-color: #6c757d;
}

.review-form {
    margin-top: 30px;
}

.review-form .form-label {
    font-weight: bold;
}

.list-unstyled {
    padding-left: 0;
    
}

.list-unstyled li {
    margin-bottom: 20px;
}

.stars {
    color: #f39c12;
}

.stars .fa-star.filled {
    color: #f39c12;
}

.stars .fa-star.empty {
    color: #dcdcdc;
}

.stars font-awesome-icon {
    font-size: 20px;
    margin-right: 5px;
}


/* css đánh giá sao */
.star-rating {
    display: flex;
    direction: row-reverse;
    font-size: 24px;
    cursor: pointer;
}

.star-rating .fa-star {
    margin-left: 5px;
    color: #dcdcdc;
    /* Màu sao chưa chọn */
}

.star-rating .fa-star.filled {
    color: #f39c12;
    /* Màu sao đã chọn */
}

.star-rating .fa-star:hover {
    color: #f39c12;
}
</style>
