package com.filtro.org;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



public class FiltroRestrito implements Filter {

    
    public FiltroRestrito() {
       
    }

	
	public void destroy() {
		
	}

	
	public void doFilter(ServletRequest request, ServletResponse response, 
			FilterChain chain)
			throws IOException, ServletException {
		
		 ((HttpServletResponse) response).setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
	     ((HttpServletResponse) response).setHeader("Pragma", "no-cache"); // HTTP 1.0.
	     ((HttpServletResponse) response).setDateHeader("Expires", 0); // Proxies.
		
		HttpServletRequest rq = (HttpServletRequest)request;
		HttpServletResponse rs = (HttpServletResponse)response;
		
		HttpSession session = rq.getSession();
		
		if(session.getAttribute("usuario") != null ){
			
			chain.doFilter(request, response);
			
		
		}else{
			
			rs.sendRedirect("Login.jsp");
		}
	}


	
	public void init(FilterConfig fConfig) throws ServletException {
	
	}

}
