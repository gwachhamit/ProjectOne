<template>
<div>
<section class="content-header">
    <h1>Add Permission</h1>     
</section>

<section class="content">
    <div class="box">
        <div class="box-body">
            <div class="row justify-content-center">
                <div class="col-md-4 col-md-offset-4">
                    <form @submit.prevent="createPermission(permission.name, permission.permissions)">
                        <div class="form-group">
                            <label for="exampleInputEmail1">Permission</label>
                            <input type="text" class="form-control" v-model="permission.name" name="name" 
                            placeholder="Enter permission">
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
import { mapActions } from 'vuex';

export default {
    components:{
        HalfCircleSpinner
    },
    data(){
        return{
            permission:{
                name:'',
            },
            loading:false,
        }
    },

    methods:{
        ...mapActions('permissions', [
            'createPermission',
        ]),
        createPermission(permission ){
            this.loading = true
            this.$store.dispatch('permissions/createPermission', { permission })
            .then((res)=>{
                Toast.fire({
                  type: 'success',
                  title: 'Record added successfully'
                })
                this.loading = false
                this.$router.push({name:'permissions'})
                console.log(res)
            })
            .catch((error)=>{
                Toast.fire({
                    type: 'error',
                    title: 'Sorry! Record not created, <br> Please try again.'
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


