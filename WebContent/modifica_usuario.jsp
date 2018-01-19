<%@page import="usuarios.ConsultaUsuarios"%>
<%@page import="usuarios.Usuario"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	<script src="js/funciones.js" type="text/javascript"></script>
<title>Modifica usuario</title>
</head>
<body>
	<jsp:include page="Vista/cabecera.jsp" />
<% 
		int id = Integer.parseInt(request.getParameter("id"));
		Usuario user = ConsultaUsuarios.getUsuario(id);
		%>
	<div class="container">
		<div class="panel panel-body">
			<div class="seleccion col-rs-4 panel panel-default">
				<div class="panel-heading">
					<h2>Modifica usuario</h2>
				</div>
				<div class="panel panel-body">
					<form class="form-horizontal" action="modifica_usuario" onsubmit="return comprobarPassword();"
						method="post">
						<div class="form-group">
							<label class="col-sm-2" for="login">Id Usuario</label>
							<div class="col-sm-10">
								<input type="text" name="idusuario" id="idusuario"
									value="<%=user.getIdusuario()%>" readonly="readonly">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2" for="login">Usuario</label>
							<div class="col-sm-10">
								<input type="text" name="login" id="login" readonly="readonly"
									value="<%=user.getLogin()%>">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2" for="password">Contraseña</label>
							<div class="col-sm-10">
								<input type="password" name="password" id="password"
									value="<%=user.getPassword()%>">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2" for="password">Contraseña</label>
							<div class="col-sm-10">
								<input type="password" name="password2" id="password2"
									value="<%=user.getPassword()%>">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2" for="text">Nombre</label>
							<div class="col-sm-10">
								<input type="text" name="nombre" id="nombre" required
									value="<%=user.getNombre()%>">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2" for="text">Apellidos</label>
							<div class="col-sm-10">
								<input type="text" name="apellidos" id="apellidos"
									value="<%=user.getApellido()%>" required>
							</div>
						</div>
						<!--Comprobamos si es estudiante o proferos mara marcar el rol-->
						<%
							out.println(user.getRol());
							switch (user.getRol()) {
							case "profesor":
						%>
						<div class="form-group">
							<label class="col-sm-2" for="password">Rol</label>
							<div class="col-sm-10">
								<fieldset>
									<legend></legend>
									<label> <input type="radio" name="rol" value="admin">
										Administrador
									</label> <label> <input type="radio" name="rol"
										value="profesor" checked="checked"> Profesor
									</label> <label> <input type="radio" name="rol"
										value="estudiante"> Estudiante
									</label>
								</fieldset>
							</div>
						</div>
						<%
							break;
							case "estudiante":
						%>
						<div class="form-group">
							<label class="col-sm-2" for="password">Rol</label>
							<div class="col-sm-10">
								<fieldset>
									<legend></legend>
									<label> <input type="radio" name="rol" value="admin">
										Administrador
									</label> <label> <input type="radio" name="rol"
										value="profesor"> Profesor
									</label> <label> <input type="radio" name="rol"
										value="estudiante" checked="checked"> Estudiante
									</label>
								</fieldset>
							</div>
						</div>
						<%
							break;
							}
						%>
						<button type="submit" class="btn btn-default"onclick="history.back()">Atrás</button>
						<button type="submit" class="btn btn-default">Enviar</button>
						
					</form>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="Vista/pie.jsp" />
</body>
</html>