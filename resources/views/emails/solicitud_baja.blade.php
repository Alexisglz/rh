@component('mail::message')
# {{ __("Se ha registrado una solicitud de baja para el recurso:") }}
<strong>{{ $emp }}</strong><br><br>
Se registra la baja para el dia:<br>
<strong>{{ $sol->fecha_baja_sol }}</strong>
<br>
<strong>{{$sol->conocimiento_baja}}</strong> tiene conocimiento de su baja.

@component('mail::button', ['url' => url('/altas'), 'color' => 'green'])
    {{ __("Ir al portal") }}
@endcomponent
{{ __("Saludos") }}.<br>
{{ config('app.name') }}

@endcomponent
