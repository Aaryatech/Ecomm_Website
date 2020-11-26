<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<header>
	<div class="top_row">
		<div class="wrapper">
			<div class="top_content">
				<div class="top_links">
					<div class="top_menu">
						<span><a href="#"><i class="fa fa-phone"
								aria-hidden="true"></i> +91 - 1234 567 890</a></span> <span><a
							href="#">Help</a></span>
						<!--<span><a href="#">Offers</a></span>-->
						<span><a href="#">Visit Stores</a></span>

						<ul class="drop_menu">
							<li><a href="#">Partner with us <i
									class="fa fa-angle-down" aria-hidden="true"></i></a>
								<ul>
									<li><a href="#"> Become A Vendor </a></li>
									<li><a href="#"> Become A Franchisee </a></li>
									<li><a href="#"> Corporate Gifts </a></li>
								</ul></li>
						</ul>

					</div>
				</div>
				<div class="top_address">
					<span><p>Delivery</p> Location :</span> Bandra Cake ShopMumbai.
					<ul class="login_menu edit">
						<li><a href="#"><i class="fa fa-pencil"
								aria-hidden="true"></i></a>
							<ul>
								<li><a href="${pageContext.request.contextPath}/"> Add
										New Address </a></li>
								<li><a
									href="${pageContext.request.contextPath}/addresslist"> Use
										Existing address</a></li>
							</ul></li>
					</ul>
				</div>
				<div class="clr"></div>
			</div>
		</div>
	</div>
	<div class="logo_row">
		<div class="wrapper">
			<div class="menu_cont">
				<div class="main_logo">
					<a href="${pageContext.request.contextPath}/home"><img src="#"
						class="lazy"
						data-src="${pageContext.request.contextPath}/resources/images/main_logo.png"
						alt=""></a>
				</div>
				<div class="menu_area_right">

					<div class="logo_form">
						<!--main search-->
						<form action="" method="get">
							<div class="input_one">
								<input name="" type="text" class="search_input"
									placeholder="Search..." />
								<button class="search_btn">
									<i class="fa fa-search" aria-hidden="true"></i>
								</button>
							</div>
						</form>
					</div>

					<div class="logo_right">
						<div class="mobile_search"></div>

						<!--like product-->
						<div class="product_like">

							<a href="like-product.html"> <i class="fa fa-heart"
								aria-hidden="true"></i></a>

						</div>

						<!--cart-->
						<div class="product_cart">
							<div id="mySidepanel" class="sidepanel">
								<div class="slide_title">
									<div class="slide_icn">
										<i class="fa fa-shopping-cart" aria-hidden="true"></i>
									</div>
									Cart
									<div class="slide_close">
										<a href="javascript:void(0)" class="closebtn"
											onclick="closeNav()">�</a>
									</div>
								</div>

								<div class="like_bx" id="item_cart_list">
									<!--<div class="empty_bx">
                                    <div class="empty_cont">
                                        Cart is Empty
                                        <a href="#">Continue Shopping</a>
                                        <img src="images/empty_cart.jpg" alt="">
                                    </div>
                                </div>-->


									<!--1-->
									<div class="like_one">
										<div class="like_pic">
											<img src="#" class="lazy"
												data-src="${pageContext.request.contextPath}/resources/images/like_pic.jpg"
												alt="">
										</div>
										<div class="like_cont">
											<h4 class="like_cake_nm">Black Forest Square Cake (Half
												kg)</h4>
											<p class="like_prc">Rs. 695.00</p>
											<div class="like_quant">
												<span>Qty.</span>

												<form id='myform' method='POST' action='#'>
													<input type='button' value='-' class='qtyminus'
														field='quantity' /> <input type='text' name='quantity'
														value='0' class='qty' /> <input type='button' value='+'
														class='qtyplus' field='quantity' />
												</form>
											</div>
										</div>
										<div class="clr"></div>
									</div>
									<!--2-->
									<div class="like_one">
										<div class="like_pic">
											<img src="#" class="lazy"
												data-src="${pageContext.request.contextPath}/resources/images/like_pic.jpg"
												alt="">
										</div>
										<div class="like_cont">
											<h4 class="like_cake_nm">Black Forest Square Cake (Half
												kg)</h4>
											<p class="like_prc">Rs. 695.00</p>
											<div class="like_quant">
												<span>Qty.</span>

												<form id='myform' method='POST' action='#'>
													<input type='button' value='-' class='qtyminus'
														field='quantity' /> <input type='text' name='quantity'
														value='0' class='qty' /> <input type='button' value='+'
														class='qtyplus' field='quantity' />
												</form>
											</div>
										</div>
										<div class="clr"></div>
									</div>
									<!--3-->
									<div class="like_one">
										<div class="like_pic">
											<img src="#" class="lazy"
												data-src="${pageContext.request.contextPath}/resources/images/like_pic.jpg"
												alt="">
										</div>
										<div class="like_cont">
											<h4 class="like_cake_nm">Black Forest Square Cake (Half
												kg)</h4>
											<p class="like_prc">Rs. 695.00</p>
											<div class="like_quant">
												<span>Qty.</span>

												<form id='myform' method='POST' action='#'>
													<input type='button' value='-' class='qtyminus'
														field='quantity' /> <input type='text' name='quantity'
														value='0' class='qty' /> <input type='button' value='+'
														class='qtyplus' field='quantity' />
												</form>
											</div>
										</div>
										<div class="clr"></div>
									</div>
								</div>
								<div id="proc_chkout">
									<div class="proc_chkout">
										<!-- <span>Total : Rs. 1390/- </span> <a href="my-cart.html">Proceed
										to Checkout</a> -->
									</div>
								</div>


							</div>
							<button class="openbtn count" onclick="openNav()">
								<i class="fa fa-shopping-cart" aria-hidden="true"></i> <span
									class="cart_item_count" id="cart_item_count">0</span>
							</button>
						</div>

						<!--user-dropdown-->
						<div class="user_login">
							<ul class="login_menu">
								<li><a href="#"><img src="#" class="lazy"
										data-src="${pageContext.request.contextPath}/resources/images/user_pic.jpg"
										alt=""> Hi Kate <!-- <i class="fa fa-angle-down"
										aria-hidden="true"></i> --></a>
									<ul>
										<li class="lgn_nm">Hello <span>kate@gmail.com</span></li>
										<!--<li><a href="#"> My Monginis </a></li>-->
										<li></li>
										<li></li>
										<li></li>
										<li></li>
										<li class="lgn_out"></li>
									</ul></li>
							</ul>
						</div>
					</div>
					<div class="clr"></div>
				</div>
			</div>
		</div>
	</div>

	<!--full menu-->
	<div id="myNav" class="overlay">
		<a href="javascript:void(0)" class="closebtn" onclick="closeNav1()">&times;</a>
		<div class="overlay-content">
			<a href="${pageContext.request.contextPath}/orderhistory"> My Order </a> <a
				href="multi-address.html"> My Address Book </a> <a
				href="${pageContext.request.contextPath}/profile"> Profile </a> <a href="#">Help</a> <a
				href="location.html">Logout</a>

			<!-- <a href="#">About</a> <a href="#">Services</a> <a href="#">Clients</a> <a href="#">Contact</a> -->
		</div>
	</div>

	<span onclick="openNav1()" class="main_menu"><img src="#"
		class="lazy"
		data-src="${pageContext.request.contextPath}/resources/images/hamburger_icn.png"
		alt=""> <!--<i class="fa fa-bars" aria-hidden="true"></i>--></span>

