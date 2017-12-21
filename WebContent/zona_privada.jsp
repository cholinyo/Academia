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
		<p>El usuario de la sesion es: <%= session.getAttribute("login") %> y la conexion es:<%= session.getAttribute("conexion") %> </p>
</header>
<%switch session.getAttribute("rol") {
case "admin":
	cabecera
	opciones
case "porfesor":
	cabecera
case "alumno":
	cabecera


}%>


	<nav>
	</nav>
</body>
<footer></footer>
</html>