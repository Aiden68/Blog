package com.andone.blog.servlet;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.andone.blog.entity.Comment;
import com.andone.blog.service.CommentService;
import com.andone.blog.service.impl.CommentServiceImpl;

/**
 * Servlet implementation class AddCommentServlet
 */
@WebServlet("/addcomment")
public class AddCommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddCommentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		Date date = new Date();
		Comment comment = new Comment();
		CommentService commentService = new CommentServiceImpl();
		comment.setName(request.getParameter("comName"));
		comment.setEmail(request.getParameter("comEmail"));
		comment.setContent(request.getParameter("comContent"));
		String pid = request.getParameter("pid");
		comment.setPid(pid);
		comment.setCreateTime(date);
		commentService.addComment(comment);
		/*List<Comment> comList = commentService.findAllCommentByPid(pid);
		request.setAttribute("comList", comList);
		request.setAttribute("comSize", comList.size());*/
		response.sendRedirect(request.getContextPath()+"/postdetail?id="+pid);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
