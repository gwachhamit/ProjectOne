<template>
  <div class="login-page">
  <div class="login-box">
  <div class="login-logo">
    <a href="../../index2.html"><b>Admin</b>Panel</a>
  </div>
  <!-- /.login-logo -->
  <div class="card">
    <div class="card-body login-card-body">
      <p class="login-box-msg">Sign in</p>

      <form @submit.prevent="login(credentials.username, credentials.password)">
        <div class="input-group mb-3">
          <input type="email" v-model="credentials.username" class="form-control" placeholder="Email" autofocus>
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-envelope"></span>
            </div>
          </div>
        </div>
        <div class="input-group mb-3">
          <input type="password" v-model="credentials.password" class="form-control" placeholder="Password">
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-lock"></span>
            </div>
          </div>
        </div>
        <div class="form-group row" v-if="error">
            <p class="warning">
                {{ error }}
            </p>
        </div>
        <div class="row">
          <div class="col-8">
            <div class="icheck-primary">
              <input type="checkbox" id="remember">
              <label for="remember">
                Remember Me
              </label>
            </div>
          </div>
          <!-- /.col -->
          <div class="col-4">
            <button type="submit" class="btn btn-primary btn-block col-md-12">Sign In
              <half-circle-spinner v-if="loading" class="spinner"
                      :animation-duration="1000"
                      :size="22"
                      color="#ffff"
                      />
            </button>
          </div>
          <!-- /.col -->
        </div>
      </form>

      <p class="mb-1">
        <a href="forgot-password.html">I forgot my password</a>
      </p>
    </div>
    <!-- /.login-card-body -->
  </div>
</div>
<!-- /.login-box -->
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
