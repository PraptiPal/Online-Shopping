<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>checkout</title>
<%@include file="components/common_css_js.jsp" %>
</head>
<body>
<%@include file="components/navbar.jsp" %>
<div class="container">
<div class="row mt-5">
<div class="col-md-6">
<!-- card -->
<div class="card">
<div class="card-body">
<h3 class="text-center mb-5">Your Selected Items</h3>
<div class="cart-body">
</div>
</div>
</div>
</div>
<div class="col-md-6">
<!-- form details -->
<!-- card -->
<div class="card">
<div class="card-body">
<h3 class="text-center mb-5">Your Details For Order</h3>
<form action="#!">
<div class="form-group">
    <label for="exampleInputEmail1">Email address</label>
    <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
  </div>
  <div class="form-group">
    <label for="name">Your Name</label>
    <input type="text" class="form-control" id="name" aria-describedby="emailHelp" placeholder="Enter Name">
  </div>
  <div class="form-group">
    <label for="exampleFormControlTextarea1">Your Shipping Address</label>
    <textarea class="form-control" id="exampleFormControlTextarea1" placeholder="Enter Your Address" rows="3"></textarea>
  </div>
  <div class="container text-center">
  <button class="btn btn-outline-success">Order Now</button>
  <button class="btn btn-outline-primary">Continue Shopping</button>
  </div>

</form>
</div>
</div>

</div>
</div>


</div>
<%@include file="components/common_modals.jsp" %>
</body>
</html>