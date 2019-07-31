
<div class="modal" id="modal_calendario"  tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Calendario de Incidencias</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body body-permisos">
        <table class="table">
        <tr>
          <th>Periodo</th>
          <th>Fecha inicio</th>
          <th>Fecha fin</th>
          <th>Fecha de envío</th>
        </tr>
        @foreach ($fechas_incidencias as $a)
          <tr><td>{{$a->periodo_nombre}}</td><td>{{$a->fecha_inicio}}</td><td>{{$a->fecha_fin}}</td><td>{{$a->fecha_envio}}</td></tr>
        @endforeach
        </table>


      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
