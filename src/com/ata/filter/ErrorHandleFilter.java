package com.ata.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class ErrorHandleFilter implements Filter{

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doFilter(ServletRequest req, ServletResponse res,
			FilterChain chain) throws IOException, ServletException {
		
		System.out.println("Inside filter---------");
		HttpServletRequest httprequest=(HttpServletRequest)req;
		
	HttpSession ses=httprequest.getSession(false);
	if(ses==null|| ses.getAttribute("credentialsBean")==null)
	{
		System.out.println("Session null ---------------");
		httprequest.getRequestDispatcher("/SessionTimeoutPage.jsp").forward(req, res);
		return;
	}
	else{
		chain.doFilter(req, res);
	}
		// TODO Auto-generated method stub
		
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub
		
	}

}
