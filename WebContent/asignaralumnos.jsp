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
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="Vista/cabecera.jsp" />
	<%
		int idasignatura = Integer.parseInt(request.getParameter("id"));
		out.println(idasignatura);
		Asignatura asignatura = Asignatura.getAsignatura(idasignatura);

		if (asignatura.getEstado() == "baja") {
	%>
	<h2>Asignatura da baja, no permite añadir alumnos. Por favor
		activela primerop</h2>
	<%
		} else {
	%>
	<table class="table table-striped">
		<tr>
			<th>Idusuario</th>
			<th>Login</th>
			<th>Nombre</th>
			<th>Apellidos</th>
			<th>Asignar asignatura</th>
		</tr>
		<%
			LinkedList<Usuario> lista = ConsultaUsuarios.getUsuariostipo("estudiante");
				for (int i = 0; i < lista.size(); i++) {
					out.println("<tr>");
					out.println("<td>" + lista.get(i).getIdusuario() + "</td>");
					int idusuario = lista.get(i).getIdusuario();
					out.println("<td>" + lista.get(i).getLogin() + "</td>");
					out.println("<td>" + lista.get(i).getNombre() + "</td>");
					out.println("<td>" + lista.get(i).getApellido() + "</td>");
			//*		if (lista.get(i).getIdusuario() in Matriculas) {
					%><td><form action='MatriculaAlumno' method='post'>
				   <input type="hidden" name="idusuario" value="<%=idusuario%>">
				    <input type="hidden" name="idasignatura" value="<%=idasignatura%>">
				    <input type='submit' name='button' value='Matricula'></form><td>
					<% 	
					//*if (lista.get(i).getIdusuario() in Matriculas) {
					out.println("</tr>");
				}
			}
		%>
		<jsp:include page="Vista/pie.jsp" />
</body>
</html>