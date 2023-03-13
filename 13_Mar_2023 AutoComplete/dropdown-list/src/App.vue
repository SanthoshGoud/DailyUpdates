<template>
  <div id="app">
    <SearchAutocomplete
      :items="[
        'Apple',
        'Banana',
        'Orange',
        'Mango',
        'Pear',
        'Peach',
        'Grape',
        'Tangerine',
        'Pineapple'
      ]"
    />
  </div>
</template>

<script>
import SearchAutocomplete from './components/searchAutoCompute.vue'

export default {
  name: 'App',
  components: {
    SearchAutocomplete
  }
}
</script>