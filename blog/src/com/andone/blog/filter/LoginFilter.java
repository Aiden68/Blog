package com.andone.blog.filter;

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

/**
 * Servlet Filter implementation class LoginFilter
 */

public class LoginFilter implements Filter {

	private FilterConfig config;
    /**
     * Default constructor. 
     */
    public LoginFilter() {
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
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		HttpSession session = req.getSession();
		
		String noLoginPaths = config.getInitParameter("noLoginPaths");
		String paths = config.getInitParameter("Paths");
		String charset = config.getInitParameter("charset");
		String uri = req.getRequestURI();
		if(charset==null){
			charset = "UTF-8";
		}
		req.setCharacterEncoding(charset);
		if(uri.lastIndexOf(".") != -1){
			String suffix = uri.substring(uri.lastIndexOf("."));
			if(suffix.equals(".css") || suffix.equals(".js") || uri.contains("font-awesome") ){
				chain.doFilter(request, response);
				return;
			}
		}	
		if(noLoginPaths!=null){
			String[] strArray = noLoginPaths.split(";");
			for (int i = 0; i < strArray.length; i++) {
				if(strArray[i]==null || "".equals(strArray[i]))continue;				
				if(uri.indexOf(strArray[i])!=-1 ){
					chain.doFilter(request, response);
					return;
				}
			}			
		}	
		if(session.getAttribute("username")!=null){
			chain.doFilter(request, response);
		}
		else{
			String[] strArray = paths.split(";");
			for (int i = 0; i < strArray.length; i++) {	
				if(strArray[i]==null || "".equals(strArray[i]))continue;		
				if(uri.indexOf(strArray[i])!=-1 ){
					res.sendRedirect(req.getContextPath()+"/jsp/backLogin.jsp");
					return;
				}
			}
			chain.doFilter(request, response);
		}
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		config = fConfig;
	}

}
