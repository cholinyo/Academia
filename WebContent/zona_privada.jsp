<%@page import="javafx.geometry.HPos"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	if (session.getAttribute("login") == null) {
		response.sendRedirect("index.html");
	}
	String nombre = (String) session.getAttribute("nombre");
%>
<head>
<meta charset="UTF-8">
<title>Zona Privada</title>
<link rel="stylesheet" type="text/css" href="css/theme.css">
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"
	integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7"
	crossorigin="anonymous">
</head>
<body>
	<jsp:include page="Vista/cabecera.jsp" />
	<%
		String rol = (String) session.getAttribute("rol");
		switch (rol) {
		case "admin":
	%>
	<jsp:include page="opciones_admin.jsp" />
	<jsp:include page="listado_ultimos_usuarios.jsp" />;
	<%
		break;
		case "profesor":
	%>
	<jsp:include page="opciones_profesor.jsp" />; 
	<%
		
		break;
		case "estudiante":
	%>
	<jsp:include page="opciones_estudiante.jsp" />
	 <jsp:include page="listado_peticiones_tutoria.jsp" />
	<%
		break;
		}
	%>
	</navigation>
</body>
<footer class="container">
	<div class="links_footer col-sm-6">
		<ul>
			<li>Sobre Nosotros</li>
			<li>Privacidad</li>
			<li>Accesibilidad</li>
			<li>legale</li>
		</ul>
		<div class="datos_footer col-sm-6">
			<img>
		</div>
</footer>
</html>