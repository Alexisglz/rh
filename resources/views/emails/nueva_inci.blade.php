@component('mail::message')
@if(config('app.env')=="local")
# {{__('Este correo es una prueba por parte del area desarrollo y no tiene ningun efecto en el proceso real')}}
@endif
# {{ __("Se registro una nueva incidencia") }}

Incidencia: <br>
<strong>{{$tipo->alias}}</strong><br>
Para el recurso: <br><strong>{{ $emp }}</strong>

@component('mail::button', ['url' => url('/incidencias/aprobar?id='.$id), 'color' => 'green'])
{{ __("Ir al portal") }}
@endcomponent
{{ __("Saludos") }}.<br>
{{ config('app.name') }}

@endcomponent
