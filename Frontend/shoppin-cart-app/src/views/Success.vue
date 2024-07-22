<template>
  <div class="flex px-10 py-5 w-full justify-between items-center">
    <router-link :to="'/'">
      <p>Home</p>
    </router-link>
  </div>
  <div class="h-screen flex justify-center items-center">
    <div class="flex flex-col items-center space-y-10">
      <h1 class="text-3xl font-bold tracking-tight text-gray-900 sm:text-4xl">
        Thanks for orderings
      </h1>
      <p class="text-center">
        We appreciate your order, we’re currently processing it. So hang tight
        and we’ll send you confirmation very soon!
      </p>
      <p>Tracking Number</p>
      <p class="text-indigo-800 font-bold text-lg">{{ bookingId }}</p>
    </div>
  </div>
</template>
<script>
export default {
  data() {
    return { bookingId: null };
  },
  mounted() {
    this.bookingId = this.$route.query.bookingId;
  },
};
</script>
