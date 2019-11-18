<template>
    <PermissionDenied v-if="permissionDenied" />
    <div v-else class="container">
        <div class="row mt-5">
          <div class="col-md-12">
            <div class="card">
              <div class="card-header">
                <h3 class="card-title"> <i class="fa fa-users"></i> Users</h3>

                <div class="card-tools">
                    <button class="btn btn-success" @click="createPage">Add New <i class="fa fa-user-plus fa-fw"></i> </button>
                </div>
              </div>
              <!-- /.card-header -->
              <div class="card-body table-responsive p-0">
                <table class="table table-hover">
                  <tbody><tr>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Type</th>
                    <th>Action</th>
                  </tr>
                  <tr v-for="(user,index) in users" :key="index">
                    <td>{{ user.name }}</td>
                    <td>{{ user.email }}</td>
                    <td><span class="tag tag-success">{{ user.type }}</span></td>
                    <td>
                        <a href="#" @click="editPage(user.id)" title="Edit" class="btn btn-primary btn-xs">Edit</a> | 
                        <a href="#" @click="deleteUser(user.id)" title="Delete" class="btn btn-danger btn-xs">Delete</a>
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

    computed: {
        ...mapGetters('users', [
            'users',
            'permissionDenied',
        ]),
    },

    mounted(){
        this.getUserList()
    },
    methods:{
        ...mapActions('users', [
            'fetchUsers',
        ]),

        getUserList(){
            this.fetchUsers()
        },

        deleteUser(id){
            this.$store.dispatch('users/deleteUser', { id })
            .then(
                Toast.fire({
                  type: 'success',
                  title: 'Record deleted'
                }),
                console.log("User Deleted")
            )
            .catch((error) => {
                Toast.fire({
                    type: 'error',
                    title: 'Sorry! Record not deleted, <br> Please try again.'
                    })
                console.log(error)
            })
        },

        createPage(){
            this.$router.push({name:"create-user"})
        },

        editPage(id){
            this.$router.push({name:"edit-user", params:{id:id}})
        }
    }
}
</script>

<style>

</style>


