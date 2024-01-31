package com.learn.online_shopping.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.learn.online_shopping.FactoryProvider;
import com.learn.online_shopping.dao.UserDao;
import com.learn.online_shopping.entites.User;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public LoginServlet() {
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
			
			//coding area
			String email= request.getParameter("email");
			String password= request.getParameter("password");
			
			//validation
			
			//authnticating user
			
			 UserDao userDao = new UserDao(FactoryProvider.getFactory());
			 User user = userDao.getUserByEmailAndPassword(email, password);
			 //System.out.println(user);
			 
			 HttpSession httpSession = request.getSession();
			 
			 if(user==null) 
			 {
				 out.println("<h1>Invalid details</h1>");
				 httpSession.setAttribute("message", "Invalid Details !! Try with another one");
				 response.sendRedirect("login.jsp");
				 return;
			 }else 
			 {
				 out.println("<h1>Wlelcome " +user.getUserName()+ " </h1>");
				  
				 
				 httpSession.setAttribute("current-user", user);
				 if(user.getUserType().equals("admin"))
				 {    //admin:- admin.jsp
					 response.sendRedirect("admin.jsp");
				 }else if(user.getUserType().equals("normal"))
				 {
					 //normal.jsp
					 response.sendRedirect("normal.jsp");
				 }
				 else {
					 out.println("we have not identified user type");
				 }
				 
				 
				
				 
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
