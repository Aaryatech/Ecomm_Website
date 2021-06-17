<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<header>
	<style>
</style>
<!-- The core Firebase JS SDK is always required and must be listed first -->
<script src="https://www.gstatic.com/firebasejs/8.6.7/firebase-app.js"></script>
<script src="https://www.gstatic.com/firebasejs/8.6.7/firebase-database.js"></script>

<!-- TODO: Add SDKs for Firebase products that you want to use
     https://firebase.google.com/docs/web/setup#available-libraries -->

<script>
  // Your web app's Firebase configuration
  var firebaseConfig = {
    apiKey: "AIzaSyDigzfh2ygt26QhXa7YoJrmNqOdx126oWg",
    authDomain: "gfplsecurityapp.firebaseapp.com",
    databaseURL: "https://gfplsecurityapp.firebaseio.com",
    projectId: "gfplsecurityapp",
    storageBucket: "gfplsecurityapp.appspot.com",
    messagingSenderId: "1093488930367",
    appId: "1:1093488930367:web:674415ee8c528ae737928a"
  };
  // Initialize Firebase
  firebase.initializeApp(firebaseConfig);
  
  var cart_tab = 'table_value';
	const dbrefObject = firebase.database().ref(cart_tab);


</script>
	<!-- Akhilesh Loader Jsp -->

	<%-- <jsp:include page="/WEB-INF/views/loader.jsp"></jsp:include> --%>
	<div class="top_row">
		<div class="wrapper">
			<div class="top_content">
				<div class="top_links">
					<div class="top_menu">
						<span><a href="#"><i class="fa fa-phone"
								aria-hidden="true"></i> +91 - 1234 567 890</a></span> <span><a
							href="${pageContext.request.contextPath}/home">Home</a></span>
						<!--<span><a href="#">Offers</a></span>-->
						<span><a
							href="${pageContext.request.contextPath}/showVistStorePage">Visit
								Stores</a></span>

						<ul class="drop_menu">
							<li><a href="#">Partner with us <i
									class="fa fa-angle-down" aria-hidden="true"></i></a>
								<ul>
									<li><a
										href="${pageContext.request.contextPath}/showBecmVendrFr">
											Become A Vendor </a></li>
									<li><a
										href="${pageContext.request.contextPath}/showBecmVendrFr">
											Become A Franchise </a></li>
									<li><a href="#"> Corporate Gifts </a></li>
								</ul></li>
						</ul>

					</div>
				</div>



				<div class="top_address">
					<span><p>Delivery</p> Location :</span> <span title="${landMark}"
						class="address_land">${landMark}.</span>
					<ul class="login_menu edit">
						<li><a href="javascript:void(0)"><i class="fa fa-pencil"
								aria-hidden="true"></i></a>
							<ul>
								<li><a
									href="${pageContext.request.contextPath}/ShowAddNewAdd">
										Add New Address </a></li>
								<li><c:choose>
										<c:when test="${sessionScope.custId>0}">
											<a href="${pageContext.request.contextPath}/addresslist">
												Use Existing address</a>
										</c:when>
										<c:otherwise>
											<!-- <a
									href="#"> Use
										Existing address</a> -->
										</c:otherwise>
									</c:choose></li>
								<c:if test="${sessionScope.custId>0}">
									<li><a onclick="setData()"
										href="${pageContext.request.contextPath}/logout"> Logout </a></li>
								</c:if>
								<li>
							</ul></li>
					</ul>
					<c:if test="${sessionScope.isAddressPopup==1}">
						<div class="drop_fix" id="add_poupu">
							<h3>Have you selected the right location ?</h3>
							<p>Your selected location seems to be a little far off from
								your device location</p>
							<a href="#" onclick="resetAddressPopup()" class="left">Dismiss</a>
							<a href="${pageContext.request.contextPath}/ShowAddNewAdd"
								class="right">Change Location</a>
						</div>
					</c:if>

				</div>
				<div class="clr"></div>
			</div>
		</div>
	</div>
	<div class="logo_row">
		<div class="wrapper">
			<div class="menu_cont">
				<div class="main_logo">
					<a href="${pageContext.request.contextPath}/home"><img
						src="${pageContext.request.contextPath}/resources/images/main_logo.png"
						class="lazy"
						data-src="${pageContext.request.contextPath}/resources/images/main_logo.png"
						alt=""></a>
				</div>
				<div class="menu_area_right">

					<div class="logo_form">
						<!--main search-->
						<!-- <form action="" method="get"> -->
						<div class="input_one">
							<input name="glbSearch" id="glbSearch" type="text"
								onchange="globalSearch(0)" list="glbTemplates"
								class="search_input" autocomplete="on" placeholder="Search..." />
							<datalist id="glbTemplates"></datalist>
							<button class="search_btn" id="btnGlbSearch"
								onclick="globalSearch(0)">
								<i class="fa fa-search" aria-hidden="true"></i>
							</button>
						</div>
						<!-- </form> -->
					</div>

					<div class="logo_right">
						<div class="mobile_search"></div>

						<!--like product-->
						<div class="product_like">
							<a href="${pageContext.request.contextPath}/likeproducts"> <i
								class="fa fa-heart" aria-hidden="true"></i> <span
								class="cart_item_count" id="like_item_count">${sessionScope.likeCount}</span>
							</a>
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
								<li><c:choose>
										<c:when test="${sessionScope.custId>0}">
											<a href="${pageContext.request.contextPath}/profile"><img
												width="25" height="25" src="${sessionScope.profileImg}"
												title="Mohsin"
												onerror="this.src='${pageContext.request.contextPath}/resources/images/no_img_folder/user_pic.png'"
												alt=""> <!-- <i class="fa fa-angle-down"
										aria-hidden="true"></i> --></a>
										</c:when>
										<c:otherwise>
											<a href="#"><img class="lazy" width="25" height="25"
												src="${sessionScope.profileImg}"
												onerror="this.src='${pageContext.request.contextPath}/resources/images/no_img_folder/user_pic.png'"
												alt=""> <!-- <i class="fa fa-angle-down"
										aria-hidden="true"></i> --></a>
										</c:otherwise>
									</c:choose> <!-- ${pageContext.request.contextPath}/resources/images/user_pic.jpg -->
									<%-- <ul>
										<li class="lgn_nm">Hello <span>${sessionScope.userEmail}</span></li>
										<!--<li><a href="#"> My Monginis </a></li>-->
										<li></li>
										<li></li>
										<li></li>
										<li></li>
										<li class="lgn_out"></li>
										
									</ul> --%></li>
								<li><span class="user_lgn_nm"
									title="${sessionScope.userName}">
										${sessionScope.userName} </span></li>

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
			<a href="${pageContext.request.contextPath}/orderhistory"> My
				Order </a> <a href="${pageContext.request.contextPath}/addresslist">
				My Address Book </a> <a
				href="${pageContext.request.contextPath}/profile"> Profile </a> <a
				href="#">Help</a> <a onclick="setData()"
				href="${pageContext.request.contextPath}/logout">Logout</a>

			<!-- <a href="#">About</a> <a href="#">Services</a> <a href="#">Clients</a> <a href="#">Contact</a> -->
		</div>
	</div>

	<span onclick="openNav1()" class="main_menu"><img
		src="${pageContext.request.contextPath}/resources/images/hamburger_icn.png"
		alt=""> <!--<i class="fa fa-bars" aria-hidden="true"></i>--></span>

