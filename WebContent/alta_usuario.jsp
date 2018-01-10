<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Alta usuario</title>
</head>

<body>
<jsp:include page="HeadFoot/Cabecera.jsp"/> ;
<div class="login col-sm-4">	
				<p>Formulario para dar de alta usuario<p>
				<form class="form-horizontal" action="graba_usuario" method="post">
					<div class="form-group">
						<label class="col-sm-2 control-label" for="login">Usuario</label>
						<div class="col-sm-10">
							<input class="col-sm-9" type="text" name="login" id="login" placeholder="Usuario">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2" for="password">Contraseña</label>
						<div class="col-sm-10">
							<input type="password" name="password" id="password" placeholder="Password">
						</div>
					<div class="form-group">
						<label class="col-sm-2" for="password">Contraseña</label>
						<div class="col-sm-10">
							<input type="password" name="password2" id="password2" placeholder="Repite password">
						</div>
					<div class="form-group">
						<label class="col-sm-2" for=""text"">Nombre</label>
						<div class="col-sm-10">
							<input type="text" name="nombre" id="nombre" placeholder="Nombre">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2" for=""text"">Apellidos</label>
						<div class="col-sm-10">
							<input type="text" name="apellidos" id="apellidos" placeholder="Apellidos">
						</div>
										<div class="form-group">
						<label class="col-sm-2" for="password">Rol</label>
						<div class="col-sm-10">
							    <fieldset>
							        <legend>Elige un rol</legend>
							        <label>
							            <input type="radio" name="rol" value="admin">Administrador</label>
							        <label>
							            <input type="radio" name="rol" value="profesor">Profesor</label>
							        <label>
							            <input type="radio" name="rol" value="estudiante" checked="checked">Estudiante</label>
							    </fieldset>
						</div>
					<button type="submit" class="btn btn-default">Enviar</button>
				</form>
			</div>

</body>
</html>