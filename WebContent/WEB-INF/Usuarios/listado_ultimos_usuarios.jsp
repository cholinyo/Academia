<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="com.mysql.jdbc.*" %>
<%@page import="mySQLconnections.conectaBD" %>
<%@ page import = "java.util.LinkedList"%>
<%@ page import = "mySQLconnections.Usuario"%> 
<%@ page import = "mySQLconnections.ConsultaUsuarios"%> 
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>
</title>
</head>
<div class="container">
<table class="table table-striped">
<tr>
<th>Idusuario</th>
<th>Login</th>
<th>Nombre</th>
<th>Apellidos</th>
<th>Rol</th>
<th>x</th>
<th>x</th>
<th>x</th>
</tr>
<%
LinkedList<Usuario> lista = ConsultaUsuarios.getUltimosUsuarios();
for (int i=0;i<lista.size();i++)
{
   out.println("<tr>");
   out.println("<td>"+lista.get(i).getIdusuario()+"</td>");
   out.println("<td>"+lista.get(i).getLogin()+"</td>");
   out.println("<td>"+lista.get(i).getNombre()+"</td>");
   out.println("<td>"+lista.get(i).getApellido()+"</td>");
   out.println("<td>"+lista.get(i).getRol()+"</td>");
   out.println("<td>Modificar</td>");
   out.println("<td>Eliminar()</td>");
   out.println("</tr>");
}
%>
</table>
</div>
</body>
</html>