<%@page import="com.dbconnectionutil.org.DbConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Imprimir</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1"> 
  <link rel="stylesheet" href="bootstrap/css/bootstrap.css">
  <script src="js/jquery.js"></script>
  <script src="bootstrap/js/bootstrap.js"></script>
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
      <a href="index.jsp" class="btn btn-info" role="button">Voltar</a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li class="active"><a href="#"> <span class="sr-only">(current)</span></a></li>
          </ul>
       <ul class="nav navbar-nav navbar-right">
        <li class="dropdown"></li>
          </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>
<%

String p_1id = request.getParameter("p_1id");

int id = Integer.parseInt(p_1id);

Connection conn = null;

PreparedStatement ps = null;

ResultSet rs = null;

try{
	
	conn = DbConnection.getConnection();
	
	String query = "SELECT * FROM ptabela1 WHERE p_1id='"+id+"'";
	
	ps = conn.prepareStatement(query);
	
	rs = ps.executeQuery();
	
%>


<div class="container bg-info" style="padding-top20px; padding-bottom:20px;">
<h1>Plano de Aula</h1>

<hr>
<form action="Atualizar.jsp" role="form" method="post">
<%

while(rs.next()){

%>
<input type="hidden" name="id" value="<%=rs.getInt("p_1id") %>">

<div class="form-group">
 <label>Módulo/Semestre/Série:</label>
 <input type="text" name="modssf" value="<%=rs.getString("modss")%>" class="form-control">
</div>

<div class="form-group">
 <label>Componente Currícular/Disciplina:</label>
 <input type="text" name="compDCf" value="<%=rs.getString("compCD")%>" class="form-control">
</div>

<div class="form-group">
 <label>Professor(a):</label>
 <input type="text" name="prof1f" value="<%=rs.getString("prof1")%>" class="form-control">
</div>

<div class="form-group">
 <label>Centro ou Unidade Escolar:</label>
 <input type="text" name="inst1f" value="<%=rs.getString("inst1")%>" class="form-control">
</div>

<div class="form-group">
 <label>Aula N°:</label>
 <input type="text" name="aulaNf" value="<%=rs.getString("aulaN")%>" class="form-control">
</div>

<div class="form-group">
 <label>Data:</label>
 <input type="text" name="dataf" value="<%=rs.getString("data")%>" class="form-control">
</div>

<div class="form-group">
 <label>Tema/Conhecimento:</label>
 <input type="text" name="temaCf" value="<%=rs.getString("temaC")%>" class="form-control">
</div>

<div class="form-group">
 <label>Tempo de aula:</label>
 <input type="text" name="tempAf" value="<%=rs.getString("tempoA")%>" class="form-control">
</div>

<div class="form-group">
  <label for="ementaf">OBJETIVO(S):</label>
  <textarea class="form-control" rows="5" name="objetf"><%=rs.getString("objet")%></textarea>
</div>

<div class="form-group">
  <label for="compHf">DESCRIÇÃO DA AULA/SEQUENCIA DE ATIVIDADES:</label>
  <textarea class="form-control" rows="5" name="desc1f"><%=rs.getString("desc1")%></textarea>
</div>

<div class="form-group">
  <label for="contPf">RECURSOS NECESSARIOS:</label>
  <textarea class="form-control" rows="5" name="recNf"><%=rs.getString("recN")%></textarea>
</div>

<div class="form-group">
  <label for="atividPf">AVALIAÇÃO:</label>
  <textarea class="form-control" rows="5" name="avali1f"><%=rs.getString("avali1")%></textarea>
</div>

<div class="form-group">
  <label for="avalif">OBSERVAÇÃO:</label>
  <textarea class="form-control" rows="5" name="obsf"><%=rs.getString("obs")%></textarea>
</div>

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

</form>

<script lang="javascript">

     function imprime(text){
         text=document
         print(text)
}
</script>
<form>

<input type="button" name="imprimirPDF" value="Imprimir" onclick="imprime()">

</form>

</div>
</body>
</html>