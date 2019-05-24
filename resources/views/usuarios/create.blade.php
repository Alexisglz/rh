@extends('layouts.admin')

@section('contenido')
    <div class="card card-primary card-outline">
        <div class="card-header">
            <h3 class="card-title">
                <i class="fa fa-plus"></i>
                REGISTRAR USUARIO
            </h3>
        </div>
        <div class="card-body">
            <form method="POST" action="{{ route('usuarios.store') }}">
                @csrf
                <div class="form-group row">
                    <label for="name" class="col-md-4 col-form-label text-md-right">{{ __('Name') }}</label>
                    <div class="col-md-6">
                        <input id="name" type="text" class="form-control{{ $errors->has('name') ? ' is-invalid' : '' }}"
                               name="name" value="{{ old('name') }}" required autofocus>
                        @if ($errors->has('name'))
                            <span class="invalid-feedback">
                            <strong>{{ $errors->first('name') }}</strong>
                        </span>
                        @endif
                    </div>
                </div>
                <div class="form-group row">
                    <label for="last_name" class="col-md-4 col-form-label text-md-right">{{ __('Apellidos') }}</label>
                    <div class="col-md-6">
                        <input id="last_name" type="text" class="form-control{{ $errors->has('last_name') ? ' is-invalid' : '' }}"
                               name="last_name" value="{{ old('last_name') }}" required autofocus>
                        @if ($errors->has('last_name'))
                            <span class="invalid-feedback">
                            <strong>{{ $errors->first('last_name') }}</strong>
                        </span>
                        @endif
                    </div>
                </div>
                <div class="form-group row">
                    <label for="usuario" class="col-md-4 col-form-label text-md-right">{{ __('Usuario') }}</label>
                    <div class="col-md-6">
                        <input id="usuario" type="text" class="form-control{{ $errors->has('usuario') ? ' is-invalid' : '' }}"
                               name="usuario" value="{{ old('usuario') }}" required autofocus>
                        <p id="user_error"></p>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="perfil" class="col-md-4 col-form-label text-md-right">{{ __('Perfil') }}</label>
                    <div class="col-md-6">
                        <select id="perfil" type="text" class="form-control" name="perfil" required>
                            <option value="ADMIN">{{__('ADMIN')}}</option>
                            <option value="STAFF">{{__('STAFF')}}</option>
                            <option value="ESPECIAL">{{__('ESPECIAL')}}</option>
                            <option value="CLIENTE">{{__('CLIENTE')}}</option>
                        </select>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="area" class="col-md-4 col-form-label text-md-right">{{ __('Area') }}</label>
                    <div class="col-md-6">
                        <select id="area" type="text" class="form-control" name="area" required>
                            <option value="">{{__('Seleccione')}}</option>
                            <option value="RH">{{__('RH')}}</option>
                            <option value="FINANZAS">{{__('FINANZAS')}}</option>
                            <option value="DESARROLLO">{{__('DESARROLLO')}}</option>
                            <option value="IT">{{__('IT')}}</option>
                            <option value="TODO">{{__('TODO')}}</option>
                            <option value="DIRECCION">{{__('DIRECCION')}}</option>
                            <option value="ALMACEN">{{__('ALMACEN')}}</option>
                            <option value="SISTEMAS">{{__('SISTEMAS')}}</option>
                            <option value="CONTROL">{{__('CONTROL')}}</option>
                            <option value="COORDINACION">{{__('COORDINACION')}}</option>
                            <option value="CUSTOMER">{{__('CUSTOMER')}}</option>
                            <option value="LOGISTICA">{{__('LOGISTICA')}}</option>
                            <option value="VIATICOS">{{__('VIATICOS')}}</option>
                            <option value="DEHN">{{__('DEHN')}}</option>
                            <option value="COMERCIAL">{{__('COMERCIAL')}}</option>
                            <option value="NCR">{{__('NCR')}}</option>
                            <option value="CAPACITACION">{{__('CAPACITACION')}}</option>
                            <option value="SUPERVISION">{{__('SUPERVISION')}}</option>
                            <option value="CALIDAD">{{__('CALIDAD')}}</option>
                            <option value="CAPITAL">{{__('CAPITAL')}}</option>
                            <option value="SOPORTE">{{__('SOPORTE')}}</option>
                            <option value="NOKIA">{{__('NOKIA')}}</option>
                            <option value="TAC">{{__('TAC')}}</option>
                            <option value="ESPECIAL">{{__('ESPECIAL')}}</option>
                            <option value="NAE">{{__('NAE')}}</option>
                            <option value="ADMINISTRADOR">{{__('ADMINISTRADOR')}}</option>
                        </select>
                    </div>
                </div>

                <div class="form-group row">
                    <label for="correo" class="col-md-4 col-form-label text-md-right">{{ __('E-Mail Address') }}</label>

                    <div class="col-md-6">
                        <input id="correo" type="email"
                               class="form-control{{ $errors->has('correo') ? ' is-invalid' : '' }}" name="correo"
                               value="{{ old('correo') }}" required>

                        @if ($errors->has('correo'))
                            <span class="invalid-feedback">
                            <strong>{{ $errors->first('correo') }}</strong>
                        </span>
                        @endif
                    </div>
                </div>

                <div class="form-group row">
                    <label for="password" class="col-md-4 col-form-label text-md-right">{{ __('Password') }}</label>

                    <div class="col-md-6">
                        <input id="password" type="password"
                               class="form-control{{ $errors->has('password') ? ' is-invalid' : '' }}" name="password"
                               required>

                        @if ($errors->has('password'))
                            <span class="invalid-feedback">
                            <strong>{{ $errors->first('password') }}</strong>
                        </span>
                        @endif
                    </div>
                </div>

                <div class="form-group row">
                    <label for="password-confirm"
                           class="col-md-4 col-form-label text-md-right">{{ __('Confirm Password') }}</label>

                    <div class="col-md-6">
                        <input id="password-confirm" type="password" class="form-control" name="password_confirmation"
                               required>
                    </div>
                </div>

                <div class="form-group row">
                    <label for="id_empleado" class="col-md-4 col-form-label text-md-right">{{ __('ID empleado') }}</label>
                    <div class="col-md-6">
                        <input id="id_empleado" type="text" class="form-control" name="id_empleado" required>
                    </div>
                </div>

                <div class="form-group row">
                    <label for="Rol" class="col-md-4 col-form-label text-md-right">Rol</label>
                    <div class="col-md-6">
                        {!! Form::select('Rol',$areas,null,['class'=>'form-control req_nok','id'=>'Rol','style'=>'width: 100%;']) !!}
                    </div>
                </div>

                {{-- <div class="form-group row">
                    <label for="password-confirm" class="col-md-4 col-form-label text-md-right">{{ __('Remember Password') }}</label>

                    <div class="col-md-1" style="padding-top: 10px">
                        {!! Form::checkbox('checkedit_pass', false, false,['class'=>'form-control req_nok','id'=>'checkedit_pass','style'=>'width: 100%;']) !!}
                    </div>
                </div> --}}

                <div class="form-group row mb-0">
                    <div class="col-md-6 offset-md-4">
                        <button id="create_user" onclick="Createuser()" type="submit" class="btn btn-primary">
                            {{ __('Register') }}
                        </button>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    {!! Html::script('js/usuarios/index.js?v='.time()) !!}
@endsection
