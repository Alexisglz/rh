@component('mail::message')
@if(config('app.env')=="local")
# {{__('Este correo es una prueba por parte del area desarrollo y no tiene ningun efecto en el proceso real')}}
@foreach($users as $correo)
<li><strong>{{json_encode($correo)}}</strong></li>
@endforeach
@endif
# {{ __("Se ha cancelado la baja del recurso:") }}
<strong>{{ $empleado }}</strong><br><br>

@component('mail::button', ['url' => url('/empleados'), 'color' => 'green'])
    {{ __("Ir al portal") }}
@endcomponent
{{ __("Saludos") }}.<br>
{{ config('app.name') }}

@endcomponent
