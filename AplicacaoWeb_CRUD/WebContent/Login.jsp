<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="pt-br">
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="javax.servlet.*"%>
<%@page import="javax.servlet.http.*"%>
<%@page import="java.util.List , java.util.ArrayList"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

 
<meta charset="utfc-8">
<title>Página de Entrada</title>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1"> 
  <link rel="stylesheet" href="bootstrap/css/bootstrap.css">
  <script src="js/jquery.js"></script>
  <script src="bootstrap/js/bootstrap.js"></script>
</head>
<body class="navbar navbar-light">
        
	<div class="container" align="center">
		<form class="form-signin"  action="ServletAutent" method="post">
			<h2 class="form-signin-heading" >Digite Usuário e Senha</h2>

			<label for="inputEmail" class="sr-only">Login</label></br>
			         
			<input type="text" id="inputPassword" class="form-control" name="login"
			placeholder="Usuário" required autofocus> 
				
			<label for="inputPassword" class="sr-only">Senha</label></br> 
			
			<input type="password" id="inputPassword" class="form-control" name="senha"
			placeholder="Senha" required><br/><br/>

              <!--<div class="checkbox">
                     <label>
                     <input type="checkbox">
                     Lembrar-me
                     </label>
                     </div>-->
                     
			<button class="btn btn-lg btn-success btn-block" type="submit">Entrar</button>
			<br>
			<% if ("error".equals(request.getParameter("usuario"))) { %>
				
				<div class="alert alert-danger" role="alert">
				  <a href="#" class="alert-link">Usuario inválido!</a>
				</div>
			<% } %>
			
			<% if ("error".equals(request.getParameter("senha"))) { %>
				<div class="alert alert-danger" role="alert">
				  <a href="#" class="alert-link">Senha inválida!</a>
				</div>
			<% } %>
			
			<% if ("error".equals(request.getParameter("error"))) { %>
				<div class="alert alert-danger" role="alert">
				  <a href="#" class="alert-link">Usuario e</a>
				  <a href="#" class="alert-link"> Senha inválidos!</a>
				</div>
			<% } %>
			
		</form>

	</div>
	<!-- /container -->


	<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
	<script src="js/ie10-viewport-bug-workaround.js"></script>
</body>
</html>
