<%@page import="org.hibernate.internal.build.AllowSysOut"%>
<%@page import="com.learn.online_shopping.FactoryProvider"%>
<%@page import="com.learn.online_shopping.dao.ProductDao"%>
<%@ page import="java.util.List"%>
<%@page import="com.learn.online_shopping.entites.Product"%>
<%@page import="com.learn.online_shopping.dao.CategoryDao"%>
<%@page import="com.learn.online_shopping.entites.Category"%>
<%@page import="com.learn.online_shopping.helper.Helper"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>online_Shopping Home</title>
<%@include file="components/common_css_js.jsp"%>
</head>
<body>
	<%@include file="components/navbar.jsp"%>
	
	<form action=CrawlServlet method="get"> 
    <input type="search" id="search" name="search" placeholder="Search...">
    <button>Search</button>
    </form>
<div class="container-fluid">
		<div class="row mt-3 mx-2">

			<%
			String cat = request.getParameter("category");
			//out.println(cat);
			ProductDao dao = new ProductDao(FactoryProvider.getFactory());
			List<Product> list = null;

			if (cat == null || cat.trim().equals("all")) {
				list = dao.getAllProducts();
			} else {
				int cid = Integer.parseInt(cat.trim());
				list = dao.getAllProductsById(cid);
			}
			CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
			List<Category> clist = cdao.getCategories();
			HttpSession hs = request.getSession();
			%>

			<!-- show categories -->
			<div class="col-md-2">
				<div class="list-group mt-4">
					<a href="index.jsp?category=all"
						class="list-group-item list-group-item-action active"> All
						Products </a>



					<%
					for (Category c : clist) {
					%>
					<a href="index.jsp?category=<%=c.getCategoyId()%>"
						class="list-group-item list-group-item-action"><%=c.getCategoryTitle()%></a>
					<%
					}
					%>
				</div>
			</div>

			<!-- show product -->
			<div class="col-md-10">
				<div class="row mt-4">
					<!-- col:12 -->
					<div class="col-md-12">
						<div class="card-columns">
							<!-- travesing products -->

							<form >
								<%
								for (Product p : list) {
								%>
								<!-- product card -->
								<div class="card product-card">
									<div class="container text-center">
										<img src="image/products/<%=p.getpPhoto()%>"
											style="max-height: 200; max-width: 100%;"
											card-img-top" alt="...">

									</div>
									<div class="card-body">

										<h5 class="card-title"><%=p.getpName()%></h5>
										<p class="card-text">
											<%=Helper.get10Words(p.getpDesc())%>
										</p>
									</div>
									<div class="card-footer text-center">
										<button class="btn  custom-bg text-white"
											onclick="add_to_cart(<%=p.getpId()%>,'<%=p.getpName()%>',<%=p.getPriceAfterApplyingDiscount()%>)">Add
											to Cart</button> 
											<input type="checkbox" onclick="addtoCompare(<%=p.getpId()%>,'<%=p.getpName()%>',<%=p.getPriceAfterApplyingDiscount()%>)"
												name="compareBox" value="<%=p.getpId()%>"><br> 
										<button class="btn  btn-outline-success">
											&#8377;
											<%=p.getPriceAfterApplyingDiscount()%>/- <span
												class="text-secondary discount-label">&#8377; <%=p.getpPrice()%>
												, <%=p.getpDiscount()%>% off
											</span>
										</button>
									</div>
								</div>
								<%
								}

								if (list.size() == 0) {
								out.println("<h3>No item in this category</h3>");
								}
								%>

									<button type="submit" formaction="compare1.jsp"> Compare</button>
							</form>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>

	
	<%@include file="components/common_modals.jsp"%>
</body>
</html>