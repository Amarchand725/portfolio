<script setup>
    import { reactive, ref } from 'vue'
    import { useRouter } from 'vue-router'

    const router = useRouter()

    let form = reactive({
        email:'',
        password:'',
    })

    let error = ref('')

    const login = async() => {
        await axios.post('/api/login', form)
        .then(response =>{
            if(response.data.success){
                localStorage.setItem('token', response.data.data.token)
                router.push('/admin/home');
            }else{
                error.value = response.data.message;
            }
        })
    }
</script>

<template>
    <div>
        <!-- <form @submit.prevent="login">
            <span style="color:red" v-if="error">{{ error }}</span><br /><br />
            <input type="email" v-model="form.email"><br /><br />
            <input type="password" v-model="form.password"><br /><br />
            <button type="submit">Login</button>
        </form> -->

        <!-- <link href='https://fonts.googleapis.com/css?family=Open+Sans:700,600' rel='stylesheet' type='text/css'> -->

        <form @submit.prevent="login">
            <div class="box">
                <h1>ADMIN LOGIN</h1>
                <h4 style="color:red" v-if="error">{{ error }}</h4>
                <input type="email" name="email" v-model="form.email" class="email" />
                <input type="password" name="email" v-model="form.password" class="email" />
                <button class="btn" type="submit">Sing In</button>
                <!-- End Btn -->
                <a href="#">
                    <div id="btn2">Sign Up</div>
                </a>
                <!-- End Btn2 -->
                <p>Forgot your password? <u style="color:#f1c40f;">Click Here!</u></p>
            </div>
            <!-- End Box -->
        </form>


    </div>
</template>
<style>
    p{
    font-size:12px;
    text-decoration: none;
    color:#525252;
    }

    h1{
    font-size:1.5em;
    color:#525252;
    }

    .box{
        background:white;
        width:300px;
        border-radius:6px;
        margin: 0 auto 0 auto;
        padding:0px 0px 40px 0px;
        border: #2980b9 4px solid;
        text-align: center;
        margin-top: 50px;
    }

    .email{
    background:#ecf0f1;
    border: #ccc 1px solid;
    border-bottom: #ccc 2px solid;
    padding: 8px;
    width:250px;
    color:#AAAAAA;
    margin-top:10px;
    font-size:1em;
    border-radius:4px;
    }

    .password{
    border-radius:4px;
    background:#ecf0f1;
    border: #ccc 1px solid;
    padding: 8px;
    width:250px;
    font-size:1em;
    }

    .btn{
    background:#2ecc71;
    width:125px;
    padding-top:5px;
    padding-bottom:5px;
    color:white;
    border-radius:4px;
    border: #27ae60 1px solid;

    margin-top:20px;
    margin-bottom:20px;
    float:left;
    margin-left:16px;
    font-weight:800;
    font-size:0.8em;
    }

    .btn:hover{
    background:#2CC06B;
    }

    #btn2{
    float:left;
    background:#3498db;
    width:125px;  padding-top:5px;
    padding-bottom:5px;
    color:white;
    border-radius:4px;
    border: #2980b9 1px solid;

    margin-top:20px;
    margin-bottom:20px;
    margin-left:10px;
    font-weight:800;
    font-size:0.8em;
    }

    #btn2:hover{
    background:#3594D2;
    }
</style>
