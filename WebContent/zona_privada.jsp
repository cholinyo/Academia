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
</html>