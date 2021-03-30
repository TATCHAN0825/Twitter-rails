<template>
  <div class="header">
    <h1>{{ msg }}</h1>
  </div>
</template>

<script>
export default {
  name: 'global_header',
  props: {
    msg: String
  }
}
</script>

<style scoped>
#header{
  background: aliceblue;
}
</style>