<%@page import="com.sun.javafx.binding.SelectBinding.AsInteger"%>
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
<title>Zona Privada Alumno</title>
</head>
<body>
	<jsp:include page="Vista/cabecera.jsp" />
	<%
		int alumno = (int) session.getAttribute("id_usuario");
		String nombrealumno = (String) session.getAttribute("nombre");
		Usuario profesor = ConsultaUsuarios.getUsuario(Integer.parseInt(request.getParameter("codpro")));

		LinkedList<Tutorias> listatutorias = Tutorias.getTutorias(Integer.parseInt(request.getParameter("codpro"))); //Recojo las tutorias de un profesor
	%>
	<div class="container">
		<div class="col-rs 12 panel panel-default ">
			<div class="panel-heading">
				<h3>
					Tutorias disponibles para el profesor
					<%=profesor.getNombre() + " " + profesor.getApellido()%>
			</div>
			<div class="panel panel-body">
				<form class="form-horizontal" action="AltaPeticionTutoria"
					method="post">
					<div class="form-group">
						<label class="col-sm-2" for="idtutora">Selecciona un
							horario</label>
						<div class="col-sm-10">
							<%
								if (listatutorias.size() == 0) {
									out.println("Profesor sin tutorias");

								}
								if (listatutorias.size() != 0) {
									for (int i = 0; i < listatutorias.size(); i++) {
										out.println("<input type='radio' name='idtutoria' value='" + listatutorias.get(i).getIdtutoria()
												+ "'> " + listatutorias.get(i).getDia() + " " + listatutorias.get(i).getHora() + "h");
									}
							%>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2" for="observaciones">Observaciones</label>
						<div class="col-sm-10">
							<textarea rows="4" cols="50" name="observaciones"
								id="observaciones""></textarea>
						</div>
					</div>
					<div class="col-sm-10">
						<input type="hidden" name="idprofesor"
							value="<%=profesor.getIdusuario()%>" id="idprofesor" "/>
					</div>
					<button type="submit" class="btn btn-default">Realizar
						solicitud</button>
				</form>
				<%
					}
				%>
			</div>
		</div>
	</div>

	<jsp:include page="Vista/pie.jsp" />
</html>