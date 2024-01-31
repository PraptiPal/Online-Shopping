package com.learn.online_shopping.servlets;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import javax.servlet.annotation.MultipartConfig;
import com.learn.online_shopping.FactoryProvider;
import com.learn.online_shopping.dao.CategoryDao;
import com.learn.online_shopping.dao.ProductDao;
import com.learn.online_shopping.entites.Category;
import com.learn.online_shopping.entites.Product;

@MultipartConfig
@WebServlet("/ProductOperationServlet")
public class ProductOperationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductOperationServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		try(PrintWriter out = response.getWriter()){
			//fetching category data
			
			String op = request.getParameter("operation");
			if(op.trim().equals("addcategory"))
			{
				//add category
				String title = request.getParameter("catTitle");
				String description = request.getParameter("catDescription");
				
				Category category = new Category();
				category.setCategoryTitle(title);
				category.setCategoryDescription(description);
				
				//category database save:
				CategoryDao categoryDao = new CategoryDao(FactoryProvider.getFactory());
				int catId = categoryDao.saveCategory(category);
				//out.println("category saved");
				
				HttpSession httpSession = request.getSession();
				httpSession.setAttribute("message", "category added sucessfully : "+catId);
				response.sendRedirect("admin.jsp");
				return;
				
			}else if(op.trim().equals("addproduct"))
			{
				// add product
				String pName = request.getParameter("pName");
				String pDesc = request.getParameter("pDesc");
				int pPrice = Integer.parseInt(request.getParameter("pPrice"));
				int pDiscount = Integer.parseInt(request.getParameter("pDiscount"));
				int pQuantity = Integer.parseInt(request.getParameter("pQuantity"));
				int catId = Integer.parseInt(request.getParameter("catId"));
				Part part=request.getPart("pPic");
				
				Product p = new Product();
				p.setpName(pName);
				p.setpDesc(pDesc);
				p.setpPrice(pPrice);
				p.setpDiscount(pDiscount);
				p.setpQuantity(pQuantity);
				p.setpPhoto(part.getSubmittedFileName());
				
				//get category by id
				
				CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
				Category category = cdao.getCategoryById(catId);
				p.setCategory(category);
				
				//product save
				ProductDao pdao = new ProductDao(FactoryProvider.getFactory());
				pdao.saveProduct(p);
				
				
				//pic uplode find the path to the uplode photo 
				String path = request.getRealPath("image")+ File.separator + "products" +File.separator +part.getSubmittedFileName();
				System.out.println(path);
				
				//uploding code...
				try {
				
				
				//uplodeing code..
				FileOutputStream fos = new FileOutputStream(path);
				InputStream is = part.getInputStream();
				//reading data
				byte []data = new byte[is.available()];
				is.read(data);
				
				//writing the data
				fos.write(data);
				fos.close();
				
				}catch (Exception e) {
					e.printStackTrace();
				}
				
				out.println("product save sucess");
				
				HttpSession httpSession = request.getSession();
				httpSession.setAttribute("message", "product added sucessfully");
				response.sendRedirect("admin.jsp");
				return;
				
			}

			
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
