// import { createApp } from "vue";
import "./style.css";
// import App from "./App.vue";
import router from "./routes/router";
import { createApp } from "vue";
import { createStore } from "vuex";
import App from "./App.vue";
const store = createStore({
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
      state.cart.push(product);
      console.log("state", this.cart);
    },
  },
});

const app = createApp(App);
app.use(router);
app.use(store);
app.mount("#app");
