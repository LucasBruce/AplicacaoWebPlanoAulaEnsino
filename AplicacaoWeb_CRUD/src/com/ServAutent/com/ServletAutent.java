package com.ServAutent.com;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.org.Usuario;


@SuppressWarnings("serial")
@WebServlet("/ServletAutent")
public class ServletAutent extends HttpServlet {
	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
	    processRequest(req, resp);

    	     
    	resp.setContentType("text/html:charset-UTF-8");
    	PrintWriter out = resp.getWriter();
    	try{
    	   
    	    Usuario usuario = new Usuario();
    	    
    	    if(!usuario.getSenha().equals(req.getParameter("senha"))&&
    	    		!usuario.getLogin().equals(req.getParameter("login"))) {
    	    	    resp.sendRedirect("Login.jsp?error=error");
    	    	    
    	    }else if(!usuario.getSenha().equals(req.getParameter("senha"))) {
    			resp.sendRedirect("Login.jsp?senha=error");
    			
    		}else if(!usuario.getLogin().equals(req.getParameter("login"))) {
    			resp.sendRedirect("Login.jsp?usuario=error");
    			
    		}else if (usuario.getLogin().equals(req.getParameter("login"))
    				&& usuario.getSenha().equals(req.getParameter("senha"))) {
    			
    	        HttpSession session = req.getSession();
    	        session.setAttribute("usuario", usuario);
    	        resp.sendRedirect("restrito/menu.jsp");
    	        
    	    }else{
    	    	
    	    	resp.sendRedirect("Login.jsp?error=error");
    	}

    	}finally{
    	    out.close();
    	}
	}

	private void processRequest(HttpServletRequest request, HttpServletResponse respons) {
		// TODO Auto-generated method stub
		
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse respons)
			throws ServletException, IOException {
	
	
		 ((HttpServletResponse) respons).setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
	     ((HttpServletResponse) respons).setHeader("Pragma", "no-cache"); // HTTP 1.0.
	     ((HttpServletResponse) respons).setDateHeader("Expires", 0); 
	     
	    HttpSession session1 = request.getSession();     
	    if(session1.getAttribute("usuario") != null){
            
            respons.sendRedirect ("Login.jsp");
            session1.invalidate();
    	}
	    
		
		
        
      }
	
		
	}
	
	

