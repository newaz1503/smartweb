const routes = [
    {
        path: '/admin/dashboard',
        name: 'dashboard',
        component: () => import('../views/admin/DashboardComponent.vue')
    },
  ]

  export default routes;
