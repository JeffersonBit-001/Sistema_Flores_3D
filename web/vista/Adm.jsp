<%-- 
    Document   : Adm
    Created on : 28 jun. 2025, 12:24:16
    Author     : JEFFERSON
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        <h1>Ver Historial</h1>

        <%@include file="cabecera.jsp" %>

        <h1>Hello World!</h1>

        <div class="container"> <!--begin::Row-->

            <div class="row">
                <div class="col-lg-12">
                    <table id="tablax" class="table table-hover border-top-color-black display nowrap" style="width:100%">
                        <thead class="table-dark">
                            <tr>
                                
                                <th>Id</th>
                                <th>Id_Pedido</th>
                                <th>Id_Personalizado</th>
                                <th>Cantidad</th>
                                <th>Preci</th>
                                <th>Detalles</th>
                                
                            </tr>
                        </thead>


                        <tbody class="tbody_cuerpo table-group-divider">

                        </tbody>
                    </table>

                </div>

            </div>
        </div>
         <!-- JQUERY -->
        <script src="https://code.jquery.com/jquery-3.4.1.js"
                integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous">
        </script>
        <!-- DATATABLES -->
        <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js">
        </script>
        <!-- BOOTSTRAP -->
        <script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js">
        </script>

        
        <script src="<%= request.getContextPath()%>/js/pedido.js"></script>


        <%@include file="pie.jsp" %>




    </body>
</html>
