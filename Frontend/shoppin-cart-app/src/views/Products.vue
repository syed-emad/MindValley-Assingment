<template>
  <div class="space-y-10 px-10 py-5">
    <div class="flex w-full justify-between">
      <h1 class="text-4xl font-bold">Products</h1>

      <router-link :to="'/cart'">
        <h1 class="font-bold">Cart</h1>
      </router-link>
    </div>
    <div
      class="mt-5 grid grid-cols-1 gap-x-6 gap-y-10 md:grid-cols-2 lg:grid-cols-4 xl:grid-cols-5"
    >
      <product-item
        v-for="product in products"
        :key="product.id"
        :product="product"
      />
    </div>
  </div>
</template>

<script>
import ProductItem from "../components/ProductItem.vue";

export default {
  components: {
    ProductItem,
  },
  data() {
    return {
      products: [],
    };
  },
  mounted() {
    this.fetchProducts();
  },
  methods: {
    fetchProducts() {
      fetch("http://localhost:4000/api/products")
        .then((res) => res.json())
        .then((data) => (this.products = data.data))
        .catch((err) => console.log(err.message));
    },
  },
};
</script>
