@component('mail::message')
@if(config('app.env')=="local")
# {{__('Este correo es una prueba por parte del area desarrollo y no tiene ningun efecto en el proceso real')}}
@endif
# {{ __("Solicitud de Alta Herramientas") }}

{{ $msg }}<br>
<strong>{{ $emp }}</strong>

@component('mail::button', ['url' => url('/altas?id='.$id), 'color' => 'green'])
    {{ __("Ir al portal") }}
@endcomponent
{{ __("Saludos") }}.<br>
{{ config('app.name') }}

@endcomponent
