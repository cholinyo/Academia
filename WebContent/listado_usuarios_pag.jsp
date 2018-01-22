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
<%
String tiporol = (String) session.getAttribute("rol");
switch (tiporol)
{
case "admin":
	break;
default:
	response.sendRedirect("index.html");
}
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<link rel="stylesheet" type="text/css" href="css/theme.css">
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"
	integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7"
	crossorigin="anonymous">
	<script type="text/javascript" src="js/sorttable.js"></script>
</head>
<body>
	<jsp:include page="Vista/cabecera.jsp" />
	<%
		String rol = (request.getParameter("tipo"));
	%>

	<div class="container">
		<div class="panel panel-body">
			<div class="seleccion col-rs-4 panel panel-default">
				<div class="panel-heading">
					<%
						switch (request.getParameter("tipo")) {

						case "estudiante":
							out.println("<h2>Estudiantes introducidos en el sistema </h2>");
							break;
						case "profesor":
							out.println("<h2>Profesores introducidos en el sistema </h2>");
							break;
						}
					int pagina=0;
					String p = request.getParameter("page");  //nº de página
					if (p!=null) pagina = Integer.valueOf(p);
					else pagina=1;
					LinkedList<Usuario> lista = ConsultaUsuarios.getUsuariostipopPag(rol,pagina);				
					
					%>
				</div>
				<table class="table table-striped sortable">
					<tr>
						<th>Idusuario</th>
						<th>Login</th>
						<th>Nombre</th>
						<th>Apellidos</th>
						<th>Rol</th>
						<th>Modifica</th>
						<th>Dar de baja</th>
					</tr>
					<%
						for (int i = 0; i < lista.size(); i++) {
							out.println("<tr>");
							out.println("<td>" + lista.get(i).getIdusuario() + "</td>");
							int id = lista.get(i).getIdusuario();
							out.println("<td>" + lista.get(i).getLogin() + "</td>");
							out.println("<td>" + lista.get(i).getNombre() + "</td>");
							out.println("<td>" + lista.get(i).getApellido() + "</td>");
							out.println("<td>" + lista.get(i).getRol() + "</td>");
							out.println("<td><a href='modifica_usuario.jsp?id=" + id + "'>Modifica</a></td>");
							out.println("<td><a href='baja_usuario?id=" + id + "'>Dar de baja</a></td>");
							out.println("</tr>");
						}
					%>
				</table>
				<%
				LinkedList<Usuario> rs = ConsultaUsuarios.gettodosUsuariostipo(rol);
				int contador=0;
				for (int i = 0; i < rs.size(); i++){
					contador ++;
				}
				out.println(contador);
				int pages = (contador / 5);
				%>
				<table>
				<%
				if (pagina > 1){
					out.println("<td><a href=\'?page=1&tipo="+rol+"\'> << </a></td>");
					int previousPage = pagina - 1;
					out.println("<td><a href=\"?page="+previousPage + "&tipo="+rol+"\"> < </a></td>");
				}
					out.println("<td><b>Page: "+ pagina + "</b></td>");
					
					if (pages > pagina){
						int nextPage = pagina + 1;
						out.println("<td><a href=\"?page="+ nextPage + "&tipo="+rol+"\"> > </a></td>");
						out.println("<td><a href=\"?page="+ pages +"&tipo="+rol+ "\"> " + " >> </a></td>");
									
				}
				%>
				</tr></table>
			</div>
			<button type="submit" class="btn btn-default"onclick="location.href = 'zona_privada.jsp'">Atrás</button>
		</div>
	</div>

	<jsp:include page="Vista/pie.jsp" />
</body>
</html>