<template>
<div>
<section class="content-header">
    <h1>Edit Permission</h1>     
</section>

<section class="content">
    <div class="box">
        <div class="box-body">
            <div class="row justify-content-center">
                <div class="col-md-4 col-md-offset-4">
                    <form @submit.prevent="updatePermission(permission.id, permission.name)">
                        <div class="form-group">
                            <label for="name">Permission</label>
                            <input type="text" class="form-control" v-model="permission.name" name="name" 
                            placeholder="Enter Permission">
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
            permission:{
                id:null,
                name:'',
            },
            db_errors:null,
            loading:false,
        }
    },
    computed:{
        ...mapGetters('permissions', [
            'permissionDetail',
        ]),
    },
    
    mounted(){
        this.fetchPermissionDetail({id:this.$route.params.id})
        .then((res) => {
            this.permission = res
            this.permission.id = res.id
        })
        this.fetchPermissions()
    },

    methods:{
        ...mapActions('permissions', [
            'fetchPermissionDetail',
            'updatePermission',
        ]),
        updatePermission(id, name ){
            this.loading = true
            this.$store.dispatch('permissions/updatePermission', { id, name })
            .then((res)=>{
                Toast.fire({
                  type: 'success',
                  title: 'Record updated successfully'
                })
                this.loading = false
                this.$router.push({ name: 'permissions'})
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


