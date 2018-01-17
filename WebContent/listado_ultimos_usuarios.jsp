<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.*"%>
<%@page import="mySQLconnections.ConectaBD"%>
<%@ page import="java.util.LinkedList"%>
<%@ page import="usuarios.Usuario"%>
<%@ page import="usuarios.ConsultaUsuarios"%>
<div class="container">
<div class="col-rs 12 panel panel-default ">
			<div class="panel-heading">
		<h2>Últimas altas de usuarios realizadas</h2>
		</div>
	<table class="table table-striped">
		<tr>
			<th>Idusuario</th>
			<th>Login</th>
			<th>Nombre</th>
			<th>Apellidos</th>
			<th>Rol</th>
			<th></th>
			<th></th>
		</tr>
		<%
			LinkedList<Usuario> lista = ConsultaUsuarios.getUltimosUsuarios();
			for (int i = 0; i < lista.size(); i++) {
				int id = lista.get(i).getIdusuario();
				out.println("<tr>");
				out.println("<td>" + lista.get(i).getIdusuario() + "</td>");
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
</div>

