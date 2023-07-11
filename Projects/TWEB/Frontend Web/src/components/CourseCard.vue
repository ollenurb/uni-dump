<template>
  <div class="card-item mb-2 mx-0" v-on:click="$emit('card-clicked', course)">
    <!-- Display the card with booking data-->
    <b-card class="text-left shadow-sm">
      <h4 class="mb-0">{{ course.title }}</h4>
    </b-card>
  </div>
</template>

<script>
export default {
  name: "CourseCard",
  data() {
    return {
      state: {
        pending: false,
        error: null
      }
    };
  },
  props: {
    course: {
      id: Number,
      title: String
    }
  }
};
</script>
