<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="usuarios.ConsultaUsuarios"%>
<%@page import="usuarios.Usuario"%>
<%@page import="asignaturas.*"%>
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
<title>Listado alumnos matriculados</title>
</head>
<body>
<div class="container">
	<jsp:include page="Vista/cabecera.jsp" />
	<div class="col-rs 12 panel panel-default ">
			<div class="panel-heading">
		<h2>Alumnos matriculados en la asignatura</h2>
		</div>
	<table class="table table-striped sortable">
		<tr>
			<th>Código matricula</th>
			<th>Idusuario</th>
			<th>Nombre</th>
			<th>Apellidos</th>
			<th></th>
		</tr>
	<%
		int profesor = (int) session.getAttribute("id_usuario");
		String nombreprofesor = (String) session.getAttribute("nombre");
		int idasignatura = Integer.parseInt(request.getParameter("idasignatura"));
		LinkedList<Matricula> lista = Matricula.getUsuMatAsig(idasignatura);

		for (int i = 0; i < lista.size(); i++)

		{
			Usuario usuario= ConsultaUsuarios.getUsuario(lista.get(i).getIdusuario());
			out.println("<tr>");
			out.println("<td>" + lista.get(i).getIdmatricula() + "</td>");
			out.println("<td>" + lista.get(i).getIdusuario() + "</td>");
			out.println("<td>" + usuario.getNombre() + "</td>");
			out.println("<td>" + usuario.getApellido() + "</td>");
			out.println("</tr>");	
		}
	%>
	</table>
	
	</div>
	<button type="submit" class="btn btn-default"onclick="history.back()">Atrás</button>
	</div>
</body>
</html>