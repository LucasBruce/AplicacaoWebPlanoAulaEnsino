<%@page import="com.dbconnectionutil.org.DbConnection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1"> 
  <link rel="stylesheet" href="bootstrap/css/bootstrap.css">
  <script src="js/jquery.js"></script>
  <script src="bootstrap/js/bootstrap.js"></script>
</head>
<body>
<%

String modssform = request.getParameter("modssf");

String compDCform = request.getParameter("compDCf");

String prof1form = request.getParameter("prof1f");

String inst1form = request.getParameter("inst1f");

String aulaNFform = request.getParameter("aulaNf");

String dataform = request.getParameter("dataf");

String temaCform = request.getParameter("temaCf");

String tempAform = request.getParameter("tempAf");

String objetform = request.getParameter("objetf");

String desc1form = request.getParameter("desc1f");

String recNform = request.getParameter("recNf");

String avali1form = request.getParameter("avali1f");

String obsform = request.getParameter("obsf");

Connection conn = null;

PreparedStatement ps = null;

try{
	
	int row = 0;
	conn = DbConnection.getConnection();
	
	String query = "INSERT INTO ptabela1(modss, compCD, prof1, inst1, aulaN, data, temaC, tempoA, objet, desc1, recN, avali1, obs) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?)";
	
	ps = conn.prepareStatement(query);
	
	ps.setString(1, modssform);
	
	ps.setString(2, compDCform);
	
	ps.setString(3, prof1form);
	
	ps.setString(4, inst1form);
	
	ps.setString(5, aulaNFform);
	
	ps.setString(6, dataform);
	
	ps.setString(7, temaCform);
	
	ps.setString(8, tempAform);
	
	ps.setString(9, objetform);
	
	ps.setString(10, desc1form);
	
	ps.setString(11, recNform);
	
	ps.setString(12, avali1form);
	
	ps.setString(13, obsform);
	
	
	row = ps.executeUpdate();
	
	if(row>0){
		
		response.sendRedirect("index_1.jsp");
		
	}else{
		
		out.println("Error In Query...");
	}
	
}
catch(Exception ex){

    out.println(ex.getMessage());
	
}

//Final do Block

finally{
	ps.close();
	
	conn.close();

}

%>
</body>
</html>