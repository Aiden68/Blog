package com.andone.blog.servlet;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.andone.blog.entity.Post;
import com.andone.blog.service.PostService;
import com.andone.blog.service.impl.PostServiceImpl;

/**
 * Servlet implementation class UpdatePostServlet
 */
@WebServlet("/updatepost")
public class UpdatePostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdatePostServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		Post post = new Post();
		PostService postService = new PostServiceImpl();
		post.setId(request.getParameter("id"));
		post.setTitle(request.getParameter("title"));
		post.setContent(request.getParameter("content"));
//		post.setSummary(post.getContent().substring(200));
		Date date = new Date();
		post.setCreateTime(date);
		post.setUpdateTime(date);
		postService.updatePost(post);
		response.sendRedirect(request.getContextPath()+"/listpost");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
