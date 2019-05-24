$(document).ready(function () {
	var table = $('#index-table').DataTable({
        processing: true,
        serverSide: true,
        responsive: true,
        ajax: '/getDataHerra',
        columns: [
            {data: 'id', name: 'id'},
            {data: 'nombre', name: 'nombre'},
            {data: 'apaterno', name: 'apaterno'},
            {data: 'amaterno', name: 'amaterno'},
            {data: 'action', name: 'action'}
        ],
        language: {
            "lengthMenu": "Mostrando _MENU_ registros por página",
            "zeroRecords": "Nada que mostrar",
            "info": "Página _PAGE_ de _PAGES_",
            "infoEmpty": "No hay información disponible",
            "infoFiltered": "(filtrado de _MAX_ registros )",
            "search": "Buscar:",
            "paginate": {
                "previous": "Anterior",
                "next": "Siguiente",
                "first": "Primera",
                "last": "Última"
            }
        },
    });
});