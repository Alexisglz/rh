require('./bootstrap');

Vue.component('example', require('./components/Example.vue'));

import Swal from 'sweetalert2/dist/sweetalert2.js'
import 'sweetalert2/src/sweetalert2.scss'

import Datatables from 'datatables/media/js/jquery.dataTables';
import 'datatables/media/js/jquery.dataTables';
import 'datatables/media/js/jquery.dataTables.min';
import 'datatables/media/css/jquery.dataTables.css';

const app = new Vue({
    el: '#app'
});
