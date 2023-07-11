<template>
  <div id="app">
    <b-navbar class="shadow-sm" toggleable="lg" type="light" variant="white">
      <b-navbar-brand class="text-center" to="/"
        ><b-icon icon="book-half"></b-icon> PriLESS</b-navbar-brand
      >
      <b-navbar-toggle target="nav-collapse"></b-navbar-toggle>
      <b-collapse id="nav-collapse" is-nav>
        <!-- Left side of the navbar -->
        <b-navbar-nav>
          <b-nav-item to="Lessons" exact exact-active-class="active primary"
            >Lessons</b-nav-item
          > 
          <b-nav-item to="History" exact exact-active-class="active"
            >History</b-nav-item
          >
          <!-- Show administrator specific sections only if the user is an administrator -->
          <b-nav-item v-if="this.$store.state.userSession.administrator" to="Control panel" exact exact-active-class="active">Control panel</b-nav-item>

        </b-navbar-nav>

        <!-- Right side of the navbar -->
        <b-navbar-nav class="ml-auto">
          <!-- Login button will be shown only if the user hasn't been already authenticated -->
          <b-nav-item
            variant="primary"
            class="px-4"
            to="Login"
            v-if="this.$store.state.userSession.userId == -1"
            exact-active-class="active"
            >Login</b-nav-item
          >
          <!-- Logout button will be shown only if the user has been already authenticated -->
          <b-nav-item-dropdown
            v-if="this.$store.state.userSession.userId != -1"
            text="Account"
            right
          >
            <b-dropdown-text v-if="this.$store.state.userSession.administrator"
              >Administrator</b-dropdown-text
            >
            <b-dropdown-text v-else>{{
              this.$store.state.userSession.name +
                " " +
                this.$store.state.userSession.surname
            }}</b-dropdown-text>
            <b-dropdown-divider></b-dropdown-divider>
            <b-dropdown-item-button @click="logout"
              >Logout</b-dropdown-item-button
            >
          </b-nav-item-dropdown>
        </b-navbar-nav>
      </b-collapse>
    </b-navbar>

    <b-overlay :show="state.pending" rounded="sm">
      <router-view />
    </b-overlay>
  </div>
</template>

<style lang="scss">
.navbar-brand {
  font-size: 18.5pt;
}

.nav-item {
  font-size: 14pt;
}

body {
  background-color: #fafafa;
}

#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
}
</style>

<script>
export default {
  name: "App",
  data() {
    return {
      state: {
        data: null,
        pending: false,
        error: false
      }
    };
  },
  mounted() {
    // When the application starts, it fetches the userSession data and if it find it in sessionStorage, then it sets it to the application state (using Vuex)
    if (this.$ls.get("userSession")) {
      const userSession = this.$ls.get("userSession");
      this.$store.commit("saveUserSession", userSession);
    }
  },
  methods: {

    logout() {
      this.sendDelete("AuthService");
    },

    deleteUserSession() {
      this.$ls.remove("userSession");
      this.$store.commit("resetUserSession");
    }, 

    async sendDelete(endpoint) {
      this.state.pending = true;
      this.$http
      .delete(
        process.env.VUE_APP_DEV_API_ENDPOINT + "/" + endpoint,
        { responseType: "json", withCredentials: true  }
      )
      .then(response => {
        this.makeToast("success", "Success", response.data.message);
        this.deleteUserSession();
        this.$router.push("Login")
      })
      .catch(error => {
        if (error.response !== undefined) {
          this.makeToast("danger", "Error", error.response.data.message);
        } else {
          this.makeToast("danger", "Error", error.message); 
        }
      })
      .finally(() => {
        this.state.pending = false;
      });
    },

    makeToast(variant = null, title, message) {
      this.$bvToast.toast(message, {
        title: title,
        variant: variant,
        solid: true
      });
    }
  }
};
</script>
