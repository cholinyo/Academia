<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="UTF-8">
	<title>Academia</title>
	<link rel="stylesheet" type="text/css" href="css/theme.css">
	<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
</head>
<body>
<body>
	<header class="container">
		<h1>Academia</h1>
	</header>
	<nav class="container" >	
	<ul class="list-inline">
	<li>Quienes Somos</li>
	<li>Donde estamos</li>
	<li>Blog</li>
	<li>Hola: <%= session.getAttribute("login") %></li>
	<li>Salir</li>
	
	</ul>
	</nav>
</body>

</body>
</html>