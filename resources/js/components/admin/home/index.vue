<script setup>
    import Base from '../layouts/base.vue';
    import { useRouter } from 'vue-router';
    import { onMounted, ref } from 'vue'

    const router = useRouter()

    const user_data = ref({
        projects:'',
        testimonials:'',
        services:'',
        skills_count:'',
        educations_count:'',
        experiences_count:'',
        services_count:'',
        projects_count:'',
        testimonials_count:'',
        messages_count:'',
        users_count:'',
    })

    onMounted(async() => {
        getData()
    })

    const getData = async () => {
        let  response = await axios.get('/api/admin/user_data')
        user_data.value = response.data.user_data
    }

    const logout = () => {
        localStorage.removeItem('token')
        router.push('/')
    }

    const getPhoto = (img) => {
        return '/img/upload/'+img
    }
</script>
<template>
    <Base />
    <!--==================== MAIN ====================-->
    <main class="main">
        <div class="main__sideNav"></div>
        <div class="main__content">
            <section class="overview" id="overview">
                <div class="overview_left">
                    <div class="overview_analyse">
                        <canvas id="chart" width="1228" height="614" style="display: block; box-sizing: border-box; height: 614px; width: 100%;"></canvas>
                    </div>
                    <div class="titlebar">
                        <div class="titlebar_item">
                            <h1>Skills</h1>
                        </div>
                        <div class="titlebar_item"></div>
                    </div>

                    <div class="overview_skills" v-for="service in user_data.services" :key="service.id" v-if="user_data.services.length > 0">
                        <div class="overview_skills-title">
                            <h3>{{ service.name }}</h3>
                        </div>
                        <div class="skills_data" v-for="item in service.have_skills" :key="item.id" v-if="service.have_skills.length > 0">
                            <div class="skills_titles">
                                <h3 class="skills_name">{{ item.name }}</h3>
                                <span class="skills_number">{{ item.proficiency }}%</span>
                            </div>
                            <div class="skills_bar">
                                <span class="skills_percentage skills_html"></span>
                            </div>
                        </div>
                    </div>
                    <br>
                </div>
                <div class="overview_right">
                    <div class="titlebar">
                        <div class="titlebar_item">
                            <h1>Overview Dashboard</h1>
                        </div>
                        <div class="titlebar_item"></div>
                    </div>

                    <!-- TOP CARDS -->
                    <div class="overview_cards">
                        <div class="overview_cards-item">
                            <div class="overview_data">
                                <p>Skills</p>
                                <span>{{ user_data.skills_count }}</span>
                            </div>
                            <div class="overview_link">
                                <span></span>
                                <a href="#">View Reports</a>
                            </div>
                        </div>
                        <div class="overview_cards-item">
                            <div class="overview_data">
                                <p>Educations</p>
                                <span>{{ user_data.educations_count }}</span>
                            </div>
                            <div class="overview_link">
                                <span></span>
                                <a href="#">View Reports</a>
                            </div>
                        </div>
                        <div class="overview_cards-item">
                            <div class="overview_data">
                                <p>Experience</p>
                                <span>{{ user_data.experiences_count }}</span>
                            </div>
                            <div class="overview_link">
                                <span></span>
                                <a href="#">View Reports</a>
                            </div>
                        </div>
                        <div class="overview_cards-item">
                            <div class="overview_data">
                                <p>Services</p>
                                <span>{{ user_data.services_count }}</span>
                            </div>
                            <div class="overview_link">
                                <span></span>
                                <a href="#">View Reports</a>
                            </div>
                        </div>
                        <div class="overview_cards-item">
                            <div class="overview_data">
                                <p>Projects</p>
                                <span>{{ user_data.projects_count }}</span>
                            </div>
                            <div class="overview_link">
                                <span></span>
                                <a href="#">View Reports</a>
                            </div>
                        </div>
                        <div class="overview_cards-item">
                            <div class="overview_data">
                                <p>Testimonials</p>
                                <span>{{ user_data.testimonials_count }}</span>
                            </div>
                            <div class="overview_link">
                                <span></span>
                                <a href="#">View Reports</a>
                            </div>
                        </div>
                        <div class="overview_cards-item">
                            <div class="overview_data">
                                <p>Messages</p>
                                <span>{{ user_data.messages_count }}</span>
                            </div>
                            <div class="overview_link">
                                <span></span>
                                <a href="#">View Reports</a>
                            </div>
                        </div>
                        <div class="overview_cards-item">
                            <div class="overview_data">
                                <p>Users</p>
                                <span>{{ user_data.users_count }}</span>
                            </div>
                            <div class="overview_link">
                                <span></span>
                                <a href="#">View Reports</a>
                            </div>
                        </div>
                    </div>
                    <!-- MEDIUM CARDS -->
                    <div class="overview_table">
                        <div class="overview_table-title">
                            <div class="titlebar">
                                <div class="titlebar_item">
                                    <h1>Latest Projects</h1>
                                </div>
                                <div class="titlebar_item"></div>
                            </div>
                            <div class="table">
                                <div class="overview_table-header">
                                    <p>Image</p>
                                    <p>Product</p>
                                </div>
                                <div class="overview_table-items" v-for="project in user_data.projects" :key="project.id" v-if="user_data.projects.length > 0">
                                    <img :src="getPhoto(project.photo)" style="height:50px;width:50px;" />
                                    <a>{{ project.title }}</a>
                                </div>
                            </div>
                        </div>
                        <div class="overview_table-title">
                            <div class="titlebar">
                                <div class="titlebar_item">
                                    <h1>Latest Testimonials</h1>
                                </div>
                                <div class="titlebar_item">

                                </div>
                            </div>
                            <div class="table">
                                <div class="overview_table-header">
                                    <p>Image</p>
                                    <p>Product</p>
                                </div>
                                <div class="overview_table-items" v-for="testimonial in user_data.testimonials" :key="testimonial.id">
                                    <img :src="getPhoto(testimonial.photo)" style="height:50px;width:50px;" />
                                    <a>{{ testimonial.name }}</a>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </section>
        </div>
    </main>

    <!--==================== FOOTER ====================-->
    <footer class="footer">
    </footer>
</template>
