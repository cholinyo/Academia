<%@page import="com.sun.javafx.binding.SelectBinding.AsInteger"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>ç<%@page import="usuarios.ConsultaUsuarios"%>
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
<title>Zona Privada Alumno</title>
</head>
<body>
<%
	int alumno = (int) session.getAttribute("id_usuario");
	String nombrealumno =(String) session.getAttribute("nombre");
	LinkedList<Matricula> lista = Matricula.getMatricula(alumno);
%>
<jsp:include page="Vista/cabecera.jsp" />
<div class="container">
	<div class="col-rs 12 panel panel-default ">
		<div class="panel-heading">
			<h2>	Asignaturas Matriculadas por <%=nombrealumno%></h2>
		</div>
		<div class="panel panel-body">
			<table class="table table-striped">
				<tr>
					<th>Id</th>
					<th>Cod</th>
					<th>Nombre</th>
					<th>Horario</th>
					<th>Solicitar tutoria</th>
				</tr>
<%
	for (int i = 0; i < lista.size(); i++) {
		int idmatricula = lista.get(i).getIdmatricula();
		int codigoasignatura = lista.get(i).getIdasignarura();
		Asignatura asignatura = Asignatura.getAsignatura(codigoasignatura);
		String nombreasignatura = asignatura.getNombre();
		int codprof = asignatura.getProfesor();
		String horario = asignatura.getHorario();
		out.println("<tr>");
		out.println("<td>" + idmatricula + "</td>");
		out.println("<td>" + codigoasignatura+ "</td>");
		out.println("<td>" + nombreasignatura + "</td>");
		out.println("<td>" + horario + "</td>"); 
		out.println("<td><a href='alta_solicitud.jsp?codpro="+codprof+"'>Solicitar tutoria</td>");
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