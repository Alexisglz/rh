@component('mail::message')
# {{ __("Se ha registrado una nueva solicitud de alta") }}

{{ $msg }}<br>
<strong>{{ $emp }}</strong>

@component('mail::button', ['url' => url('/altas'), 'color' => 'green'])
    {{ __("Ir al portal") }}
@endcomponent
{{ __("Saludos") }}.<br>
{{ config('app.name') }}

@endcomponent
