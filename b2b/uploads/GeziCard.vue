<template>
  <div class="gezi-card">
    <img :src="gezi.image" :alt="gezi.title" />
    <h3>{{ gezi.title }}</h3>
    <p>{{ gezi.description }}</p>
  </div>
</template>

<script>
export default {
  props: ['gezi']
};
</script>

<style scoped>
.gezi-card {
  border: 1px solid #ccc;
  padding: 15px;
  margin: 10px;
  text-align: center;
}
</style>