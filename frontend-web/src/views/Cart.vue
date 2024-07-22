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
        <h2 class="text-lg font-medium text-gray-900">Contact Information</h2>
        <p class="block text-sm font-medium text-gray-700">Email address</p>
        <input
          id="email"
          v-model="userEmail"
          type="email"
          placeholder="Enter your email"
          class="w-full md:w-3/5 px-4 py-2 rounded-md border-2"
        />
        <h2 class="text-lg font-medium text-gray-900">Shipping Address</h2>
        <p class="block text-sm font-medium text-gray-700">Name</p>
        <input
          id="name"
          v-model="name"
          type="string"
          placeholder="Enter your full name"
          class="w-full md:w-3/5 px-4 py-2 rounded-md border-2"
        />

        <p class="block text-sm font-medium text-gray-700">Address</p>
        <input
          id="address"
          v-model="address"
          type="string"
          placeholder="Enter Address"
          class="w-full md:w-3/5 px-4 py-2 rounded-md border-2"
        />

        <p class="block text-sm font-medium text-gray-700">City</p>
        <input
          id="city"
          v-model="city"
          type="string"
          placeholder="Enter City"
          class="w-full md:w-3/5 px-4 py-2 rounded-md border-2"
        />

        <p class="block text-sm font-medium text-gray-700">Country</p>
        <input
          id="country"
          v-model="country"
          type="string"
          placeholder="Enter Country"
          class="w-full md:w-3/5 px-4 py-2 rounded-md border-2"
        />
        <p class="text-red-500">
          {{ errorMessage }}
        </p>
      </div>
      <div class="w-full md:w-2/5 flex justify-center">
        <div class="w-full md:w-3/4 rounded-lg p-5 space-y-5">
          <h2 id="summary-heading" class="text-lg font-medium text-gray-900">
            Order summary
          </h2>
          <cart-item v-for="item in cart" :key="item.id" :item="item" />
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
            :class="{
              'bg-indigo-600 hover:bg-indigo-700': cart.length > 0,
              'bg-gray-300 cursor-not-allowed': cart.length === 0,
            }"
            class="flex w-full px-8 py-3 items-center justify-center rounded-md text-base font-medium text-white"
          >
            Order Now
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
import { errorMessages } from "vue/compiler-sfc";

export default {
  data() {
    return {
      finalBill: 0,
      deliveryFee: 0,
      userEmail: "",
      address: "",
      city: "",
      name: "",
      country: "",
      errorMessage: "",
    };
  },
  mounted() {
    this.finalBill = this.cartTotal + this.deliveryFee;
    this.errorMessage = this.cart.length === 0 ? "No product in cart" : "";
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
      if (this.cart.length == 0) {
        this.errorMessage = "No Items in Cart";
        return;
      }
      if (
        this.userEmail.trim().length === 0 ||
        this.address.trim().length === 0 ||
        this.city.trim().length === 0 ||
        this.name.trim().length === 0 ||
        this.country.trim().length === 0
      ) {
        this.errorMessage = "Please fill in all fields in the form";
        return;
      }
      let payload = {
        items: this.cart.map((item) => {
          return {
            orderQuantity: item.orderQuantity,
            price: parseFloat(item.price),
            product_id: item.id,
          };
        }),
        orderAmount: this.finalBill,
        userEmail: this.userEmail,
        name: this.name,
        address: this.address,
        city: this.city,
        country: this.country,
      };

      try {
        const response = await axios.post("http://localhost:4000/api/order", {
          order: payload,
        });
        let data = response.data;
        console.log("response", response, response.cart_id);
        if (response.status === 201) {
          this.$store.commit("clearCart");
          this.$router.push(`/success?bookingId=${data.cart_id}`);
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
