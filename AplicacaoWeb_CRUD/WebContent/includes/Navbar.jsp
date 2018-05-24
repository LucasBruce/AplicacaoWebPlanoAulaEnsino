<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
 
  <meta name="viewport" content="width=device-width, initial-scale=1"> 
  <link rel="stylesheet" href="bootstrap/css/bootstrap.menu.css">
  <script src="js/jquery.js"></script>
  <script src="bootstrap/js/bootstrap.js"></script>
  

</head>
<body>
<script>
function myFunction() {
    document.getElementById("myDropdown").classList.toggle("show");
}

// Close the dropdown menu if the user clicks outside of it
window.onclick = function(event) {
  if (!event.target.matches('.dropbtn')) {

    var dropdowns = document.getElementsByClassName("dropdown-content");
    var i;
    for (i = 0; i < dropdowns.length; i++) {
      var openDropdown = dropdowns[i];
      if (openDropdown.classList.contains('show')) {
        openDropdown.classList.remove('show');
      }
    }
  }
}
</script>
	<div class="dropdown">
  <button onclick="myFunction()" class="dropbtn">Disciplinas</button>
  <div id="myDropdown" class="dropdown-content">
    <a href="#">Linguagem de Programação</a>
    <a href="#">Banco de Dados 2</a>
    <a href="#">Análise e Projeto de Sistemas</a>
  </div>
</div>



</body>
</html>