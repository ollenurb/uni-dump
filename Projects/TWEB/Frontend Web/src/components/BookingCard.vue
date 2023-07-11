<template>
  <div class="card-item mb-2">
    <!-- Display the card with booking data-->
    <b-card class="shadow-sm">
      <b-container>
        <b-row align-v="center">
          <b-col lg="5">
            <!-- Sei colonna da small in su (se no vai sotto e diventa row) -->
            <h5 class="mb-2">
              <b-icon icon="person"></b-icon>
              {{ booking.teacher.name + " " + booking.teacher.surname }}
            </h5>
          </b-col>
          <b-col
            md
            v-bind:class="{
              'text-right': this.$store.state.userSession.userId == -1
            }"
          >
            <h5 class="mb-2">
              <b-icon icon="clock"></b-icon>
              {{ booking.hour + ":00 - " + (booking.hour + 1) + ":00" }}
            </h5>
          </b-col>
          <b-col v-if="this.$store.state.userSession.userId != -1">
            <b-button block variant="dark" @click="bookBooking()"
              >BOOK</b-button
            >
          </b-col>
        </b-row>
      </b-container>
    </b-card>
  </div>
</template>

<script>
export default {
  name: "BookingCard",
  data() {
    return {
      state: {
        pending: false
      }
    };
  },
  props: {
    booking: {
      teacher: String,
      day: String,
      hour: Number
    }
  },
  methods: {
    bookBooking() {
      // TODO: Implement pending animation 
      const qs = require("querystring");

      this.$http
        .post(
          process.env.VUE_APP_DEV_API_ENDPOINT + "/BookingService",
          qs.stringify({ booking: JSON.stringify(this.booking) }),
          { responseType: "json", withCredentials: true }
        )
        .then(response => {
          this.onLessonBooked(response); 
        })
        .catch(error => {
          if (error.response !== undefined) {
            this.makeToast("danger", "Error", error.response.data.message);
          } else {
            this.makeToast("danger", "Error", error.message);
          }
        });
    },

    makeToast(variant = null, title, message) {
      this.$bvToast.toast(message, {
        title: title,
        variant: variant,
        solid: true
      });
    },

    onLessonBooked(response) {
      this.$emit("lesson-booked", response.data.message);
    }
  }
};
</script>
