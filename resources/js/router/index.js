const routes = [
    {
        path: '/admin/dashboard',
        name: 'dashboard',
        component: () => import('../views/admin/DashboardComponent.vue')
    },
    //division route
    {
        path: '/admin/division',
        name: 'division',
        component: () => import('../views/admin/division/Index.vue')
    },
    //district route
    {
        path: '/admin/district',
        name: 'district',
        component: () => import('../views/admin/district/Index.vue')
    },
    //division district route
    {
        path: '/admin/division-district',
        name: 'division-district',
        component: () => import('../views/admin/divdist/Index.vue')
    },
  ]

  export default routes;
