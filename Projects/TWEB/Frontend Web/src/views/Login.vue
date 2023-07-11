<template>
  <div class="login">
  
    <b-container>
      <b-row align-h="center" align-v="center">
        <b-col cols="md-6 sm mt-3">
          <b-overlay :show="state.pending" rounded="sm">
            <b-card class="text-left p-3 shadow-sm">
              <div class="mb-5 text-center">
                <b-icon
                  icon="book-half"
                  class="rounded-circle bg-dark p-3"
                  variant="white"
                  font-scale="7.5"
                ></b-icon>
              </div>

              <h3 center class="mb-2">LOGIN</h3>
              <h6 class="mb-4">Login to access the functionalities</h6>

              <!-- Form inputs -->
              <b-form @submit="onSubmit" @reset="onReset">
                <!-- Email address form group (label and input) -->
                <b-form-group
                  id="input-group-1"
                  label="Email address:"
                  label-for="email-input"
                >
                  <b-input-group>
                    <b-input-group-prepend is-text>
                      <b-icon icon="envelope-fill"></b-icon>
                    </b-input-group-prepend>

                    <b-form-input
                      id="email-input"
                      v-model="form.email"
                      type="email"
                      required
                      placeholder="Enter your email"
                    ></b-form-input>
                  </b-input-group>
                </b-form-group>

                <b-form-group
                  id="input-group-2"
                  label="Password:"
                  label-for="password-input"
                >
                  <b-input-group>
                    <b-input-group-prepend is-text>
                      <b-icon icon="lock-fill"></b-icon>
                    </b-input-group-prepend>

                    <b-form-input
                      id="password-input"
                      v-model="form.password"
                      type="password"
                      required
                      placeholder="Enter your password"
                    ></b-form-input>
                  </b-input-group>
                </b-form-group>

                <b-row>
                  <b-col cols="md" class="mt-2">
                    <b-button type="submit" block variant="primary"
                      >LOGIN</b-button
                    >
                  </b-col>
                  <b-col cols="md" class="mt-2">
                    <b-button type="reset" block variant="danger">RESET</b-button>
                  </b-col>
                </b-row>
              </b-form>
            </b-card>
          </b-overlay>

          <div v-if="state.error">
            <b-alert
            show
            fade
            variant="danger"
            dismissible>{{ state.error }}</b-alert>
          </div>

        </b-col>
      </b-row>
    </b-container>
  </div>
</template>

<style></style>

<script>
export default {
  name: "Login",
  data() {
    return {
      form: {
        email: "",
        password: ""
      },
      state: {
        pending: false,
        error: false
      },
      avatarProps: { width: 150, height: 150 }
    };
  },
  methods: {
    // Handle submit button click (try to login using the authentication service)
    onSubmit(evt) {
      this.state.pending = true; 

      const qs = require("querystring");
      const MD5 = require("crypto-js/md5");

      evt.preventDefault();
      if (this.form.password.length > 0) {
        this.$http
          .post(
            process.env.VUE_APP_DEV_API_ENDPOINT + "/AuthService",
            qs.stringify({
              email: this.form.email,
              password: MD5(this.form.password).toString()
            }),
            { responseType: "json", withCredentials: true }
          )
          .then(response => {
            if (response.data.data != undefined) {
              // Save the login session and make it persistent
              this.saveSessionData(response.data.data);
              this.$router.push("Lessons");
            } else {
              this.state.error = response.data.message;
            }
          })
          .catch(error => {
            if (error.response !== undefined) {
              this.state.error = error.response.data.message;
            } else {
              this.state.error = error.message;
            }
          })
          .finally(() => {
            this.state.pending = false;
          });
      }
    },
    // Handle reset button click by clearing the form state
    onReset(evt) {
      evt.preventDefault();
      this.form.email = "";
      this.form.password = "";
      // Trick to reset/clear native browser form validation state
      this.state.error = false;
    },

    saveSessionData(sessionData) {
      // Set expire time of session data to 30 minutes
      this.$ls.set("userSession", sessionData, 60 * 60 * 500);
      this.$store.commit("saveUserSession", sessionData);
    }
  }
};
</script>
