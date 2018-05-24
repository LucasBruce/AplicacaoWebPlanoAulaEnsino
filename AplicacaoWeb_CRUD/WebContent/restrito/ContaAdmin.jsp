
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Formulário.jsp</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1"> 
  <link rel="stylesheet" href="bootstrap/css/bootstrap.css">
  <script src="js/jquery.js"></script>
  <script src="bootstrap/js/bootstrap.js"></script>
  <script src='http://code.jquery.com/jquery-2.1.3.min.js'></script>
   <script src='//maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js'></script>
</head>
<body>


<div class="container bg-info" style="padding-top20px; padding-bottom:20px;">
<p>
<p>
     <h1>Cadastro de Professores e Controle de Usuários</h1>                  
<hr>
<hr>

<div class="row">
<div class="col-sm-4">
<form role="form" action="SalvarForm.jsp" method="post">

<div class="form-group">
<label>Nome:</label>
<input type="text" class="form-control" name="instf">
</div>

<div class="form-group">
<label>Email:</label>
<input type="text" class="form-control" name="cursof">
</div>

<div class="form-group">
<label>Usuário:</label>
<input type="text" class="form-control" name="discipf">
</div>

<div class="form-group">
<label>Senha:</label>
<input type="text" class="form-control" name="periodf">
</div>

<div class="form-group">
<label>Disciplina 1:</label>
<input type="text" class="form-control" name="cursof">
</div>

<div class="form-group">
<label>Disciplina 2:</label>
<input type="text" class="form-control" name="cursof">
</div>

<div class="form-group">
<label>Disciplina 3:</label>
<input type="text" class="form-control" name="cursof">
</div>


<button class="btn btn-info btn-black" type="submit">Salvar</button>

</form>
</div>

			

<div class="col-sm-8">

<table class="table">

<thead>
<tr>

<th>Usuários Cadastrados</th>

<th><th><th>Opções</th></th></th>
</tr>
</thead>

<tbody>

<tr>
<td></td>
<td></td>
<td></td>
<td>
<a href="EditarForm.jsp?p_id="  class="btn btn-success" role="button">Editar</a>
<a href="Excluir.jsp?p_id=%>" class="btn btn-danger" role="button">Excluir</a>
</td>
</tr>
</form>

</tbody>
</table>
</div>

</div>
</div>
</body>
</html>