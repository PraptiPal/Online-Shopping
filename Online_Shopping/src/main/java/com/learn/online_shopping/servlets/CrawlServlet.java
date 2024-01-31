package com.learn.online_shopping.servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;



/**
 * Servlet implementation class CrawlServlet
 */
@WebServlet("/CrawlServlet")
public class CrawlServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	private HashSet<String> links;

	public CrawlServlet() {
		links = new HashSet<String>();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// response.getWriter().append("Served at: ").append(request.getContextPath());
		ArrayList<Integer> newlist = new ArrayList<>();
		String query = request.getParameter("search").toString();
		//String arr[] = new String[2];
//		arr[0] = query.substring(0, query.indexOf(32));
//		if (query.length() >= arr[0].length()) {
//			arr[1] = query.substring(query.indexOf(32) + 1, query.length());
//		}
		
		String text = null;

		Document doc = Jsoup.connect("http://localhost:8085/Online_Shopping/index.jsp").get();
		//System.out.println(doc.text());
		if (doc.text().contains(query)) {
			
			Elements elements = doc.getElementsByClass("card-body");
			for (Element element : elements) {
				if (element.text().contains(query)) {
					//if (element.text().contains(arr[0]) && element.text().contains(arr[1])) {
						int productId = Integer.parseInt(element.select("input[name='p']").attr("value"));
						newlist.add(productId);
						System.out.println(productId);
					//}
				}
				
			}
		}
		HttpSession session = request.getSession();
		session.setAttribute("productIdSerachList", newlist);
		
		response.sendRedirect("search.jsp");

	}

}