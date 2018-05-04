<%@page import="stonebank.ejb.TusuarioFacade"%>
<%@page import="stonebank.entity.Tmovimiento"%>
<%@page import="java.util.List"%>
<%@page import="stonebank.entity.Tusuario"%>

<!DOCTYPE html>

<%
    Tusuario usuario = (Tusuario)session.getAttribute("usuarioLogin"); //antes request
    List<Tusuario> listaUsuarios = (List<Tusuario>)session.getAttribute("listaUsuarios");
    //A lo mejor hay que usar session en lugar de request
    //usuario.getTmovimientoList()
    List<Tmovimiento> sublista = (usuario.getTmovimientoList().subList(0, 2));
    //Sublista empieza en 0
    
    //TusuarioFacade tusuariofacade;
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Index Usuario</title>
    </head>
    <body>
        <h1>ˇBienvenido/a  <%= usuario.getNombre() %> <%= usuario.getApellidos() %>!</h1>
        <hr>
        
        <div class = "padre" style="width:100%">
            
          <div class = "subdiv-izquierdo" style="width:40%;display:inline-table;">
            <h3>Últimos movimientos</h3>
            
            <table border="1">
                <tbody>
                    <tr>
                        <td>Concepto</td>
                        <td>IBAN</td>
                        <td>Importe</td>
                        <td>Fecha</td>
                    </tr>
                    <% 
                        for(Tmovimiento movi: sublista){      

                        %>
                    <tr>
                        <%--<td><%= movi.getTusuariodniUsuario().toString() %></td>--%>
                        <td><%= movi.getConcepto() %></td>
                        <td><%= movi.getIbanEntidad() %></td>
                        <td><%= movi.getCantidad() %> </td>
                        <td><%= movi.getFecha() %></td>
                    </tr>
                        <%
                            
                       }
                        %>
                </tbody>
            </table>
            
            <br>
            <a href="ServletListaMovimientos" >Ver todas las transacciones</a>
          </div>
            
          <div class="subdiv-derecho" style="width:40%;display:inline-table;">
              <h3>Buscador de movimientos</h3>
              <form action="ServletBusqueda" method="post">
                    <input type="text" name="Buscador" maxlength="30" value="Concepto, nombre..."/>
                    <input type="submit" value="Buscar" />              
              </form>
              <br><br>
              <%--<a href="/usuario/realizarTransferencia.jsp">Realizar transferecia</a> --%>
              <form action="/usuario/realizarTransferencia.jsp">
                   <input type="submit" value="Realizar transferencia" />
              </form>
          </div>
        </div>
              <br><br>
              
        <a href="EditarUsuario?dni=<%= usuario.getDniUsuario() %>">Configuración</a>
        <br>
        <a href="CerrarSesion">Cerrar sesión</a>
    </body>
</html>