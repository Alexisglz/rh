<div class="modal fade" id="viable" role="dialog">
    <div class="modal-dialog modal-md">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="titulomodal">{{__('Recurso Viable')}}</h4>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <div class="row">
                        <div class=" btn-group-toggle" data-toggle="buttons">
                            <input hidden id="id_empleado_via">
                            <label id="lbl_vi_si" class="btn btn-success ml-2">
                                <input type="radio" name="options" id="option1" autocomplete="off" value="Si"
                                       checked> {{__('SI')}}
                            </label>
                            <label id="lbl_vi_no" class="btn btn-danger ml-2">
                                <input type="radio" name="options" id="option2" autocomplete="off"
                                       value="No"> {{__('NO')}}
                            </label>
                            <label id="lbl_vi_res" class="btn btn-warning ml-2 text-white">
                                <input type="radio" name="options" id="option3" autocomplete="off"
                                       value="Con reservas"> {{__('VIABLE CON RESERVAS')}}
                            </label>
                            <label id="lbl_vi_na" class="btn btn-secondary ml-2">
                                <input type="radio" name="options" id="option4" autocomplete="off"
                                       value="No aplica"> {{__('NO APLICA')}}
                            </label>
                        </div>
                    </div>
                    <div class="row mt-5">
                        <label for="obs_via">{{__('Observaciones')}}</label>
                        <textarea class="form-control" id="obs_via"></textarea>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <div align="right">
                    <button type="button" class="btn btn-xs btn-danger" data-dismiss="modal">{{__('Cerrar')}}</button>
                    @can('access',[\App\User::class,'cambio_viable'])
                        <button type="button" class="btn btn-xs btn-primary" id="enviar" onclick='saveViable()'>{{__('Guardar')}}</button>
                    @endcan
                </div>
            </div>
        </div>
    </div>
</div>
<style>
    .btn-success:not(:disabled):not(.disabled).active{
        box-shadow: 0 0 1em #28a745 !important;
    }
    .btn-danger:not(:disabled):not(.disabled).active{
        box-shadow: 0 0 1em #dc3545 !important;
    }
    .btn-warning:not(:disabled):not(.disabled).active{
        box-shadow: 0 0 1em #d4a605 !important;
    }
    .btn-secondary:not(:disabled):not(.disabled).active {
        box-shadow: 0 0 1em #6c757d !important;
    }
</style>
