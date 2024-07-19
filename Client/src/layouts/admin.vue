<template>

    <TheHeaderVue />
    <div class="container-fuild">
        <div class="row">
            <div class="col-sm-3 d-none d-sm-fex">
                SIDER BAR
            </div>

            <div class="col-12 col-sm-9">
                <router-view></router-view>
            </div>
        </div>
    </div>
    
</template>
<script>
import TheHeaderVue from "../components/TheHeader.vue"
export default {
    components: {
        TheHeaderVue
    }
}
</script>