package com.andone.blog.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.PageContext;

import com.andone.blog.entity.Catagory;
import com.andone.blog.entity.Comment;
import com.andone.blog.entity.Post;
import com.andone.blog.service.CatagoryService;
import com.andone.blog.service.CommentService;
import com.andone.blog.service.PostService;
import com.andone.blog.service.impl.CatagoryServiceImpl;
import com.andone.blog.service.impl.CommentServiceImpl;
import com.andone.blog.service.impl.PostServiceImpl;

/**
 * Servlet implementation class PostDetailServlet
 */
@WebServlet("/postdetail")
public class PostDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PostDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		PostService postService = new PostServiceImpl();
		CommentService commentService = new CommentServiceImpl();
		String id = request.getParameter("id");
		Post post = postService.postFindById(id);
		Integer visitors = Integer.parseInt(post.getVisitor());
		visitors++;
		postService.updatePostVisitors(id, visitors);
		List<Comment> comList = commentService.findAllCommentByPid(id);
		CatagoryService catagoryService  = new CatagoryServiceImpl();
		List<Catagory> catList = catagoryService.findAllCat();
		request.setAttribute("post", post);
		request.setAttribute("commentList", comList);
		request.setAttribute("comSize", comList.size());
		request.setAttribute("catList", catList);
		request.getRequestDispatcher("/jsp/frontDetail.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
