import VueRouter from 'vue-router';
import Page1 from './pages/page1.vue'
import Page2 from './pages/page2.vue'

const routes = [
{path: '/', component: Page1},
{path: '/page2', component: Page2}
];

export default new VueRouter({ routes });