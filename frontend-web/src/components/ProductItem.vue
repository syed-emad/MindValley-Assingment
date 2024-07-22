<template>
  <router-link :to="'/detail/' + product.id">
    <div id="product-item" class="h-80 w-full">
      <div
        id="image-area"
        class="h-3/4 flex items-center justify-center bg-gray-100 rounded-sm hover:scale-105 hover:opacity-80 cursor-pointer transition duration-300 ease-in-out"
      >
        <img :src="product.image_url" class="object-contain w-3/4 h-3/4" />
      </div>
      <div id="detail-area" class="h-1/4 py-2">
        <div class="flex justify-between">
          <div class="flex flex-col">
            <p class="text-sm font-medium text-gray-600">
              {{ product.name }}
            </p>
            <p id="quantity" class="text-sm font-medium text-gray-600">
              Quantity: {{ product.quantity }}
            </p>
          </div>
          <p id="pricing" class="text-sm font-medium">{{ product.price }}$</p>
        </div>
      </div>
    </div>
  </router-link>
</template>

<script>
export default {
  props: {
    product: {
      type: Object,
      required: true,
    },
  },
};
</script>
