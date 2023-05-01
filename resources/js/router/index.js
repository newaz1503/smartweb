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
  ]

  export default routes;
