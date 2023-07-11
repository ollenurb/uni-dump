<template>
  <div class="history">
    <b-container>
      <b-row class="mt-3" align-h="center">
        <b-col cols="md-9 sm" align-self="center">
          <b-jumbotron
            text-variant="white"
            bg-variant="dark"
            class="text-left mb-3 shadow-sm"
            header="Bookings History"
            lead="Here is the history of your previously booked lessons."
            header-level="4"
          >
          </b-jumbotron>

          <hr />

          <!-- If it is in a pending state, then shows the loading component -->
          <div v-if="pending">
            <b-spinner class="mb-3" style="width: 4em; height: 4em;"></b-spinner
            ><br />
            <h4>Loading</h4>
          </div>
          <!-- If it is an error, show the danger alert with the error message in it -->
          <div v-else-if="error">
            <b-alert show variant="danger">{{ error }}</b-alert>
          </div>

          <!-- Check if empty object has been returned -->
          <div v-else-if="JSON.stringify(data) == JSON.stringify({})">
            <b-alert show variant="primary">Nothing to see here yet. <br>Your booked lessons will appear here once booked from the specific section</b-alert>
          </div>

          <!-- At this point we are sure that it is not loading and neither errors, so we can render the actual data -->
          <div v-else>
            <div v-for="(bookingArray, j) in data" :key="j">
              <SeparatorCard :title="j" />
              <div v-for="(booking, i) in bookingArray" :key="i">
                <HistoryBookingCard :booking="booking" />
              </div>
            </div>
          </div>

          
          
        </b-col>
      </b-row>
    </b-container>
  </div>
</template>

<script>
import HistoryBookingCard from "@/components/HistoryBookingCard.vue";
import SeparatorCard from "@/components/SeparatorCard.vue";

export default {
  name: "History",
  data() {
    return {
      data: null,
      pending: true,
      error: false
    };
  },
  components: {
    HistoryBookingCard,
    SeparatorCard
  },
  created() {
    this.getBookingHistory();
  },
  methods: {
    groupBy(xs, f) {
      return xs.reduce(
        (r, v, i, a, k = f(v)) => ((r[k] || (r[k] = [])).push(v), r),
        {}
      );
    },

    async getBookingHistory() {
      this.$http
        .get(process.env.VUE_APP_DEV_API_ENDPOINT + "/HistoryService", {
          responseType: "json",
          withCredentials: true
        })
        .then(response => {
          this.data = this.groupBy(response.data.data, booking => booking.date);
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
    }
  }
};
</script>
