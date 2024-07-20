<template>
  <div class="space-y-10 px-10">
    <div class="flex px-10 py-2 w-full justify-end items-center">
      <router-link :to="'/cart'">
        <img src="../assets/bag.png" class="h-10 w-10 cursor-pointer" />
      </router-link>
    </div>
    <h1 class="text-4xl font-bold">Products</h1>
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
