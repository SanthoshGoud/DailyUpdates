<template>
    <div class="autocomplete">
      <input
      v-model="search"
      @input="onChange"
        type="text"
      />
      <ul
        v-show="isOpen"
        class="autocomplete-results"
      >
        <li
        v-for="(result, i) in results"
        :key="i"
        @click="setResult(result)"
          class="autocomplete-result"
        >
        {{ result }}

        </li>
      </ul>
    </div>
  </template>
  
  <script>
  export default {
    name: 'SearchAutocomplete',
    props: {
    items: {
      type: Array,
      required: false,
      default: () => [],
    },
  },
    data() {
    return {
      search: '',
      results: [],
      isOpen: false,
    };
    
  },
  mounted() {
    document.addEventListener('click', this.handleClickOutside);
  },
  unmounted() {
    document.removeEventListener('click', this.handleClickOutside);
  },
  
  methods: {
    setResult(result) {
      this.search = result;
      this.isOpen = false;
    },  
    filterResults() {
      this.results = this.items.filter(item => item.toLowerCase().indexOf(this.search.toLowerCase()) > -1);
    },
    onChange() {
      this.filterResults();
      this.isOpen = true;
    },
    handleClickOutside(event) {
      if (!this.$el.contains(event.target)) {
        this.isOpen = false;
      }
    }
  }
  };
  </script>

<style>
.autocomplete {
  position: relative;
}

.autocomplete-results {
  padding: 0;
  margin: 0;
  border: 1px solid #eeeeee;
  height: 120px;
  min-height: 1em;
  max-height: 6em;    
  overflow: auto;
}

.autocomplete-result {
  list-style: none;
  text-align: left;
  padding: 4px 2px;
  cursor: pointer;
}

.autocomplete-result:hover {
  background-color: #4AAE9B;
  color: white;
}
</style>