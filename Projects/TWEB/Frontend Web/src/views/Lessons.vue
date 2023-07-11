<template>
  <div class="lessons">
    <b-container>
      <b-row class="mt-3" align-h="center">
        <b-col cols="md-9 sm" align-self="center">
          <b-jumbotron
            text-variant="white"
            bg-variant="dark"
            class="text-left mb-3 shadow-sm"
            header="Available Lessons"
            lead="Click on a course to show its available lessons"
            header-level="4"
          >
            <p v-if="this.$store.state.userSession.userId == -1">
              Without an account you can only see the available lessons.
              <b-link to="Login" href="Login">Sign up</b-link> if you want to
              book one.
            </p>
          </b-jumbotron>

          <hr />

          <div v-if="pending">
            <b-spinner
              class="mb-3"
              style="width: 4em; height: 4em;"
            ></b-spinner>
            <br />
            <h4>Loading</h4>
          </div>

          <div v-else-if="error">
            <b-alert show variant="danger">{{ error }}</b-alert>
          </div>

          <div v-else>
            <b-row v-for="(chunk, row) in data" :key="row">
              <b-col lg class="pr-lg-1">
                <CourseCard
                  :course="chunk[0]"
                  v-on:card-clicked="onCardClicked"
                />
              </b-col>

              <b-col lg class="pl-lg-1">
                <CourseCard
                  :course="chunk[1]"
                  v-on:card-clicked="onCardClicked"
                />
              </b-col>
            </b-row>

            <Modal ref="modal" />
          </div>
        </b-col>
      </b-row>
    </b-container>
  </div>
</template>

<script>
import CourseCard from "@/components/CourseCard.vue";
//import SeparatorCard from '@/components/SeparatorCard.vue'
import Modal from "@/components/Modal.vue";

var _ = require("lodash");

export default {
  name: "Lessons",
  components: {
    CourseCard,
    Modal
    //SeparatorCard
  },
  data() {
    return {
      data: null,
      pending: true,
      error: false
    };
  },
  created() {
    this.getAvailableBookings();
  },
  methods: {
    async getAvailableBookings() {
      this.$http
        .get(process.env.VUE_APP_DEV_API_ENDPOINT + "/AvailableCoursesService", {
          responseType: "json"
        })
        .then(response => {
          this.data = response.data.data;
          this.data = _.chunk(this.data, 2);
        })
        .catch((error) => {
          if (error.response !== undefined) {
            this.error = error.response.data.message;
          } else {
            this.error = error.message;
          }
        })
        .finally(() => {
          this.pending = false;
        });
    },
    onCardClicked(course) {
      this.$refs.modal.show(course);
    }
  }
};
</script>
