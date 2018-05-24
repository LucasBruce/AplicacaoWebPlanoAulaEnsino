
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
      <a href="" class="btn btn-info" role="button">Plano de Aula</a>
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

String query = "SELECT * FROM ptabela1";

try{
	
conn = DbConnection.getConnection();

ps = conn.prepareStatement(query);

rs = ps.executeQuery();

%>

<div class="container bg-info" style="padding-top20px; padding-bottom:20px;">
<p>
<p>
     <h1>Formulário de Plano de Aula</h1>                  
<hr>
<hr>

<div class="row">
<div class="col-sm-4">
<form role="form" action="SalvarForm_1.jsp" method="post">

<div class="form-group">
<label>Módulo/Semestre/Série:</label>
<input type="text" class="form-control" name="modssf">
</div>

<div class="form-group">
<label>Componente Currícular/Disciplina:</label>
<input type="text" class="form-control" name="compDCf">
</div>

<div class="form-group">
<label>Professor(a):</label>
<input type="text" class="form-control" name="prof1f">
</div>

<div class="form-group">
<label>Centro ou Unidade Escolar:</label>
<input type="text" class="form-control" name="inst1f">
</div>

<div class="form-group">
<label>Aula N°:</label>
<input type="text" class="form-control" name="aulaNf">
</div>

<div class="form-group">
<label>Data:</label>
<input type="text" class="form-control" name="dataf">
</div>

<div class="form-group">
<label>Tema/Conhecimento:</label>
<input type="text" class="form-control" name="temaCf">
</div>

<div class="form-group">
<label>Tempo de aula:</label>
<input type="text" class="form-control" name="tempAf">
</div>

<div class="form-group">
  <label for="ementaf">OBJETIVO(S) - Neste campo devem ser apresentados os objetivos geral e/ou específico(s).</label>
  <textarea class="form-control" rows="15" name="objetf"></textarea>
</div>

 <div class="form-group">
  <label for="compHf">DESCRIÇÃO DA AULA/SEQUENCIA DE ATIVIDADES - Neste campo devem ser apresentados os conteúdos,
 procedimentos e seguência das atividaes relacionadas ás habilidades desejadas.</label>
  <textarea class="form-control" rows="15" name="desc1f"></textarea>
</div>

<div class="form-group">
  <label for="contPf">RECURSOS NECESSARIOS - Neste campo devem ser apresentados os recursos a serem utilizados para o desenvol
vimento da aula e/ou atividade.</label>
  <textarea class="form-control" rows="20" name="recNf"></textarea>
</div>

<div class="form-group">
  <label for="atividPf">AVALIAÇÃO - Neste campo deve ser descrito a forma e os critérios de avaliação, destacando 
os aspectos significativos da aprendizagem.</label>
  <textarea class="form-control" rows="15" name="avali1f"></textarea>
</div>

<div class="form-group">
  <label for="avalif">OBSERVAÇÃO:</label>
  <textarea class="form-control" rows="10" name="obsf"></textarea>
</div>

<button class="btn btn-info btn-black" type="submit">Salvar</button>

</form>
</div>

			

<div class="col-sm-8">

<table class="table">

<thead>
<tr>
<th>Disciplina</th>
<th>Professor</th>
<th>Data</th>
<th><th><th>Opções</th></th></th>
</tr>
</thead>

<tbody>
<%

while(rs.next()){
	
%>
<tr>
<td><%=rs.getString("compCD")%></td>
<td><%=rs.getString("Prof1")%></td>
<td><%=rs.getString("data")%></td>
<td>
<th><a href="EditarForm_1.jsp?p_1id=<%=rs.getInt("p_1id")%>" class="btn btn-success" role="button">Editar</a></th>
<th><a href="Excluir_1.jsp?p_1id=<%=rs.getInt("p_1id")%>" class="btn btn-danger" role="button">Excluir</a></th>
<th><a href="../ServRel_1?p_1id=<%=rs.getInt("p_1id") %>" class="btn btn-primary"  role="button" target="_blank">PDF</a></th>
</td>
</tr>
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