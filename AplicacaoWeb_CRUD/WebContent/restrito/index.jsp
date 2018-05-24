
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.dbconnectionutil.org.DbConnection"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
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

<nav class="navbar navbar-light" style="background-color:#e3f2fd;">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a href="index.jsp" class="btn btn-info" role="button">Plano de Ensino</a>
      <a href="index_1.jsp" class="btn btn-info" role="button">Plano de Aula</a>
      
       <p>
      <div class="dropdown">
     
  <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">Disciplinas
  <span class="caret"></span></button>

  <ul class="dropdown-menu">
    <li><a href="#">SAD</a></li>
    <li class="divider"></li>
    <li><a href="#">Lógica de Programação</a></li>
    <li class="divider"></li>
    <li><a href="#">Banco de Dados 2</a></li>
    <li class="divider"></li>
    <li><a href="#">Análise e Projeto de Sistemas</a></li>
    <li class="divider"></li>
    <li><a href="#">Banco de Dados</a></li>
    <li class="divider"></li>
    <li><a href="#">Redes de Computadores</a></li>
  </ul>
</div>

    </div>
    
    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li class="active"><a href="#"> <span class="sr-only">(current)</span></a></li>
          </ul>
        </li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li class="dropdown">
        <h><a href="../ServletAutent" class="btn btn-danger">Sair</a></h>
          </ul>
        </li>
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>

<% 

Connection conn = null;

PreparedStatement ps = null;

ResultSet rs = null;

String query = "SELECT * FROM ptabela";

try{
	
conn = DbConnection.getConnection();

ps = conn.prepareStatement(query);

rs = ps.executeQuery();

%>

<div class="container bg-info" style="padding-top20px; padding-bottom:20px;">
<p>
<p>
     <h1>Formulário de Plano de Ensino</h1>                  
<hr>
<hr>

<div class="row">
<div class="col-sm-4">
<form role="form" action="SalvarForm.jsp" method="post">

<div class="form-group">
<label>Instituição:</label>
<input type="text" class="form-control" name="instf">
</div>

<div class="form-group">
<label>Curso:</label>
<input type="text" class="form-control" name="cursof">
</div>

<div class="form-group">
<label>Disciplina:</label>
<input type="text" class="form-control" name="discipf">
</div>

<div class="form-group">
<label>Período:</label>
<input type="text" class="form-control" name="periodf">
</div>

<div class="form-group">
<label>Carga Horário:</label>
<input type="text" class="form-control" name="chf">
</div>

<div class="form-group">
<label>Semestre:</label>
<input type="text" class="form-control" name="semestf">
</div>

<div class="form-group">
<label>Professores:</label>
<input type="text" class="form-control" name="proff">
</div>

<div class="form-group">
  <label for="ementaf">Ementa:</label>
  <textarea class="form-control" rows="15" name="ementaf"></textarea>
</div>

<div class="form-group">
  <label for="compHf">Competências e Habilidades a serem desenvolvidas:</label>
  <textarea class="form-control" rows="15" name="compHf"></textarea>
</div>

  <div class="form-group">
  <label for="contPf">Conteúdo Programático:</label>
  <textarea class="form-control" rows="20" name="contPf"></textarea>
</div>

<div class="form-group">
  <label for="atividPf">Atividades Programadas:</label>
  <textarea class="form-control" rows="15" name="atividPf"></textarea>
</div>

<div class="form-group">
  <label for="avalif">Avaliação:</label>
  <textarea class="form-control" rows="10" name="avalif"></textarea>
</div>

<div class="form-group">
  <label for="bibliGf">Bibliografia Geral:</label>
  <textarea class="form-control" rows="15" name="bibliGf"></textarea>
</div>

<div class="form-group">
  <label for="bibliCf">Bibliografia Complementar:</label>
  <textarea class="form-control" rows="15" name="bibliCf"></textarea>
</div>

<button class="btn btn-info btn-black" type="submit">Salvar</button>

</form>
</div>

			

<div class="col-sm-8">

<table class="table">

<thead>
<tr>
<th>Curso</th>
<th>Disciplina</th>
<th>Período</th>
<th><th><th>Opções</th></th></th>
</tr>
</thead>

<tbody>
<%

while(rs.next()){
	
%>

<tr>
<td><%=rs.getString("curso")%></td>
<td><%=rs.getString("discip")%></td>
<td><%=rs.getString("period")%></td>
<td>
<th><a href="EditarForm.jsp?p_id=<%=rs.getInt("p_id")%>"  class="btn btn-success" role="button">Editar</a></th>
<th><a href="Excluir.jsp?p_id=<%=rs.getInt("p_id")%>" class="btn btn-danger" role="button">Excluir</a></th>
<th><a href="../ServRel?p_id=<%=rs.getInt("p_id")%>" class="btn btn-primary"  role="button" target="_blank">PDF</a></th>
</td>
</tr>
</form>
<%

}//Fim do while
}//Fim do try
catch(Exception ex){
	
	ex.printStackTrace();
}

//Final do Block

finally{
	ps.close();
	
	conn.close();
	
	
}
%>
</tbody>
</table>
</div>

</div>
</div>
</body>
</html>