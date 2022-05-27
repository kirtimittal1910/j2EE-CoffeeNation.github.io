<%@page import="Entities.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%

   User user= (User)session.getAttribute("current-user"); 
   if(user==null){
	   
	   session.setAttribute("message", "You are not logged in !! Login first.");
	   response.sendRedirect("login.jsp");
	   return;
    }
   else{
	   
	   if(user.getUserType().equals("admin")){
		   session.setAttribute("message", "You are admin! Please Login to you respective panel.");
		   response.sendRedirect("login.jsp");
		   return;
	   }
   }



%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

 <%@include file="components/common_css_js.jsp" %>
 
 <link rel="stylesheet" href="css/normal.css" type="text/css">
<title>User Dashboard</title>

<script type="text/javascript">

   function Rate_1(){
	  var text= $("#feedback-star");
	  text.val("I just hate it");
      text.show();	  
   }
		
	
   function Rate_2(){
	   var text= $("#feedback-star");
	   text.val("I don't like it");
	   text.show();
   }
		
	
   function Rate_3(){
	   var text= $(".feedback-star");
	   text.val("I like it");
	   text.show();
   } 
		
   function Rate_4(){
	   var text= $(".feedback-star");
	   text.val("It is awesome");
	   text.show();
   }
		
	
   function Rate_5(){
	   var text= $(".feedback-star");
	   text.val("I love it");
	   text.show();
   }
		
	
</script>




</head>
<body>
   <%@include file="components/navbar.jsp" %>
   
   <div class="container">
        <%@include file="components/Message.jsp" %>
       <div class="row">
       
 <!-- Wishlist column -->
          <div class="col-md-4">
             <div class="card" data-toggle="modal" data-target="#wishlist">
                <div class="card-body text-center">
                    <div class="container">
                        <img  style="max-width: 20%" class="img-fluid icons" alt="orderBag-icon" src="img/finalorder-bag.png">  
                    </div>
                    <h1 style="color: white">My Wishlist</h1>  
                </div>
			  </div>
          </div>
<!-- Personal Detail column -->          
          <div class="col-md-4">
             <div class="card" data-toggle="modal" data-target="#personalDetail">
                <div class="card-body text-center">
                    <div class="container">
                        <img  style="max-width: 26%" class="img-fluid icons" alt="profileDetail-icon" src="img/profile-details.png">  
                    </div>
                    <h1 style="color: white">Profile Details</h1>  
                </div>
			  </div>
          </div> 
  <!-- Feedback form column -->     
          <div class="col-md-4">
             <div class="card" data-toggle="modal" data-target="#feedbackForm">
                <div class="card-body text-center">
                    <div class="container">
                        <img  style="max-width: 26%" class="img-fluid icons" alt="feedback-icon" src="img/feedback.png">  
                    </div>
                    <h1 style="color: white">Feedback</h1>  
                </div>
			  </div>
          </div>
                
      </div>
   
   </div>
   
   <!----------------- Modal----------------------->
   
<!--Personal detail Modal -->
	<div class="modal fade" id="personalDetail" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLongTitle">Your
						Details</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form action="">
						<div class="form-group">
							<label for="exampleInputEmail1">Email address</label> <input
								value="<%=user.getUserEmail()%>" type="email"
								class="form-control" id="exampleInputEmail1"
								aria-describedby="emailHelp" placeholder="Enter email">
						</div>
						<div class="form-group">
							<label for="name">Name</label> <input
								value="<%=user.getUserName()%>" type="text" class="form-control"
								id="name" aria-describedby="Name" placeholder="Enter Name">
						</div>
						<div class="form-group">
							<label for="phoneNo">Contact</label> <input
								value="<%=user.getUserPhone()%>" type="number"
								class="form-control" id="phoneNo" aria-describedby="phoneNo"
								placeholder="Enter Phone no.">
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>

<!---- whishlist Modal ---->

	<div class="modal fade" id="wishlist" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="exampleModalLabel">Wishlist</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="wishlist-body"></div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>

<!-- Feedback form Modal -->
	<div class="modal fade" id="feedbackForm" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLongTitle"> Feedback Form</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
				     <div class="container">
				     <div class="star-widget">
                        <input type="radio" name="rate" id="rate-5">
                        <label for="rate-5" class="fas fa-star rate-5" onclick="Rate_5()"></label>
                        <input type="radio" name="rate" id="rate-4">
                        <label for="rate-4" class="fas fa-star rate-4" onclick="Rate_4()"></label>
                        <input type="radio" name="rate" id="rate-3">
                        <label for="rate-3" class="fas fa-star rate-3" onclick="Rate_3()"></label>
                        <input type="radio" name="rate" id="rate-2">
                        <label for="rate-2" class="fas fa-star rate-1" onclick="Rate_2()"></label>
                        <input type="radio" name="rate" id="rate-1">
                        <label for="rate-1" class="fas fa-star rate-1" onclick="Rate_1()"></label>
                    </div>
                    <form action="/coffeeShop/feedbackServlet" method="post" class="feedbackform">
                         <input type="text" class="feedback-star" name="feedback" id="feedback-star" style="display:none">
                       <div class="detail">
                         <input  type="email" name="email" value="<%=user.getUserEmail()%>" placeholder="Enter your email">
                       </div>
                       <div class="textarea">
                         <textarea rows="2" name="experience" placeholder="Describe your experience"></textarea>
                       </div>
                       <div class="submitbtn">
                         <button type="submit">Submit</button>
                       </div>
                    </form>
				     
				     </div>
				     
					
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>

	<%@include file="components/commonModals.jsp" %>   
</body>
</html>