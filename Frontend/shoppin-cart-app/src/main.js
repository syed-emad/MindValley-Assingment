// import { createApp } from "vue";
import "./style.css";
// import App from "./App.vue";
import router from "./routes/router";
import { computed, createApp } from "vue";
import { createStore } from "vuex";
import App from "./App.vue";
export const store = createStore({
  state() {
    return {
      count: 0,
      cart: [],
    };
  },
  mutations: {
    increment(state) {
      state.count++;
      console.log("state", this.count);
    },
    addToCart(state, product) {
      let cartItem = state.cart.find((item) => item.id === product.id);
      console.log("CartItem", product);
      if (cartItem) {
        console.log("here");
        cartItem.orderQuantity += product.orderQuantity;
      } else {
        console.log("else");
        state.cart.push({
          ...product,
        });
      }
      console.log("state", this.cart);
    },
  },
  getters: {
    getCartItems(state) {
      return state.cart;
    },
    cartTotal: (state) => {
      const total2 = state.cart.reduce((total, product) => {
        const price = parseFloat(product.price);
        console.log("price", price, product.quantity, total);
        return total + price * product.orderQuantity;
      }, 0);
      console.log("total", total2);
      return total2;
    },
  },
});

const app = createApp(App);
app.use(router);
app.use(store);
app.mount("#app");