</header>
<script>
	function appendCartData() {

		if (sessionStorage.getItem("allItemList") == null) {
			var table = [];
			sessionStorage.setItem("allItemList", JSON.stringify(table));
		}

		if (sessionStorage.getItem("cartValue") == null) {
			var table = [];
			sessionStorage.setItem("cartValue", JSON.stringify(table));
		}

		var allItemList = sessionStorage.getItem("allItemList");
		var allItemArr = $.parseJSON(allItemList);

		var cartValue = sessionStorage.getItem("cartValue");
		var table = $.parseJSON(cartValue);

		$("#item_cart_list").html('');
		$("#proc_chkout").html('');
		$("#cart_item_count").html('');
		var subtotal = 0;

		for (var j = 0; j < allItemArr.length; j++) {
			for (var i = 0; i < table.length; i++) {

				if (table[i].itemId == allItemArr[j].productId) {

					//alert(i);
					subtotal = (parseFloat(subtotal) + parseFloat(table[i].totalAmt))
							.toFixed(2);
					$("#item_cart_list")
							.append(
									'<div class="like_one">'
											+ '<div class="like_pic">'
											+ '<img src="${prodImgUrl}'+allItemArr[j].prodImagePrimary+'" class="lazy"'+
				'data-src="${prodImgUrl}'+allItemArr[j].prodImagePrimary+'"'+
				'alt="">'
											+ '</div>'
											+ '<div class="like_cont">'
											+ '<h4 class="like_cake_nm">'
											+ table[i].exVar1
											+ '</h4>'
											+ '<p class="like_prc">Rs.'
											+ table[i].totalAmt
											+ '</p>'
											+ '<div class="like_quant">'
											+ '<span>Qty.</span>'
											+ '<form id="myform" method="POST" action="#">'
											+ '<input type="button" value="-" onclick="setQty('
											+ table[i].itemId
											+ ','
											+ i
											+ ','
											+ table[i].qty
											+ ',0)" class="qtyminus"'
											+ 'field="quantity"/><input type="text" id="prod_quantity'+table[i].itemId+'" name="prod_quantity'+table[i].itemId+'"'+
						'value="'+table[i].qty+'" class="qty" /> <input type="button" onclick="setQty('
											+ table[i].itemId
											+ ','
											+ i
											+ ','
											+ table[i].qty
											+ ',1)" value="+"'
											+ 'class="qtyplus" field="quantity"/>'
											+ '</form>'
											+ '</div>'
											+ '</div>'
											+ '<div class="clr"></div>'
											+ '</div>')

				}//IF
			}//End of For loop 2
		}//End of loop 1

		document.getElementById("cart_item_count").innerHTML = ""
				+ table.length;
		$("#proc_chkout")
				.append(
						'<div class="proc_chkout">'
								+ '<span>Total : Rs.'
								+ subtotal
								+ '/- </span> <a href="${pageContext.request.contextPath}/checkout">Proceed'
								+ 'to Checkout</a>' + '</div>')

	}
	function setQty(productId, position, curQty, buttonType) {
		//setQty('+table[i].itemId+','+i+','+table[i].qty+',0)"
		//prod_quantity+productId;
		var ischanged = 0;
		if (parseInt(buttonType) == 0 && parseInt(curQty) > 1) {
			//Its Minus call;
			//alert("If")
			curQty = parseInt(curQty) - 1;
			ischanged = 1;
		} else if (parseInt(buttonType) == 1) {
			//Its Plus;
			//alert("Else")
			curQty = parseInt(curQty) + 1;
			ischanged = 1;
		}

		if (parseInt(ischanged) == 1) {
			var cartValue = sessionStorage.getItem("cartValue");
			var table = $.parseJSON(cartValue);
			table[position].qty = curQty;

			var qty = parseFloat(curQty);
			var taxableAmt = parseFloat(table[position].rate)
					* parseFloat(qty).toFixed(2);
			var cgstAmt = (parseFloat(table[position].rate) * parseFloat(qty) * parseFloat(table[position].cgstPer)) / 100;
			var sgstAmt = (parseFloat(table[position].rate) * parseFloat(qty) * parseFloat(table[position].sgstPer)) / 100;
			var igstAmt = (parseFloat(table[position].rate) * parseFloat(qty) * parseFloat(table[position].igstPer)) / 100;

			var taxAmt = (cgstAmt + sgstAmt + igstAmt).toFixed(2);
			var totalAmt = parseFloat(taxableAmt).toFixed(2);

			table[position].taxableAmt = taxableAmt;
			table[position].cgstAmt = cgstAmt;
			table[position].sgstAmt = sgstAmt;
			table[position].igstAmt = igstAmt;
			table[position].taxAmt = taxAmt;
			table[position].totalAmt = totalAmt;
			console.log(table);
			sessionStorage.setItem("cartValue", JSON.stringify(table));
			appendCartData();
		}//end of If ischanged==1
	}
	function clearData() {
		sessionStorage.clear();
	}

	//appendCartData(); // Onload call.
	getItemList();// Onload call.

	function getItemList() {

		//document.getElementById("loaderimg").style.display = "block";
		var fd = new FormData();
		$.ajax({
			url : '${pageContext.request.contextPath}/getAllFrWiseData',
			type : 'post',
			dataType : 'json',
			data : fd,
			contentType : false,
			processData : false,
			success : function(response) {
				//document.getElementById("loaderimg").style.display = "none";
				//alert(JSON.stringify(response.feProductHeadList))
				sessionStorage.setItem("allItemList", JSON
						.stringify(response.feProductHeadList));

				appendCartData();

			},
		});

	}

	function openNav() {
		appendCartData();
		document.getElementById("mySidepanel").style.width = "300px";
	}
	
	function closeNav() {
		document.getElementById("mySidepanel").style.width = "0";
	}
	
</script>

