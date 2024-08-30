const admin = [
  {
    path: "/layout",
    component: () => import("../layouts/user.vue"),
    children: [
      {
        path: "/",
        name: "user-home",
        component: () => import("../pages/user/home.vue")
      },
      {
        path: "/cart",
        name: "user-cart",
        component: () => import("../pages/user/cart.vue")
      },
      {
        path: "/detail",
        name: "user-detail",
        component: () => import("../pages/user/detail.vue")
      },
      {
        path: "/login",
        name: "login",
        component: () => import("../components/login.vue")
      },
      {
        path: "/register",
        name: "register",
        component: () => import("../components/register.vue")
      },
      

    ]
  },
  {
    path: "/admin",
    component: () => import("../layouts/admin.vue"),
    children: [
    //quan ly user
      {
        path: "users",
        name: "admin-users",
        component: () => import("../pages/admin/users/index.vue")

      },
      {
        path: "users/create",
        name: "admin-users-create",
        component: () => import("../pages/admin/users/create.vue")

      },
      {
        path: "roles",
        name: "admin-roles",
        component: () => import("../pages/admin/roles/index.vue")

      },
      {
        path: "settings",
        name: "admin-settings",
        component: () => import("../pages/admin/settings/index.vue")

      }
    ]  
  }
 

];
export default admin;