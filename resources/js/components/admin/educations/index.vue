<script setup>
    import Base from '../layouts/base.vue'
    import { onMounted, ref } from 'vue'

    let educations =ref([])

    const form = ref({
        institution: '',
        period: '',
        degree: '',
        department: '',
    })

    const showModal = ref(false)
    const hideModal = ref(true)
    const editMode = ref(false)

    onMounted(async() => {
        getEducations()
    })

    const getEducations = async () => {
        let  response = await axios.get('/api/admin/educations')
        educations.value = response.data.educations
    }

    const openModal = () => {
        showModal.value = !showModal.value
    }

    const closeModal = () => {
        showModal.value = !hideModal.value
        form.value = ({})
        editModal.value = false;
    }

    const createEducation = async() => {
        await axios.post('/api/admin/education/create', form.value)
        .then(response => {
            getEducations()
            closeModal()
            toast.fire({
                icon: 'success',
                title: 'Education added successfully.',
            })
        })
    }
    const editModal = (education) => {
        editMode.value = true
        showModal.value = !showModal.value
        form.value = education
    }

    const updateEducation = async () => {
        await axios.post('/api/admin/education/update/'+form.value.id, form.value)
        .then(() => {
            getEducations()
            closeModal()
            toast.fire({
                icon: 'success',
                title: 'Education updated successfully.'
            })
        })
    }
    const deleteEducation = (id) => {
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
                axios.get('/api/admin/education/destroy/'+id)
                .then(() => {
                    Swal.fire(
                        'Delete',
                        'Education delete successfully',
                        'success',
                    )
                    getEducations()
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
            <!--==================== EDUCATIONS ====================-->
            <section class="educations section" id="educations">
                <div class="skills_container">
                    <div class="titlebar">
                        <div class="titlebar_item">
                            <h1>Educations </h1>
                        </div>
                        <div class="titlebar_item">
                            <div class="btn btn__open--modal" @click="openModal()">
                                New Education
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
                                <input class="table_search--input" type="text" placeholder="Search Education">
                            </div>
                        </div>

                        <div class="education_table-heading">
                            <p>Institution</p>
                            <p>Period</p>
                            <p>Degree</p>
                            <p>Department</p>
                            <p>Actions</p>
                        </div>
                        <!-- item 1 -->
                        <div class="education_table-items" v-for="education in educations" :key="education.id" v-if="educations.length > 0">
                            <p>{{ education.institution }}</p>
                            <p>{{ education.period }}</p>
                            <p>{{ education.degree }}</p>
                            <p>{{ education.department }}</p>
                            <div>
                                <button class="btn-icon success" @click="editModal(education)">
                                    <i class="fas fa-pencil-alt"></i>
                                </button>
                                <button class="btn-icon danger" @click="deleteEducation(education.id)">
                                    <i class="far fa-trash-alt"></i>
                                </button>
                            </div>
                        </div>

                    </div>

                </div>
                <!-------------- EDUCATION MODAL --------------->
                <div class="modal main__modal " :class="{ show: showModal }">
                    <div class="modal__content">
                        <span class="modal__close btn__close--modal" @click="closeModal()">??</span>
                        <h3 class="modal__title" v-show="editMode == false">Add Education</h3>
                        <h3 class="modal__title" v-show="editMode == true">Update Education</h3>
                        <hr class="modal_line"><br>
                        <form @submit.prevent="editMode ?  updateEducation() : createEducation()">
                            <div>
                                <p>Institution</p>
                                <input type="text" class="input" v-model="form.institution" />

                                <p>Period</p>
                                <input type="text" class="input" v-model="form.period" />

                                <p>Degree</p>
                                <input type="text" class="input" v-model="form.degree" />

                                <p>Department</p>
                                <input type="text" class="input" v-model="form.department" />

                            </div>
                            <br><hr class="modal_line">
                            <div class="model__footer">
                                <button class="btn mr-2 btn__close--modal" @click="closeModal()">
                                    Cancel
                                </button>
                                <button type="submit" class="btn btn-secondary btn__close--modal ">Save</button>
                            </div>
                        </form>
                    </div>
                </div>
            </section>
        </div>
    </main>
</template>
