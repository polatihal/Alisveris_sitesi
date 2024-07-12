<template>
  <div class="home">
    <h1>Gezi Rehberi</h1>
    <div class="gezi-list">
      <GeziCard v-for="gezi in geziler" :key="gezi.id" :gezi="gezi" />
    </div>
  </div>
</template>

<script>
import GeziCard from '../components/GeziCard.vue';

export default {
  components: {
    GeziCard
  },
  data() {
    return {
      geziler: [
        {
          id: 1,
          title: 'Örnek Yer 1',
          description: 'Bu birinci örnek yerin açıklaması',
          image: 'https://via.placeholder.com/150'
        },
        {
          id: 2,
          title: 'Örnek Yer 2',
          description: 'Bu ikinci örnek yerin açıklaması',
          image: 'https://via.placeholder.com/150'
        }
        // Buraya istediğiniz kadar gezi ekleyebilirsiniz
      ]
    };
  }
};
</script>

<style scoped>
.home {
  text-align: center;
}

.gezi-list {
  display: flex;
  flex-wrap: wrap;
  justify-content: center;
}
</style>
