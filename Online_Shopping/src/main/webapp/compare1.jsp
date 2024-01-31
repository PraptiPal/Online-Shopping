<%@page import="org.hibernate.internal.build.AllowSysOut"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.*" %>
    <%@page import="com.learn.online_shopping.entites.Product"%>
    <%@page import="com.learn.online_shopping.entites.User"%>
    <%@page import="com.learn.online_shopping.dao.ProductDao"%>
<%@page import="com.learn.online_shopping.FactoryProvider"%>
<%
    
    
    User auth = (User) request.getSession().getAttribute("auth");
    if (auth != null) {
    	request.setAttribute("auth", auth);
    }
    
   
    %><%

ProductDao pd = new ProductDao(FactoryProvider.getFactory());
    List<Product> productList= pd.getAllProducts();
    
    String[] values = request.getParameterValues("compareBox");
    List<Product> plist = new ArrayList<>();
    for(String value : values) {
    	for(Product p:productList){
    	if(Integer.valueOf(value) == p.getpId()){
    		plist.add(p);
    		break;
    		}
    	}
    }
    
    for(Product p : plist){
    	System.out.println(p.getpName());
    }
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Compare Page</title>
<style>
table {
  border-collapse: collapse;
  width: 100%;
}

th, td {
  text-align: left;
  padding: 8px;
}

tr:nth-child(even) {background-color: #f2f2f2;}
</style>
</head>
<body>
   
	<h2>Compare Products</h2>
<table class="tbl">
  <tr>
    <th>Name</th>
    <th>Description</th>
    <th>Price</th>
    <th>Discount</th>
    <th>Image</th>
  </tr>
  <%
  for(Product p : plist){
  %>
  <tr>
    <td><%=p.getpName() %></td>
    <td><%= p.getpDesc()%></td>
	<td><%= p.getpPrice()%></td>
	<td><%=p.getpDiscount() %></td>
	<td><img src="product-images/${p.getpPhoto()}"
							class="card-img-top" alt="..."></td>
  </tr>

<%
  }
%>
</table>

<br><br>
<a href="checkout.jsp">CheckOut Now</a>
 
</body>
</html>