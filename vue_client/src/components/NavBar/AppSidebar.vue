<template>
    <div id="main-sidebar">
        <aside class="main-sidebar sidebar-dark-primary elevation-4">
            <!-- Brand Logo -->
            <router-link to="/admin/dashboard" class="brand-link">
                <!-- <img src="dist/img/AdminLTELogo.png" alt="Logo" class="brand-image img-circle elevation-3" style="opacity: .8"> -->
                <i class="fa fa-leaf"></i>
                <span class="brand-text font-weight-light">Admin Panel</span>
            </router-link>
            <!-- Sidebar -->
            <div class="sidebar">
                <!-- Sidebar user panel (optional) -->
                <div class="user-panel mt-3 pb-3 mb-3 d-flex">
                    <div class="image">
                        <img :src="'/profile.svg'" class="img-circle elevation-2" :alt="accountDetail.name">
                    </div>
                    <div class="info">
                        <a href="#" class="d-block">{{ accountDetail.name }}</a>
                    </div>
                </div>

                <!-- Sidebar Menu -->
                <nav class="mt-2">
                    <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
                        <!-- Add icons to the links using the .nav-icon class with font-awesome or any other icon font library -->
                        <li class="nav-item">
                            <router-link to="/admin/dashboard" class="nav-link">
                                <i class="nav-icon fa fa-tachometer-alt"></i>
                                <p>
                                Dashboard
                                </p>
                            </router-link>
                        </li>
                        <li class="nav-item">
                            <router-link :to="{name:'users'}" class="nav-link">
                                <i class="nav-icon fa fa-users"></i>
                                <p>
                                Users
                                </p>
                            </router-link>
                        </li>
                        <li class="nav-item">
                            <router-link :to="{name:'roles'}" class="nav-link">
                                <i class="nav-icon fa fa-user-tag"></i>
                                <p>
                                Roles
                                </p>
                            </router-link>
                        </li>
                        <li class="nav-item">
                            <router-link :to="{name:'permissions'}" class="nav-link">
                                <i class="nav-icon fa fa-user-slash"></i>
                                <p>
                                Permissions
                                </p>
                            </router-link>
                        </li>
                        <li class="nav-item">
                            <router-link to='/logout' class="nav-link">
                                <i class="nav-icon fa fa-power-off"></i>
                                <p>
                                    Logout
                                </p>
                            </router-link>
                        </li>
                    </ul>
                </nav>
                <!-- /.sidebar-menu -->
            </div>
            <!-- /.sidebar -->
        </aside>
    </div>
</template>

<script>

import { mapGetters } from 'vuex';
export default {
    data(){
        return {
            name:'Amit',
        }
    },
    computed: {
        ...mapGetters('auth', [
            'accountDetail',
        ]),
    },
    
    methods:{
       
    }
}
</script>

<style>

</style>


