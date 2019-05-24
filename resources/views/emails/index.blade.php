@extends('layouts.admin')
@section('contenido')
 <div class="main-contact">
        <h3 class="head">contact</h3>
        <p> kjashdlahdlkahdlads</p>
        <div class="contact-form">
    
            {!! Form::open(['route'=>'mail.store','method'=>'post']) !!}
            <div class="col-md-6 contact-left">
{!! Form::text('name',null,['placeolder'=>'Nombre']) !!}
{!! Form::text('email',null,['placeolder'=>'Email']) !!}

{{-- {!! Form::text('empleado', null, ['class'=>'form-control','id'=>'empleado']) !!} --}}
{{-- {!!Form::text('email',null,['placeolder'=>'Email'])!!} --}}


            </div>
            <div class="col-md-6 contact-right">
                    {!! Form::textarea('mensaje',null,['placeolder'=>'Mensaje']) !!}

            </div>
            {!! Form::submit('SEND') !!}
            {!! Form::close() !!} 
        </div>

        <a class="btn btn-primary btn-lg" id="hola"  role="button">
            mandar correo &raquo;
          </a>
       
    </div>
 
{!! Html::script('js/email.js') !!}

    @endsection