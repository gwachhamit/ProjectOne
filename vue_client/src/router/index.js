import Vue from "vue";
import Router from "vue-router";
import AppLayout from "../components/AppLayout.vue";
import store from '@/store';

const requireAuthenticated = (to, from, next) => {
  store.dispatch('auth/initialize')
    .then(() => {
      if (!store.getters['auth/isAuthenticated']) {
        next('/login');
      } else {
        next();
      }
    });
};

const requireUnauthenticated = (to, from, next) => {
  store.dispatch('auth/initialize')
    .then(() => {
      if (store.getters['auth/isAuthenticated']) {
        next({name:'dashboard'});
      } else {
        next();
      }
    });
};

const redirectLogout = (to, from, next) => {
  store.dispatch('auth/logout')
    .then(() => next('/login'));
};

Vue.use(Router);

export default new Router({
  mode: "history",
  routes: [
    {
      path: "/",
      redirect: { name: 'login' },
    },
    {
      path: "/login",
      name: "login",
      component: () =>
      import("@/views/Login.vue"),
      beforeEnter: requireUnauthenticated,
    },
    {
      path: "/admin",
      component: AppLayout,
      children: [
        {
          name: 'dashboard',
          path: 'dashboard',
          component: () =>
          import( "@/views/Dashboard.vue"),
        },
        {
          name: 'users',
          path: 'users',
          component: () =>
          import("@/views/user/Index.vue"),
        },
        {
          name: 'create-user',
          path: 'users/create',
          component: () =>
          import("@/views/user/Create.vue"),
        },
        {
          name: 'edit-user',
          path: 'users/:id/edit',
          component: () =>
          import("@/views/user/Edit.vue"),
        },
        {
          name: 'roles',
          path: 'roles',
          component: () =>
          import("@/views/role/Index.vue"),
        },
        {
          name: 'create-role',
          path: 'roles/create',
          component: () =>
          import("@/views/role/Create.vue"),
        },
        {
          name: 'edit-role',
          path: 'roles/:id/edit',
          component: () =>
          import("@/views/role/Edit.vue"),
        },
        {
          name: 'permissions',
          path: 'permissions',
          component: () =>
          import("@/views/permission/Index.vue"),
        },
        {
          name: 'create-permission',
          path: 'permissions/create',
          component: () =>
          import("@/views/permission/Create.vue"),
        },
        {
          name: 'edit-permission',
          path: 'permissions/:id/edit',
          component: () =>
          import("@/views/permission/Edit.vue"),
        },
        {
          path: '*',
          name: "page-not-found-authenticated",
          component: () =>
          import("@/views/PageNotFound.vue")
        },
        {
          path: '',
          redirect: { name: 'dashboard' },
        },
      ],
      beforeEnter: requireAuthenticated,
    },
    {
      path: '/logout',
      beforeEnter: redirectLogout,
    },
    {
      path: '*',
      name: "page-not-found",
      component: () =>
        import("../views/PageNotFound.vue")
    }
  ]
});
