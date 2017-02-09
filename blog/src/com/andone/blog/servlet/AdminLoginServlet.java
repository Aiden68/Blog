package com.andone.blog.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.andone.blog.entity.Admin;
import com.andone.blog.service.AdminService;
import com.andone.blog.service.impl.AdminServiceImpl;

/**
 * Servlet implementation class AdminLogin
 */
@WebServlet("/adminlogin")
public class AdminLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminLoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String username = request.getParameter("username");
		String pwd = request.getParameter("pwd");
		AdminService adminService = new AdminServiceImpl();
		Admin admin = adminService.findByNameAndPwd(username, pwd);
		if(admin != null){
			HttpSession session = request.getSession();
			session.setAttribute("username", username);
			response.sendRedirect(request.getContextPath()+"/jsp/backIndex.jsp");
		}
		else{
			request.getRequestDispatcher("/jsp/backLogin.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
