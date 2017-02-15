package com.andone.blog.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.andone.blog.entity.Catagory;
import com.andone.blog.service.CatagoryService;
import com.andone.blog.service.impl.CatagoryServiceImpl;
import com.sun.glass.ui.CommonDialogs.Type;

import net.sf.json.JSONArray;

/**
 * Servlet implementation class ListCatServlet
 */
@WebServlet("/listcat")
public class ListCatServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ListCatServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CatagoryService catagoryService = new CatagoryServiceImpl();
		List<String> catList = new ArrayList<String>();
		List<Catagory> list = new ArrayList<>();
		list = catagoryService.findAllCat();	
		String type = request.getParameter("type");
		if(type!=null){
			System.out.println("e");
			request.setAttribute("catList", list);
			request.getRequestDispatcher(request.getContextPath()+"/jsp/index.jsp").forward(request, response);
		}
		else{
			for(Catagory catagory:list){
				catList.add(catagory.getCatName());
			}
			JSONArray jSONArray = JSONArray.fromObject(catList);
			String jsonJAVA = jSONArray.toString();
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter pw = response.getWriter();
			pw.write(jsonJAVA);
			pw.flush();
			pw.close();
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
