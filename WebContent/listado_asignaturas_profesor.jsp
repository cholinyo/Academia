<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="usuarios.ConsultaUsuarios"%>
<%@page import="usuarios.Usuario"%>
<%@page import="asignaturas.Asignatura"%>
<%@page import="asignaturas.Matricula"%>
<%@ page import="java.util.LinkedList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="css/theme.css">
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"
	integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7"
	crossorigin="anonymous">
<title>Asignaturas del profesor</title>
</head>
</body>
<%
	int profesor = (int) session.getAttribute("id_usuario");
	String nombreprofesor =(String) session.getAttribute("nombre");
	LinkedList<Asignatura> lista = Asignatura.getAsignaturasProfe(profesor);
%>
<jsp:include page="Vista/cabecera.jsp" />
<div class="container">
	<div class="col-rs 12 panel panel-default ">
		<div class="panel-heading">
			<h2>	Asignaturas de <%=nombreprofesor%></h2>
		</div>
		<div class="panel panel-body">
			<table class="table table-striped">
				<tr>
					<th>Id</th>
					<th>Nombre</th>
					<th>Horario</th>
					<th>Estado</th>
					<th>Alumnos</th>
				</tr>
<%
	for (int i = 0; i < lista.size(); i++) {
		out.println("<tr>");
		out.println("<td>" + lista.get(i).getIdasignatura() + "</td>");
		out.println("<td>" + lista.get(i).getNombre() + "</td>");
		int id = lista.get(i).getIdasignatura(); //*identificador de asignatura pasa pasar com parametro a las opcines
		out.println("<td>" + lista.get(i).getHorario() + "</td>");
		out.println("<td>" + lista.get(i).getEstado() + "</td>");
		out.println("<td><a href='ver_alumnos_matriculados.jsp?idasignatura="+lista.get(i).getIdasignatura()+"'>Listado Alumnos</a></td>");
	} 
%>
			</table>
		</div>
	</div>
</div>
<body>
</html>