</header>

<script type="text/javascript">
	/*********************Akhil For Loader On Each Page**************  */
	$(window).on('load', function() {
		//alert("Ok")
		setTimeout(removeLoader, 1000); //wait for page load PLUS two seconds.
	});
	function removeLoader() {
		$("#loadingDiv").fadeOut(500, function() {
			// fadeOut complete. Remove the loading div
			$("#loadingDiv").remove(); //makes page more lightweight 
		});
	}
	/************************************************************/
	//Sachin 18-02-2021
	function resetAddressPopup() {
		document.getElementById("add_poupu").style.display = "none";
		var fd = new FormData();
		fd.append("isPop", 0)
		$.ajax({
			url : '${pageContext.request.contextPath}/resetAddressPopup',
			type : 'post',
			dataType : 'json',
			data : fd,
			contentType : false,
			processData : false,
			success : function(response) {

			},
		});
	}

	function setData() {
		var table = [];
		sessionStorage.setItem("cartValue", JSON.stringify(table));
		sessionStorage.setItem("prodImageList", JSON.stringify(table));
	}

	/* function setLike(id) {
	 alert("OKKK he")
	 $.getJSON(
	 '${setLikeOrDislike}',
	 {
	 prodId : id,
	 ajax : 'true'
	 },
	 function(data) {
	 //alert(JSON.stringify(data));
	 setLikeCount(data.statusText);
	 });
	 } */
	function setLandmark(landMark) {

		//document.getElementsByClassName("address_land").innerHTML=""+landMark;
	}
