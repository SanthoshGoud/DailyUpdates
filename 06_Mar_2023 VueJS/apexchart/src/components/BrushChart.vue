 <template>
  <div>
    <VueApexCharts
      :options="chartOptions"
      :series="chartSeries"
      :type="chartType"
      :height="chartHeight"
    />
  </div>
</template>
  
  <script>
  import VueApexCharts from 'vue-apexcharts';
  export default {
    name: 'BrushChart',
    components: {
      VueApexCharts
    },
    props: {
      chartData: {
        type: Array,
        required: true
      }
    },
    data() {
      return {
        chartOptions: {
          chart: {
            id: 'brush-chart',
            height: 380,
            type: 'area',
            brush: {
              target: 'chart2',
              enabled: true
            },
            selection: {
              enabled: true,
              xaxis: {
                min: new Date('20 Jan 2017').getTime(),
                max: new Date('10 Dec 2017').getTime()
              }
            }
          },
          colors: ['#546E7A'],
          dataLabels: {
            enabled: false
          },
          markers: {
            size: 0
          },
          xaxis: {
            type: 'datetime',
            tooltip: {
              enabled: false
            }
          },
          yaxis: {
            tickAmount: 2,
            labels: {
              formatter: function(val) {
                return val.toFixed(2);
              }
            }
          }
        },
        chartSeries: [{
          name: 'series-1',
          data: this.chartData
        }],
        chartType: 'area',
        chartHeight: 380
      }
    }
  }
  </script>

  