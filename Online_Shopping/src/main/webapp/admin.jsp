<%@page import="com.learn.online_shopping.entites.User"%>
<%@ page import="java.util.List" %>
<%@page import="com.learn.online_shopping.dao.CategoryDao"%>
<%@page import=" com.learn.online_shopping.FactoryProvider" %>
 <%@page import="com.learn.online_shopping.entites.Category"%>

<% 
 User user = (User)session.getAttribute("current-user");
 if(user==null)
 {
    
	 session.setAttribute("message","you are not logined in !!  Login first");
	 response.sendRedirect("login.jsp");
	 return;
    
 }else
 {
	 if(user.getUserType().equals("normal"))
	 {
		 session.setAttribute("message","you are not admin ! do not access this page");    
		 response.sendRedirect("login.jsp");
		 return;
	 }
 }

%>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>admin jsp page</title>
<%@include file="components/common_css_js.jsp" %>
</head>
<body>
<%@include file="components/navbar.jsp" %>
  <div class="container admin">
  <div class="container-fuild">
  <%@include file="components/message.jsp" %>
  </div>
  <div class="row mt-3">
  
  <!---fist col-->
  <div class="col-md-4">
  <!-- first box -->
  <div class="card">
  <div class="card-body text-center">
  <div class="container">
  <img style="max-width:125px;" class="img-fuild rounded-circle" src="image/man.png " alt="user_icon">
  </div>
  <h1>2341</h1>
  <h1 class="text-uppercase text-muted">User</h1>
  </div>
  </div>
  </div>
  <!-- secound call -->
  <div class="col-md-4">
  <div class="card">
  <div class="card-body text-center">
  <div class="container">
  <img style="max-width:125px;" class="img-fuild rounded-circle" src="image/menu.png " alt="user_icon">
  </div>
  <h1>2342</h1>
  <h1 class="text-uppercase text-muted">Categories</h1>
  </div>
  </div>
  </div>
  <!-- third call -->
  <div class="col-md-4">
  <div class="card">
  <div class="card-body text-center">
  <div class="container">
  <img style="max-width:125px;" class="img-fuild rounded-circle" src="image/cubes.png " alt="user_icon">
  </div>
  <h1>2343</h1>
  <h1 class="text-uppercase text-muted">Prodcts</h1>
  </div>
  </div>
  </div>
  </div>
  <!-- secound row -->
  <div class="row mt-3">
  <!-- secound row first coloum -->
  <div class="col-md-6">
  <div class="card" data-toggle="modal" data-target="#add-category-modal">
  <div class="card-body text-center">
  <div class="container">
  <img style="max-width:125px;" class="img-fuild rounded-circle" src="image/menu%20(1).png " alt="user_icon">
  </div>
  <p>Click here to add new Categories</p>
  <h1 class="text-uppercase text-muted">Add Categories</h1>
  </div>
  </div>
  </div>
  <div class="col-md-6">
    <!-- secound row first coloum -->
  <div class="card" data-toggle="modal" data-target="#add-product-modal">
  <div class="card-body text-center">
  <div class="container">
  <img style="max-width:125px;" class="img-fuild rounded-circle" src="image/add-to-cart.png " alt="user_icon">
  </div> 
  <p class="mt-2">Click here to add new Products</p>
  <h1 class="text-uppercase text-muted"> Add Prodcts</h1>
  </div>
  </div>
  </div>
  </div>
</div>
<!-- add category model -->


<!-- Modal -->
<div class="modal fade" id="add-category-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header custom-bg text-white">
        <h5 class="modal-title" id="exampleModalLabel">Fill Category Details</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form action="ProductOperationServlet" method="post">
        <input type="hidden" name="operation" value="addcategory">
        
        <div class="form-group">
        <input type="text" class="form-control" name="catTitle" placeholder="Enter category title" required />
        </div>
        
        <div class="form-group">
        <textarea style="height:350px;" class="form-control" placeholder="Enter category description" name="catDescription"  required ></textarea>
        </div>
        <div class="container text-center">
        <button class="btn btn-outline-success">Add Category </button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        
        </div>
        </form>
      </div>
      <div class="modal-footer">
        
      </div>
    </div>
  </div>
</div>
<!-- end category model -->
<!-- product model -->
<!-- Modal -->
<div class="modal fade" id="add-product-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Product Details</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <!-- form -->
        <form action="ProductOperationServlet" method="post" enctype="multipart/form-data">
        <input type="hidden" name="operation" value="addproduct"/>
        <!--product title-->
        <div class="form-group">
        <input type="text" class="form-control" placeholder="Enter title of product" name="pName" required/>    
        </div>
        <!-- product description -->
        <div class="form-group">
        <textarea style="height:150px;" class="form-control" placeholder="Enter product decsription" name="pDesc" pDesc"></textarea>
        </div>   
          <!-- product price -->     
        <div class="form-group">
        <input type="number"  class="form-control" placeholder="Enter price of product" name="pPrice"></textarea>
        </div>
         <!-- product discount -->     
        <div class="form-group">
        <input type="number"  class="form-control" placeholder="Enter product discount" name="pDiscount"></textarea>
        </div>
         <!-- product quantity --> 
         <div class="form-group">
        <input type="number"  class="form-control" placeholder="Enter product quantity" name="pQuantity"></textarea>
        </div>
         <!-- product category --> 
         <%
         CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
         List<Category> list = cdao. getCategories();
         %>
         <div class="form-group">
         <select name="catId" class="form-control" id="">
         
         <%
         for(Category c:list){
         %>
         
         <option value="<%= c.getCategoyId() %>"> <%=c.getCategoryTitle() %></option>
         <%} %>
         </select>
        </div>
         
         <!-- product file -->
         <div class="form-group">
         <label for="pPic">Select Picture of Product</label>
         <br>
         <input type="file" id="pPic" name="pPic" required/>
         </div>
         
         <!-- submit button -->
         <div class="container text-center" >
         <button class="btn btn-outline-success">Add Product</button>
        
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
        </form>
      </div>
      <div class="modal-footer">
      </div>
    </div>
  </div>
</div>


<!-- end category model -->
</body>
</html>