package com.learn.online_shopping.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.learn.online_shopping.entites.Product;

/**
 * Servlet implementation class Compare
 */
@WebServlet("/Compare")
public class Compare extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Compare() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		List<Product> productList = new ArrayList<>();

		String[] str = request.getParameterValues("compareBox");
		//User auth = (User) request.getSession().getAttribute("auth");

		//if (auth != null) {
		//request.setAttribute("auth", auth);
		//}

		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		for(String str1:str){
			out.print("<li>"+ str1+ "</li>");
//		int productId = Integer.parseInt(str1);
//		System.out.println(productId);
//       request.getRequestDispatcher("Compare.java").forward(request, response);
//		
//		response.sendRedirect("index.jsp");
		

		}

	}

}
