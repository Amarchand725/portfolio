<script setup>
    import Base from '../layouts/base.vue'
    import { onMounted, ref } from 'vue'

    let skills =ref([])
    let services =ref([])

    const form = ref({
        service_id: '',
        name: '',
        proficiency: '',
    })

    const showModal = ref(false)
    const hideModal = ref(true)
    const editMode = ref(false)

    onMounted(async() => {
        getSkills()
        getServices()
    })

    const getSkills = async () => {
        let  response = await axios.get('/api/admin/skills')
        skills.value = response.data.skills
    }

    const getServices = async () => {
        let response = await axios.get('/api/admin/services')
        services.value = response.data.services
    }

    const openModal = () => {
        editMode.value = false
        showModal.value = !showModal.value
    }

    const closeModal = () => {
        showModal.value = !hideModal.value
        form.value = ({})
        editModal.value = false;
    }

    const createSkill = async() => {
        await axios.post('/api/admin/skill/create', form.value)
        .then(response => {
            getSkills()
            closeModal()
            toast.fire({
                icon: 'success',
                title: 'Skill add successfully.',
            })
        })
    }

    const editModal = (skill) => {
        editMode.value = true
        showModal.value = !showModal.value
        form.value = skill
    }

    const updateSkill = async () => {
        await axios.post('/api/admin/skill/update/'+form.value.id, form.value)
        .then(() => {
            getSkills()
            closeModal()
            toaster.fir({
                icon: 'success',
                title: 'Skill updated successfully.'
            })
        })
    }
    const deleteSkill = (id) => {
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
                axios.get('/api/admin/skill/destroy/'+id)
                .then(() => {
                    Swal.fire(
                        'Delete',
                        'Skill delete successfully',
                        'success',
                    )
                    getSkills()
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
            <!--==================== SKILLS ====================-->
            <section class="skills section" id="skills">
                <div class="skills_container">
                    <div class="titlebar">
                        <div class="titlebar_item">
                            <h1>Skills </h1>
                        </div>
                        <div class="titlebar_item">
                            <div class="btn btn__open--modal" @click="openModal()">
                                New Skill
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
                                <input class="table_search--input" type="text" placeholder="Search Service">
                            </div>
                        </div>

                        <div class="skill_table-heading">
                            <p>Name</p>
                            <p>Proficiency</p>
                            <p>Service</p>
                            <p>Actions</p>
                        </div>
                        <!-- item 1 -->
                        <div class="skill_table-items" v-for="skill in skills" :key="skill.id" v-if="skills.length > 0">
                            <p>{{ skill.name }}</p>
                            <div class="table_skills-bar">
                                 <span class="table_skills-percentage" :style="{'width' : `${skill.proficiency}%`}"></span>
                                 <strong>{{ skill.proficiency }}%</strong>
                            </div>
                            <p v-if="skill.service">{{ skill.service.name }}</p>
                            <div>
                                <button class="btn-icon success" @click="editModal(skill)">
                                    <i class="fas fa-pencil-alt"></i>
                                </button>
                                <button class="btn-icon danger" @click="deleteSkill(skill.id)">
                                    <i class="far fa-trash-alt"></i>
                                </button>
                            </div>
                        </div>

                    </div>

                </div>
                <!-------------- SERVICES MODAL --------------->
                <div class="modal main__modal " :class="{ show: showModal }">
                    <div class="modal__content">
                        <span class="modal__close btn__close--modal" @click="closeModal()">??</span>
                        <h3 class="modal__title" v-show="editMode == false">Add Skill</h3>
                        <h3 class="modal__title" v-show="editMode == true">Update Skill</h3>
                        <hr class="modal_line"><br>
                        <form @submit.prevent="editMode ? updateSkill() : createSkill()">
                            <div>
                                <p>Name</p>
                                <input type="text" class="input" v-model="form.name" />

                                <p>Proficiency</p>
                                <input type="text" class="input" v-model="form.proficiency" />

                                <p>Service</p>
                                <select class="inputSelect" v-model="form.service_id">
                                    <option disabled>Select Service</option>
                                    <option :value="service.id" v-for="service in services" :key="service.id">{{ service.name }}</option>
                                </select>
                            </div>
                            <br><hr class="modal_line">
                            <div class="model__footer">
                                <button class="btn mr-2 btn__close--modal" @click="closeModal()">
                                    Cancel
                                </button>
                                <button type="submit" class="btn btn-secondary " v-show="editMode == false">Save</button>
                                <button type="submit" class="btn btn-secondary " v-show="editMode == true">Update Skill</button>
                            </div>
                        </form>
                    </div>
                </div>
            </section>
        </div>
    </main>
</template>
