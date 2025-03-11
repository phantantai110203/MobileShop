<template>
    <div>
        <h1>Quản lý Slideshow</h1>


        <table>
            <thead>
                <tr>
                    <th>Tiêu đề</th>
                    <th>Hình ảnh</th>
                    <th>Ngày tạo</th>
                    <th>Hành động</th>
                </tr>
            </thead>
            <tbody>
                <tr v-for="slide in slides" :key="slide.id">
                    <td>{{ slide.image }}</td>

                    <td><img :src="getFullImageUrl(slide.image)" class="card-img-top" :alt="slide.image"></td>
                    <td>{{ formatDate(slide.created_at) }}</td>
                    <td>
                        <button @click="deleteSlide(slide.id)">Xóa</button>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
</template>

<script>
import axios from 'axios';

export default {
    data() {
        return {
            slides: [],
            title: '',
            image: null,
            description: '',
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
        fetchSlides() {
            axios.get('http://localhost:8000/api/slides')
                .then(response => {
                    this.slides = response.data;
                })
                .catch(error => {
                    console.error('Có lỗi xảy ra:', error);
                });
        },
        addSlide() {
            const formData = new FormData();
            formData.append('title', this.title);
            formData.append('image', this.image);
            formData.append('description', this.description);

            axios.post('/api/slides', formData)
                .then(() => {
                    this.fetchSlides();
                    this.title = '';
                    this.image = null;
                    this.description = '';
                })
                .catch(error => {
                    console.error('Có lỗi xảy ra khi thêm slide:', error);
                });
        },
        onFileChange(event) {
            this.image = event.target.files[0];
        },
        deleteSlide(id) {
            axios.delete(`http://localhost:8000/api/slides/${id}`) 
                .then(() => {
                this.fetchSlides();
            })
                    .catch(error => {
                        console.error('Có lỗi xảy ra khi xóa slide:', error);
                    });
        },
        formatDate(dateString) {
            const date = new Date(dateString);

            // Lấy ngày, tháng, năm và giờ
            const day = String(date.getDate()).padStart(2, '0');
            const month = String(date.getMonth() + 1).padStart(2, '0'); // Tháng bắt đầu từ 0
            const year = date.getFullYear();
            const hours = String(date.getHours()).padStart(2, '0');
            const minutes = String(date.getMinutes()).padStart(2, '0');

            // Trả về chuỗi định dạng d/m/Y H:i
            return `${day}/${month}/${year} ${hours}:${minutes}`;
        }
    },
    mounted() {
        this.fetchSlides();
    }
};
</script>

<style>
table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 20px;
}

th,
td {
    border: 1px solid #ccc;
    padding: 15px;
    text-align: left;
    vertical-align: middle;
}

th {
    background-color: #f2f2f2;
    color: #333;
    font-weight: bold;
}

tr:hover {
    background-color: #f9f9f9;
}

img {
    max-width: 100px;
    /* Kích thước tối đa cho hình ảnh */
    height: auto;
}

button {
    background-color: #007bff;
    color: white;
    border: none;
    padding: 8px 12px;
    cursor: pointer;
    border-radius: 4px;
}

button:hover {
    background-color: #0056b3;
}

img {
    width: 50px;
    height: 50px;
}
</style>
