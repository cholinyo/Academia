<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "java.util.LinkedList"%>
<%@ page import = "usuarios.Usuario"%> 
<%@ page import = "usuarios.ConsultaUsuarios"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="css/theme.css">
	<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">
<title>Alta asignaturas</title>
</head>
<% 
LinkedList<Usuario> listaProfesores = ConsultaUsuarios.getUsuariostipo("profesor");
%>
<body>
<jsp:include page="Vista/cabecera.jsp"/>
<div class="container">
	<div>	
				<p>Alta asignatura<p>
				<form class="form-horizontal" action="graba_asignatura" method="post">
					<div class="form-group">
						<label class="col-sm-2" for="nombre">Nombre Asignatura</label>
						<div class="col-sm-10">
							<input type="text" name="nombre" id="nombre" placeholder="Nombre Asignatura">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2" for="horario">Horario</label>
						<div class="col-sm-10">
							<input type="text" name="horario" id="horario" placeholder="horario">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2" for="profesor">Profesor</label>
						<div class="col-sm-10">
							<select name="carlist" form="carform">
							<%
							for (int i=0;i<listaProfesores.size();i++)
								{
								String nombre = listaProfesores.get(i).getNombre() + " " +listaProfesores.get(i).getApellido();
								int idprofesor = listaProfesores.get(i).getIdusuario();
								%>
								<option value="<%listaProfesores.get(i).getIdusuario(); %>"><%=idprofesor + " " +nombre%></option><%
								} %>
							</select>
						</div>
					</div>
					<button type="submit" class="btn btn-default">Crear Asignatura</button>
				</form>
			</div>
</div>
<jsp:include page="Vista/pie.jsp"/>
</body>
</html>