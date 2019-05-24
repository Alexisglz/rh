@component('mail::message')
# {{ __("Se encuentran listas y fueron entregadas las herramientas:") }}
<ul>
@foreach($msg as $item)
<li><strong>{{$item}}</strong></li>
@endforeach
</ul>
{{__('Para el recurso: ')}}
<strong>{{ $emp }}</strong>

@component('mail::button', ['url' => url('/altas'), 'color' => 'green'])
{{ __("Ir al portal") }}
@endcomponent
{{ __("Saludos") }}.<br>
{{ config('app.name') }}

@endcomponent
