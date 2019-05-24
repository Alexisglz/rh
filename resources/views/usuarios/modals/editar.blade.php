<div class="modal fade" id="editarUserModal" role="dialog">
    {!! Form::open(['id'=>'formulario_edit_usuario','route'=>'usuarios.store','method'=>'POST','files'=>true,'enctype'=>"multipart/form-data"]) !!}
    <div class="modal-dialog modal-md">
        <div id="edit_usuario" class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="titulomodal">{{__('Editar Usuario')}}</h4>
            </div>
            <div class="modal-body body-permisos">
                <div class="form-group">
                    <div class="row">
                        <div class="col-md-12">
                            <form id="edit_usuario1" method="post" action="">
                                <input type="number" name="" id="user_id" hidden="true">
                                <label for="name_user">{{__('Nombre')}}</label>
                                <input type="text" name="name_user" id="name_user" class="form-control">
                                <label for="apellidos">{{__('Apellidos')}}</label>
                                <input type="text" name="apellidos" id="apellidos" class="form-control">
                                <label for="usuario">{{__('Usuario')}}</label>
                                <input type="text" name="usuario" id="usuario" class="form-control">
                                <label for="email_user">{{__('Correo Eléctronico')}}</label>
                                <input type="email" name="email_user" id="email_user" class="form-control">
                                <label for="id_empleado">{{__('ID Empleado')}}</label>
                                <input type="number" name="id_empleado" id="id_empleado" class="form-control">
                                <label for="perfil">{{__('Perfil')}}</label>
                                <select id="perfil" type="text" class="form-control" name="perfil" required>
                                    <option value="ADMIN">{{__('ADMIN')}}</option>
                                    <option value="STAFF">{{__('STAFF')}}</option>
                                    <option value="ESPECIAL">{{__('ESPECIAL')}}</option>
                                    <option value="CLIENTE">{{__('CLIENTE')}}</option>
                                </select>
                                <label for="area">{{__('Área')}}</label>
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
                                <label for="rol">{{__('Rol')}}</label>
                                <select id="rol" name="rol" class="form-control"></select>
                                @if(auth()->user()->getRol->Rol == 'ADMIN')
                                    <label for="password">{{__('Contraseña')}}</label>
                                    <input type="password" name="password" id="password" class="form-control">
                                @endif
                            </form>
                        </div>
                        <div class="col-md-6">

                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <div align="right">
                    <button type="button" class="btn btn-xs btn-danger"
                            data-dismiss="modal" id="cerrar">{{__('Cerrar')}}</button>
                    <button type="button" class="btn btn-xs btn-primary" id="enviar_user"
                            onclick="validateFormEdit()">{{__('Enviar')}}</button>
                </div>
            </div>
        </div>
    </div>
    {!! Form::close() !!}
</div>
