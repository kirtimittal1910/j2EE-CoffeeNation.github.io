<%@page import="java.util.Map"%>
<%@page import="helper.Helper"%>
<%@page import="Entities.Category"%>
<%@page import="java.util.List"%>
<%@page import="dao.CategoryDao"%>
<%@page import="helper.FactoryProvider"%>
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
	   
	   if(user.getUserType().equals("normal")){
		   session.setAttribute("message", "You are not admin ! Cannot access this page.");
		   response.sendRedirect("login.jsp");
		   return;
	   }
   }
%>
           
  <%
      CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
      List<Category>list= cdao.getCategories();  
      
      //getting user and product count
      Map<String, Long>m = Helper.getCount(FactoryProvider.getFactory());
  %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<%@include file="components/common_css_js.jsp"%>
<link rel="stylesheet" href="css/admin.css" type="text/css">
<title>Admin Dashboard</title>
</head>
<body>
	<%@include file="components/navbar.jsp"%>

	<div class="container">
	
	   <div class="container-fluid mt-3">
	      <%@include file="components/Message.jsp" %>
	   </div>
		<div class="row">
			<!-- 1st column -->
			<div class="col-md-4">
				<div class="card">
					<div class="card-header">
						<img class="icons" alt="user-icon" src="img/user-icon.png">
						<h4>Customers Registered</h4>
					</div>
					<div class="card-body">
					  <h5> <%= m.get("userCount") %> </h5> 
					</div>
				</div>
			</div>

			<!-- 2nd column -->
			<div class="col-md-4">
				<div class="card">
					<div class="card-header">
						<img class="icons" alt="category-icon" src="img/category-item.png">
						<h4>Categories</h4>
					</div>
					<div class="card-body">
					    <h5><%= list.size() %></h5>
					</div>
				</div>


			</div>

			<!-- 3rd column -->
			<div class="col-md-4">
				<div class="card">
					<div class="card-header">
						<img class="icons" alt="item-icon" src="img/Items-icon.png">
						<h4>Items Added</h4>
					</div>
					<div class="card-body">
					  <h5> <%= m.get("productCount") %> </h5> 
				    </div>
				</div>

			</div>

		</div>

		<!--second-row-->
		<div id="add-section" class="row">

			<!--2nd row 1st col-->
			<div class="col-md-4">
				<div class="card" data-toggle="modal" data-target="#add_category_modal">
					<div class="card-header">
						<img class="icons" alt="user-icon" src="img/add-category.png">
						<h4>Add Category</h4>
					</div>
					<div class="card-body">
						<h5>Click here for add category!!</h5>
					</div>
				</div>
			</div>

			<!--2nd row 2nd col-->
			<div class="col-md-4">
				<div class="card" data-toggle="modal" data-target="#add_item_modal">
					<div class="card-header">
						<img class="icons" alt="user-icon" src="img/add-product.png">
						<h4>Add New Item</h4>
					</div>
					<div class="card-body">
						<h5>Click here for add new item!!</h5>
					</div>
				</div>
			</div>

		</div>


	</div>
	
<!---------- add-category-modal-start-------->	
<!-- Modal -->
<div class="modal fade" id="add_category_modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header" style="background-color: #8b6245; color:white">
        <h5 class="modal-title" id="exampleModalLongTitle" >Add New Category</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      
  <!-- Category-form -->    
         <form action="/coffeeShop/productOperationServlet" method="post">
             <input type="hidden" name="operation" value="addCategory">
             
             <div class="form-group">
                 <input type="text" name="cat-name" class="form-control" placeholder="Category Name" required="required"> 
             </div>
             
             <div class="form-group">
                 <input type="text" name="cat-description" class="form-control" placeholder="Description" required="required"> 
             </div>
             
             <div class="container text-center">
                <button type="submit" class="btn btn-outline-success" >Add Category</button>
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
             </div>
         </form>
      </div>

    </div>
  </div>
</div>
<!-----------add-category-model-end-------------->

<!-- --------add-product-model-start ------------>
<!-- Modal -->
<div class="modal fade" id="add_item_modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header" style="background-color: #8b6245; color:white">
        <h5 class="modal-title" id="exampleModalLongTitle" >Add New Item</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
   
   <!-- Add-Item form -->   
        <form action="/coffeeShop/productOperationServlet" method="post" enctype="multipart/form-data">
            
            <input type="hidden" name="operation" value="addProduct">
            
           <!-- Category column --> 
            <div class="form-group">
                 <label>Category</label>
                 <select name="catId" class="form-control" id="catId">
                 <%
                   for(Category c: list){
                 %>
                   <option value="<%= c.getCategoryId() %>"><%= c.getCategoryTitile() %></option>
                 <%
                   }
                 %>
                 </select> 
             </div>
             
          <!-- item-column -->
            <div class="form-group">
                 <label>Item Name</label>
                 <input type="text" name="item-name" class="form-control" placeholder="Item Name" required="required"> 
             </div>
          
          <!-- description-column -->   
             <div class="form-group">
                 <label>Description</label>
                 <input type="text" name="item-des" class="form-control" placeholder="Item Description" required="required"> 
             </div>
             
          <!-- price column -->
             <div class="form-group">
                 <label>Price</label>
                 <input type="number" name="item-price" class="form-control" placeholder="Price in Rupees" required="required"> 
             </div>
             
          <!-- pic-column -->
             <div class="form-group">
                 <label>Picture</label>
                 <input type="file" name="item-pic" class="form-control" required="required"> 
             </div>
             
              <div class="container text-center">
                <button type="submit" class="btn btn-outline-success" >Add Item</button>
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
             </div>
        </form>
      </div>

    </div>
  </div>
</div>
<!-- --------add-product-model-end------------ -->

<%@include file="components/commonModals.jsp" %>
</body>
</html>