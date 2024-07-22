<template>
  <div class="flex px-10 py-5 w-full justify-between items-center">
    <img
      @click="goBack()"
      src="../assets/back.png"
      class="h-10 w-10 cursor-pointer"
    />
    <router-link :to="'/cart'">
      <img src="../assets/bag.png" class="h-10 w-10 cursor-pointer" />
    </router-link>
  </div>
  <div
    class="w-full flex flex-col md:flex-row lg:h-screen px-10 space-y-5 md:space-y-0"
  >
    <div class="w-full md:w-1/2 flex items-center">
      <div class="space-y-5 w-full">
        <h1 id="product" class="text-3xl font-bold text-gray-900 sm:text-4xl">
          {{ product.name }}
        </h1>
        <p id="price" class="text-lg text-gray-900 sm:text-xl">
          {{ product.price }}$
        </p>
        <p class="text-base text-gray-500 w-2/3">
          {{ product.description }}
        </p>
        <div class="w-3/4 space-y-5">
          <div class="w-3/4 flex items-center">
            <div class="flex items-center space-x-4">
              <button
                @click="decrementOrderQuantity"
                class="px-3 py-1 bg-gray-200 rounded-md text-gray-700"
              >
                -
              </button>
              <input
                type="text"
                class="w-12 text-center bg-gray-100 rounded-md"
                v-model.number="orderQuantity"
              />
              <button
                @click="incrementOrderQuantity"
                class="px-3 py-1 bg-gray-200 rounded-md text-gray-700"
              >
                +
              </button>
            </div>
          </div>
          <button
            @click="addToCart(product)"
            type="submit"
            :class="{
              'bg-indigo-600 hover:bg-indigo-700': orderQuantity > 0,
              'bg-gray-300 cursor-not-allowed': orderQuantity === 0,
            }"
            class="flex w-full px-8 py-3 items-center justify-center rounded-md btext-base font-medium text-white"
          >
            Add to cart
          </button>
        </div>
        <p
          v-if="addedToCart"
          class="text-green-900 absolute font-semibold transition duration-300 ease-in-out"
        >
          Item added to cart
        </p>
        <p v-if="product.quantity === 0" class="font-semibold">
          Sorry this product is out of stock
        </p>
      </div>
    </div>
    <div class="w-full md:w-1/2 p-10">
      <img :src="product.image_url" class="w-full h-full object-contain" />
    </div>
  </div>
</template>
<script>
export default {
  data() {
    return {
      product: {},
      addedToCart: false,
      orderQuantity: 0,
    };
  },
  mounted() {
    this.fetchProduct();
  },
  methods: {
    addToCart(product) {
      if (this.orderQuantity === 0) return;
      console.log("cart", this.$store.state.cart);
      product = { ...product, orderQuantity: this.orderQuantity };
      this.$store.commit("addToCart", product);
      console.log("after adding cart", this.$store.state.cart);
      this.orderQuantity = 0;
      this.addedToCart = true;
      setTimeout(() => {
        this.addedToCart = false;
      }, [2000]);
    },
    fetchProduct() {
      fetch(`http://localhost:4000/api/product/${this.$route.params.id}`)
        .then((res) => res.json())
        .then((data) => (this.product = data.data))
        .catch((err) => console.log(err.message));
    },
    goBack() {
      this.$router.go(-1);
    },
    incrementOrderQuantity() {
      if (this.orderQuantity === this.product.quantity) return;
      this.orderQuantity++;
    },
    decrementOrderQuantity() {
      if (this.orderQuantity === 0) return;
      this.orderQuantity--;
    },
  },
};
</script>
