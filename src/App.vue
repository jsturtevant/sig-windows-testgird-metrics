<template>
  <div>Hello {{ value }}</div>
</template>

<script>
export default {
  name: "App",
  data() {
    return {
      value: ""
    };
  },
  methods: {
    getMetrics: function () {
      fetch('/api/metrics')
        .then(response => response.json())
        .then(data => this.value = data.message);

    }
  },
  mounted () {
    this.getMetrics()
  }
};
</script>
