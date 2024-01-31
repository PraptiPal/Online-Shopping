function add_to_cart(pid, pname, price)
{
	let cart = localStorage.getItem("cart");
	if (cart == null)
	{
		//no cart yet
		let products=[];
		let product = {productId:pid , productName:pname, productQuantity:1,productPrice:price}
		products.push(product);
		localStorage.setItem("cart",JSON.stringify(products));	
		console.log("product added for first time")
	
	}else
	{
		//cart is already present
		let pcart = JSON.parse(cart);
		
		let oldProduct = pcart.find((item) => item.productId == pid)
		console.log(oldProduct)
		if(oldProduct)
		{
			// we have to increse the quantity
			oldProduct.productQuantity=oldProduct.productQuantity+1
			pcart.map((item)=>{
				if(item.productId == oldProduct.productId)
				{
					item.productQuantity=oldProduct.productQuantity;
				}
				
			})
			localStorage.setItem("cart",JSON.stringify(pcart));
			console.log("product quantity is incresed")
			
		}else
		{
			//we have to add the Quantity
			let product = {productId:pid , productName:pname, productQuantity:1,productPrice:price}
			pcart.push(product);
			localStorage.setItem("cart",JSON.stringify(pcart));
			console.log("product is added")
		}
			
}	
	updateCart();
	
	}
	//update cart:
	
function updateCart()
{
	 let cartString = localStorage.getItem("cart");
	 let cart=JSON.parse(cartString);
	 if(cart==null || cart.length==0)
	 {
		console.log("cart is empty !!")
		$(".cart-items").html("( 0 )");
		$(".cart-body").html("<h3>Cart does not have any items </h3>");
		$(".checkout-btn").attr('disabled',true)
	}else
	{
		//there is some in cart to show
		console.log(cart)
		$(".cart-items").html(`( ${cart.length} )`);
		let table = `
		<table class='table'>
		<thead class='thead-light'>
		<tr>
		<th>Item Name</th>
		<th> Price</th>
		<th> Quantity</th>
		<th> Total Price</th>
		<th> Action</th>
		
		</tr>
		</thead>
		
		
		`;
		
		let totalPrice = 0;
		cart.map((item)=>{
			table+=`
			<tr>
			<td> ${item.productName} </td>
			<td> ${item.productPrice} </td>
			<td> ${item.productQuantity} </td>
			<td> ${item.productQuantity*item.productPrice} </td>
			<td><button onclick='deleteItemFromCart(${item.productId})' class='btn btn-danger btn-sm'>Remove</buton></td>
			</tr>
			
			`
			totalPrice+=item.productPrice*item.productQuantity;
			
		})
		
	table=table + `
	<tr><td colspan='5' class='text-right font-weight-bold m-5'>Total Price : ${totalPrice} </td></tr>
	
	</table>`
	$(".cart-body").html(table);
	$(".checkout-btn").attr('disabled',false)
	console.log("removed")
		
	}
}

//delete item
function deleteItemFromCart(pid)
{
	let cart = JSON.parse(localStorage.getItem('cart'));
	let newcart=cart.filter((item) => item.productId != pid)
	localStorage.setItem('cart', JSON.stringify(newcart))
	updateCart();
}
	$(document).ready(function (){
		updateCart()
	})
	
function goToCheckout(){
	window.location="checkout.jsp"
}

function addtoCompare(pid, pname, price){
	
//no cart yet
		let products=[];
		let product = {productId:pid , productName:pname, productQuantity:1,productPrice:price}
		products.push(product);
		localStorage.setItem("cart1",JSON.stringify(products));	
		console.log("product added for first time")
		console.log(products);
		
		
		let product1 = {productId:pid , productName:pname, productQuantity:1,productPrice:price}
		products.push(product1);
		localStorage.setItem("cart1",JSON.stringify(products));	
		console.log("product added for second time")
		console.log(products);
		
		updateCart2();
		
		
}

function updateCart2()
{
	//window.location="compare2.jsp"
		let table = `
		<table class = 'table'>
  <tr>
    <th>Company</th>
    <th>Contact</th>
    <th>Country</th>
  </tr>
  <tr>
    <td>Alfreds Futterkiste</td>
    <td>Maria Anders</td>
    <td>Germany</td>
  </tr>
  <tr>
    <td>Centro comercial Moctezuma</td>
    <td>Francisco Chang</td>
    <td>Mexico</td>
  </tr>
</table>
		`;
		console.log("function 2 called")
	}


	
	
	
	
	
	