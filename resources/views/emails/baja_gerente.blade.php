@component('mail::message')
@if(config('app.env')=="local")
# {{__('Este correo es una prueba por parte del area desarrollo y no tiene ningun efecto en el proceso real')}}
@endif
# {{ __("Se ha registrado una solicitud de baja en un puesto gerencial para el recurso:") }}
<strong>{{ $empleado->nombre_completo }}</strong><br><br>
Se registra la baja para el dia:<br>
<strong>{{ $baja->fecha_baja_sol }}</strong>
<br>
<strong>{{$baja->conocimiento_baja}}</strong> tiene conocimiento de su baja.

@component('mail::button', ['url' => url('/bajas?id='.$baja->id), 'color' => 'green'])
    {{ __("Ir al portal") }}
@endcomponent
{{ __("Saludos") }}.<br>
{{ config('app.name') }}

@endcomponent
