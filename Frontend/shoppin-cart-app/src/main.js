// import { createApp } from "vue";
import "./style.css";
// import App from "./App.vue";
import router from "./routes/router";
// import { createStore } from "vuex";

// const store = createStore({
//   state() {
//     return {
//       count: 0,
//     };
//   },
//   mutations: {
//     increment(state) {
//       state.count++;
//     },
//   },
// });
// const app = createApp(App).use(router).mount("#app");
// app.use(store);
import { createApp } from "vue";
import { createStore } from "vuex";
import App from "./App.vue";
// Create a new store instance.
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
