<%@page import="usuarios.Usuario"%>
<%@page import="usuarios.ConsultaUsuarios"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.LinkedList"%>
<%@page import="asignaturas.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%String rol = (String) session.getAttribute("rol");
switch (rol)
{
case "admin":
	break;
default:
	response.sendRedirect("index.html");
}
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="css/theme.css">
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"
	integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7"
	crossorigin="anonymous">
<title>Gestión de Asignaturas</title>
</head>
<body>
	<jsp:include page="Vista/cabecera.jsp" />
	<div class="container">
		<div class="col-rs 12 panel panel-default ">
			<div class="panel-heading">
				<h2>Listado de las asignaturas de la academia</h2>
			</div>
			<div class="panel panel-body">
				<table class="table table-striped">
					<tr>
						<th>Id</th>
						<th>Nombre</th>
						<th>Horario</th>
						<th>Profesor</th>
						<th>Modificar asignatura</th>
						<th>Matricular Alumnnos</th>
						<th>Desmatricular Alumnos</th>
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
							String estado = lista.get(i).getEstado();
							switch (lista.get(i).getEstado()) {
							case "alta":
								out.println("<td><a href='asignaralumnos.jsp?id=" + id + "'>Matricular</a></td>");
								out.println("<td><a href='eliminaralumnos.jsp?id=" + id + "'>Desmatricular</a></td>");
								break;

							case "baja":
								out.println("<td>Asignatura de baja</td>");
								out.println("<td><a href='modificarasignatura.jsp?id="+lista.get(i).getIdasignatura()+"'>Activela</a></td>");
								break;
							}
							out.println("<td>" + lista.get(i).getEstado() + "</td>");
							out.println("</tr>");
						}
					%>
				</table>
			</div>
			<button type="submit" class="btn btn-default"onclick="history.back()">Atrás</button>
		</div>
	</div>

	<jsp:include page="Vista/pie.jsp" />
</body>
</html>