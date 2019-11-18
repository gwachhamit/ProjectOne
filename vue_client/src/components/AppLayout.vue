<template>

        <div class="wrapper">

            <!-- Navbar -->
            <app-navbar></app-navbar>
            <!-- /.navbar -->

            <!-- Main Sidebar Container -->
            <app-sidebar></app-sidebar>

            <!-- Content Wrapper. Contains page content -->
            <div class="content-wrapper">
                <router-view></router-view>
                <vue-progress-bar></vue-progress-bar>
            </div>
            <!-- /.content-wrapper -->

            <!-- Control Sidebar -->
            <aside class="control-sidebar control-sidebar-dark">
                <!-- Control sidebar content goes here -->
                <div class="p-3">
                <h5>Title</h5>
                <p>Sidebar content</p>
                </div>
            </aside>
            <!-- /.control-sidebar -->

        </div>
        <!-- ./wrapper -->

</template>

<script>
import appNavbar from '@/components/NavBar/AppNavbar.vue'
import appSidebar from '@/components/NavBar/AppSidebar.vue'
export default {
    components:{
        appNavbar,
        appSidebar,
    },
}
</script>

<style>
    @import "../assets/admin-lte/dist/css/adminlte.min.css";
    @import "https://use.fontawesome.com/releases/v5.8.1/css/all.css";
</style>

