@component('mail::message')
@if(config('app.env')=="local")
# {{__('Este correo es una prueba por parte del area desarrollo y no tiene ningun efecto en el proceso real')}}
<strong>{{__('Enviado a:')}}</strong><br>
@foreach($users as $user)
<li><strong>{{json_encode($user)}}</strong></li>
@endforeach
@endif
# {{ __("Se ha registrado una nueva solicitud de alta") }}

{{ $msg }}<br>
<strong>{{ $emp }}</strong>

@component('mail::button', ['url' => url('/altas/aprobar?id='.$id), 'color' => 'green'])
    {{ __("Ir al portal") }}
@endcomponent
{{ __("Saludos") }}.<br>
{{ config('app.name') }}

@endcomponent
