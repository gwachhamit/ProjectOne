<template>
    <div id="main-topbar">
        <nav class="main-header navbar navbar-expand bg-white navbar-light border-bottom">
            <!-- Left navbar links -->
            <ul class="navbar-nav">
                <li class="nav-item">
                <a class="nav-link" data-widget="pushmenu" href="#"><i class="fa fa-bars"></i></a>
                </li>
            </ul>

            <div v-if="accountDetail.name != null">{{accountDetail.name}}</div>
        </nav>
    </div>
</template>
    
<script>
import { mapGetters, mapActions } from 'vuex';
export default {
    mounted(){
        this.fetchAccoundDetail()
    },
    computed: {
        ...mapGetters('auth', [
            'accountDetail',
        ]),
    },
    methods:{
        ...mapActions('auth', [
            'getAccountDetail',
        ]),

        fetchAccoundDetail(){
            this.getAccountDetail()
        }
    }
}
</script>

<style>
    
</style>


