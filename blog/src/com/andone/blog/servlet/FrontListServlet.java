package com.andone.blog.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.andone.blog.entity.Post;
import com.andone.blog.service.PostService;
import com.andone.blog.service.impl.PostServiceImpl;
import com.andone.blog.util.Constant;
import com.andone.blog.util.Pager;
import com.andone.blog.util.StringUtil;

/**
 * Servlet implementation class FrontListServlet
 */
@WebServlet("/index")
public class FrontListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FrontListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PostService postService = new PostServiceImpl();
		List<Post> list = postService.findAllPost();
		Post ppost = new Post();
//		int currentPage = Integer.parseInt(request.getParameter("currentPage"));
		// 校验pageNum参数输入合法性
		String pageNumStr = request.getParameter("pageNum"); 
		if(pageNumStr !=null && !StringUtil.isNum(pageNumStr)){
			request.setAttribute("errorMsg", "参数传输错误");
			request.getRequestDispatcher("jdbcSqlStudent.jsp").forward(request, response);
			return;
		}
		
		int currentPage = Constant.DEFAULT_PAGE_NUM; //显示第几页数据
		if(pageNumStr!=null && !"".equals(pageNumStr.trim())){
			currentPage = Integer.parseInt(pageNumStr);
		}
		
		int pageSize = Constant.DEFAULT_PAGE_SIZE;  // 每页显示多少条记录
		String pageSizeStr = request.getParameter("pageSize");
		if(pageSizeStr!=null && !"".equals(pageSizeStr.trim())){
			pageSize = Integer.parseInt(pageSizeStr);
		}
		Pager<Post> result = postService.pageFind(ppost, currentPage, pageSize);
		for(Post post:result.getResultList()){
			if(post.getContent()==null){
				continue;
			}
			String content = post.getContent();
			String regex = "<[^>]*>";
			String temp = content.replaceAll(regex, "");
			temp += "......";
			if(temp.length() > 200){
				post.setSummary(temp.substring(0, 200) + "......");
			}
			else{
				post.setSummary(temp);
			}			
		}
		request.setAttribute("result", result);
		request.getRequestDispatcher("/jsp/frontIndex.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
