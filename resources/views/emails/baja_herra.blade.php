@component('mail::message')
@if(config('app.env')=="local")
# {{__('Este correo es una prueba por parte del area desarrollo y no tiene ningun efecto en el proceso real')}}
@endif
# {{ __("Se registro una solicitud de baja para el recurso:") }}
<strong>{{$emp}}</strong>
<br>
Con cita para la fecha: <strong>{{$sol->fecha_cita}}</strong><br>
Favor de realizar la: <strong>{{$tipo}}</strong>

@component('mail::button', ['url' => url('/altas'), 'color' => 'green'])
{{ __("Ir al portal") }}
@endcomponent
{{ __("Saludos") }}.<br>
{{ config('app.name') }}

@endcomponent
