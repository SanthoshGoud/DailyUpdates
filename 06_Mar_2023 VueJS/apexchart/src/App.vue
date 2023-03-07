<template>
  <div id="app">
    <brush-chart :chart-data="chartData" />
  </div>
</template>

<script>
import BrushChart from './components/BrushChart.vue';

export default {
  name: 'App',
  components: {
    BrushChart
  },
  data() {
    return {
      chartData: []
    }
  },
  created() {
    fetch('C:/Users/ssaara/Downloads/data.josn')
      .then(response => response.json())
      .then(data => {
        this.chartData = data;
        console.log(data);
      });
  }
}
</script>
