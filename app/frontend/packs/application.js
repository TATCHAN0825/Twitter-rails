/* eslint no-console:0 */
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//
// To reference this file, add <%= javascript_pack_tag 'application' %> to the appropriate
// layout file, like app/pages/layouts/application.html.erb
import 'babel-polyfill'
import Vue from 'vue'
import Vuex from 'vuex'
import App from '../app_application.vue'
import store from './store1.js'

Vue.use(Vuex)

Vue.config.productionTip = false

document.addEventListener('DOMContentLoaded', () => {
    new Vue({
        el: '#app',
        store: store,
        render: (h) => h(App)
    })
})