<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.*"%>
<%@page import="mySQLconnections.ConectaBD"%>
<%@ page import="java.util.LinkedList"%>
<%@ page import="usuarios.Usuario"%>
<%@ page import="usuarios.ConsultaUsuarios"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<jsp:include page="Vista/cabecera.jsp" />
<%
	String rol = (request.getParameter("tipo"));
%>

<div class="container">
	<h2>
		Listado de los usuarios de la aplicación con rol
		<%=rol%></h2>
	<table class="table table-striped">
		<tr>
			<th>Idusuario</th>
			<th>Login</th>
			<th>Nombre</th>
			<th>Apellidos</th>
			<th>Rol</th>
			<th>Modifica</th>
			<th>Dar de baja</th>
		</tr>
		<%
			LinkedList<Usuario> lista = ConsultaUsuarios.getUsuariostipo(rol);
			for (int i = 0; i < lista.size(); i++) {
				out.println("<tr>");
				out.println("<td>" + lista.get(i).getIdusuario() + "</td>");
				int id = lista.get(i).getIdusuario();
				out.println("<td>" + lista.get(i).getLogin() + "</td>");
				out.println("<td>" + lista.get(i).getNombre() + "</td>");
				out.println("<td>" + lista.get(i).getApellido() + "</td>");
				out.println("<td>" + lista.get(i).getRol() + "</td>");
				out.println("<td><a href='modifica_usuario.jsp?id=" + id + "'>Modifica</a></td>");
				out.println("<td><a href='baja_usuario?id=" + id + "'>Dar de baja</a></td>");
				out.println("</tr>");
			}
		%>
	</table>
</div>
<jsp:include page="Vista/pie.jsp" />
</body>
</html>