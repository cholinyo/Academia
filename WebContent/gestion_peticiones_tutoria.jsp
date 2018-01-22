<%@page import="asignaturas.PeticionTutoria"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.*"%>
<%@page import="mySQLconnections.ConectaBD"%>
<%@ page import="java.util.LinkedList"%>
<%@ page import="usuarios.Usuario"%>
<%@ page import="usuarios.ConsultaUsuarios"%>
<head>
<script type="text/javascript" src="js/sorttable.js"></script>
</head>
<body>
	<div class="panel-heading">
		<h3>Peticiones de tutorias realizadas</h3>
	</div>
	<div class="panel panel-body">	
	<table class="table table-striped sortable">
		<tr>
			<th>Id Peticion</th>
			<th>Alumno</th>
			<th>Dia</th>
			<th>Hora</th>
			<th>Estado</th>
			<th>Observaciones</th>
			<th>Aceptar</th>
			<th>Denegar</th>
		</tr>
		<%
					int idprofesor = (int) session.getAttribute("id_usuario");
					LinkedList<PeticionTutoria> lista = PeticionTutoria.getPeticionesProfesor(idprofesor);
					for (int i = 0; i < lista.size(); i++) {
						out.println("<tr>");
						out.println("<td>" + lista.get(i).getIdpeticion() + "</td>");
						Usuario alumno = ConsultaUsuarios.getUsuario(lista.get(i).getIdalumno());					
						out.println("<td>" + alumno.getNombre() + " " + alumno.getApellido() + "</td>");
						out.println("<td>" + lista.get(i).getDia() + "</td>");
						out.println("<td>" + lista.get(i).getHora() + "</td>");
						out.println("<td>" + lista.get(i).getObsservaciones() + "</td>");
						out.println("<td>" + lista.get(i).getEstado() + "</td>");
						out.println("<td><a href='CambiarEstadoTutoria?estado=aceptado&id="+lista.get(i).getIdpeticion()+"'>Aceptar</a></td>");
						out.println("<td><a href='CambiarEstadoTutoria?estado=rechazado&id="+lista.get(i).getIdpeticion()+"'>Denegar</a></td>");
						out.println("</tr>");
					}
				%>
	</table>
</div>
</body>



