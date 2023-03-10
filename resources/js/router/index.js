import { createRouter, createWebHistory } from "vue-router";

//admin
import homeAdminIndex from '../components/admin/home/index.vue'
import adminAboutIndex from '../components/admin/about/index.vue'
import adminServiceIndex from '../components/admin/services/index.vue'
import adminSkillIndex from '../components/admin/skills/index.vue'
import adminEducationIndex from '../components/admin/educations/index.vue'
import adminExperienceIndex from '../components/admin/experience/index.vue'
import adminProjectIndex from '../components/admin/projects/index.vue'
import adminProjectNew from '../components/admin/projects/create.vue'
import adminProjectEdit from '../components/admin/projects/edit.vue'
import adminTestimonialIndex from '../components/admin/testimonials/index.vue'
import adminTestimonialNew from '../components/admin/testimonials/create.vue'
import adminTestimonialEdit from '../components/admin/testimonials/edit.vue'
import adminMessageIndex from '../components/admin/messages/index.vue'
import adminUserIndex from '../components/admin/users/index.vue'
import adminUserProfile from '../components/admin/users/profile.vue'
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
    {
        path:'/admin/educations',
        name: 'AdminEducation',
        component: adminEducationIndex,
        meta:{
            requiresAuth: true
        }
    },
    {
        path:'/admin/experiences',
        name: 'AdminExperience',
        component: adminExperienceIndex,
        meta:{
            requiresAuth: true
        }
    },
    {
        path:'/admin/projects',
        name: 'AdminProject',
        component: adminProjectIndex,
        meta:{
            requiresAuth: true
        }
    },
    {
        path:'/admin/projects/new',
        name: 'AdminProjectNew',
        component: adminProjectNew,
        meta:{
            requiresAuth: true
        }
    },
    {
        path:'/admin/projects/edit/:id',
        name: 'AdminProjectEdit',
        component: adminProjectEdit,
        meta:{
            requiresAuth: true
        },
        props: true
    },
    {
        path:'/admin/testimonials',
        name: 'AdminTestimonial',
        component: adminTestimonialIndex,
        meta:{
            requiresAuth: true
        }
    },
    {
        path:'/admin/testimonial/new',
        name: 'AdminTestimonialNew',
        component: adminTestimonialNew,
        meta:{
            requiresAuth: true
        }
    },
    {
        path:'/admin/testimonial/edit/:id',
        name: 'AdminTestimonialEdit',
        component: adminTestimonialEdit,
        meta:{
            requiresAuth: true
        },
        props: true
    },
    {
        path:'/admin/messages',
        name: 'AdminMessage',
        component: adminMessageIndex,
        meta:{
            requiresAuth: true
        }
    },
    {
        path:'/admin/users',
        name: 'AdminUser',
        component: adminUserIndex,
        meta:{
            requiresAuth: true
        }
    },
    {
        path:'/admin/user/profile',
        name: 'AdminUserProfile',
        component: adminUserProfile,
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
