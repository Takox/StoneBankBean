<%-- 
    Document   : exito.jsp
    Created on : 04-may-2018, 15:56:11
    Author     : Fran Gambero
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    String mensaje = (String)request.getAttribute("mensajeExito");
    String url = (String)request.getAttribute("proximaURL");
    %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

        <!-- jQuery library -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

        <!-- Latest compiled JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>SB Exito</title>
    </head>
    <body class="container-fluid">
        <div align="center">
        <h1>Página de éxito</h1>
        <hr>
        
        <h3 style="color: #2D9024">El mensaje recibido es: <%= mensaje %></h3>
        
         <form action="<%= url %>">
                <input type="submit" value="Siguiente" />
            </form>
         
        </div>        
    </body>
</html>
