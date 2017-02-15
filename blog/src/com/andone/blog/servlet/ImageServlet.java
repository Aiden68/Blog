package com.andone.blog.servlet;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.andone.blog.dao.CatagoryDao;
import com.andone.blog.entity.Catagory;
import com.andone.blog.entity.Image;
import com.andone.blog.service.CatagoryService;
import com.andone.blog.service.ImageService;
import com.andone.blog.service.impl.CatagoryServiceImpl;
import com.andone.blog.service.impl.ImageServiceImpl;

import net.sf.json.JSONArray;


/**
 * Servlet implementation class ImageServlet
 */
@WebServlet("/image")
@MultipartConfig
public class ImageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ImageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Integer type = Integer.valueOf(request.getParameter("type"));
        ImageService imageService = new ImageServiceImpl();
        CatagoryService catagoryService = new CatagoryServiceImpl();
        List<Catagory> catList = new ArrayList<>();
        catList = catagoryService.findAllCat();
        request.getSession().setAttribute("catList", catList);
        if (type == 1) {    //ÉÏ´«Í¼Æ¬²©¿ÍÒ³
            String imageName = request.getParameter("image_name");
            Part image = request.getPart("image");
            InputStream inputStream = image.getInputStream();
            Image img = new Image();
            img.setDate(new Date());
            img.setName(imageName);
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            img.setUrl(sdf.format(new Date()).toString() + "/" + UUID.randomUUID());
            List<String> urlList = new ArrayList<String>();
            urlList.add(img.getUrl());
            imageService.addImage(img, inputStream);
//          request.getSession().setAttribute("imageList", imageService.getByUserId(img.getUser().getId()));
            JSONArray jSONArray = JSONArray.fromObject(urlList);
    		String url = jSONArray.toString();
    		response.setContentType("text/html;charset=UTF-8");
    		PrintWriter pw = response.getWriter();
    		pw.print(url);
        } else if (type == 2) {    //É¾³ýÍ¼Æ¬
            String ids = request.getParameter("ids");
            String urls = request.getParameter("urls");
            if(request.getSession().getAttribute("username") != null){
            	imageService.delByIdsAndUrls(ids, urls);
            }
        }else if (type == 3){
        	request.getSession().setAttribute("imageList", imageService.findAllImage());
        	ArrayList<Image> aList = imageService.findAllImage();
            response.sendRedirect(request.getContextPath() + "/jsp/frontImageList.jsp");
        }else if (type == 4){
        	request.getSession().setAttribute("imageList", imageService.findAllImage());
        	ArrayList<Image> aList = imageService.findAllImage();
            response.sendRedirect(request.getContextPath() + "/jsp/imageList.jsp");
        }else if(type == 5){
        	String imageName = request.getParameter("image_name");
            Part image = request.getPart("image");
            InputStream inputStream = image.getInputStream();
            Image img = new Image();
            img.setDate(new Date());
            img.setName(imageName);
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            img.setUrl(sdf.format(new Date()).toString() + "/" + UUID.randomUUID());
            imageService.addImage(img, inputStream);
            request.getSession().setAttribute("imageList", imageService.findAllImage());
            response.sendRedirect(request.getContextPath() + "/jsp/imageList.jsp");
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
