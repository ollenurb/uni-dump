<template>
  <div class="mb-2">
    <!-- Display the card with booking data-->
    <b-card no-body class="text-left shadow-sm">
      <b-card-body class="p-0">
        <b-container class="p-4">

          <b-row align-v="center">
            <b-col>
              <h4 v-if="booking.teacher != null"><b-icon-people></b-icon-people>{{"  " + booking.teacher.name + " " + booking.teacher.surname }}</h4>
              <h4 v-else class="mb-0 text-muted"><b-icon-people></b-icon-people>{{" Deleted Teacher"}}</h4>
              <h4 v-if="this.$store.state.userSession.administrator"><b-icon icon="person"></b-icon>{{"  " + booking.user.name + " " + booking.user.surname}}</h4>

              <h4 v-if="booking.course != null"><b-icon icon="book"></b-icon>{{"  " +  booking.course.title }}</h4>
              <h4 v-else class="mb-0 text-muted"><b-icon-people></b-icon-people>{{" Deleted Course"}}</h4>
            </b-col>

            <b-col md="3">
              <h5>
                <b-icon icon="clock"></b-icon>
                {{ booking.hour + ":00 - " + (booking.hour + 1) + ":00" }}
              </h5>

              <b-button-group 
                class="d-flex" 
                size="sm"
                v-if="!this.booking.done && !this.booking.unbooked && !this.$store.state.userSession.administrator"
                >
                <b-button class="w-100" variant="primary" @click="modifyBooking('done')">DONE</b-button>
                <b-button class="w-100" variant="danger" @click="modifyBooking('unbook')">CANCEL</b-button>
              </b-button-group>
            </b-col>
          </b-row>
        </b-container>

        <b-row>
          <b-col class="text-left">
            <b-badge
              class="w-25"
              v-if="!this.booking.done && !this.booking.unbooked"
              variant="secondary"
              >Booked</b-badge
            >
            <b-badge
              class="w-25"
              v-else-if="this.booking.done && !this.booking.unbooked"
              variant="success"
              >Done</b-badge
            >
            <b-badge
              class="w-25"
              v-else-if="!this.booking.done && this.booking.unbooked"
              variant="danger"
              >Unbooked</b-badge
            >
            <b-badge v-else variant="dark"
            class="w-25">
            Inconsistent state</b-badge>
          </b-col>
        </b-row>

      </b-card-body>
    </b-card>
  </div>
</template>

<script>
export default {
  name: "HistoryBookingCard",
  data() {
    return {
      state: {
        pending: false,
        error: null
      }
    };
  },
  props: {
    booking: {
      id: Number,
      teacher: String,
      day: String,
      hour: Number,
      done: Boolean,
      unbooked: Boolean
    }
  },
  methods: {
    // TODO: Add pending animation 
    //const qs = require("querystring");
    async modifyBooking(methodType) {
      this.$http
        .get(process.env.VUE_APP_DEV_API_ENDPOINT + "/ModifyBookingService", {
          params: { bookingId: this.booking.id, method: methodType },
          responseType: "json",
          withCredentials: true
        })
        .then(response => {
          this.makeToast("success", "Success", response.data.message);
          if(methodType == "unbook") {
            this.booking.unbooked = true;
          } else if(methodType == "done") {
            this.booking.done = true; 
          }
        })
        .catch(error => {
          if (error.response !== undefined) {
            this.makeToast("danger", "Error", error.response.data.message);
          } else {
            this.makeToast("danger", "Error", error.message);
          }
        })
        .finally(() => {
          this.pending = false;
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
