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
        </li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li class="dropdown">
        <h>
          </ul>
        </li>
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>
<%

String p_id = request.getParameter("p_id");

int id = Integer.parseInt(p_id);

Connection conn = null;

PreparedStatement ps = null;

ResultSet rs = null;

try{
	
	conn = DbConnection.getConnection();
	
	String query = "SELECT * FROM ptabela WHERE p_id='"+id+"'";
	
	ps = conn.prepareStatement(query);
	
	rs = ps.executeQuery();
	
%>

<div class="container bg-info" style="padding-top20px; padding-bottom:20px;">
<h1>Plano de Ensino</h1>

<hr>
<form action="Atualizar.jsp" role="form" method="post">
<%

while(rs.next()){

%>
<input type="hidden" name="id" value="<%=rs.getInt("p_id") %>">

<div class="form-group">
 <label>Instituição:</label>
 <input type="text" name="instf" value="<%=rs.getString("instit")%>" class="form-control">
</div>

<div class="form-group">
 <label>Curso:</label>
 <input type="text" name="cursof" value="<%=rs.getString("curso")%>" class="form-control">
</div>

<div class="form-group">
 <label>Disciplina:</label>
 <input type="text" name="discipf" value="<%=rs.getString("discip")%>" class="form-control">
</div>

<div class="form-group">
 <label>Período:</label>
 <input type="text" name="periodf" value="<%=rs.getString("period")%>" class="form-control">
</div>

<div class="form-group">
 <label>Carga Horário:</label>
 <input type="text" name="chf" value="<%=rs.getString("CH")%>" class="form-control">
</div>

<div class="form-group">
 <label>Semestre:</label>
 <input type="text" name="semestf" value="<%=rs.getString("semest")%>" class="form-control">
</div>

<div class="form-group">
 <label>Professores:</label>
 <input type="text" name="proff" value="<%=rs.getString("prof")%>" class="form-control">
</div>

<div class="form-group">
  <label for="ementaf">Ementa:</label>
  <textarea class="form-control" rows="5" name="ementaf"><%=rs.getString("ement")%></textarea>
</div>

<div class="form-group">
  <label for="compHf">Competências e Habilidades a serem desenvolvidas:</label>
  <textarea class="form-control" rows="5" name="compHf"><%=rs.getString("CompH")%></textarea>
</div>

<div class="form-group">
  <label for="contPf">Conteúdo Programático:</label>
  <textarea class="form-control" rows="5" name="contPf"><%=rs.getString("ContP")%></textarea>
</div>

<div class="form-group">
  <label for="atividPf">Atividades Programadas:</label>
  <textarea class="form-control" rows="5" name="atividPf"><%=rs.getString("atividP")%></textarea>
</div>

<div class="form-group">
  <label for="avalif">Avaliação:</label>
  <textarea class="form-control" rows="5" name="avalif"><%=rs.getString("avaliac")%></textarea>
</div>

<div class="form-group">
  <label for="bibliGf">Bibliografia Geral:</label>
  <textarea class="form-control" rows="5" name="bibliGf"><%=rs.getString("bibliG")%></textarea>
</div>

<div class="form-group">
  <label for="bibliCf">Bibliografia Complementar:</label>
  <textarea class="form-control" rows="5" name="bibliCf"><%=rs.getString("bibliC")%></textarea>
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