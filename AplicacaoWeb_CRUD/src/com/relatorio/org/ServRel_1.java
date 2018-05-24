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


@WebServlet("/ServRel_1")
public class ServRel_1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
  

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String p_1id = request.getParameter("p_1id");

		int id = Integer.parseInt(p_1id);

		Connection conn = null;

		PreparedStatement ps = null;

		ResultSet rs = null;

		try{
			
			conn = DbConnection.getConnection();
			
			String query = "SELECT * FROM ptabela1 WHERE p_1id="+id;
			
			ps = (PreparedStatement) conn.prepareStatement(query);
			
			rs = ps.executeQuery();
    
			
        	
             Map<String, Object> parametros = new HashMap<String, Object>();
        	 String caminhoRel = "C:/Users/lucas/workspaceNeon/AplicacaoWeb_CRUD/WebContent/reports/plano_aula.jasper";
        	 
	            ImageIcon gto = new ImageIcon(getClass().getResource("logiesp.png"));
	            parametros.put("logo_1",gto.getImage());
	      
	            
        	JRResultSetDataSource jrRS = new JRResultSetDataSource(rs); 
        	
		JasperPrint preencher = JasperFillManager.fillReport(caminhoRel, parametros, jrRS);
		
			
        OutputStream outStream = response.getOutputStream();
        
            response.setContentType("application/pdf");
            response.setHeader("Content-Disposition", "inline; filename=\"Plano_de_Aula.pdf\"");
            JasperExportManager.exportReportToPdfStream(preencher, outStream);
            
    			ps.close();
    			
    			conn.close();
    			
		}
		catch(Exception e){
			e.printStackTrace();
		}
	
	}


	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

}
