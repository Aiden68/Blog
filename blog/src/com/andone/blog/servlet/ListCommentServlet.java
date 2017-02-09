package com.andone.blog.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.andone.blog.entity.Comment;
import com.andone.blog.entity.Post;
import com.andone.blog.service.CommentService;
import com.andone.blog.service.impl.CommentServiceImpl;

/**
 * Servlet implementation class ListCommentServlet
 */
@WebServlet("/listcomment")
public class ListCommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ListCommentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CommentService commentService = new CommentServiceImpl();
		List<Comment> comList = commentService.findAllComment();
		request.setAttribute("comList", comList);
		request.setAttribute("comSize", comList.size());
		request.getRequestDispatcher("/jsp/listComment.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
