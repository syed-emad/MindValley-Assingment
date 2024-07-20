<template>
  <div class="flex px-10 py-5 w-full justify-between items-center">
    <img
      @click="goBack()"
      src="../assets/back.png"
      class="h-10 w-10 cursor-pointer"
    />
  </div>
  <div class="px-10 space-y-5">
    <h1 class="text-3xl font-bold tracking-tight text-gray-900 sm:text-4xl">
      Shopping Cart
    </h1>
    <div class="w-full flex flex-col md:flex-row space-y-5 md:space-y-0">
      <div class="w-full md:w-3/5 space-y-5">
        <input
          v-model="userEmail"
          type="email"
          placeholder="Enter your email"
          class="w-full px-4 py-2 rounded-md border-2"
        />
        <cart-item v-for="item in cart" :key="item.id" :item="item" />
      </div>
      <div class="w-full md:w-2/5 flex justify-center">
        <div class="w-full md:w-3/4 h-80 bg-gray-50 rounded-lg p-5 space-y-5">
          <h2 id="summary-heading" class="text-lg font-medium text-gray-900">
            Order summary
          </h2>
          <div class="flex items-center justify-between">
            <p class="text-sm text-gray-600">Total</p>
            <p class="text-sm font-medium text-gray-900">${{ cartTotal }}</p>
          </div>
          <div class="flex items-center justify-between">
            <p class="text-sm text-gray-600">Delivery</p>
            <p class="text-sm font-medium text-gray-900">$0.00</p>
          </div>
          <div
            class="flex items-center justify-between border-t border-gray-200 pt-4"
          >
            <dt class="text-base font-medium text-gray-900">Order total</dt>
            <dd class="text-base font-medium text-gray-900">
              ${{ finalBill }}
            </dd>
          </div>
          <button
            @click="submitOrder()"
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
import { mapState, mapGetters } from "vuex";
import axios from "axios";
const axiosInstance = axios.create({
  baseURL: "http://localhost:4000/api/", // Adjust base URL as per your backend
});
export default {
  data() {
    return {
      finalBill: 0,
      deliveryFee: 0,
      userEmail: "",
    };
  },
  mounted() {
    this.finalBill = this.cartTotal + this.deliveryFee;
  },
  components: {
    CartItem,
  },
  computed: {
    ...mapState(["cart"]),
    ...mapGetters(["cartTotal"]),
  },
  methods: {
    goBack() {
      this.$router.go(-1);
    },
    async submitOrder() {
      let payload = {
        items: this.cart.map((item) => {
          return {
            orderQuantity: item.orderQuantity,
            price: parseFloat(item.price),
            product_id: item.id,
          };
        }),
        orderAmount: this.finalBill,
        userEmail: "this.userEmail",
      };

      try {
        const response = await axios.post("http://localhost:4000/api/order", {
          order: payload,
        });
        if (response.status === 201) {
          // Redirect to a new page
          this.$router.push("/success");
        } else {
          console.error("Failed to submit order.");
        }
        console.log("Response:", response.data);
      } catch (error) {
        console.error("Error:", error);
      }
    },
  },
};
</script>
