@component('mail::message')
@if(config('app.env')=="local")
# {{__('Este correo es una prueba por parte del area desarrollo y no tiene ningun efecto en el proceso real')}}
@endif
# {{ __("Se solicita un ajuste de Sueldo") }}

Para el recurso: <br>
<strong>{{$ajuste->empleado}}</strong> con el numero de empleado: <strong>{{$ajuste->empleado_num}}</strong><br><br>

@if($ajuste->tradicional > 0)
Sueldo Tradicional: <strong>{{$ajuste->tradicional}}</strong>
@endif

@if($ajuste->asimilado> 0)
Sueldo Tradicional: <strong>{{$ajuste->asimilado}}</strong>
@endif

@component('mail::button', ['url' => url('/ajuste/validar?id='.$ajuste->id), 'color' => 'green'])
{{ __("Ir al portal") }}
@endcomponent
{{ __("Saludos") }}.<br>
{{ config('app.name') }}

@endcomponent
