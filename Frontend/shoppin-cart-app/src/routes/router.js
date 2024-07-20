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
];
const router = createRouter({
  routes,
  history: createWebHistory(),
});

export default router;
