<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%

       User user= (User)session.getAttribute("current-user"); 
       if(user==null){
	   
	       session.setAttribute("message", "You are not logged in !! Login first.");
	       response.sendRedirect("login.jsp");
	       return;
      }


%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<%@include file="components/common_css_js.jsp"%>
<title>Checkout Page</title>
</head>
<body onload="loadCheckout()">
     <%@include file="components/navbar.jsp" %>
     
     <div class="container">
     
       <div class="row">
          
          <div class="col-md-6">
          <!-- card -->
           <div class="card mt-4">
           
              <div class="card-body">
                <h3 class="card-title p-3 text-center" style="background-color: #8b6245; color: white">Your Order List</h3>
                <div class="cart-body"></div>
              </div>
           </div>
          </div>


			<div class="col-md-6">
				<!-- form-details -->
				<div class="card mt-4">

					<div class="card-body">
						<h3 class="card-title p-3 text-center"
							style="background-color: #8b6245; color: white">Personal
							Details</h3>
						<!--  <form>
                     <div class="form-group">
                         <label for="exampleInputEmail1">Email address</label>
                         <input value="" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                         <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                     </div>
                     <div class="form-group">
                         <label for="name">Name</label>
                         <input value="" type="text" class="form-control" id="name" name="name" aria-describedby="Name" placeholder="Enter Name">
                     </div>
                     <div class="form-group">
                         <label for="address">Delivery Address</label>
                         <textarea class="form-control" id="address" rows="2" placeholder="Enter Delivery Address"></textarea>
                     </div>
                     <div class="form-group">
                         <label for="phoneNo">Contact</label>
                         <input value="" type="number" class="form-control" id="phoneNo" aria-describedby="phoneNo" placeholder="Enter Phone no.">
                     </div>
                     
                     <div class="container text-center">
                       <button class="btn-lg" style="background-color: #8b6245; color: white" onclick="OrderPage()"> Order Now</button>
                       <button class="btn-lg" style="background-color: #8b6245; color: white" onclick="window.location.href = 'Main.jsp';"> Continue </button>
                     </div>
                     
                   
                   </form> --->

						<form action="/coffeeShop/orderServlet" method="post">
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail">Email</label> 
									<input value="<%=user.getUserEmail() %>" type="email" class="form-control" id="inputEmail" 
									       name= "e-mail"    placeholder="Email">
								</div>
								<div class="form-group col-md-6">
									<label for="inputName">Name</label> 
									<input value="<%=user.getUserName() %>" type="text" class="form-control" id="inputName"
										name="name" placeholder="Name">
								</div>
							</div>
							<div class="form-group">
								<label for="inputAddress">Contact</label> 
								<input value="<%=user.getUserPhone() %>" type="number" class="form-control" id="inputPhoneNo"
									name="contact" placeholder="Contact no.">
							</div>
							<div class="form-group">
								<label for="inputAddress">Address</label> <input type="text"
									class="form-control" id="inputAddress"
									placeholder="Apartment, studio, or floor">
							</div>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputCity">City</label> <input type="text"
										class="form-control" id="inputCity">
								</div>
								<div class="form-group col-md-4">
									<label for="inputState">State</label> 
									<input type="text" class="form-control" id="inputState"
									placeholder="State">
								</div>
								<div class="form-group col-md-2">
									<label for="inputZip">Zip</label> <input type="text"
										class="form-control" id="inputZip">
								</div>
								<div class="form-group">
								    <input type="hidden" class="form-control" id="orderProduct" name="product" value=" ">
								</div>
							</div>
							<div class="container text-center">
								<input type="submit" class="btn-lg" value="Order Now"
									style="background-color: #8b6245; color: white">
								<input type="button" class="btn-lg" value="Return To Home"
									style="background-color: #8b6245; color: white"
									onclick="window.location.href = 'Main.jsp'">
							</div>

						</form>
					</div>
				</div>
			</div>

		</div>
     
     </div>
     
     
     
 	<%@include file="components/commonModals.jsp" %>
</body>
</html>