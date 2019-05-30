@component('mail::message')
@if(config('app.env')=="local")
# {{__('Este correo es una prueba por parte del area desarrollo y no tiene ningun efecto en el proceso real')}}
@endif
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
