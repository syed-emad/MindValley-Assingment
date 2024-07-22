<template>
  <div class="h-40 w-full flex bg-gray-50 rounded-lg p-5">
    <div class="flex space-x-5">
      <img :src="item.image_url" class="object-contain" />
      <div class="flex flex-col">
        <p class="text-md font-medium text-gray-600">{{ item.name }}</p>
        <p id="price" class="text-md font-medium">{{ item.price }}$</p>
        <p id="quantity" class="text-md font-medium">
          Quantity: {{ item.orderQuantity }}
        </p>
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
};
</script>
