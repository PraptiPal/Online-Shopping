package com.learn.online_shopping.servlets;

import java.io.IOException;

import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.learn.online_shopping.FactoryProvider;
import com.learn.online_shopping.entites.User;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public RegisterServlet() {
        super();
    }
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		try(PrintWriter out = response.getWriter()){
			try {
				String userName = request.getParameter("user_name");
				String userEmail = request.getParameter("user_email");
				String userPassword = request.getParameter("user_password");
				String userPhone = request.getParameter("user_phone");
				String userAddress = request.getParameter("user_address");

          //validation
            if(userName.isEmpty()) {
            	return;
            }
            //creating user object to store data
				User user= new User(userName,userEmail,userPassword,userPhone,"default.jpg",userAddress,"normal");
				Session hibernateSession = FactoryProvider.getFactory().openSession();
				Transaction tx = hibernateSession.beginTransaction();
				
				int userId =(int)hibernateSession.save(user);
				tx.commit();
				hibernateSession.close();
				
				HttpSession httpSession = request.getSession();
				httpSession.setAttribute("message", "Registration Successful!! User ID !!" +userId);
				
				response.sendRedirect("register.jsp");
				return;
				
				
			}catch (Exception e) {
				e.printStackTrace();
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
