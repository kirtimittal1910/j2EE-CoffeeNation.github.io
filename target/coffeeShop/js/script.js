function addToCart( pid, pname, price){
	
	let cart = localStorage.getItem("cart");
	
	if(cart==null){
		
		
		let products= [];
		let product= {productId:  pid, productName:  pname, productQuantity: 1, productPrice: price }
	    products.push(product);
        localStorage.setItem("cart", JSON.stringify(products));
        console.log('"1st Product added"');
        showToast("Item is added to cart!!")
	}
	else{
		
		//cart is already present
		let pcart = JSON.parse(cart);
		
		let oldProduct= pcart.find( (item)=> item.productId == pid)
		if(oldProduct){
			//we have to increase the quantity
			oldProduct.productQuantity= oldProduct.productQuantity+1;
			pcart.map((item)=>{
				
				if(item.productId==oldProduct.productId){
					item.productQuantity= oldProduct.productQuantity;
				}
			})
			localStorage.setItem("cart", JSON.stringify(pcart));
			console.log('prodouct quantity increased');
			showToast( oldProduct.productName + "quantity is increased!!")
		}
		 else{
			//we have to add the product
			let product= {productId:pid, productName:pname, productQuantity:1, productPrice:price}
			pcart.push(product);
			localStorage.setItem("cart", JSON.stringify(pcart));
			console.log('product is added');
			showToast("Item is added to cart!!")
		} 
		
		
	}
	
	updateCart();
    deleteItemFromWishlist(pid);	
	
}

//update cart

function updateCart(){
    let cartString = localStorage.getItem("cart");
    let cart= JSON.parse(cartString);

    if(cart==null || cart.length==0){
	
	    console.log("Cart is empty!!");

        $(".cart-items").html("( 0 )");
        $(".cart-body").html("<h3>Empty</h3>");
        $(".checkout-btn").attr('disabled', true);
    }
    else{
	   //cart has items
       console.log(cart);
        $(".cart-items").html(`( ${cart.length} )`);
        let table= `
              <table class='table table-bordered'>
              <thead class='thead-light'>
                 <tr>
                  <th>Item Name </th>
                  <th>Price </th>
                  <th>Quantity </th>
                  <th>Total Price </th>
                  <th>Action </th>

                 </tr>
               </thead>     

               `;

             let totalPrice=0;
         
             cart.map((item)=>{
	             
               table+=`
                    <tr>   
                      <td> ${item.productName} </td>
                      <td> ${item.productPrice} </td>
                      <td> <button class= 'btn btn-danger btn-lg' data-type= "minus" onclick='decreaseItemFromCart( ${item.productId} )'>
                             <span class= 'glyphicon glyphicon-minus'></span>
                           </button>  
                           ${item.productQuantity}
                           <button class= 'btn btn-success btn-lg' data-type= "plus" onclick='increaseItemFromCart( ${item.productId} )'>
                             <span class= 'glyphicon glyphicon-plus'></span>
                           </button>
                      </td>
                      <td> ${item.productQuantity*item.productPrice} </td>
                      <td> <button class='btn btn-danger btn-sm' onclick= 'deleteItemFromCart( ${item.productId} )'>Remove</button> </td>
                    
                    </tr>

                  `
                 totalPrice += item.productPrice * item.productQuantity;	           

            })

           table= table + `
            <tr><td colspan= '5' class='text-right font-weight-bold'> Total Price: ${totalPrice} </td></tr>
           </table>`
           $(".cart-body").html(table);
           $(".checkout-btn").attr('disabled', false);


    }
}

//Remove item
function deleteItemFromCart(pid){
	
	let cart = JSON.parse(localStorage.getItem('cart'));
	let newCart = cart.filter((item) => item.productId != pid);
	localStorage.setItem('cart' , JSON.stringify(newCart));
	updateCart();
	
	showToast("Item is removed from cart!!")
}

function decreaseItemFromCart(pid){
	
	let decreaseCart = JSON.parse(localStorage.getItem('cart'));
	
	let decreaseProduct= decreaseCart.find( (item)=> item.productId == pid)
	 
    if(decreaseProduct.productQuantity==1){
	    deleteItemFromCart(pid);
    }
    
    else{

	       decreaseProduct.productQuantity= decreaseProduct.productQuantity-1;
			decreaseCart.map((item)=>{
				
				if(item.productId == decreaseProduct.productId){
					item.productQuantity= decreaseProduct.productQuantity;
				}
			})
			localStorage.setItem("cart", JSON.stringify(decreaseCart));
			updateCart();
			
			showToast( decreaseProduct.productName + "quantity is decreased!!")
		}	
}

