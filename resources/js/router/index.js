import { createRouter, createWebHistory } from "vue-router";

//admin
import homeAdminIndex from '../components/admin/home/index.vue'
import adminAboutIndex from '../components/admin/about/index.vue'
import adminServiceIndex from '../components/admin/services/index.vue'
import adminSkillIndex from '../components/admin/skills/index.vue'
//pages
import homePageIndex from '../components/pages/home/index.vue'
import Login from '../components/auth/login.vue'
//notfound
import notFound from '../components/notFound.vue'

const routes = [
    //admin
    {
        path:'/admin/home',
        name: 'AdminHome',
        component: homeAdminIndex,
        meta:{
            requiresAuth: true
        }
    },
    {
        path:'/admin/about',
        name: 'AdminAbout',
        component: adminAboutIndex,
        meta:{
            requiresAuth: true
        }
    },
    {
        path:'/admin/services',
        name: 'AdminService',
        component: adminServiceIndex,
        meta:{
            requiresAuth: true
        }
    },
    {
        path:'/admin/skills',
        name: 'AdminSkill',
        component: adminSkillIndex,
        meta:{
            requiresAuth: true
        }
    },
    //pages
    {
        path:'/',
        name: 'Home',
        component:homePageIndex,
        meta:{
            requiresAuth: false
        }
    },
    {
        path:'/login',
        name: 'Login',
        component:Login,
        meta:{
            requiresAuth: false
        }
    },
    //notfound
    {
        path:'/:pathMatch(.*)*',
        name: 'notFound',
        component:notFound,
        meta:{
            requiresAuth: false
        }
    }
]

const router = createRouter({
    history: createWebHistory(),
    routes,
})

router.beforeEach((to, from) => {
    if(to.meta.requiresAuth && !localStorage.getItem('token')){
        return { name: 'Login' }
    }
    if(to.meta.requiresAuth == false && localStorage.getItem('token')){
        return { name: 'AdminHome' }
    }
})

export default router;
