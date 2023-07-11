<template>
  <div class="card-item mb-2">
    <b-card class="text-center" bg-variant="primary" text-variant="light">
      <h5 class="mt-2"><b-icon icon="calendar-fill"></b-icon> {{ title }}</h5>
    </b-card>
  </div>
</template>

<script>
export default {
  name: "SeparatorCard",
  props: {
    title: String
  }
};
</script>
