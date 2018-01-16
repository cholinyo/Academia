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
<title>Alta usuario</title>
</head>

<body>
	<jsp:include page="Vista/cabecera.jsp" />
	<div class="container">
		<div class="col-rs 12 panel panel-default ">
			<div class="panel-heading">
				<h2>Alta usuario</h2>
			</div>
			<div class="panel panel-body">
				<div>
					<form class="form-horizontal" action="graba_usuario" method="post">
						<div class="form-group">
							<label class="col-sm-2" for="login">Usuario</label>
							<div class="col-sm-10">
								<input type="text" name="login" id="login" placeholder="Usuario">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2" for="password">Contraseña</label>
							<div class="col-sm-10">
								<input type="password" name="password" id="password"
									placeholder="Password">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2" for="password">Contraseña</label>
							<div class="col-sm-10">
								<input type="password" name="password2" id="password2"
									placeholder="Repite password">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2" for="text">Nombre</label>
							<div class="col-sm-10">
								<input type="text" name="nombre" id="nombre"
									placeholder="Nombre">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2" for="text">Apellidos</label>
							<div class="col-sm-10">
								<input type="text" name="apellidos" id="apellidos"
									placeholder="Apellidos">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2" for="password">Rol</label>
							<div class="col-sm-10">
								<fieldset>
									<legend></legend>
									<label> <input type="radio" name="rol" value="admin"> Administrador
									</label> <label> <input type="radio" name="rol"
										value="profesor"> Profesor
									</label> <label> <input type="radio" name="rol"
										value="estudiante" checked="checked"> Estudiante
									</label>
								</fieldset>
							</div>
						</div>
						<button type="submit" class="btn btn-default">Atrás</button>
						<button type="submit" class="btn btn-default" onclick="alert("Atras")>Enviar</button>
						
					</form>
				</div>
			</div>
		</div>
		<jsp:include page="Vista/pie.jsp" />
</body>
</html>