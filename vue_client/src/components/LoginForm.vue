<template>
  <div class="login row justify-content-center">
      <div class="col-md-4">
          <div class="card">
              <div class="card-header">
                  Login
              </div>
              <div class="card-body">
                  <form @submit.prevent="login(credentials.username, credentials.password)">
                      <div class="form-group row">
                          <label for="email">Email:</label>
                          <input type="email" v-model="credentials.username" class="form-control" placeholder="Email Address">
                      </div>
                      <div class="form-group row">
                          <label for="password">Password:</label>
                          <input type="password" v-model="credentials.password" class="form-control" placeholder="Password">
                      </div>
                      <div class="form-group row">
                        <button type="submit" class="btn btn-primary col-md-12">Login
                          <half-circle-spinner v-if="loading" class="spinner"
                                  :animation-duration="1000"
                                  :size="22"
                                  color="#ffff"
                                  />
                        </button>
                      </div>
                      <div class="form-group row" v-if="error">
                          <p class="warning">
                              {{ error }}
                          </p>
                      </div>
                  </form>
              </div>
          </div>
      </div>
  </div>
</template>

<script>
export default {
  name: "Login",
  data() {
    return{
      credentials: {
        username: null,
        password: null
      },
      error: null,
      loading:false,
    }
  },

  methods:{
    login(username, password) {
      this.error = null,
      this.loading = true,
      this.$store.dispatch("auth/login", { username, password })
        .then( res => {
          this.loading=false
          this.$router.push({ name: "dashboard"})
          console.log(res)
        })
        .catch(error=> {
          this.loading=false
            this.error = error.message
          }
        )
    }
  }
};
</script>

<style>
  
</style>
