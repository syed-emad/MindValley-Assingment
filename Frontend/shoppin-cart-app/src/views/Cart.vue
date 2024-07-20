<template>
  <div class="px-10 space-y-5">
    <h1 class="text-3xl font-bold tracking-tight text-gray-900 sm:text-4xl">
      Shopping Cart
    </h1>
    <div class="w-full flex">
      <div class="w-3/5 space-y-5">
        <cart-item v-for="item in cart" :key="item.id" :item="item" />
      </div>
      <div class="w-2/5 flex justify-center">
        <div class="w-3/4 h-80 bg-gray-50 rounded-lg p-5 space-y-5">
          <h2 id="summary-heading" class="text-lg font-medium text-gray-900">
            Order summary
          </h2>
          <div class="flex items-center justify-between">
            <p class="text-sm text-gray-600">Total</p>
            <p class="text-sm font-medium text-gray-900">$99.00</p>
          </div>
          <div
            class="flex items-center justify-between border-t border-gray-200 pt-4"
          >
            <dt class="text-base font-medium text-gray-900">Order total</dt>
            <dd class="text-base font-medium text-gray-900">$112.32</dd>
          </div>
          <button
            @click="
              addToCart({
                id: 3,
                name: 'Product A',
                description: 'hello',
                image_url:
                  'https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg',
                price: '10.99',
                quantity: 1,
              })
            "
            type="submit"
            class="flex w-full px-8 py-3 items-center justify-center rounded-md bg-indigo-600 text-base font-medium text-white hover:bg-indigo-700"
          >
            Add to cart
          </button>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
import CartItem from "../components/CartItem.vue";
import { mapState, mapActions, mapGetters } from "vuex";

export default {
  components: {
    CartItem,
  },
  computed: {
    ...mapState(["cart"]),
  },
};
</script>
