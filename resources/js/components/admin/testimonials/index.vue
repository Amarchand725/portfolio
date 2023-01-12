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
        testimonials.value = response.data.testimonials
    }

    const ourImage = (img) => {
        return '/img/upload/'+img
    }

    const newTestimonial = () => {
        router.push('/admin/testimonial/new')
    }

    const onEdit = (id) => {
        router.push('/admin/testimonial/edit/'+id)
    }

    const deleteTestimonial = (id) => {
        Swal.fire({
            title: 'Are you sure?',
            text: "You can't back",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            cancelButtonText: 'Cancel',
            confirmButtonText: 'Yes, Delete it',
        })
        .then((result) => {
            if(result.value){
                axios.get('/api/admin/testimonial/destroy/'+id)
                .then(() => {
                    Swal.fire(
                        'Delete',
                        'Testimonial delete successfully',
                        'success',
                    )
                    getTestimonials()
                })
            }
        })
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
                            <div class="btn btn__open--modal" @click="newTestimonial()">
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
                            <p>Testinomy</p>
                            <p>Rating</p>
                            <p>Actions</p>
                        </div>
                        <!-- item 1 -->
                        <div class="testimonial_table-items" v-for="testimonial in testimonials" :key="testimonial.id" v-if="testimonials.length > 0">
                            <p>
                                <img :src="ourImage(testimonial.photo)" class="testimonial_img-list">
                            </p>
                            <p>{{ testimonial.name }}</p>
                            <p>{{ testimonial.function }}</p>
                            <p>{{ testimonial.testinomy }}</p>
                            <p>{{ testimonial.rating }}</p>
                            <div>
                                <button class="btn-icon success" @click="onEdit(testimonial.id)">
                                    <i class="fas fa-pencil-alt"></i>
                                </button>
                                <button class="btn-icon danger" @click="deleteTestimonial(testimonial.id)">
                                    <i class="far fa-trash-alt"></i>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    </main>
</template>
