@component('mail::message')
# {{ __("Se registro una nueva incidencia") }}

Incidencia: <br>
<strong>{{$tipo->alias}}</strong>
Para el recurso: <br><strong>{{ $emp }}</strong>

@component('mail::button', ['url' => url('/autorizar'), 'color' => 'green'])
{{ __("Ir al portal") }}
@endcomponent
{{ __("Saludos") }}.<br>
{{ config('app.name') }}

@endcomponent
