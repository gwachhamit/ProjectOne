<template>
  <div class="login">
    <LoginForm />
  </div>
</template>

<script>
// @ is an alias to /src
import LoginForm from "@/components/LoginForm.vue";

export default {
  name: "home",
  components: {
    LoginForm
  }
};
</script>

<style scoped>
.login {
  vertical-align: center;
}
</style>
