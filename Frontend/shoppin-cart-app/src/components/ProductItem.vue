<template>
  <div id="product-item" class="h-80 w-full">
    <div
      id="image-area"
      class="h-3/4 flex items-center justify-center bg-gray-100 rounded-sm"
    >
      <img :src="product.imageUrl" class="object-contain w-3/4 h-3/4" />
    </div>
    <div id="detail-area" class="h-1/4 py-2">
      <div class="flex justify-between">
        <p class="text-sm font-medium text-gray-600">{{ product.name }}</p>
        <p class="text-sm font-medium">{{ product.price }}</p>
      </div>
    </div>
  </div>
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
