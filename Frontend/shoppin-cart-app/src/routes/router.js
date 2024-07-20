import { createRouter, createWebHistory } from "vue-router";
const routes = [
  { path: "", name: "home", component: () => import("../views/Products.vue") },
  {
    path: "/detail/:id",
    name: "product",
    component: () => import("../views/ProductDetail.vue"),
  },
  {
    path: "/cart",
    name: "cart",
    component: () => import("../views/Cart.vue"),
  },
  {
    path: "/success",
    name: "order-success",
    component: () => import("../views/Success.vue"),
  },
];
const router = createRouter({
  routes,
  history: createWebHistory(),
});

export default router;
