<header class="container">
	<h1>Academia</h1>
</header>
<nav class="container navbar navbar-default">
	<div class="navbar-header">
		<a class="navbar-brand" href="http://localhost:8080/Academia/">Academia</a>
	</div>
	<ul class="nav navbar-nav">
		<li class="active"><a href="http://localhost:8080/Academia/">Home</a></li>
		<li><a href="http://localhost:8080/Academia/quien.html">Quienes
				Somos</a></li>
		<li><a href="http://localhost:8080/Academia/donde.html">Donde
				estamos</a></li>
		<li><a href="http://localhost:8080/Academia/blog.html">Blog</a></li>
		<li><a href="#">Hola <%= session.getAttribute("login") %></a></li>
		<li><a href="Logout">Logout</a></li>
	</ul>
</nav>
