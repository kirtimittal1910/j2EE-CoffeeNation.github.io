<%@page import="helper.Helper"%>
<%@page import="Entities.Category"%>
<%@page import="dao.CategoryDao"%>
<%@page import="Entities.Product"%>
<%@page import="java.util.List"%>
<%@page import="dao.ProductDao"%>
<%@page import="org.hibernate.hql.internal.ast.util.ASTUtil.IncludePredicate"%>
<%@page import="helper.FactoryProvider"%>
<!DOCTYPE html>
<html>
<head>
   <meta http-equiv="Content-Type" content="text/html; charset-UTF-8">
   <link rel="stylesheet" href="css/main.css" type="text/css">
   
   <%@include file="components/common_css_js.jsp"%>
   <script type="text/javascript">
      $(document).ready(function(){
    	  
    	  
    	  
    	  function readMore(){
    		  
    		  var maxlength= 20;
        	  $(".pDescription").each(function(){
        		  var myStr= $(this).text();
        		  if($.trim(myStr).length > maxlength){
        			  var newStr= myStr.substring(0, maxlength);
        			  var removedStr= myStr.substring(maxlength, $.trim(myStr).length);
        			  $(this).empty().html(newStr);
        			  $(this).append(' <a href= "javascript:void(0);" class="read-more">read more...</a> ');
        			  $(this).append('<span class="more-text">' + removedStr + ' <a href= "javascript:void(0);" class="read-less">read less...</a> </span>');
        		  }
        	  });
    		  
    	  }
    	  
    	  readMore();
    	  $(document).on("click", ".read-more", function() {
    		  $(this).siblings(".more-text").contents().unwrap();
    		  $(this).remove();
    	  });
    	  
    	  $(document).on("click", ".read-less", function() {
    		  $(this).remove();
    		  readMore();
    	  });
    	   
      });
      
      
       $(function(){
    	 $(".list-category a").click(function(){
    		 $(this).addClass("active");
    	
    		 
    	 });
      }); 
      
   </script>
   <style>
      .card-text .more-text{
         display: none;
      }
   </style>


   <title>Menu-Page</title>
   
</head>
<body>

    <%@include file="components/navbar.jsp" %>
    
    <div class= "container-fluid">
    <div class="row mt-3 mx-3">
    
    
    <%
       
       String cat=   request.getParameter("category");
       ProductDao pdao= new ProductDao(FactoryProvider.getFactory());
       List<Product>Plist= null;
       
       if(cat== null || cat.trim().equals("all")){
    	  Plist = pdao.getAllProducts();
       }
       else{
    	   int cId= Integer.parseInt(cat.trim());
    	   Plist= pdao.getAllProductsById(cId);  
       }
       
       CategoryDao cdao= new CategoryDao(FactoryProvider.getFactory());
       List<Category>Clist = cdao.getCategories();
       
    %>
    
    <!-- show categories -->
		<div class="col-md-2">
			<div class="list-group mt-4 list-category">
			    <a href="#" class="list-group-item list-group-item-action active" data-bs-toggle="list">
					Categories </a>
				<a href="Main.jsp?category=all" class="list-group-item list-group-item-action" data-bs-toggle="list" id="allProducts">
					All Products </a>

				<%
				for (Category c : Clist) {
				%>
                
				<a href="Main.jsp?category=<%= c.getCategoryId() %> " class="list-group-item list-group-item-action c-list" id="active-List"> 
			     <%= c.getCategoryTitile() %></a>

				<%
				}
				%>

			</div>

		</div>
		

		<!----- show products ----->
		
		<div class="col-md-10">

			<!-- row -->
			<div class="row mt-4">
				<!-- column -->
				<div class="col-md-12">

					<div class="card-columns">

						<!-- traversing products -->
						<%
						for (Product p : Plist) {
						%>
		        <!-- product-card -->				
						<div class="card product-card">
						   
						   <img class="card-img-top " src="img/menu/<%= p.getpPhoto() %>" alt="<%= p.getpPhoto() %>" style="max-height: 300px; max-width: 100%;">
						   <div class="card-body">
						   
						     <h5 class="card-title"><%= p.getpName() %></h5>
						     <p class="card-text">
						        &#8377;<%=p.getpPrice() %><br> 
						       <span class= "pDescription"><%= p.getpDesc()%></span> 
						     </p>
						     <button class="btn custom-bg text-white" onclick= " (addToCart(<%= p.getpId()%>, '<%= p.getpName()%>', <%= p.getpPrice()%>))">
						     Add
						     </button>
						     <button class="btn custom-bg text-white" onclick="(addToWishlist(<%= p.getpId()%>, '<%= p.getpName()%>', <%= p.getpPrice()%> ))"> 
						     <img alt="whishlist" src="img/Wishlist.png" onclick="(addToWishlist(<%= p.getpId()%>, '<%= p.getpName()%>', <%= p.getpPrice()%> ))"> 
						     Wishlist
						     </button>
						     
						   </div>
						</div>

						<%
						}
						if(Plist.size()==0){
							out.println("<h3>No Item in this category</h3>");
						}
						%>

					</div>

				</div>

			</div>
		</div>
		
		

	</div>
	</div>
	
	<%@include file="components/commonModals.jsp" %>
	
</body>
</html>
