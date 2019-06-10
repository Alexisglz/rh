@component('mail::message')
@if(config('app.env')=="local")
# {{__('Este correo es una prueba por parte del area desarrollo y no tiene ningun efecto en el proceso real')}}
@endif
# {{ __("Incidencia") }}

{{ $msg }}.<br><br>
Para el Recurso: <strong>{{ $emp }}</strong>.<br><br>
Fue: <strong>{{$estatus}}</strong>.

@component('mail::button', ['url' => url('/incidencias?id='.$id), 'color' => 'green'])
    {{ __("Ir al portal") }}
@endcomponent
{{ __("Saludos") }}.<br>
{{ config('app.name') }}

@endcomponent
