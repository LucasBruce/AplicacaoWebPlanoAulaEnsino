<%@page import="com.dbconnectionutil.org.DbConnection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String id = request.getParameter("p_1id");

int p_1id = Integer.parseInt(id);

Connection conn = null;

PreparedStatement ps = null;

try{
	
	int row = 0;
	
	conn = DbConnection.getConnection();
	
	String query = "DELETE FROM ptabela1 WHERE p_1id=?";
	
	ps = conn.prepareStatement(query);
	
	ps.setInt(1, p_1id);
	
	row = ps.executeUpdate();
	
	if(row>0){
		
		response.sendRedirect("index_1.jsp");
		
	}
	else{
		
		out.println("Error in Query" +row);
		
	}
}
catch(Exception ex){
	
	ex.printStackTrace();
}

//Final do Block

finally{
	ps.close();
	
	conn.close();
	
}

%>
</body>
</html>