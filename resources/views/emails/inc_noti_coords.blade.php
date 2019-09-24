@component('mail::message')
@if(config('app.env')=="local")
# {{__('Este correo es una prueba por parte del area desarrollo y no tiene ningun efecto en el proceso real')}}
<strong>{{__('Enviado a:')}}</strong><br>
@foreach($users as $user)
<li><strong>{{json_encode($user)}}</strong></li>
@endforeach
@endif
# {{ __("La fecha limite para levantar incidencias es el dia de hoy para el periodo de") }}
# {{ $periodo }}

<p>Favor de ingresar al sistema antes de: </p><strong>{{$date}}</strong>

@component('mail::button', ['url' => url($url), 'color' => 'green'])
{{ __("Ir al portal") }}
@endcomponent
{{ __("Saludos") }}.<br>
{{ config('app.name') }}

@endcomponent
