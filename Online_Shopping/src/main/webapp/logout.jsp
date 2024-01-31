<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>logout page</title>
<%@include file="components/common_css_js.jsp" %>
</head>
<body>
<%@include file="components/navbar.jsp" %>
<div class="card-body">

<%@include file="components/message.jsp" %>

<form action="LogoutServlet" method="post">
<%
session.setAttribute("message","you are not logined in !!  Login first");
response.sendRedirect("login.jsp");
%>
</form>
</div>
</body>
</html>