</script>
<script>
	function appendCartData() {
		 
		try{
		try {
			setLike(0);
		} catch (e) {
			console.log("in header jsp appendCartData()")
		}
		if (sessionStorage.getItem("allItemList") == null) {
			var table = [];
			sessionStorage.setItem("allItemList", JSON.stringify(table));
		}
	
		if (sessionStorage.getItem("cartValue") == null) {
			var table = [];
			sessionStorage.setItem("cartValue", JSON.stringify(table));
		}
		
		var mob='9885';
	    const dbrefObject = firebase.database().ref("cart_value/"+mob);
//alert("Firebase code un comment 406 to 437");
		 /*  if (sessionStorage.getItem("cartValue") == null) {
			var table = [];
		//	sessionStorage.setItem("cartValue", JSON.stringify(table));
		
			 //dbrefObject.on('value', snap => sessionStorage.setItem("cartValue",(JSON.stringify(snap.val()))));
			 alert("HHHH 406 cart value null");
			 dbrefObject
				.on(
						'value',
						function(snapshot) {
							console.log('Message received. ', snapshot.val());
							//alert(JSON.stringify(snapshot.val().mob));
							var c=JSON.stringify(snapshot.val().json_input);
							console.log('Message Data. ', c);
							 sessionStorage.setItem("cartValue",c);
							
						})
							//console.log('Message received. ', snapshot.val());
			 
			// var x="[{\"uniqueId\":1623913756795,\"orderDetailId\":0,\"orderId\":0,\"itemId\":30,\"hsnCode\":\"19059010\",\"qty\":1,\"mrp\":900,\"rate\":900,\"taxableAmt\":900,\"cgstPer\":9,\"sgstPer\":9,\"igstPer\":18,\"cgstAmt\":81,\"sgstAmt\":81,\"igstAmt\":162,\"discAmt\":0,\"taxAmt\":\"324.00\",\"totalAmt\":\"900.00\",\"delStatus\":1,\"remark\":\"\",\"exInt1\":18,\"exInt2\":14,\"exInt3\":79,\"exInt4\":8,\"exVar1\":\"Exotic Blackforest Square Cake\",\"exVar2\":\"\",\"exVar3\":\"1621073696073_6.jpg\",\"exVar4\":\"KGS\",\"exFloat1\":1,\"exFloat2\":1,\"exFloat3\":1,\"exFloat4\":1,\"weight\":\"1\",\"veg\":\"\",\"rateSettingType\":\"1\",\"flvName\":\"BLACK FOREST\",\"imgFile\":\"\",\"imgName\":\"\",\"spInst\":\"NA\",\"msgonCake\":\"NA\"},{\"uniqueId\":1623914157249,\"orderDetailId\":0,\"orderId\":0,\"itemId\":52,\"hsnCode\":\"19059010\",\"qty\":1,\"mrp\":900,\"rate\":900,\"taxableAmt\":900,\"cgstPer\":9,\"sgstPer\":9,\"igstPer\":18,\"cgstAmt\":81,\"sgstAmt\":81,\"igstAmt\":162,\"discAmt\":0,\"taxAmt\":\"324.00\",\"totalAmt\":\"900.00\",\"delStatus\":1,\"remark\":\"\",\"exInt1\":31,\"exInt2\":53,\"exInt3\":79,\"exInt4\":6,\"exVar1\":\"6 Princess With Castle Photo Cake\",\"exVar2\":\"\",\"exVar3\":\"1621515655542_81.jpg\",\"exVar4\":\"KGS\",\"exFloat1\":1,\"exFloat2\":1,\"exFloat3\":1,\"exFloat4\":1,\"weight\":\"1\",\"veg\":\"\",\"rateSettingType\":\"1\",\"flvName\":\"DESIGNER\",\"imgFile\":\"\",\"imgName\":\"\",\"spInst\":\"NA\",\"msgonCake\":\"NA\"},{\"uniqueId\":1623913802276,\"orderDetailId\":0,\"orderId\":0,\"itemId\":91,\"hsnCode\":\"19059010\",\"qty\":1,\"mrp\":900,\"rate\":900,\"taxableAmt\":900,\"cgstPer\":9,\"sgstPer\":9,\"igstPer\":18,\"cgstAmt\":81,\"sgstAmt\":81,\"igstAmt\":162,\"discAmt\":0,\"taxAmt\":\"324.00\",\"totalAmt\":\"900.00\",\"delStatus\":1,\"remark\":\"\",\"exInt1\":61,\"exInt2\":47,\"exInt3\":79,\"exInt4\":6,\"exVar1\":\"Motu Patlu Photo Cake\",\"exVar2\":\"\",\"exVar3\":\"1622539785982_72.jpg\",\"exVar4\":\"KGS\",\"exFloat1\":1,\"exFloat2\":1,\"exFloat3\":1,\"exFloat4\":1,\"weight\":\"1\",\"veg\":\"\",\"rateSettingType\":\"1\",\"flvName\":\"BLUEBERRY\",\"imgFile\":\"\",\"imgName\":\"\",\"spInst\":\"NA\",\"msgonCake\":\"NA\"}]";
			 //sessionStorage.setItem("cartValue",x);
			 alert("KK1")

		}else{
			alert("before write data"+sessionStorage.getItem("cartValue"));
			if(sessionStorage.getItem("cartValue")=="undefined"){
				var table = [];
					sessionStorage.setItem("cartValue", JSON.stringify(table));
			}else{
			 writeUserData(mob, sessionStorage.getItem("cartValue"));
			}			 
		}   */

		 
		var allItemList = sessionStorage.getItem("allItemList");
		var allItemArr = $.parseJSON(allItemList);
		
		//new code
		
		
		 /*  var fd = new FormData();
	fd.append("cartValue",sessionStorage.getItem("cartValue"));
			$.ajax({
				url : '${pageContext.request.contextPath}/sysncCartData',
				type : 'post',
				dataType : 'json',
				data : fd,
				contentType : false,
				processData : false,
				async: false,
				success : function(response) {
				if(sessionStorage.getItem("cartValue")===null){
					console.log("In IF",response)
				}else{
					console.log("In else",response)
					//sessionStorage.setItem("cartValue", JSON.stringify(response));
				}
				},
			});   */
		console.log("NC ",sessionStorage.getItem("cartValue"));
		//nc
					var cartValue = sessionStorage.getItem("cartValue");

			var table = $.parseJSON(cartValue);
			//setCookie('cart_ck', JSON.stringify(table), 30);
		$("#item_cart_list").html('');
		$("#proc_chkout").html('');
		$("#cart_item_count").html('');
		var subtotal = 0;
		var prodIdStr = "";
		var newCartVal = [];
		for (var j = 0; j < allItemArr.length; j++) {
			for (var i = 0; i < table.length; i++) {
				
				if (table[i].itemId == allItemArr[j].productId) {
					prodIdStr = prodIdStr + "," + allItemArr[j].productId;
					//alert(i);
					table[i].exVar3=allItemArr[j].prodImagePrimary;
					table[i].exVar4=allItemArr[j].uomShowName;
					subtotal = (parseFloat(subtotal) + parseFloat(table[i].totalAmt))
							.toFixed(2);

					var prodName = "";
					var qtyBox = "";

					if (table[i].rateSettingType == 0) {
						prodName = table[i].exVar1;
						qtyBox = '<div class="like_quant">'
								+ '<span>Qty.</span>'
								+ '<form id="myform" method="POST" action="#">'
								+ '<input type="button" value="-" onclick="setQty('
								+ table[i].itemId
								+ ','
								+ i
								+ ','
								+ table[i].qty
								+ ',0)" class="qtyminus"'
								+ 'field="quantity"/><input type="text" readonly   id="prod_quantity'+table[i].itemId+'" name="prod_quantity'+table[i].itemId+'"'+
		'value="'+table[i].qty+'" class="qty" /> <input type="button" onclick="setQty('
								+ table[i].itemId + ',' + i + ','
								+ table[i].qty + ',1)" value="+"'
								+ 'class="qtyplus" field="quantity"/> '
								+ '</form>  ' + '</div>';
					} else {

						if (table[i].exInt2 != 0
								|| table[i].flvName == "undefined"
								|| table[i].flvName == ""
								|| table[i].flvName == "NA") {
							prodName = table[i].exVar1 + " Flavour - "
									+ table[i].flvName + " Weight - "
									+ table[i].weight;

						} else {
							prodName = table[i].exVar1 + " Weight - "
									+ table[i].weight;

						}

					}

					$("#item_cart_list")
							.append(
									'<div class="like_one">  <a href="javascript:void(0)" onclick="deleteItemFromCart('
											+ table[i].uniqueId
											+ ')"><i class="fa fa-trash-o" aria-hidden="true"></i></a> '
											+ '<div class="like_pic">'
											+ '<img src="${prodImgUrl}'+allItemArr[j].prodImagePrimary+'" class="lazy"'+
				'data-src="${prodImgUrl}'+allItemArr[j].prodImagePrimary+'"'+
				'alt="">'
											+ '</div>'
											+ '<div class="like_cont">'
											+ '<h4 class="like_cake_nm">'
											+ prodName
											+ '</h4>'
											+ '<p class="like_prc">Rs.'
											+ table[i].totalAmt
											+ '</p>'
											+ qtyBox
											+ '</div>'
											+ '<div class="clr"></div>'
											+ '</div>')
											newCartVal.push(table[i]);
				}//IF
				
			}//End of For loop 2
		}//End of loop 1
		sessionStorage.setItem("cartValue", JSON.stringify(newCartVal));

		document.getElementById("cart_item_count").innerHTML = ""
				+ table.length;
		$("#proc_chkout")
				.append(
						'<div class="proc_chkout">'
								+ '<span>Total : Rs.'
								+ subtotal
								+ '/- </span> <a href="${pageContext.request.contextPath}/checkout/'+prodIdStr+'">Proceed '
								+ ' to Checkout</a>' + '</div>')
		} catch (e) {
	//	alert("Err" +e)
		} 
	}
	function writeUserData(mob, inputJson) {
		/* alert("A")
		  firebase.database().ref('table_value/'+mob).set({
			 mob:mob
		    json_input: inputJson,
		  });
		 */
		
		var data_add = {
				"mob" : mob,
				"json_input" : inputJson,
			}
		
		var key = firebase.database().ref().child('cart_value/'+mob).add(data_add).key;
		//alert("B")
		}
	function setQty(productId, position, curQty, buttonType) {
		//setQty('+table[i].itemId+','+i+','+table[i].qty+',0)"
		//prod_quantity+productId;
var maxValue=document.getElementById("maxValue").value;

		var ischanged = 0;
		if (parseInt(buttonType) == 0 && parseInt(curQty) > 1&&parseInt(curQty)<=parseInt(maxValue)) {
			//Its Minus call;
			//alert("If")
			curQty = parseInt(curQty) - 1;
			ischanged = 1;
		} else if (parseInt(buttonType) == 1 &&parseInt(curQty)<parseInt(maxValue)) {
			//Its Plus;
			//alert("Else")
			curQty = parseInt(curQty) + 1;
			ischanged = 1;
		}

		if (parseInt(ischanged) == 1) {

			if (sessionStorage.getItem("cartValue") == null) {
				var table = [];
				sessionStorage.setItem("cartValue", JSON.stringify(table));
			}

			var cartValue = sessionStorage.getItem("cartValue");
			var table = $.parseJSON(cartValue);

			table[position].qty = curQty;

			var qty = parseFloat(curQty);

			//alert(table[position].rate)

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
			setCartData();
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
		$
				.ajax({
					url : '${pageContext.request.contextPath}/getAllFrWiseData',
					type : 'post',
					dataType : 'json',
					data : fd,
					contentType : false,
					processData : false,
					async:false,
					success : function(response) {
						//document.getElementById("loaderimg").style.display = "none";
						//alert(JSON.stringify(response.feProductHeadList))
						sessionStorage.setItem("allItemList", JSON
								.stringify(response.feProductHeadList));

						if (response.feProductHeadList.length > 0) {

							var arr = [];

							for (var i = 0; i < response.feProductHeadList.length; i++) {

								//arr.push(response.feProductHeadList[i].productName);
								//arr.push(response.feProductHeadList[i].shortName);
								arr
										.push(response.feProductHeadList[i].flavorNames);
								arr
										.push(response.feProductHeadList[i].ingerdiants);
								arr
										.push(response.feProductHeadList[i].appliTagNames);
								arr
										.push(response.feProductHeadList[i].layeringCreamNames);
								arr
										.push(response.feProductHeadList[i].prodStatusName);

							}

							//alert(arr);

							//var a = [ 'a', 'a', '1' ];
							var unique = arr.filter(onlyUnique);
							//alert(unique)
							$('#glbTemplates').find('option').remove().end()

							for (var i = 0; i < unique.length; i++) {
								var flag = 0;
								$("#glbTemplates").append(
										$("<option></option>").attr("value",
												unique[i]).text(unique[i]));
							}
							$("#glbTemplates").trigger("chosen:updated");

						}

						appendCartData();

					},
				});

	}

	function onlyUnique(value, index, self) {
		return self.indexOf(value) === index;
	}
	
	function openNav() {
		appendCartData();
		document.getElementById("mySidepanel").style.width = "300px";
		setTimeout(function() {
			closeNav();
		}, 10000);
	}

	function closeNav() {
		document.getElementById("mySidepanel").style.width = "0";
	}

	function globalSearch(catId) {

		//alert(document.getElementById("glbSearch").value);

		sessionStorage.setItem("menuFilterName", document
				.getElementById("glbSearch").value);

		sessionStorage.setItem("priceFilterMin", "0");
		sessionStorage.setItem("priceFilterMax", "0");

		sessionStorage.setItem("findCatId", catId);

		var table = [];
		sessionStorage.setItem("selTags", JSON.stringify(table));
		sessionStorage.setItem("selTags_SAC", document
				.getElementById("glbSearch").value);

		window.open('${pageContext.request.contextPath}/products/0', '_self');

	}
	function getCookie(cname) {
		var name = cname + "=";
		var decodedCookie = decodeURIComponent(document.cookie);
		var ca = decodedCookie.split(';');
		for (var i = 0; i < ca.length; i++) {
			var c = ca[i];
			while (c.charAt(0) == ' ') {
				c = c.substring(1);
			}
			if (c.indexOf(name) == 0) {
				//alert(c.substring(name.length, c.length))
				return c.substring(name.length, c.length);
			}
		}
		return "";
	}

	function deleteItemFromCart(uniqueId) {

		if (sessionStorage.getItem("cartValue") == null) {
			var table = [];
			sessionStorage.setItem("cartValue", JSON.stringify(table));
		}

		var cartValue = sessionStorage.getItem("cartValue");
		var table = $.parseJSON(cartValue);

		var newCartVal = [];

		for (var i = 0; i < table.length; i++) {
			if (uniqueId != table[i].uniqueId) {
				newCartVal.push(table[i]);
			}
		}

		sessionStorage.setItem("cartValue", JSON.stringify(newCartVal));

		appendCartData();
		setCartData();
	}

	function search(ele) {
		if (event.key === 'Enter') {
			alert(ele.value);
		}
	}
	function setLikeCount(statusText) {
		//alert("OK H")
		var data1 = JSON.parse(statusText);
		var likeCount = 0;
		$.each(data1.feProductHeadList, function(key, product) {
			if (product.isLike == 1) {
				likeCount = likeCount + 1;
			}
		});
		$('#like_item_count').html('' + likeCount);
	}
	
	//$("input.myClass:checkbox")
document.addEventListener("DOMContentLoaded", function() {
			  var lazyBackgrounds = [].slice.call(document.querySelectorAll(".mobile_fit"));

			  if ("IntersectionObserver" in window) {
				 
			    let lazyBackgroundObserver = new IntersectionObserver(function(entries, observer) {
			      entries.forEach(function(entry) {
			        if (entry.isIntersecting) {
			          entry.target.classList.add("visible");
			          lazyBackgroundObserver.unobserve(entry.target);
			        }
			      });
			    });

			    lazyBackgrounds.forEach(function(lazyBackground) {
			      lazyBackgroundObserver.observe(lazyBackground);
			    });
			  }
			});
	
	
//Set a Cookie
function setCookie(cName, cValue, expDays) {
     let date = new Date();
     date.setTime(date.getTime() + (expDays * 24 * 60 * 60 * 1000));
     const expires = "expires=" + date.toUTCString();
     document.cookie = cName + "=" + cValue + "; " + expires + "; path=/";
}

//Apply setCookie
	
 
</script>


