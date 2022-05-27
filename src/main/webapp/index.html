<%@page import="Entities.User"%>
<%@page import="Entities.Category"%>
<%@page import="java.util.List"%>
<%@page import="helper.FactoryProvider"%>
<%@page import="dao.CategoryDao"%>

<%
User U= (User)session.getAttribute("current-user");      
CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
      List<Category>list= cdao.getCategories();  
%>



<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="css/index.css" type="text/css">
<link rel="stylesheet" href="https://unpkg.com/swiper@8/swiper-bundle.min.css"/>

<%@include file="components/common_css_js.jsp"%>
<title>CoffeeShop - Home</title>
</head>
<body>
   <div id= "load-page" class="loader-wrapper">
      <span class="loader"><span class="loader-inner"></span></span>
   </div>


	<nav class="navbar navbar-expand-lg nav">
		<div class="container">
			<a class="navbar-brand" href="Main.jsp"
				onmouseover="this.style.color='white'"> <img alt="logo"
				src="img/finalLogo.png"><font size="+2">CoffeeNation</font>
			</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>



			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav mr-auto nav-value">
					<li class="nav-item active"><a class="nav-link"
						href="index.jsp"> <font size="+1"> Home </font> <span
							class="sr-only">(current)</span>
					</a></li>


					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false"> <font size="+1"> Menu </font>
					</a>

						<div class="dropdown-menu" aria-labelledby="navbarDropdown">
							<a class="dropdown-item" href="Main.jsp?category=all"
								id="allProducts"> <font size="+1"> All Products </font>
							</a>
							<%
							for (Category c : list) {
							%>

							<a class="dropdown-item list-group-item"
								href="Main.jsp?category=<%=c.getCategoryId()%> "><%=c.getCategoryTitile()%></a>

							<%
							}
							%>
						</div></li>
				</ul>

				<ul class="navbar-nav ml-auto nav-value">

					<li class="nav-item active"><a class="nav-link" href="#"
						data-toggle="modal" data-target="#cart"> <font size="+1"><img
								class="icon" alt="cart-icon" src="img/cart-icon.png"><span
								class="cart-items">(0)</span></font>
					</a></li>


					<%
						if (U == null) {
						%>
					<li class="nav-item active"><a class="nav-link"
						href="login.jsp"> <font size="+1"> Login </font>
					</a></li>

					<li class="nav-item active"><a class="nav-link"
						href="register.jsp"> <font size="+1"> Register </font>
					</a></li>

					<%
						} else {
						%>
					<li class="nav-item active"><a class="nav-link"
						href="<%=U.getUserType().equals("admin") ? "admin.jsp" : "normal.jsp"%>">
							<font size="+1"> <%=U.getUserName()%>
						</font>
					</a></li>

					<li class="nav-item active"><a class="nav-link"
						href="/coffeeShop/logoutServlet"> <font size="+1">
								Logout </font>
					</a></li>
					<%
						}
						%>



				</ul>
			</div>
			</div>
	</nav>



	<div id="header-title">

		
			<h1>Start Your Day With Perfect Coffee</h1>
			<input class="menu" type="button" value="Explore The Menu"
				onclick="window.location.href='Main.jsp'">
		
	</div>
	<%@include file="components/commonModals.jsp" %>
	
	
</body>
</html>
