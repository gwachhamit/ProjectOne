<template>
<div>
<section class="content-header">
    <h1>Edit User</h1>     
</section>

<section class="content">
    <div class="box">
        <div class="box-body">
            <div class="row justify-content-center">
                <div class="col-md-4 col-md-offset-4">
                    <form @submit.prevent="createUser(user.name, user.email, user.password, user.confirm_password, user.role, user.photo)">
                        <div class="form-group">
                            <label for="name">Name</label>
                            <input type="text" class="form-control" v-model="user.name" name="name" 
                            placeholder="Enter Name" required>
                        </div>
                        <div class="form-group">
                            <label for="email">Email</label>
                            <input type="email" class="form-control" v-model="user.email" name="email" 
                            placeholder="Enter Email" required>
                        </div>
                        <div class="form-group">
                            <label for="password">Password</label>
                            <input type="password" class="form-control" v-model="user.password" name="password" 
                            placeholder="Enter Password">
                            <small v-if="db_errors != null && db_errors['password']" class="error-message">{{db_errors['password'][0]}}</small>
                        </div>
                        <div class="form-group">
                            <label for="exampleInputEmail1">Confirm Password</label>
                            <input type="password" class="form-control" v-model="user.confirm_password" name="confirm_password" 
                            placeholder="Confirm Password">
                            <small v-if="db_errors != null && db_errors['confirm_password']" class="error-message">{{db_errors['confirm_password'][0]}}</small>
                        </div>
                        <div class="form-group">
                            <div v-if="!image">
                            <input class="hide" style="display:none;" type="file" @change="onPhotoChange" name="photo" ref="photo">
                            <button class="browse-img" type="button" @click="$refs.photo.click()">Upload Image</button>
                            </div>
                            <div v-else>
                                <button @click="removeImage"><i class="fas fa-times"></i></button>
                                <br>
                                <img :src="image" height="200px"/>
                            </div>
                            <small v-if="db_errors != null && db_errors['photo']" class="error-message">{{db_errors['photo'][0]}}</small>
                        </div>
                        <div class="form-group">
                            <label for="exampleInputEmail1">Role</label>
                            <select name="role" required v-model="user.role" class="form-control">
                                <option value="">Select a role</option>
                                <option  v-for="(role,key) in roleList" :value="role.id" :key="key">{{ role.name }}</option>
                            </select>
                        </div>
                        <button type="submit" class="btn btn-primary">Submit
                            <half-circle-spinner v-if="loading" class="spinner"
                                    :animation-duration="1000"
                                    :size="22"
                                    color="#ffff"
                                    />
                        </button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>
</div>
</template>

<script>
import { mapGetters, mapActions } from 'vuex';
export default {
    data(){
        return{
            user:{
                id:null,
                name:'',
                email:'',
                password:'',
                confirm_password:'',
                role:''
            },
            db_errors:null,
        }
    },
    computed:{
        ...mapGetters('users', [
            'userDetail',
            'roleList',
        ]),
    },
    
    mounted(){
        this.fetchUserDetail({id:this.$route.params.id})
        .then((res) => {
            this.user = res
            this.user.role = this.user.roleList[0].id
        })
        this.fetchGroupList()
    },

    methods:{
        ...mapActions('users', [
            'fetchUserDetail',
            'updateUser',
            'fetchRoleList',
        ]),
        updateUser(id, name,email,password, confirm_password, role, photo ){
            this.loading = true,
            // Var formData = new FormData();
            formData.append('photo', photo, photo.name);
            formData.append('name', name);
            formData.append('email', email);
            formData.append('password', password);
            formData.append('confirm_password', confirm_password);
            formData.append('role', role);
            this.$store.dispatch('users/updateUser', { formData })
            .then((res)=>{
                Toast.fire({
                  type: 'success',
                  title: 'Record added successfully'
                }),
                this.loading = false,
                this.$router.push({ name: 'users'})
                console.log(res)
            })
            .catch((error)=>{
                this.loading = false,
                this.db_errors = error.data
                
            })
                
        },

        onPhotoChange(e) {
            var files = e.target.files || e.dataTransfer.files;
            if (!files.length)
                return;
            this.createImage(files[0]);
            this.service.photo = files[0];
        },
        createImage(file) {
            // var image = new Image();
            var reader = new FileReader();
            var vm = this;

            reader.onload = (e) => {
                vm.image = e.target.result;
            };
            reader.readAsDataURL(file);
        },

        removeImage: function () {
            this.image = '';
        }
    }
}
</script>

<style>

</style>


