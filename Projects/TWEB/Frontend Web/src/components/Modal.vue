<template>
  <b-modal
    id="scrollable-modal"
    header-bg-variant="dark"
    header-text-variant="light"
    size="lg"
    centered
    scrollable
    :title="course.title"
  >
    <b-container fluid>
      <b-row v-if="state.pending" class="my-3" align-h="center">
        <b-col cols="md-9 sm" align-self="center">
          <div
            class="d-flex flex-grow-1 align-items-center justify-content-center"
          >
            <b-spinner
              class="mb-3"
              style="width: 4em; height: 4em;"
            ></b-spinner>
          </div>
        </b-col>
      </b-row>

      <div v-else-if="state.error">
        <b-alert show variant="danger"> {{ state.error }} </b-alert>
      </div>

      <div v-else>
        <h5 v-if="state.data != null && !Object.keys(state.data).length">
          Currently there are no lessons available for this course.
        </h5>
        <div v-for="(bookingArray, j) in state.data" :key="j">
          <SeparatorCard :title="j" />
          <div v-for="(booking, i) in bookingArray" :key="i">
            <BookingCard
              :booking="booking"
              v-on:lesson-booked="onLessonBooked"
            />
          </div>
        </div>
      </div>
    </b-container>
  </b-modal>
</template>

<script>
import BookingCard from "@/components/BookingCard.vue";
import SeparatorCard from "@/components/SeparatorCard.vue";

export default {
  name: "Modal",
  components: {
    BookingCard,
    SeparatorCard
  },
  data() {
    return {
      state: {
        pending: false,
        error: null,
        data: null
      },
      course: {
        id: -1,
        title: ""
      }
    };
  },
  methods: {
    groupBy(xs, f) {
      return xs.reduce(
        (r, v, i, a, k = f(v)) => ((r[k] || (r[k] = [])).push(v), r),
        {}
      );
    },

    async getData() {
      this.state.pending = true;
      this.$http
        .get(
          process.env.VUE_APP_DEV_API_ENDPOINT + "/AvailableBookingsService",
          { params: { courseId: this.course.id } }
        )
        .then(response => {
          this.state.data = this.groupBy(
            response.data.data,
            booking => booking.date
          );
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
    },

    show(course) {
      this.course = course;
      this.getData();
      this.$bvModal.show("scrollable-modal");
    },

    makeToast(variant = null, title, message) {
      this.$bvToast.toast(message, {
        title: title,
        variant: variant,
        solid: true
      });
    }, 

    onLessonBooked(message) {
      this.getData();
      this.makeToast("success", "Success", message);
    }
  }
};
</script>
