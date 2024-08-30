<template>
    <Nav />

    <div>
        <router-view></router-view>
    </div>
    <Footer />
</template>
<script>
import Footer from '../pages/user/compoment/Footer.vue';
import Nav from '../pages/user/compoment/Nav.vue';
export default {
    components: {
        Footer,
        Nav
    }
}

</script>