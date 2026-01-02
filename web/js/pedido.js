/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

mostrar();


function mostrar() {

    if (!$.fn.DataTable.isDataTable('#tablax')) {
            $('#tablax').DataTable({
                responsive: true,

                ajax: {
                    url: '../ControladorPersonalizado?tipo=Administrador',
                    method: 'GET',
                    dataSrc: '',
                    error: function (xhr, error, code) {
                        console.error('Error fetching usuarios:', error);
                    },
                    complete: function () {
                        isLoading = false; // Restablecer el estado de carga
                    }
                },
                columns: [
                    {data: 'id'},
                    {data: 'id_pedido'},
                    {data: 'id_personalizado'},
                    {data: 'cantidad'},
                    {data: 'precio_individual'},
                    {
                        data: null,
                        render: function (data, type, row) {
                            return '<div class="btn-group" role="group">' +
                                '<button class="btn btn-primary btn-detalles" data-id="' + row.id_personalizado + '">' +
                                '<i class="fa-solid fa-pen-to-square"></i> Detalles</button>' +
                                '</div>';
                        },
                        orderable: false,
                        searchable: false
                    }
                ],
                language: {
                    processing: "Tratamiento en curso...",
                    search: "Buscar&nbsp;:",
                    lengthMenu: "Número _MENU_ items",
                    info: "",
                    infoEmpty: "No existen datos.",
                    infoFiltered: "(filtrado de _MAX_ elementos en total)",
                    loadingRecords: "Cargando...",
                    zeroRecords: "No se encontraron datos con tu búsqueda",
                    emptyTable: "No hay datos disponibles en la tabla.",
                    paginate: {
                        first: "Primero",
                        previous: "Anterior",
                        next: "Siguiente",
                        last: "Último"
                    },
                    aria: {
                        sortAscending: ": active para ordenar la columna en orden ascendente",
                        sortDescending: ": active para ordenar la columna en orden descendente"
                    }
                },
                scrollY: '500px',
                scrollX: true,
                scrollCollapse: true,
                lengthMenu: [[10, 25, -1], [10, 25, "Todos"]]
            });
        } else {
            $('#tablax').DataTable().ajax.reload(null, false);
        }
        
        
        
        $(document).on('click', '.btn-detalles', function () {
    const id = $(this).data('id');
    window.location.href = 'detallePersonalizado.jsp?id=' + encodeURIComponent(id);
    //window.location.href = 'http://127.0.0.1:8000/mostrarGet/?id=' + encodeURIComponent(id);
});

        
        
}



