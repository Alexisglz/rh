@component('mail::message')
# {{ __("Solicitud de Alta Herramientas") }}

{{ $msg }}<br>
<strong>{{ $emp }}</strong>

@component('mail::button', ['url' => url('/altas'), 'color' => 'green'])
    {{ __("Ir al portal") }}
@endcomponent
{{ __("Saludos") }}.<br>
{{ config('app.name') }}

@endcomponent
