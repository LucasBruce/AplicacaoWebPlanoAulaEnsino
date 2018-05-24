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

String id = request.getParameter("id");

int p_id = Integer.parseInt(id);

String instform = request.getParameter("instf");

String cursoform = request.getParameter("cursof");

String discipform = request.getParameter("discipf");

String periodform = request.getParameter("periodf");

String chform = request.getParameter("chf");

String semestform = request.getParameter("semestf");

String profform = request.getParameter("proff");

String ementaform = request.getParameter("ementaf");

String compHform = request.getParameter("compHf");

String contPform = request.getParameter("contPf");

String atividPform = request.getParameter("atividPf");

String avaliform = request.getParameter("avalif");

String bibliGform = request.getParameter("bibliGf");

String bibliCform = request.getParameter("bibliCf");

Connection conn = null;

PreparedStatement ps = null;

try{
	
	int row = 0;
	
	conn = DbConnection.getConnection();
	
	String query = "UPDATE ptabela SET instit=? , curso=? , discip=? , period=? , CH=? , semest=? , prof=? , ement=? , CompH=? , ContP=? , atividP=? , avaliac=? , bibliG=? , bibliC=? WHERE p_id=?";
	
	
	ps = conn.prepareStatement(query);
	
    ps.setString(1, instform);
	
	ps.setString(2, cursoform);
	
	ps.setString(3, discipform);
	
	ps.setString(4, periodform);
	
	ps.setString(5, chform);
	
	ps.setString(6, semestform);
	
	ps.setString(7, profform);
	
	ps.setString(8, ementaform);
	
	ps.setString(9, compHform);
	
	ps.setString(10, contPform);
	
	ps.setString(11, atividPform);
	
	ps.setString(12, avaliform);
	
	ps.setString(13, bibliGform);
	
	ps.setString(14, bibliCform);
	
	ps.setInt(15, p_id);
	
	row = ps.executeUpdate();
	
	if(row>0){
		
		response.sendRedirect("index.jsp");
	}
	
	else{
		out.println("Error In Query...");
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