<%@page import="asignaturas.PeticionTutoria"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.*"%>
<%@page import="mySQLconnections.ConectaBD"%>
<%@ page import="java.util.LinkedList"%>
<%@ page import="usuarios.Usuario"%>
<%@ page import="usuarios.ConsultaUsuarios"%>
<body>
<div class="container">
	<div class="col-rs 12 panel panel-default ">
		<div class="panel-heading">
			<h2>Peticiones de tutorias realizadas</h2>
		</div>
		<div class="panel panel-body">
			<table class="table table-striped">
				<tr>
					<th>Id Peticion</th>
					<th>Profesor</th>
					<th>Dia</th>
					<th>Hora</th>
					<th>Estado</th>
					<th></th>
				</tr>
				<%
					int idalumno = (int) session.getAttribute("id_usuario");
					LinkedList<PeticionTutoria> lista = PeticionTutoria.getPeticionesAlumno(idalumno);
					for (int i = 0; i < lista.size(); i++) {
						out.println("<tr>");
						out.println("<td>" + lista.get(i).getIdpeticion() + "</td>");
						Usuario profesor = ConsultaUsuarios.getUsuario(lista.get(i).getIdprofesor());
						
						out.println("<td>" + profesor.getNombre() + " " + profesor.getApellido() + "</td>");
						out.println("<td>" + lista.get(i).getDia() + "</td>");
						out.println("<td>" + lista.get(i).getHora() + "</td>");
						out.println("<td>" + lista.get(i).getEstado() + "</td>");
						out.println("</tr>");
					}
				%>
			</table>
		</div>
	</div>
</div>
</body>