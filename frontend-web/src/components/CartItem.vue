<template>
  <div class="w-full flex bg-gray-50 rounded-lg p-5">
    <div
      class="w-full flex lg:space-x-5 flex-col items-center lg:flex-row lg:items-start"
    >
      <img :src="item.image_url" class="object-contain w-40 h-40" />
      <div class="flex flex-col items-center lg:items-start">
        <p class="text-md font-medium text-gray-600">{{ item.name }}</p>
        <p id="price" class="text-md font-medium">{{ item.price }}$</p>
        <p id="quantity" class="text-md font-medium">
          Quantity: {{ item.orderQuantity }}
        </p>
        <div class="flex items-center" @click="removeFromCart(item.id)">
          <img src="../assets/delete.png" class="object-contain w-5 h-5" />
          <p>Remove</p>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
export default {
  props: {
    item: {
      type: Object,
      required: true,
    },
  },
  methods: {
    removeFromCart(productId) {
      console.log(productId);
      this.$store.commit("removeFromCart", productId);
    },
  },
};
</script>
