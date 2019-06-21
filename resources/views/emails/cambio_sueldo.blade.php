@component('mail::message')
@if(config('app.env')=="local")
# {{__('Este correo es una prueba por parte del area desarrollo y no tiene ningun efecto en el proceso real')}}
@endif
# {{ __("Se solicitan modificaciones de sueldo:") }}
<br><strong>{{ __('Dar click en el boton para descargar el documento')}} </strong>

@component('mail::button', ['url' => url('/files/'.$url), 'color' => 'green'])
{{ __("Descargar Documento") }}
@endcomponent
{{ __("Saludos") }}.<br>
{{ config('app.name') }}

@endcomponent
