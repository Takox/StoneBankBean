<%-- 
    Document   : confirmarEliminarMovimiento
    Created on : 19-abr-2018, 13:35:06
    Author     : rafaelpernil
--%>
<%
   int idmov = Integer.parseInt(request.getParameter("idmov")); 
   int dni = Integer.parseInt(request.getParameter("dni"));
%>    
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Confirmar eliminar movimiento</title>
    
    </head>
    <body>
        <h1>¿Está seguro de que desea eliminar el movimiento <%=idmov %> ?</h1>
            <form action="${pageContext.request.contextPath}/ServletEliminaMovimiento" method="post">
            <input type="hidden" name="idm" value="<%=idmov%>"/>
            <input type="hidden" name="dni" value="<%=dni%>"/>
             <input type="submit" value="Sí"/>
         </form>
        <form action="${pageContext.request.contextPath}/empleado/indexEmpleado.jsp">
            <input type="submit" value="No"/>
        </form>
    </body>
</html>
