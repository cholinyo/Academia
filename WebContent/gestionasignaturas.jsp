<%@page import="usuarios.Usuario"%>
<%@page import="usuarios.ConsultaUsuarios"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.LinkedList"%>
<%@page import="asignaturas.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="Vista/cabecera.jsp" />
	<div class="container">
		<h2>Agisnaturas dadas de alta en el sistema</h2>
		<table class="table table-striped">
			<tr>
				<th>Id</th>
				<th>Nombre</th>
				<th>Horario</th>
				<th>Profesor</th>
				<th>Modificar asignatura</th>
				<th>Asignar Alumnnos</th>
				<th>Estado</th>
			</tr>
			<%
				LinkedList<Asignatura> lista = Asignatura.getAsignaturas();
				for (int i = 0; i < lista.size(); i++) {
					out.println("<tr>");
					out.println("<td>" + lista.get(i).getIdasignatura() + "</td>");
					out.println("<td>" + lista.get(i).getNombre() + "</td>");
					int id = lista.get(i).getIdasignatura(); //*identificador de asignatura pasa pasar com parametro a las opcines
					out.println("<td>" + lista.get(i).getHorario() + "</td>");
					Usuario usuario = ConsultaUsuarios.getUsuario(lista.get(i).getProfesor());
					int codProfesor = lista.get(i).getProfesor();
					String nombreprofesor = usuario.getNombre();
					out.println("<td>" + codProfesor + " " + nombreprofesor + "</td>");
					out.println("<td><a href='modificarasignatura.jsp?id=" + id + "'>Modifica</a></td>");
					out.println("<td><a href='asignaralumnos.jsp?id=" + id + "'>Asignar</a></td>");
					out.println("<td>"+lista.get(i).getEstado()+"</td>");
					out.println("</tr>");
				}
			%>
		</table>
	</div>
	<jsp:include page="Vista/pie.jsp" />
</body>
</html>