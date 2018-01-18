<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.LinkedList"%>
<%@page import="asignaturas.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Gestionar tutorias</title>
<link rel="stylesheet" type="text/css" href="css/theme.css">
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"
	integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7"
	crossorigin="anonymous">
</head>
<body>
	<jsp:include page="Vista/cabecera.jsp"></jsp:include>
	<div class="container">
		<div class="col-rs 12 panel panel-default ">
			<div class="panel-heading">
				<h2>
					Tutorias de
					<%=session.getAttribute("nombre")%>
				</h2>
			</div>
			<div class="panel panel-body">
				<table class="table table-striped">
					<tr>
						<th>Id_Tutoria</th>
						<th>Día</th>
						<th>Hora</th>
						<th>Eliminar</th>
						<th></th>
					</tr>

					<%
						int profesor = (int) session.getAttribute("id_usuario");

						LinkedList<Tutorias> lista = Tutorias.getTutorias(profesor);
						for (int i = 0; i < lista.size(); i++) {
							out.println("<tr>");
							out.println("<td>" + lista.get(i).getIdtutoria() + "</td>");
							out.println("<td>" + lista.get(i).getDia() + "</td>");
							out.println("<td>" + lista.get(i).getHora() + "</td>");
							String parametros = ("idtutoria="+lista.get(i).getIdtutoria()+"&idprofesor="+profesor);
							out.println("<td><a href='AnulaTutoria?" + parametros + "'>Dar de baja</a></td>");
							out.println("</tr>");

							
							
						}
					%>
				</table>
			</div>
		</div>
	</div>

	<jsp:include page="Vista/pie.jsp"></jsp:include>
</body>
</html>