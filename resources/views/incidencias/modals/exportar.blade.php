<div class="modal fade" id="exp_incidencias" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle"
     aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="exampleModalLongTitle">{{__('Exportar Incidencias')}}</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="card-body text-center">
                    <div class="form-row">
                        <label for="export_inci">{{__('Periodo')}}</label>
                        <select id="export_inci" name="export_inci" class="form-control col-sm-12">
                            <option value="0">{{__('TODOS')}}</option>
                            @foreach($periodos as $periodo)
                                <option value="{{$periodo->id}}">{{strtoupper($periodo->periodo_nombre)}}</option>
                            @endforeach
                        </select>
                    </div>
                    <div class="form-row">
                        <label for="estatus_inci">{{__('Estatus')}}</label>
                        <select id="estatus_inci" name="estatus_inci" class="form-control col-sm-12">
                            <option value="">{{__('TODOS')}}</option>
                            <option value="SOLICITADO">{{__('SOLICITADO')}}</option>
                            <option value="POR VALIDAR DIRECCION">{{__('AUTORIZADO POR DIRECTOR DE AREA')}}</option>
                            <option value="POR ENVIAR">{{__('AUTORIZADO POR DIRECCION')}}</option>
                            <option value="ENVIADO">{{__('LOTE PROCESADO')}}</option>
                            <option value="CANCELAR">{{__('CANCELADO')}}</option>
                        </select>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">{{__('Cerrar')}}</button>
                <button type="button" class="btn btn-primary" onclick="ExcelIncidencias();">{{__('Exportar')}}</button>
            </div>
        </div>
    </div>
</div>
