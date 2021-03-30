<template>
  <div class="footer">
    <h1>{{ msg }}</h1>
    <div class="message">
      <h3>app/javascript/packs/assetsのロゴ</h3>
      <img class="img" src="../assets/pjpng" /><br>
      これはページ2です。<br>
      <h3>app/assets/images/のねこ</h3>
      <div class="cat_image" /><br>
      この中にスタイルをまとめて書いてね<br>
    </div>
    <router-link to="/">前のページへ</router-link>
  </div>
</template>

<script>
export default {
  name: 'global_footer',
  props: {
    msg: "ページ1"
  }
}
</script>

<style scoped lang="scss">
.footer{
  background: aliceblue;
}
.message{
  margin: 0.2em;
  margin: 1em;
  padding: 1em;
  background: #EFEFEF;
  border: solid darkred;
}
img{
  background-image: image-url('/pj.png');
}
</style>