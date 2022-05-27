<%@page import="helper.FactoryProvider"%>
<%@page import="dao.ProductDao"%>
<%@page import="Entities.User"%>
<%
  User user1= (User)session.getAttribute("current-user");
  ProductDao pdao1= new ProductDao(FactoryProvider.getFactory());
%>


<nav class="navbar navbar-expand-lg navbar-dark custom-bg">
	<div class="container">
		<a class="navbar-brand" href="Main.jsp">
		  <img alt="Logo" src="img/finalLogo.png"><font size="+2"> CoffeeNation </font> 
		  </a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active">
				    <a class="nav-link" href="index.jsp"><font size="+1">Home</font> 
						<span class="sr-only">(current)</span>
				    </a>
				 </li>


			</ul>
			
		
			
			<ul class="navbar-nav ml-auto">

				<li class="nav-item active">
				  <a class="nav-link" href="#" data-toggle="modal" data-target="#cart">
				    <font size="+1"> <img  class="icon" alt="cart-icon" src="img/cart-icon.png"><span class="cart-items">(0)</span></font>
				  </a>
				</li>


				<%
				if (user1 == null) {
				%>
				<li class="nav-item active"><a class="nav-link"
					href="login.jsp"><font size="+1"> Login </font> </a></li>

				<li class="nav-item active"><a class="nav-link"
					href="register.jsp"> <font size="+1"> Register </font> </a></li>

				<%
				} else {
				%>
				<li class="nav-item active">
				    <a class="nav-link" href="<%= user1.getUserType().equals("admin") ? "admin.jsp" : "normal.jsp"%>">
				   <font size="+1"> <%=user1.getUserName()%> </font> </a></li>

				<li class="nav-item active"><a class="nav-link"
					href="/coffeeShop/logoutServlet"> <font size="+1"> Logout </font></a></li>
				<%
				}
				%>



			</ul>
		</div>
	</div>
</nav>