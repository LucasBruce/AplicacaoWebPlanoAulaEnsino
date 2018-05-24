<%@page import="java.sql.SQLException"%>
<%@page import="net.sf.jasperreports.view.JasperViewer"%>
<%@page import="net.sf.jasperreports.engine.JasperFillManager"%>
<%@page import="com.sun.javafx.collections.MappingChange.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="net.sf.jasperreports.engine.JRResultSetDataSource"%>
<%@page import="com.dbconnectionutil.org.DbConnection"%>
<%@page import="java.sql.ResultSet"%>
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

String p_id = request.getParameter("p_id");

int id = Integer.parseInt(p_id);

Connection conn = null;

PreparedStatement ps = null;

ResultSet rs = null;
			
			try{
				
			conn = DbConnection.getConnection();
			
			String query = "SELECT * FROM ptabela WHERE p_id='"+id+"'";
	      
	        
	        ps = (PreparedStatement) conn.prepareStatement(query);
	        
	        rs = ps.executeQuery();
	        
	        
	        JRResultSetDataSource jrRS = new JRResultSetDataSource(rs);
			/* Preenche o relatório com os dados. */
			String jasperPrint = JasperFillManager.fillReportToFile("reports/plan_ensino.jasper", null, jrRS);//Aqui vc chama o relatório
			JasperViewer viewer = new JasperViewer(jasperPrint, false, false);
			viewer.setExtendedState(JasperViewer.MAXIMIZED_BOTH);//Coloca em maximizado
			viewer.setTitle("Plano de Ensino" + id);//Coloca um título no relatório
	        
			}catch(Exception ex){
				
				ex.printStackTrace();
			}
			
			finally{
				try {
					ps.close();
				} catch (SQLException e) {
					
					e.printStackTrace();
				}
				
				try {
					conn.close();
				} catch (SQLException e) {
					
					e.printStackTrace();
				}
				
				
			}

%>

</body>
</html>