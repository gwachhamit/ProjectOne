<template>
<div>
<section class="content-header">
    <h1>Edit Role</h1>     
</section>

<section class="content">
    <div class="box">
        <div class="box-body">
            <div class="row justify-content-center">
                <div class="col-md-4 col-md-offset-4">
                    <form @submit.prevent="updateRole(role.name, role.permissions)">
                        <div class="form-group">
                            <label for="exampleInputEmail1">Role</label>
                            <input type="text" class="form-control" v-model="role.name" name="name" 
                            placeholder="Enter role">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputEmail1">Permissions</label>
                            <div class="form-check" v-for="(permission,key) in permissions" :key="key">
                                <input type="checkbox" class="form-check-input" :id="key" v-model="role.permissions" :value="permission.id">
                                <label class="form-check-label" :for="key">{{permission.name}}</label>
                            </div>
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
import { HalfCircleSpinner } from 'epic-spinners'
import { mapGetters, mapActions } from 'vuex';
export default {
    components:{
        HalfCircleSpinner
    },
    data(){
        return{
            role:{
                id:null,
                name:'',
                permissions:[],
            },
            db_errors:null,
            loading:false,
        }
    },
    computed:{
        ...mapGetters('roles', [
            'roleDetail',
            'permissions',
        ]),
    },
    
    mounted(){
        this.fetchRoleDetail({id:this.$route.params.id})
        .then((res) => {
            this.role = res
            this.role.id = res.id
        })
        this.fetchPermissions()
    },

    methods:{
        ...mapActions('roles', [
            'fetchRoleDetail',
            'updateRole',
            'fetchPermissions',
        ]),
        updateRole(id, name, permissions ){
            this.loading = true
            this.$store.dispatch('roles/updateRole', { id, name, permissions })
            .then((res)=>{
                Toast.fire({
                  type: 'success',
                  title: 'Record updated successfully'
                })
                this.loading = false
                this.$router.push({ name: 'roles'})
                console.log(res)
            })
            .catch((error)=>{
                Toast.fire({
                    type: 'error',
                    title: 'Sorry! Record not updated, <br> Please try again.'
                    })
                this.loading = false
                console.log(error)
            })
               
        },
    }
}
</script>

<style>
    .spinner {
        float:right;
    }
</style>


