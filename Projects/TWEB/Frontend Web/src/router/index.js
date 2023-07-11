import Vue from "vue";
import VueRouter from "vue-router";
import Lessons from "../views/Lessons.vue";

Vue.use(VueRouter);

const routes = [
  {
    path: "/",
    name: "Lessons",
    component: Lessons
  },
  {
    path: "/history",
    name: "history",
    component: () => import("../views/History.vue")
  },
  {
    path: "/lessons",
    name: "Lessons",
    component: () => import("../views/Lessons.vue")
  },
  {
    path: "/teachers",
    name: "Teachers",
    component: () => import("../views/Teachers.vue")
  },
  {
    path: "/control panel",
    name: "Control panel",
    component: () => import("../views/Control panel.vue")
  },
  {
    path: "/login",
    name: "Login",
    component: () => import("../views/Login.vue")
  }
];

const router = new VueRouter({
  mode: "history",
  base: process.env.BASE_URL,
  routes
});

export default router;
