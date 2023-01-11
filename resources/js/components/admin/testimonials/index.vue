<script setup>
    import Base from '../layouts/base.vue'
    import { onMounted, ref } from 'vue'
    import { useRouter } from 'vue-router'

    const router = useRouter()

    let testimonials =ref([])

    const showModal = ref(false)
    const hideModal = ref(true)
    const editMode = ref(false)

    onMounted(async() => {
        getTestimonials()
    })

    const getTestimonials = async () => {
        let  response = await axios.get('/api/admin/testimonials')
        // testimonials.value = response.data.testimonials
        console.log('response', response)
    }
</script>
<template>
    <Base />
    <main class="main">
        <!-- Side Nav Dummy-->
        <div class="main__sideNav"></div>
        <!-- End Side Nav -->
        <!-- Main Content -->
        <div class="main__content">
             <!--==================== TESTIMONIALS ====================-->
            <section class="testimonials section" id="testimonials">
                <div class="testimonials_container">
                    <div class="titlebar">
                        <div class="titlebar_item">
                            <h1>Testimonials </h1>
                        </div>
                        <div class="titlebar_item">
                            <div class="btn btn__open--modal">
                                New Testimonial
                            </div>
                        </div>
                    </div>

                    <div class="table">

                        <div class="table_filter">
                            <span class="table_filter-Btn ">
                                <i class="fas fa-ellipsis-h"></i>
                            </span>
                            <div>
                                <ul class="table_filter-list">
                                    <li>
                                        <p class="table_filter-link table_filter-link--active">
                                            All
                                        </p>
                                    </li>
                                </ul>
                            </div>
                        </div>

                        <div class="table_search">
                            <div class="table_search-wrapper">
                                <select class="table_search-select" name="" id="">
                                    <option value="">Filter</option>
                                </select>
                            </div>
                            <div class="relative">
                                <i class="table_search-input--icon fas fa-search "></i>
                                <input class="table_search--input" type="text" placeholder="Search Testimonial">
                            </div>
                        </div>

                        <div class="testimonial_table-heading">
                            <p>Photo</p>
                            <p>name</p>
                            <p>Function</p>
                            <p>Testimony</p>
                            <p>Rating</p>
                            <p>Actions</p>
                        </div>
                        <!-- item 1 -->
                        <div class="testimonial_table-items">
                            <p>
                                <img src="/assets/img/avatar.jpg" alt="" class="testimonial_img-list">
                            </p>
                            <p>Backend Developer</p>
                            <p>Backend Developer</p>
                            <p>Backend Developer</p>
                            <p>5/5</p>
                            <div>
                                <button class="btn-icon success">
                                    <i class="fas fa-pencil-alt"></i>
                                </button>
                                <button class="btn-icon danger" >
                                    <i class="far fa-trash-alt"></i>
                                </button>
                            </div>
                        </div>

                    </div>

                </div>
            </section>
            <!--===================ADD TESTIMONIAL ====================-->
            <!-- <section class="about section" id="testimonial">
                <div class="about_container">
                    <div class="titlebar">
                        <div class="titlebar_item">
                            <h1>Add Testimonial</h1>
                        </div>
                        <div class="titlebar_item">
                            <div class="btn btn-secondary">
                                Save Testimonial
                            </div>
                        </div>
                    </div>
                    <div class="card_wrapper">
                        <div class="wrapper_left">
                            <div class="card">

                                <p>Name</p>
                                <input type="text" class="input" />

                                <p>Function</p>
                                <input type="text" class="input" />

                                <p>Testimony</p>
                                <textarea cols="10" rows="5"  ></textarea>

                            </div>
                        </div>

                        <div class="wrapper_right ">
                            <div class="card">
                                <p>Photo</p>
                                <div class="testimonial_img-container">
                                 <img src="/assets/img/avatar.jpg" alt="" class="testimonial_img">
                                </div>
                                <input type="file" id="fileimg" />
                                <br>
                                <p>Rating ?/5</p>
                                <input type="text" class="input" />
                            </div>
                        </div>

                    </div>
                    <div class="titlebar">
                        <div class="titlebar_item">

                        </div>
                        <div class="titlebar_item">
                            <div class="btn btn-secondary">
                                Save Testimonial
                            </div>
                        </div>
                    </div>
                </div>
            </section> -->
            <!--===================EDIT TESTIMONIAL ====================-->
            <!-- <section class="about section" id="testimonial">
                <div class="about_container">
                    <div class="titlebar">
                        <div class="titlebar_item">
                            <h1>Edit Testimonial</h1>
                        </div>
                        <div class="titlebar_item">
                            <div class="btn btn-secondary">
                                Update Testimonial
                            </div>
                        </div>
                    </div>
                    <div class="card_wrapper">
                        <div class="wrapper_left">
                            <div class="card">

                                <p>Name</p>
                                <input type="text" class="input" />

                                <p>Function</p>
                                <input type="text" class="input" />

                                <p>Testimony</p>
                                <textarea cols="10" rows="5"  ></textarea>

                            </div>
                        </div>

                        <div class="wrapper_right ">
                            <div class="card">
                                <p>Photo</p>
                                <div class="testimonial_img-container">
                                 <img src="/assets/img/avatar.jpg" alt="" class="testimonial_img">
                                </div>
                                <input type="file" id="fileimg" />
                                <br>
                                <p>Rating ?/5</p>
                                <input type="text" class="input" />
                            </div>
                        </div>

                    </div>
                    <div class="titlebar">
                        <div class="titlebar_item">

                        </div>
                        <div class="titlebar_item">
                            <div class="btn btn-secondary">
                                Update Testimonial
                            </div>
                        </div>
                    </div>
                </div>
            </section> -->
        </div>
    </main>
</template>
