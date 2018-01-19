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
<title>Asignar alumnos</title>
</head>
<body>
	<jsp:include page="Vista/cabecera.jsp" />
	<%
		int idasignatura = Integer.parseInt(request.getParameter("id"));
		Asignatura asignatura = Asignatura.getAsignatura(idasignatura);
	%>
	<div class='container'>
		<div class="panel panel-body">
			<div class="seleccion col-rs-4 panel panel-default">
				<div class="panel-heading">
					<h2>
						Matricular en la asignatura
						<%=asignatura.getNombre()%>
						(COD:
						<%=idasignatura%>)
					</h2>
				</div>
				<div class="panel panel-body">
					<table class="table table-striped">
						<tr>
							<th>Idusuario</th>
							<th>Login</th>
							<th>Nombre</th>
							<th>Apellidos</th>
							<th>Matricular en asignatura</th>
						</tr>
						<%
							LinkedList<Usuario> lista = ConsultaUsuarios.getUsuariostipo("estudiante");
							for (int i = 0; i < lista.size(); i++) {
								int id = lista.get(i).getIdusuario();
								if (!Matricula.compruebaMatricula(id, idasignatura)) {//Recoge los que no están matriculados
									out.println("<tr>");
									out.println("<td>" + lista.get(i).getIdusuario() + "</td>");
									out.println("<td>" + lista.get(i).getLogin() + "</td>");
									out.println("<td>" + lista.get(i).getNombre() + "</td>");
									out.println("<td>" + lista.get(i).getApellido() + "</td>");
									out.println("<td><form action='MatriculaAlumno' method='post'>");
									out.println("<input type='hidden' name='idusuario' value='" + id + "'>");
									out.println("<input type='hidden' name='idasignatura' value='" + idasignatura + "'>");
									out.println("<input type='submit' name='button' value='Matricula'></form></td>");
									out.println("</tr>");
								}
							}
						%>
					</table>
				</div>
				<button type="submit" class="btn btn-default"onclick="history.back()">Atrás</button>
			</div>
		</div>
	</div>
	<jsp:include page="Vista/pie.jsp" />
</body>
</html>