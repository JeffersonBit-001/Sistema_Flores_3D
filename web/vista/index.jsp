<%-- 
    Document   : index
    Created on : 27 may. 2025, 21:38:20
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
        <h1>Usuarios</h1>

        <table>
            <thead>

                <tr>
                    <th>Id</th>
                    <th>Nombre</th>
                    <th>Apellido</th>
                    <th>Accion</th>
                </tr>

            </thead>


            <tbody id="tablax">

                
            </tbody>

        </table>
        
        
        <form id="form_insertar" action="pagina.jsp" method="post">
            
            <label>Nombre</label>
            <input type="text" name="nombre" id="nombre">
            <label>Apellido</label>
            <input type="text" name="apellido" id="apellido">
            <button type="submit">Enviar</button>
        </form>

    
    
    </body>
    
    
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="<%=request.getContextPath()%>/js/usuario.js"></script>
    
</html>
