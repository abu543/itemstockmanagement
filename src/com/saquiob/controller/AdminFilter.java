package com.saquiob.controller;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * Servlet Filter implementation class AdminFilter
 */
@WebFilter("/*")
public class AdminFilter implements Filter {
 
	
	private static final String [] LoginRequiredURLs = {"itemController", "/add-item-form.jsp", "/update-item-form.jsp" };
    /**
     * Default constructor. 
     */
    public AdminFilter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		
		//filter direct url ko access nhi hone deta
		
		HttpServletRequest httpRequest = (HttpServletRequest) request;   //servlet ko cast karega httpsevlet me  //filter direct url ko access nhi hone deta
		HttpSession session= httpRequest.getSession(false);          // check kareg ki user login wala  hai ki nhi
		
	boolean loggedIn = session!=null && session.getAttribute("user")!=null;   //check karega ki loggin wala person hai ki nhi
		
		String requestURL= httpRequest.getRequestURL().toString();
		System.out.println(requestURL);
		
		if(!loggedIn && isLoginRequired(requestURL)) {
			RequestDispatcher rd = request.getRequestDispatcher("index2.jsp");
			rd.forward(request,response);
		} else {
		chain.doFilter(request, response);
	}
	}

	private boolean isLoginRequired(String requestURL) {
		for(String loginRequiredURL : LoginRequiredURLs) {
			if(requestURL.contains(loginRequiredURL)) {
				return true;
			}
		}
		return false;
	}
	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
