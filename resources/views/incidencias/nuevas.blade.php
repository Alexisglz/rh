@extends('layouts.admin')

@section('contenido')

{{-- // MOD:SAM,  Js para llenar  los datos de los Dropdown con los catalogos de selecion.
// Crea un select y muestra  los datos en los controles de la vista
// Creado 10-11-18 
// By: Sam Guzman DTI consultores. --}}



<form>
        <div class="form-row">
            
      <div class="col-md-6 mb-3">
          {!! Form::select('cliente',$clientes,null,['class'=>'form-control select_wbs req_common','data-id'=>1,'id'=>'cliente','placeholder'=>'CLIENTE','style'=>'width: 100%;']) !!}
      </div>
      <div class="col-md-3 mb-3">
            <label for="validationDefault03">Empleado</label>
            <div class="dropdown">
                    <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenu2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                      Dropdown
                    </button>
                    <div class="dropdown-menu" aria-labelledby="dropdownMenu2">
                      <button class="dropdown-item" type="button">Action</button>
                      <button class="dropdown-item" type="button">Another action</button>
                      <button class="dropdown-item" type="button">Something else here</button>
                    </div>
                  </div>
          </div>
    </div>
    <div class="form-group">
      <div class="form-check">
        <input class="form-check-input" type="checkbox" value="" id="invalidCheck2" required>
        <label class="form-check-label" for="invalidCheck2">
          Agree to terms and conditions
        </label>
      </div>
    </div>
    <button class="btn btn-primary" type="submit">Submit form</button>
  </form>
{!! Html::script('js/incidencias/nuevaIncidencia.js') !!}
{!! Html::script('js/sol_altas/search_wbs.js?v='.time()) !!}
{!! Html::script('js/sol_altas/common.js?v='.time()) !!}
@endsection