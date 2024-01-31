<%@page import="org.hibernate.internal.build.AllowSysOut"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.*" %>
    <%@page import="com.learn.online_shopping.entites.Product"%>
    <%@page import="com.learn.online_shopping.entites.User"%>
    <%@page import="com.learn.online_shopping.dao.ProductDao"%>
    <%@page import="com.learn.online_shopping.dao.CategoryDao"%>
<%@page import="com.learn.online_shopping.FactoryProvider"%>
<%
ProductDao pd = new ProductDao(FactoryProvider.getFactory());
CategoryDao cd = new CategoryDao(FactoryProvider.getFactory());
pd.getAllProducts();
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>compare jsp file</title>
</head>
<body>
<table>
  <tr>
    <th>Company</th>
    <th>Contact</th>
  </tr>
  <tr>
    <td>Alfreds Futterkiste</td>
    <td>Maria Anders</td>
  </tr>
  <tr>
    <td>Centro comercial Moctezuma</td>
    <td>Francisco Chang</td>
  </tr>
</table>
</body>
</html>