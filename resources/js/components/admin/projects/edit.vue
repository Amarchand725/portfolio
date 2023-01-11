<script setup>
    import Base from '../layouts/base.vue'
    import { onMounted } from 'vue'

    onMounted(async() => {
        getSingleProject()
    })

    const props = defineProps({
        id:{
            type:String,
            default:""
        }
    })

    const getSingleProject = async() =>{
        let response = await axios.get(`/api/admin/project/edit/${props.id}`)
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
            <!--===================EDIT PROJECT ====================-->
            <section class="about section" id="project">
                <div class="about_container">
                    <div class="titlebar">
                        <div class="titlebar_item">
                            <h1>Edit Project</h1>
                        </div>
                        <div class="titlebar_item">
                            <div class="btn btn-secondary">
                                Update Project
                            </div>
                        </div>
                    </div>
                    <div class="card_wrapper">
                        <div class="wrapper_left">
                            <div class="card">

                                <p>Title</p>
                                <input type="text" class="input" />

                                <p>Description</p>
                                <textarea cols="10" rows="5"  ></textarea>

                                <p>Link</p>
                                <input type="text" class="input" />

                            </div>
                        </div>

                        <div class="wrapper_right ">
                            <div class="card">
                                <div class="project_img-container">
                                 <img src="/assets/img/avatar.jpg" alt="" class="project_img">
                                </div>
                                <br>
                                <input type="file" id="fileimg" />
                                <br><br><br>
                            </div>
                        </div>

                    </div>
                    <div class="titlebar">
                        <div class="titlebar_item">

                        </div>
                        <div class="titlebar_item">
                            <div class="btn btn-secondary">
                                Update Project
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    </main>
</template>