function increaseItemFromCart(pid){
	
	let increaseCart = JSON.parse(localStorage.getItem('cart'));
	
	let increaseProduct= increaseCart.find( (item)=> item.productId == pid)
	
	increaseProduct.productQuantity= increaseProduct.productQuantity+1;
			increaseCart.map((item)=>{
				
				if(item.productId == increaseProduct.productId){
					item.productQuantity= increaseProduct.productQuantity;
				}
			})
			localStorage.setItem("cart", JSON.stringify(increaseCart));
			updateCart();
			
			showToast( increaseProduct.productName + "quantity is increased!!")
			
}




$(document).ready(function(){
	updateCart()
	updateWishlist();
});

function showToast(content){
	$("#toast").addClass("display");
	$("#toast").html(content);
	setTimeout(() =>{
		$("#toast").removeClass("display");
		}, 2000 );
}


function OrderPage(){
	localStorage.clear();
	updateCart();
	
}

function goToCheckout(){
	window.location = "checkout.jsp";
}


 $(window).on("load",function(){
	$(".loader-wrapper").fadeOut("slow");
});


 function loadCheckout(){
	let cartString = localStorage.getItem("cart");
    let cart= JSON.parse(cartString);

    if(cart==null){
	   window.location.href="Main.jsp";
       return;
    }

    $("#orderProduct").val(cart);
}



//add to wishlist
function addToWishlist(Pid, Pname, Pprice){
	let wishlist= localStorage.getItem("wishlist");
	
	if(wishlist==null){
		//whishlist is empty
		let f_items=[];
		let f_item={f_itemId: Pid, f_itemName: Pname, f_itemPrice: Pprice};
		f_items.push(f_item);
		localStorage.setItem("wishlist", JSON.stringify(f_items));
		console.log('product is added in wishlist');
		showToast("Item added to wishlist")
	}
	else{
		//wishlist already present
		let Iwishlist= JSON.parse(wishlist);
		
		let old_f_item= Iwishlist.find( (item)=> item.f_itemId == Pid)
		if(old_f_item){
			//item already present in wishlist
			console.log("Product already present in wishlist")
			showToast("Item already present in wishlist")
		}
		else{
			//we have to add item in wishlist
			 let f_item={f_itemId: Pid, f_itemName: Pname, f_itemPrice: Pprice};
		     Iwishlist.push(f_item);
             let fwishlist=JSON.stringify(Iwishlist);
		     localStorage.setItem("wishlist", fwishlist);
             console.log('product is added in wishlist');
		     showToast("Item added to wishlist");
		}
	}
	
	updateWishlist();
	
}

//update wishlist
function updateWishlist(){
	
	let wishlistString = localStorage.getItem("wishlist");
    let wishlist= JSON.parse(wishlistString);

    if(wishlist==null || wishlist.length==0){
	
	    console.log("Wishlist is empty!!");

        $(".wishlist-body").html("<h3>Empty</h3>");
    }
    else{
	     //cart has items
        console.log(wishlist);

        let table= `
              <table class='table table-bordered'>
              <thead class='thead-light'>
                 <tr>
                  <th>Item Name </th>
                  <th>Price </th>
                  <th>Remove Action </th>
                  <th>Add Action </th>
                 </tr>
               </thead>     

               `;

          wishlist.map( (item)=>{
	             
               table+=`
                    <tr>   
                      <td> ${item.f_itemName} </td>
                      <td> ${item.f_itemPrice} </td>
                      <td> <button class='btn btn-danger btn-sm' onclick= 'deleteItemFromWishlist( ${item.f_itemId} )'>
                            Remove
                           </button> 
                      </td>         
                      <td> <button class= 'btn btn-success btn-sm' onclick='addToCart( ${item.f_itemId}  , "${item.f_itemName}" ,  ${item.f_itemPrice} )'>
                             Add To Cart
                           </button>
                      </td>          
                   </tr>

                </table>`	           
            });
           $(".wishlist-body").html(table);
    }
}

//Remove item from Wishlist
 function deleteItemFromWishlist(Pid){
	
	let wishlist = JSON.parse(localStorage.getItem('wishlist'));
	let newWishlist = wishlist.filter((item) => item.f_itemId != Pid);
	localStorage.setItem('wishlist' , JSON.stringify(newWishlist));
	updateWishlist();
	
	showToast("Item is removed from wishlist!!");
}