<<<<<<< HEAD
<%@page import="javafx.geometry.HPos"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       
<%

if (session.getAttribute("login")==null){
	response.sendRedirect("index.html");
}
String nombre = (String)session.getAttribute("nombre");
%> 
<head>
	<meta charset="UTF-8">
	<title>Zona Privada</title>
	<link rel="stylesheet" type="text/css" href="css/theme.css">
	<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
</head>
<body>
<header>
		<h1>Academia Zona Privada</h1>
		<p>El usuario de la sesion es: <%= session.getAttribute("nombre") %>, el rol es: <%= session.getAttribute("rol") %>  y la conexion es:<%= session.getAttribute("conexion") %> </p>
</header>
<navigation>

<%
String rol=(String)session.getAttribute("rol");
switch  (rol)
		{
	case "admin": %>
		<jsp:include page="opciones_admin.jsp"/> ;
		<%break;
	case "profesor":  %>
		<jsp:include page="opciones_profesor.jsp"/>;
		<%break;
	case "estudiante": %>
		<jsp:include page="opciones_estudiante.jsp"/>; 
		<% break;
	} %>
</navigation>
</body>
	<footer class="container">
		<div class="links_footer col-sm-6">
		<ul>
			<li>Sobre Nosotros</li>
			<li>Privacidad</li>
			<li>Accesibilidad</li>
			<li> legale </li>
		</ul>
		<div class="datos_footer col-sm-6">
			<img >
		</div>
	</footer>
=======
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       
<%

if (session.getAttribute("login")==null){
	response.sendRedirect("index.html");
}
String nombre = (String)session.getAttribute("nombre");
%> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Acceso Portal</title>
</head>
<body>
<header>
<div class="container">
	<div class="row">	
		<div class="col-9"><h1>DEl JSP</h1></div>
		<div class="col-3"><p>El usuario de la sesion es: <%= session.getAttribute("login") %></p></div>
	</div>
</div>
</header>
</body>
<footer></footer>
>>>>>>> branch 'master' of https://github.com/cholinyo/Academia.git
</html>