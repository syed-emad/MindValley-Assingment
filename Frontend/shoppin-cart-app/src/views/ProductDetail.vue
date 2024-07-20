<template>
  <div class="w-full flex lg:h-screen px-10">
    <div class="w-1/2 flex items-center">
      <div class="space-y-5">
        <h1 class="text-3xl font-bold text-gray-900 sm:text-4xl">
          {{ product.name }}
        </h1>
        <p class="text-lg text-gray-900 sm:text-xl">{{ product.price }}$</p>
        <p class="text-base text-gray-500 w-2/3">
          {{ product.description }}
        </p>
        <div class="w-3/4">
          <button
            @click="addToCart(product)"
            type="submit"
            class="flex w-full px-8 py-3 items-center justify-center rounded-md bg-indigo-600 text-base font-medium text-white hover:bg-indigo-700"
          >
            Add to cart
          </button>
        </div>
      </div>
    </div>
    <div class="w-1/2">
      <img :src="product.image_url" class="w-full h-full object-contain" />
    </div>
  </div>
</template>
<script>
export default {
  data() {
    return {
      product: {},
    };
  },
  mounted() {
    this.fetchProduct();
  },
  methods: {
    addToCart(product) {
      this.$store.commit("addToCart", product);
      console.log("asd", this.$store.state.cart);
    },
    fetchProduct() {
      console.log(this.$route.params.id);
      fetch(`http://localhost:4000/api/product/${this.$route.params.id}`)
        .then((res) => res.json())
        .then((data) => (this.product = data.data))
        .catch((err) => console.log(err.message));
    },
  },
};
</script>
