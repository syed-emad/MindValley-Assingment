import { createRouter, createWebHistory } from "vue-router";
const routes = [
  { path: "", name: "home", component: () => import("../views/Products.vue") },
  {
    path: "/detail",
    name: "product",
    component: () => import("../views/ProductDetail.vue"),
  },
];
const router = createRouter({
  routes,
  history: createWebHistory(),
});

export default router;
