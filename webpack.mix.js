const mix = require('laravel-mix');

/*
 |--------------------------------------------------------------------------
 | Mix Asset Management
 |--------------------------------------------------------------------------
 |
 | Mix provides a clean, fluent API for defining some Webpack build steps
 | for your Laravel application. By default, we are compiling the Sass
 | file for the application as well as bundling up all the JS files.
 |
 */

mix.autoload({
    jquery: ['$', 'window.jQuery', 'jQuery'],
    'sweetalert2.js/node_modules/sweetalert2/dist/sweetalert2.js':['swal', 'Swal'],
    'jquery.dataTables.js/node_modules/datatables/media/js/jquery.dataTables':['Datatables','datatables']
}).js('resources/assets/js/app.js', 'public/js')
    .sass('resources/assets/sass/app.scss', 'public/css');
