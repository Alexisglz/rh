@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header">{{ __('Cambio de Contraseña') }}</div>

                <div class="card-body">
                    <form id="contra" method="POST" action="{{ route('pass.update') }}">
                        <h5 class="text-success text-center"><strong>{{__('Al reestablecer la contraseña sera actualizada en los sistemas:')}}<br>{{__('Incore, RH y Tickets.')}}</strong></h5>
                        @csrf

                        <input id="id" name="id" hidden value="{{$id}}">
                        <div class="form-group row">
                            <label for="password" class="col-md-4 col-form-label text-md-right">{{ __('Password') }}</label>

                            <div class="col-md-6">
                                <input id="password" type="password" class="form-control{{ $errors->has('password') ? ' is-invalid' : '' }}" name="password" required>
                                <small id="small">{{__('La contraseña debe tener 8 caracteres, una letra mayuscula, una minuscula y un numero.')}}</small>

                                @if ($errors->has('password'))
                                    <span class="invalid-feedback">
                                        <strong>{{ $errors->first('password') }}</strong>
                                    </span>
                                @endif
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="password-confirm" class="col-md-4 col-form-label text-md-right">{{ __('Confirm Password') }}</label>

                            <div class="col-md-6">
                                <input id="password-confirm" type="password" class="form-control" name="password_confirmation" required>
                                <small id="small-c" class="text-danger" style="display:none;">{{__('La contraseñas no coinciden')}}</small>
                            </div>
                        </div>

                        <div class="form-group row mb-0">
                            <div class="col-md-6 offset-md-4">
                                <button id="sub" disabled type="submit" class="btn btn-primary">
                                    {{ __('Cambiar Contraseña') }}
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
{!! Html::script('js/validador.js') !!}
    <script>
        $(function () {
            password('password','password-confirm','sub','small','small-c');
        });
    </script>
@endsection
