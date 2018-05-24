package com.relatorio.org;

import java.io.IOException;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.ImageIcon;
import com.dbconnectionutil.org.DbConnection;
import com.mysql.jdbc.PreparedStatement;
import net.sf.jasperreports.engine.JRResultSetDataSource;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;



@WebServlet("/ServRel")
public class ServRel extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	
	
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String p_id = request.getParameter("p_id");
		int id = Integer.parseInt(p_id);
		
		try{
			
			
			Connection conn = (Connection) DbConnection.getConnection();
			
			String query = "SELECT * FROM ptabela WHERE p_id ="+id;
			
			PreparedStatement ps = (PreparedStatement) conn.prepareStatement(query);
			
			ResultSet rs = ps.executeQuery();
    
			
        	
             Map<String, Object> parametros = new HashMap<String, Object>();
        	 String caminhoRel = "C:/Users/lucas/workspaceNeon/AplicacaoWeb_CRUD/WebContent/reports/plan_ensino.jasper";
        	 
	            ImageIcon gto = new ImageIcon(getClass().getResource("logiesp.png"));
	            parametros.put("logo",gto.getImage());
	      
	            
        	JRResultSetDataSource jrRS = new JRResultSetDataSource(rs); 
        	
		JasperPrint preencher = JasperFillManager.fillReport(caminhoRel, parametros, jrRS);
		
			
        OutputStream outStream = response.getOutputStream();
        
            response.setContentType("application/pdf");
            response.setHeader("Content-Disposition", "inline; filename=\"Plano_de_Ensino.pdf\"");
            JasperExportManager.exportReportToPdfStream(preencher, outStream);
            
    			ps.close();
    			
    			conn.close();
    			
		}
		catch(Exception e){
			e.printStackTrace();
		}
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
