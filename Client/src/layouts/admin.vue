<template>

    <TheHeaderVue />
    <div class="container-fluid mt-3 mb-3">
        <div class="row">
            <div class="col-sm-3 d-none d-sm-flex">
                <a-list bordered style="width: 100%;">
                    <TheMenu />

                    <template #header>
                        <div>BẢNG ĐIỀU KHIỂN</div>
                    </template>

                </a-list>
            </div>

            <div class="col-12 col-sm-9">
                <router-view></router-view>
            </div>
        </div>
    </div>
    <TheFooter />
</template>
<script>
import TheHeaderVue from "../components/TheHeader.vue"
import TheMenu from "../components/TheMenu.vue";
import TheFooter from "../components/TheFooter.vue";

export default {
    components: {
        TheHeaderVue,
        TheMenu,
        TheFooter
    }
}
</script>