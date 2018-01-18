<%@page import="asignaturas.Tutorias"%>
<%@page import="jdk.nashorn.internal.ir.RuntimeNode.Request"%>
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
	int codasig = Integer.parseInt(request.getParameter("codigoasignatura"));
	Asignatura datosasignatura = Asignatura.getAsignatura(codasig);
	int profesorasig = datosasignatura.getProfesor();
	String nombreasig = datosasignatura.getNombre();
	String horarioasig = datosasignatura.getHorario();
	Usuario datosprofesor = ConsultaUsuarios.getUsuario(profesorasig);
	String nombreprof = (datosprofesor.getNombre() + " " + datosprofesor.getApellido());
	
	LinkedList<Tutorias> listatutorias = Tutorias.getTutorias(profesorasig);  //Tutorias del profesor asignado.
	%>

<body>
	<jsp:include page="Vista/cabecera.jsp"></jsp:include>
	<div class="container">
		<div class="col-rs 12 panel panel-default ">
			<div class="panel-heading">
				<h2> Horario de tutorias del profesor <%=nombreprof%>
				</h2>
			</div>
			<table class="table table-striped">
				<tr>
					<th>Idtutoria</th>
					<th>Dia</th>
					<th>Hora</th>
					<th>Solicitar</th>
				</tr>
				<%
						for (int i = 0; i < listatutorias.size(); i++) {
							out.println("<tr>");
							out.println("<td>" + listatutorias.get(i).getIdtutoria() + "</td>");
							out.println("<td>" + listatutorias.get(i).getDia() + "</td>");
							out.println("<td>" + listatutorias.get(i).getHora() + "</td>");
							out.println("<td><a href='altasolicitud.jsp?isolicitud="+listatutorias.get(i).getIdtutoria() +"'>Solicitar Tutoria</a></td>");
							out.println("</tr>");
						}
					%>
			</table>
</body>
</html>