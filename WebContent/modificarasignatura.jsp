<%@page import="com.sun.javafx.binding.SelectBinding.AsInteger"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="usuarios.ConsultaUsuarios"%>
<%@page import="usuarios.Usuario"%>
<%@page import="asignaturas.Asignatura"%>
<%@ page import="java.util.LinkedList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Modificación de Asignaturas</title>
</head>
<body>
	<jsp:include page="Vista/cabecera.jsp" />
	<%
		int id = Integer.parseInt(request.getParameter("id"));
		out.println(id);
		Asignatura asignatura = Asignatura.getAsignatura(id);
		out.println(asignatura.getEstado());
		int idprofesorasignado = asignatura.getProfesor();
		Usuario profesor = ConsultaUsuarios.getUsuario(idprofesorasignado);
		LinkedList<Usuario> listaProfesores = ConsultaUsuarios.getUsuariostipo("profesor");
	%>
	<div class="container">
		<div>
			<p>Alta asignatura
			<p>
			<form class="form-horizontal" action="ModificaAsignatura" method="post">
				<div class="form-group">
					<label class="col-sm-2" for="nombre">Código Asignatura</label>
					<div class="col-sm-10">
						<input type="text" name="idasignatura" id="idasignatura"  readonly="readonly" value="<%=id%>">
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2" for="nombre">Nombre Asignatura</label>
					<div class="col-sm-10">
						<input type="text" name="nombre" id="nombre"
							value="<%=asignatura.getNombre()%>">
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2" for="horario">Horario</label>
					<div class="col-sm-10">
						<input type="text" name="horario" id="horario"
							value="<%=asignatura.getHorario()%>">
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2" for="profesor">Profesor</label>
					<div class="col-sm-10">
						<select name="profesor">
							<%
								for (int i = 0; i < listaProfesores.size(); i++) {
									String nombre = listaProfesores.get(i).getNombre() + " " + listaProfesores.get(i).getApellido();
									int idprofesor = listaProfesores.get(i).getIdusuario();
									if (idprofesor == idprofesorasignado) {
							%>
							<option selected value="<%=idprofesor%>"><%=idprofesor + " " + nombre%></option>
							<%
								} else {
							%>
							<option value="<%=idprofesor%>"><%=idprofesor + " " + nombre%></option>
							<%
								}
								}
							%>
						</select>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2" for="profesor">Activa/Desactiva Asignatura</label>
					<div class="col-sm-10">
						<%if (asignatura.getEstado() == "baja") {%>
							<label><input type="radio" name="estado" value="alta"> Alta</label><br>
							<label><input type="radio" name="estado" value="baja" checked="checked"> Baja</label><br>
							<%
							}
						else 
							{
							%>
							<label><input type="radio" name="estado" value="alta" checked="checked"> Alta</label><br>
							<label><input type="radio" name="estado" value="baja"> Baja</label><br>
							<%
							}
							%>
					</div>
				</div>
			<button type="submit" class="btn btn-default">Modificar Asignatura</button>
			</form>
		</div>
	</div>
	<jsp:include page="Vista/pie.jsp" />
</body>
</html>