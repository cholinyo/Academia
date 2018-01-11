<%@page import="mySQLconnections.ConsultaUsuarios"%>
<%@page import="mySQLconnections.Usuario"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<jsp:include page="Vista/cabecera.jsp"/>
<% 
int id=Integer.parseInt(request.getParameter("id"));
out.println(id);
Usuario user = ConsultaUsuarios.getUsuario(id);
out.println(user.getApellido());
%>
<div class="container">
	<div>	
				<p>Alta usuario<p>
				<form class="form-horizontal" action="graba_usuario" method="post">
					<div class="form-group">
						<label class="col-sm-2" for="login">Usuario</label>
						<div class="col-sm-10">
							<input type="text" name="login" id="login" value="<%=user.getLogin() %>">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2" for="password">Contraseña</label>
						<div class="col-sm-10">
							<input type="password" name="password" id="password" value="<%=user.getPassword() %>">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2" for="password">Contraseña</label>
						<div class="col-sm-10">
							<input type="password" name="password2" id="password2" placeholder="Repite password">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2" for="text">Nombre</label>
						<div class="col-sm-10">
							<input type="text" name="nombre" id="nombre" value="<%=user.getNombre() %>">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2" for="text">Apellidos</label>
						<div class="col-sm-10">
							<input type="text" name="apellidos" id="apellidos" value="<%=user.getApellido() %>">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2" for="password">Rol</label>
						<div class="col-sm-10">
							    <fieldset>
							        <legend></legend>
							        <label>
							            <input type="radio" name="rol" value="admin">Administrador</label>
							        <label>
							            <input type="radio" name="rol" value="profesor">Profesor</label>
							        <label>
							            <input type="radio" name="rol" value="estudiante" checked="checked">Estudiante</label>
							    </fieldset>
						</div>
					</div>
					<button type="submit" class="btn btn-default">Enviar</button>
				</form>
			</div>
</div>
<jsp:include page="Vista/pie.jsp"/>

<body>

</body>
</html>