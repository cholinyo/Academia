<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<head>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">
</head>
<body>
<div class="container">
	<div class="col-rs 12 panel panel-default "  >
		<div class="panel-heading">
			<h2>Panel de Control Admin</h2>
		</div>
		<div class="panel panel-body">	
				<div class="seleccion col-rs-4 panel panel-default">
					<div class="panel-heading"><h3>Usuarios</h3></div>
						<div class="panel-body">
							<ul class="list-inline">
								<li><a href="alta_usuario.jsp">Alta usuario<img src=""></a></li>
								<li><a href="">Baja usuario<img src=""></a></li>
								<li><a href="listado_usuarios.jsp?tipo=estudiante">Consulta Alumnos<img src=""></a></li>
								<li><a href="listado_usuarios.jsp?tipo=profesor">Cosulta Profesores<img src=""></a></li>
							</ul>
						</div>
				</div>
				<div class="seleccion col-rs-4 panel panel-default">
					<div class="panel-heading"><h3>Asignaturas</h3></div>
						<div class="panel-body">
							<ul class="list-inline">
								<li><a href="">Alta<img src=""></a></li>
								<li><a href="">Baja<img src=""></a></li>
								<li><a href="">Consulta<img src=""></a></li>
								
							</ul>
						</div>
				</div>
				<div class="seleccion col-rs-4 panel panel-default">
					<div class="panel-heading"><h3>Alumnos</h3></div>
					<div class="panel-body">
						<ul class="list-inline">
							<li><a href="">Alta<img src=""></a></li>
							<li><a href="">Baja<img src=""></a></li>
						</ul>
					</div>
				</div>
		</div>
			
	</div>
</div>

</body>