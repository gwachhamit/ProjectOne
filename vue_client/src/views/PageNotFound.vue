<template>
    <div class="dashboard">
        <p>Page Not Found</p>
        <div class="dashboard-cards">
            <router-link :to="{name:'dashboard'}">Go to Dashboard.</router-link>
        </div>
    </div>
</template>

<script>
export default {
  name: 'page-not-found',
};
</script>
