<template>
  <h1 class="text-4xl font-bold">Products</h1>
  <div
    class="grid grid-cols-1 gap-x-6 gap-y-10 md:grid-cols-2 lg:grid-cols-4 xl:grid-cols-4 bg-pink-900"
  >
    <product-item
      v-for="product in products"
      :key="product.id"
      :product="product"
    />
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
      products: [
        {
          id: 1,
          name: "Shirt",
          price: "300$",
          imageUrl: "../assets/weatherly_logo.png",
        },
        {
          id: 1,
          name: "Shirt",
          price: "300$",
          imageUrl: "../assets/weatherly_logo.png",
        },
      ],
    };
  },
};
</script>
