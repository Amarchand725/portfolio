<script setup>
    import Base from '../layouts/base.vue'
    import { onMounted } from 'vue'

    onMounted(async() => {
        getProfile()
    })

    const getProfile = async() =>{
        let response = await axios.get('/api/admin/user/profile')
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
            <!--==================== PROFILE ====================-->
            <section class="about section" id="about">
                <div class="about_container">
                    <div class="titlebar">
                        <div class="titlebar_item">
                            <h1>My Profile</h1>
                        </div>
                        <div class="titlebar_item">
                            <div class="btn btn-secondary">
                                Save Changes
                            </div>
                        </div>
                    </div>
                    <div class="card_wrapper">
                        <div class="wrapper_left">
                            <div class="card">
                                <p>Full Name</p>
                                <input type="text" class="input" />

                                <p>Email</p>
                                <input type="email" class="input" />

                                <p>Experience (optional)</p>
                                <textarea cols="10" rows="5"  ></textarea>

                                <p>Password (leave blank if you don't want to change)</p>
                                <input type="password" class="input" />
                            </div>
                        </div>

                        <div class="wrapper_right ">
                            <div class="card">
                                <div class="avatar_profile">
                                 <img src="/assets/img/avatar.jpg" alt="" class="avatar_profile_img">
                                </div>
                                <input type="file" id="fileimg" />
                            </div>
                        </div>

                    </div>
                    <div class="titlebar">
                        <div class="titlebar_item">

                        </div>
                        <div class="titlebar_item">
                            <div class="btn btn-secondary">
                                Save Changes
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    </main>
</template>
