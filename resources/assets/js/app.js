require('./bootstrap');

Vue.component('example', require('./components/Example.vue'));

import Swal from 'sweetalert2/dist/sweetalert2.js'
import 'sweetalert2/src/sweetalert2.scss'

const app = new Vue({
    el: '#app'
});
