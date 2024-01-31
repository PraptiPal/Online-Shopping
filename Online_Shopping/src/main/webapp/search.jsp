<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.*"%>
    <%@page import="com.learn.online_shopping.entites.Product"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
   if(request.getAttribute("list")!=null){
	 
	  List<Product> list = (ArrayList)request.getAttribute("list");
	
	  Iterator<Product> itr = list.iterator();
	  
	  while(itr.hasNext()) {
	      out.println(itr.next()+"<br>");
	    }
	 
%>


<% 
}
%>
</body>
</html>