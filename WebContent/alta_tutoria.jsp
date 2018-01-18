<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.*"%>
<%@page import="mySQLconnections.ConectaBD"%>
<%@ page import="java.util.LinkedList"%>
<%@ page import="usuarios.Usuario"%>
<%@ page import="usuarios.ConsultaUsuarios"%>
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
<title>Alta tutorias</title>
</head>
<body>
	<jsp:include page="Vista/cabecera.jsp"></jsp:include>
	<div class="container">
		<div class="col-rs 12 panel panel-default ">
			<div class="panel-heading">
				<h2>Cree la nueva turoria</h2>
			</div>
			<div class="panel panel-body">
				<form class="form-horizontal" action="AltaTutoria" method="post">
					<div class="form-group">
						<label class="col-sm-2" for="dia">Indique el día la
							tutoria</label>
						<div class="col-sm-10">
							<input type="radio" name="dia" value="Lunes" required > Lunes <input
								type="radio" name="dia" value="Martes"> Martes <input
								type="radio" name="dia" value="Miercoles"> Miercoles <input
								type="radio" name="dia" value="Jueves"> Jueves <input
								type="radio" name="dia" value="Viernes"> Viernes
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2" for="hora">Indique la hora para la
							tutoria</label>
						<div class="col-sm-10">
							<input type="number" name="hora" min="8" max="19" required>(8h-19h)
						</div>
					</div>
					<input type="hidden" name="idprofesor" id="idprofesor" value="<%= session.getAttribute("id_usuario") %>">
					<div class="form-group">
						<div class="col-sm-10">
							<input type="submit" value="Alta">
						</div>
					</div>
				</form>
			</div>

		</div>
	</div>
</body>
</html>