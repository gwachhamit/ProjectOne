<template>
    <PermissionDenied v-if="permissionDenied" />
    <div v-else class="container">
        <div class="row mt-5">
          <div class="col-md-12">
            <div class="card">
              <div class="card-header">
                <h3 class="card-title"> <i class="fa fa-users"></i> Roles</h3>

                <div class="card-tools">
                    <button class="btn btn-success" @click="createPage">Add New </button>
                </div>
              </div>
              <!-- /.card-header -->
              <div class="card-body table-responsive p-0">
                <table class="table table-hover">
                  <tbody><tr>
                    <th>Name</th>
                    <th>Action</th>
                  </tr>
                  <tr v-for="(role,index) in roles" :key="index">
                    <td>{{ role.name }}</td>
                    <td>
                        <a href="#" @click="editPage(role.id)" title="Edit" class="btn btn-primary btn-xs">Edit</a> | 
                        <a href="#" @click="deleteRole(role.id)" title="Delete" class="btn btn-danger btn-xs">Delete</a>
                    </td>
                  </tr>
                </tbody></table>
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->
          </div>
        </div>

    </div>
</template>

<script>
import { mapGetters, mapActions } from 'vuex'
import PermissionDenied from "@/components/PermissionDenied.vue";
export default {
    components:{
        PermissionDenied,
    },
    data(){
        return{
        }
    },

    computed: {
        ...mapGetters('roles', [
            'roles',
            'permissionDenied',
        ]),
    },
    mounted(){
        this.getRoleList()
    },
    methods:{
        ...mapActions('roles', [
            'fetchRoles',
        ]),

        getRoleList(){
            this.fetchRoles()
        },

        deleteRole(id){
            this.$store.dispatch('roles/deleteRole', { id })
            .then((res) => {
                Toast.fire({
                  type: 'success',
                  title: 'Record deleted'
                })
                console.log(res)
            })
            .catch((error) => {
                Toast.fire({
                    type: 'error',
                    title: 'Sorry! Record not deleted, <br> Please try again.'
                    })
                console.log(error)
            })
        },

        createPage(){
            this.$router.push({name:"create-role"})
        },
        editPage(id){
            this.$router.push({name:"edit-role", params:{id:id}})
        }
    }
}
</script>

<style>

</style>


