@extends('layouts.admin')

@section('contenido')
    @if($errors->any())
        <div class="alert alert-danger">
            @foreach($errors->all() as $error)
                {{$error}}
                <br>
            @endforeach
        </div>
    @endif
    <div class="modal fade bd-example-modal-lg3" id="ModalNuevoWBS" data-backdrop="static" data-keyboard="false"
         tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="addcodigo">WBS</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <input id="token" type="hidden" name="_token" value="{{ csrf_token() }}">
                <div class="modal-body">
                    <div class="form-row">
                        <div class="col-md-4 mb-3">
                            <label for="wbsCliente">Cliente</label>
                            {{-- <input type="text" class="form-control" id="wbsCliente" value="" required> --}}
                            {!! Form::select('cliente',$clientes,null,['class'=>'form-control select_wbs req_common','data-id'=>1,'id'=>'wbsCliente','placeholder'=>'CLIENTE','style'=>'width: 100%;']) !!}
                        </div>
                        <div class="col-md-4 mb-3">
                            <label for="wbsSercicio">Servicio</label>
                            {{-- <input type="text" class="form-control" id="wbsServicio" value="" required> --}}
                            {!! Form::select('servicio',$servicios,null,['class'=>'form-control select_wbs req_common','data-id'=>2,'id'=>'wbsServicio','placeholder'=>'SERVICIO','style'=>'width: 100%;']) !!}
                        </div>
                        <div class="col-md-4 mb-3">
                            <label for="wbsDescrip">Region</label>
                            {{-- <input type="text" class="form-control" id="wbsDescrip" value="" required> --}}
                            {!! Form::select('region',$regiones,null,['class'=>'form-control select_wbs req_common','data-id'=>3,'id'=>'wbsDescrip','placeholder'=>'REGION','style'=>'width: 100%;']) !!}
                        </div>
                        <div class="col-md-4 mb-3">
                            <label for="wbsTecnologia">Tecnologia</label>
                            {!! Form::select('tecnologia',$tecnologias,null,['class'=>'form-control select_wbs req_common','data-id'=>4,'id'=>'wbsTecnologia','placeholder'=>'TECNOLOGIA','style'=>'width: 100%;']) !!}
                        </div>
                        <div class="col-md-4 mb-3">
                            <label for="wbsGrupo">Grupo</label>
                            {{-- <input type="number" class="form-control" id="wbsGrupo" value="" required> --}}
                            {!! Form::select('grupo',$grupos,null,['class'=>'form-control select_wbs req_common','data-id'=>5,'id'=>'wbsGrupo','placeholder'=>'GRUPO','style'=>'width: 100%;']) !!}
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    {{--<button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button> --}}
                    <button type="button" onclick="NuevoWBS();" id="wbsNuevo" class="btn btn-success">Agregar</button>
                </div>
            </div>
        </div>
    </div>
    <!-- Modal -->
    <div class="modal fade" id="Editarwbs" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog"
         aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLongTitle">Modificar WBS</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-row">
                        <div class="col-md-4 mb-3">
                            <label for="wbsClientem">Cliente</label>
                            {{-- <input type="text" class="form-control" id="wbsCliente" value="" required> --}}
                            {!! Form::select('cliente',$clientes,null,['class'=>'form-control select_wbs req_common','data-id'=>1,'id'=>'wbsClientem','placeholder'=>'CLIENTE','style'=>'width: 100%;']) !!}
                        </div>
                        <div class="col-md-4 mb-3">
                            <label for="wbsSerciciom">Servicio</label>
                            {{-- <input type="text" class="form-control" id="wbsServicio" value="" required> --}}
                            {!! Form::select('servicio',$servicios,null,['class'=>'form-control select_wbs req_common','data-id'=>2,'id'=>'wbsServiciom','placeholder'=>'SERVICIO','style'=>'width: 100%;']) !!}
                        </div>
                        <div class="col-md-4 mb-3">
                            <label for="wbsDescripm">Region</label>
                            {{-- <input type="text" class="form-control" id="wbsDescrip" value="" required> --}}
                            {!! Form::select('region',$regiones,null,['class'=>'form-control select_wbs req_common','data-id'=>3,'id'=>'wbsDescripm','placeholder'=>'REGION','style'=>'width: 100%;']) !!}
                        </div>
                        <div class="col-md-4 mb-3">
                            <label for="wbsTecnologiam">Tecnologia</label>
                            {!! Form::select('tecnologia',$tecnologias,null,['class'=>'form-control select_wbs req_common','data-id'=>4,'id'=>'wbsTecnologiam','placeholder'=>'TECNOLOGIA','style'=>'width: 100%;']) !!}
                        </div>
                        <div class="col-md-4 mb-3">
                            <label for="wbsGrupom">Grupo</label>
                            {{-- <input type="number" class="form-control" id="wbsGrupo" value="" required> --}}
                            {!! Form::select('grupo',$grupos,null,['class'=>'form-control select_wbs req_common','data-id'=>5,'id'=>'wbsGrupom','placeholder'=>'GRUPO','style'=>'width: 100%;']) !!}
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                        <button type="button" onclick="ActualizarWBS();" id="wbsEditar" class="btn btn-success">
                            Guardar
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="container-fluid">
        <div class="card card-primary card-outline">
            <div class="card-header">
                <h3 class="card-title">
                    <i class="fa fa-plus"></i>
                    Administracion de catalogos
                </h3>
                <div class="col-12">
                    <div class="card-body form-group">
                        <ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active" id="pills-home-tab" data-toggle="pill"
                                   href="#pills-catalogos" role="tab" aria-controls="pills-catalogos"
                                   aria-selected="true">Codigos</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" id="pills-home-tab" data-toggle="pill"
                                   href="#pills-coordinador" role="tab" aria-controls="pills-coordinador"
                                   aria-selected="true">Coordinadores</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" id="pills-profile-tab" data-toggle="pill"
                                   href="#pills-planes" role="tab" aria-controls="pills-planes" aria-selected="false">Planes
                                    Lineas</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" id="pills-proyectos-tab" data-toggle="pill"
                                   href="#pills-proyectos" role="tab" aria-controls="pills-proyectos"
                                   aria-selected="false">Proyectos</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" id="pills-contact-tab" data-toggle="pill"
                                   href="#pills-wbs" role="tab" aria-controls="pills-wbs" aria-selected="false">WBS</a>
                            </li>
                        </ul>
                        <div class="tab-content" id="pills-tabContent">
                            <div class="tab-pane fade show active" id="pills-catalogos" role="tabpanel"
                                 aria-labelledby="pills-home-tab">
                                <hr/>
                                <div class="row">
                                    <button id="Ncodigo" type="button" onclick="OcultaBtnEdit();"
                                            class="btn btn-success btn-sm float-right"
                                            data-toggle="modal" data-target=".bd-example-modal-lg">Agregar Codigo
                                    </button>
                                    <div class="col-12">
                                        <hr/>
                                        <table class="table table-active table-responsive" id="catalogosCodigos-table"
                                               style="text-align: right;font-size: 12px;width: 100%">
                                            <thead>
                                            <tr>
                                                <th>Id</th>
                                                <th>Codigo</th>
                                                <th>Concepto</th>
                                                <th>Precio</th>
                                                <th>Costo</th>
                                                <th>Incluye</th>
                                                <th>Tipo</th>
                                                <th>Diario</th>
                                                <th>PD</th>
                                                <th>Diario Gasolina</th>
                                                <th>Monto Viatico</th>
                                                <th>Incluye Viatico</th>
                                                <th>Incluye equipo</th>
                                                <th>Descripcion</th>
                                                <th>Horas</th>
                                                <th>Caduca</th>
                                                <th>Editar</th>
                                                <th>Eliminar</th>
                                            </tr>
                                            </thead>
                                        </table>
                                    </div>
                                </div>
                            </div>
                            <div class="tab-pane fade" id="pills-coordinador" role="tabpanel"
                                 aria-labelledby="pills-contact-tab">
                                <hr/>
                                <div class="row">
                                    <button id="CCoordinadorNew" type="button" onclick="OcultaBtnEdit();"
                                            class="btn btn-success btn-sm float-right" data-toggle="modal"
                                            data-target=".bd-example-modal-lg1">Agregar coordinador
                                    </button>
                                    <div class="col-12">
                                        <hr/>
                                        <table class="table table-active table-responsive" id="Coordinador-table"
                                               style="text-align: right;font-size: 12px;width: 100%">
                                            <thead>
                                            <tr>
                                                <th>Id</th>
                                                <th>Nombre</th>
                                                <th>Apellido</th>
                                                <th>Correo</th>
                                                <th>Editar</th>
                                                <th>Eliminar</th>
                                            </tr>
                                            </thead>
                                        </table>

                                    </div>
                                </div>
                            </div>
                            <div class="tab-pane fade" id="pills-planes" role="tabpanel"
                                 aria-labelledby="pills-profile-tab">
                                <hr/>
                                <div class="row">
                                    <button id="cPlanesNew" type="button" onclick="OcultaBtnEdit();"
                                            class="btn btn-success btn-sm float-right"
                                            data-toggle="modal" data-target=".bd-example-modal-lg2">Agregar plan
                                    </button>
                                    <div class="col-12">
                                        <hr/>
                                        <table class="table table-active table-responsive" id="planes-table"
                                               style="text-align: right;font-size: 12px;width: 100%">
                                            <thead>
                                            <tr>
                                                <th>Id</th>
                                                <th>Codigo</th>
                                                <th>Nombre</th>
                                                <th>Tipo</th>
                                                <th>Descripcion</th>
                                                <th>Costo</th>
                                                <th>Precio</th>
                                                <th>Empresa</th>
                                                <th>Proveedor</th>
                                                <th>Editar</th>
                                                <th>Eliminar</th>
                                            </tr>
                                            </thead>
                                        </table>
                                    </div>
                                </div>
                            </div>
                            <div class="tab-pane fade" id="pills-wbs" role="tabpanel"
                                 aria-labelledby="pills-contact-tab">
                                <hr/>
                                <div class="row">
                                    <button id="CwbsNew" type="button" class="btn btn-success btn-sm float-right"
                                            data-toggle="modal" data-target=".bd-example-modal-lg3">Agregar WBS
                                    </button>
                                    <div class="col-12">
                                        <hr/>
                                        <table class="table table-active table-responsive" id="wbs-table"
                                               style="text-align: right;font-size: 12px;width: 100%">
                                            <thead>
                                            <tr>
                                                <th>Id</th>
                                                <th>Cliente</th>
                                                <th>Servicio</th>
                                                <th>Region</th>
                                                <th>Tecnologia</th>
                                                <th>Grupo</th>
                                                <th>Editar</th>
                                                <th>Eliminar</th>
                                            </tr>
                                            </thead>
                                        </table>
                                    </div>
                                </div>
                            </div>
                            <div class="tab-pane fade" id="pills-proyectos" role="tabpanel"
                                 aria-labelledby="pills-proyectos-tab">
                                <hr/>
                                <fieldset class="form-group">
                                    <div class="row">
                                        <div class="col-sm-8">
                                            <table class="table table-active table-responsive" id="proyectos-table"
                                                   style="text-align: right;font-size: 12px;width: 100%">
                                                <thead>
                                                <tr>
                                                    <th>Id</th>
                                                    <th>Proyecto</th>
                                                    <th>Nombre</th>
                                                    <th>Activo</th>
                                                    <th>Editar</th>
                                                    <th>Eliminar</th>
                                                </tr>
                                                </thead>
                                            </table>
                                        </div>
                                        <div class="col-sm-2">
                                            <legend class="col-form-label col-sm-12 pt-0">
                                                <h4>Agregar proyecto</h4>
                                            </legend>
                                            <div class="col-sm-12" id="divRadios">
                                                <div class="form-check">
                                                    <input class="form-check-input" type="radio" name="p" id="RCliente"
                                                           value="clientes" checked>
                                                    <label class="form-check-label" for="RCliente">Cliente</label>
                                                </div>
                                                <div class="form-check">
                                                    <input class="form-check-input" type="radio" name="p" id="RServicio"
                                                           value="servicios">
                                                    <label class="form-check-label" for="RServicio">Servicio</label>
                                                </div>
                                                <div class="form-check">
                                                    <input class="form-check-input" type="radio" name="p" id="RRegion"
                                                           value="regiones">
                                                    <label class="form-check-label" for="RRegion">Region</label>
                                                </div>
                                                <div class="form-check">
                                                    <input class="form-check-input" type="radio" name="p"
                                                           id="RTecnologia" value="tecnologias">
                                                    <label class="form-check-label" for="RTecnologia">Tecnologia</label>
                                                </div>
                                                <div class="form-check">
                                                    <input class="form-check-input" type="radio" name="p" id="RGrupo"
                                                           value="grupos">
                                                    <label class="form-check-label" for="RGrupo">Grupo</label>
                                                </div>
                                            </div>
                                            <div class="form-check">
                                                <button type="button" class="btn btn-primary" onclick="OcultaDiv();"
                                                        id="ProyectoNew" data-toggle="modal"
                                                        data-target="#ModalProyectos">
                                                    Agregar
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </fieldset>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    {{-- secion de modals --}}
    <div class="modal fade bd-example-modal-lg" data-backdrop="static" data-keyboard="false" id="ModalNuevoCodigo"
         tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="addcodigo">Agregar nuevo codigo</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-row">
                        <div class="col-md-4 mb-3">
                            <label for="Ccodigo">Codigo</label>
                            <input type="text" class="form-control" id="Ccodigo" value="" required>
                        </div>
                        <div class="col-md-4 mb-3">
                            <label for="Cconsepto">Concepto</label>
                            <input type="text" class="form-control" id="Cconsepto" value="" required>
                        </div>
                        <div class="col-md-4 mb-3">
                            <label for="Cprecio">Precio</label>
                            <input type="Number" class="form-control" id="Cprecio" value="" required>
                        </div>
                        <div class="col-md-4 mb-3">
                            <label for="Ccosto">Costo</label>
                            <input type="Number" class="form-control" id="Ccosto" value="" required>
                        </div>
                        <div class="col-md-4 mb-3">
                            <label for="Cincluye">Incluye</label>
                            <input type="text" class="form-control" id="Cincluye" value="" required>
                        </div>
                        <div class="col-md-4 mb-3">
                            <form class="form-inline">
                                <label class="my-1 mr-2" for="Ctipo">Tipo</label>
                                <select class="custom-select my-1 mr-sm-2" id="Ctipo" required>
                                    <option selected>Seleccionar</option>
                                    <option value="sueldo">Sueldo</option>
                                    <option value="computo">Computo</option>
                                    <option value="celular">Celular</option>
                                    <option value="auto">Auto</option>
                                    <option value="bam">Bam</option>
                                    <option value="sw">Sw</option>
                                    <option value="viatico">Viatico</option>
                                    <option value="viaticos">Viaticos</option>
                                    <option value="">N/A</option>
                                </select>
                            </form>
                        </div>
                        <div class="col-md-4 mb-3">
                            <label for="Cdiario">Diario</label>
                            <input type="Number" class="form-control" id="Cdiario" required value="0.00">
                        </div>
                        <div class="col-md-4 mb-3">
                            <label for="Cpd">PD</label>
                            <input type="text" class="form-control" id="Cpd" value="" required>
                        </div>
                        <div class="col-md-4 mb-3">
                            <label for="CdiarioGasolina">Diario Gasolina</label>
                            <input type="Number" class="form-control" id="CdiarioGasolina" required value="0.00">
                        </div>
                        <div class="col-md-4 mb-3">
                            <label for="Horas">Horas</label>
                            <input type="text" class="form-control" id="Horas" value="">
                        </div>
                        <div class="col-md-4 mb-3">
                            <label for="CincluyeViaticos">Incluye viaticos</label>
                            <select class="custom-select mr-sm-2" id="CincluyeViaticos" required>
                                <option selected>Seleccione</option>
                                <option value="0">No</option>
                                <option value="1">Si</option>
                            </select>
                        </div>
                        <div class="col-md-4 mb-3">
                            <label for="CincluyeEquipo">Incluye equipo</label>
                            <select class="custom-select mr-sm-2" id="CincluyeEquipo" required>
                                <option selected>Seleccione</option>
                                <option value="0">No</option>
                                <option value="1">Si</option>
                            </select>
                        </div>
                        <div class="col-md-8 mb-3">
                            <label for="cDescripcion">Descripción</label>
                            <textarea class="form-control" id="cDescripcion" rows="2"></textarea>
                        </div>
                        <div class="col-md-4 mb-3">
                            <label for="Ccaduca">Caduca</label>
                            <input type="date" class="form-control" id="Ccaduca" value="">
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    {{-- <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>			 --}}
                    <button type="button" onclick="ActualizarCodigo();" id="CEditar" class="btn btn-success">Guardar
                    </button>
                    <button type="button" onclick="CodigoNuevo();" id="CAgregar" class="btn btn-success">Agregar
                    </button>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade bd-example-modal-lg1" data-backdrop="static" data-keyboard="false" id="ModalNuevoCoordinador"
         tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="addCoordinador">Coordinador</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-row">
                        <div class="col-md-4 mb-3">
                            <label for="CoNombre">Nombre</label>
                            <input type="text" class="form-control" id="CoNombre" value="" required>
                        </div>
                        <div class="col-md-4 mb-3">
                            <label for="CoApellido">Apellido</label>
                            <input type="text" class="form-control" id="CoApellido" value="" required>
                        </div>
                        <div class="col-md-4 mb-3">
                            <label for="CoCorreo">Correo</label>
                            <input type="Email" class="form-control" id="CoCorreo" value="" required>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    {{--
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button> --}}
                    <button type="button" onclick="ActualizarCoordinador();" id="CoEditar" class="btn btn-success">
                        Guardar
                    </button>
                    <button type="button" onclick="NuevoCoordinador();" id="CoAgregar" class="btn btn-success">Agregar
                    </button>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="ModalProyectos" tabindex="-1" role="dialog" aria-labelledby="ModalProyectos"
         aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Administrar Proyectos</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div id="ActualizarProy">
                        <div class="form-row">
                            <div class="col-md-4 mb-3">
                                <label for="proyId">Id</label>
                                <input type="text" class="form-control" id="proyId" disabled value="" required>
                            </div>
                            <div class="col-md-4 mb-3">
                                <label for="ProyTabla">Proyecto</label>
                                <input type="text" class="form-control" id="ProyTabla" disabled value="" required>
                            </div>

                            <div class="col-md-4 mb-3">
                                <label for="ProyNom">Nombre</label>
                                <input type="text" class="form-control" id="ProyNom" value="" required>
                            </div>
                            <div class="col-md-4 mb-3">
                                <label for="proyActivo">Activo</label>
                                <select class="custom-select mr-sm-2" id="proyActivo" required>
                                    <option selected>Seleccione</option>
                                    <option value="0">No</option>
                                    <option value="1">Si</option>
                                </select>
                            </div>
                        </div>
                        <button type="button" onclick="ActualizarProyecto();" id="CoEditar" class="btn btn-success">
                            Guardar
                        </button>
                    </div>
                    <div id="NuevoProy">
                        <div class="form-row">
                            <div class="col-md-4 mb-3">
                                <label for="proyIdn">Id</label>
                                <input type="text" class="form-control" id="proyIdn" value="" required>
                            </div>
                            <div class="col-md-4 mb-3">
                                <label for="ProyTablan">Proyecto</label>
                                <input type="text" class="form-control" id="ProyTablan" disabled value="" required>
                            </div>
                            <div class="col-md-4 mb-3">
                                <label for="ProyNomn">Nombre</label>
                                <input type="text" class="form-control" id="ProyNomn" value="" required>
                            </div>
                            <div class="col-md-4 mb-3">
                                <label for="proyActivon">Activo</label>
                                <select class="custom-select mr-sm-2" id="proyActivon" required>
                                    <option selected>Seleccione</option>
                                    <option value="0">No</option>
                                    <option value="1">Si</option>
                                </select>
                            </div>
                        </div>
                        <button type="button" onclick="NuevoProyecto();" id="CoAgregar" class="btn btn-success">
                            Agregar
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade bd-example-modal-lg2" data-backdrop="static" data-keyboard="false"
         id="ModalNuevoPlan" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="addcodigoplan"></h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-row">
                        <div class="col-md-4 mb-3">
                            <label for="Pcodigo">Plan Codigo</label>
                            <input type="text" class="form-control" id="Pcodigo" value="" required>
                        </div>
                        <div class="col-md-4 mb-3">
                            <label for="Pnombre">Plan Nombre</label>
                            <input type="text" class="form-control" id="Pnombre" value="" required>
                        </div>
                        <div class="col-md-4 mb-3">
                            <label for="Pdescripcion">Plan Descripcion</label>
                            <input type="text" class="form-control" id="Pdescripcion" value="" required>
                        </div>
                        <div class="col-md-4 mb-3">
                            <label for="ptipo">Plan Tipo</label>
                            <input type="text" class="form-control" id="ptipo" value="" required>
                        </div>
                        <div class="col-md-4 mb-3">
                            <label for="pcosto">Plan Costo</label>
                            <input type="number" class="form-control" id="pcosto" value="" required>
                        </div>
                        <div class="col-md-4 mb-3">
                            <label for="Pprecio">Plan Precio</label>
                            <input type="number" class="form-control" id="Pprecio" value="" required>
                        </div>
                        <div class="col-md-4 mb-3">
                            <label for="Pempresa">Plan Empresa</label>
                            <input type="text" class="form-control" id="Pempresa" value="" required>
                        </div>
                        <div class="col-md-4 mb-3">
                            <label for="Pproveedor">Plan Proveedor</label>
                            <select class="custom-select mr-sm-2" id="Pproveedor" required>
                                <option selected>Seleccione</option>
                                <option value="MOVISTAR">MOVISTAR</option>
                                <option value="TELCEL">TELCEL</option>
                                <option value="AT&T">AT&T</option>
                                <option value="IUSACELL">IUSACELL</option>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    {{--
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button> --}}
                    <button type="button" onclick="ActualizarPlan();" id="PlEditar" class="btn btn-success">Guardar
                    </button>
                    <button type="button" onclick="NuevoPlan();" id="PlNuevo" class="btn btn-success">Agregar</button>
                </div>
            </div>
        </div>
    </div>
    {!! Html::script('js/configuracion/codigos.js') !!}
    {!! Html::script('js/configuracion/GetTablas.js') !!}
@endsection
