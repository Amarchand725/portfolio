<script setup>
    import Base from '../layouts/base.vue'
    import { onMounted, ref } from 'vue'

    let users =ref([])

    const form = ref({
        name : '',
        email : '',
        password : '',
        bio : '',
        photo : '',
        type : '',
    })

    const errors = ref({})

    const showModal = ref(false)
    const hideModal = ref(true)
    const editMode = ref(false)

    onMounted(async() => {
        getUsers()
    })

    const getUsers = async () => {
        let  response = await axios.get('/api/admin/users')
        users.value = response.data.users
    }

    const ourImage = (img) => {
        return '/img/upload/'+img
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

    const createUser = async () => {
        await axios.post('/api/admin/user/create', form.value)
        .then(response => {
            getUsers()
            closeModal()
            toast.fire({
                icon:'success',
                title:'User Added Successfully.'
            })
        })
        .catch((error) => {
            if(error.response.status == 422){
                errors.value = error.response.data.errors
            }
        })
    }

    const editModal = (user) => {
        editMode.value = true
        showModal.value = !showModal.value
        form.value = user
    }

    const updateUser = async () => {
        await axios.post('/api/admin/user/update/'+form.value.id, form.value)
        .then(() => {
            getUsers()
            closeModal()
            toast.fire({
                icon: 'success',
                title: 'user update successfully.'
            })
        })
    }

    const deleteUser = (id) => {
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
                axios.get('/api/admin/user/destroy/'+id)
                .then(() => {
                    Swal.fire(
                        'Delete',
                        'User delete successfully',
                        'success',
                    )
                    getUsers()
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
            <!--==================== USERS ====================-->
            <section class="users section" id="users">
                <div class="users_container">
                    <div class="titlebar">
                        <div class="titlebar_item">
                            <h1>Users </h1>
                        </div>
                        <div class="titlebar_item">
                            <div class="btn btn__open--modal" @click="openModal()">
                                New User
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
                                <input class="table_search--input" type="text" placeholder="Search User">
                            </div>
                        </div>

                        <div class="user_table-heading">
                            <p>Photo</p>
                            <p>Name</p>
                            <p>Role</p>
                            <p>Actions</p>
                        </div>
                        <!-- item 1 -->
                        <div class="user_table-items" v-for="user in users" :key="user.id" v-if="users.length > 0">
                            <p>
                                <img :src="ourImage(user.photo)" class="user_img-list">
                            </p>
                            <p>{{ user.name }}</p>
                            <p>{{ user.type }}</p>
                            <div>
                                <button class="btn-icon success" @click="editModal(user)">
                                    <i class="fas fa-pencil-alt"></i>
                                </button>
                                <button class="btn-icon danger" @click="deleteUser(user.id)">
                                    <i class="far fa-trash-alt"></i>
                                </button>
                            </div>
                        </div>

                    </div>

                </div>
            </section>
            <!-------------- USER MODAL --------------->
            <div class="modal main__modal " :class="{ show: showModal }">
                <div class="modal__content">
                    <span class="modal__close btn__close--modal" @click="closeModal()">×</span>
                    <h3 class="modal__title" v-show="editMode == false">Add User</h3>
                    <h3 class="modal__title" v-show="editMode == true">Update User</h3>
                    <hr class="modal_line"><br>
                    <form @submit.prevent="editMode ? updateUser() : createUser()">
                        <div>
                            <p>Name</p>
                            <input type="text" class="input" v-model="form.name"/>
                            <small style="color:red" v-if="errors.name">{{ errors.name }}</small>
                            <p>Email</p>
                            <input type="email" class="input" v-model="form.email"/>
                            <small style="color:red" v-if="errors.email">{{ errors.email }}</small>

                            <p>Bio</p>
                            <textarea cols="20" rows="3" class="textarea" v-model="form.bio"></textarea>

                            <p>Type</p>
                            <select class="inputSelect" v-model="form.type">
                                <option disabled>Select Role</option>
                                <option value="admin">Admin</option>
                                <option value="user">Standard User</option>
                            </select>

                            <p v-show="editMode == false">Password</p>
                            <p v-show="editMode == true">Password (Leave blank if you don't want to change)</p>
                            <input  type="password" id="password" class="input" v-model="form.password">
                        </div>
                        <br><hr class="modal_line">
                        <div class="model__footer">
                            <button class="btn mr-2 btn__close--modal" @click="closeModal()">
                                Cancel
                            </button>
                            <button type="submit" class="btn btn-secondary" v-show="editMode == false">Save</button>
                            <button type="submit" class="btn btn-secondary" v-show="editMode == true">Update</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </main>
</template>
