import Vue from "vue";
import Vuex from "vuex";
import Storage from "vue-ls";

const options = {
  namespace: "vuejs__", // key prefix
  name: "ls", // name variable Vue.[ls] or this.[$ls],
  storage: "session" // storage name session, local, memory
};

Vue.use(Storage, options);
Vue.use(Vuex);

// Used to store common application data such as user data upon successful login
export default new Vuex.Store({
  state: {
    userSession: {
      userId: -1,
      name: "",
      surname: "",
      administrator: false
    }
  },
  mutations: {
    saveUserSession(state, newSession) {
      state.userSession = newSession;
    },
    resetUserSession(state) {
      state.userSession = {
        userId: -1,
        name: "",
        surname: "",
        administrator: false
      };
    }
  },
  actions: {},
  modules: {}
});
