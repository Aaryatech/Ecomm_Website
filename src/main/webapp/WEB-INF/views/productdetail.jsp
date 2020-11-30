<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<jsp:include page="/WEB-INF/views/include/metacssjs.jsp"></jsp:include>


<body>


	<div class="mongi_help">
		<a href="#mongi" class="initialism mongi_open"><img
			src="${pageContext.request.contextPath}/resources/images/mongi_help.png"
			alt=""></a>
	</div>

	<!--apply now pop up-->
	<div id="mongi" class="well">
		<div class="mongi_title">
			<span><a href="#"> Clear</a></span> Select Our Best Filter
			<div class="mongi_close close_pop">
				<i class="fa fa-times" aria-hidden="true"></i>
			</div>
		</div>
		<div class="mongi_cont">
			<ul class="ks-cboxtags">
				<li><input type="checkbox" id="checkboxOne"><label
					for="checkboxOne">Chocolate Cakes</label></li>
				<li><input type="checkbox" id="checkboxtwo"><label
					for="checkboxtwo">Exotic Cakes</label></li>
				<li><input type="checkbox" id="checkboxthree"><label
					for="checkboxthree">Black Forest Cakes</label></li>
				<li><input type="checkbox" id="checkboxfour"><label
					for="checkboxfour">Designer Cakes</label></li>
				<li><input type="checkbox" id="checkboxfive"><label
					for="checkboxfive">Derpy Hooves</label></li>
				<li><input type="checkbox" id="checkboxsix"><label
					for="checkboxsix">Party Celebration Cakes</label></li>
				<li><input type="checkbox" id="checkboxseven"><label
					for="checkboxseven">Wedding Cakes</label></li>
				<li><input type="checkbox" id="checkboxeight"><label
					for="checkboxeight">Photo Cakes</label></li>
				<li><input type="checkbox" id="checkboxnine"><label
					for="checkboxnine">Cakes For Kids</label></li>
				<li><input type="checkbox" id="checkboxten"><label
					for="checkboxten">Medley</label></li>
				<li><input type="checkbox" id="checkboxeleven"><label
					for="checkboxeleven">Party Celebration Cakes</label></li>

				<li><input type="checkbox" id="checkboxtwel"><label
					for="checkboxtwel">Pizza</label></li>
				<li><input type="checkbox" id="checkboxthirteen" checked><label
					for="checkboxthirteen">Sandwich</label></li>
				<li><input type="checkbox" id="checkboxfourteen"><label
					for="checkboxfourteen">Fish</label></li>
				<li><input type="checkbox" id="checkboxfifteen"><label
					for="checkboxfifteen">Desert</label></li>
				<li><input type="checkbox" id="checkboxsixteen"><label
					for="checkboxsixteen">Salad</label></li>
				<li><input type="checkbox" id="checkboxseventeen"><label
					for="checkboxseventeen">Italian</label></li>
				<li><input type="checkbox" id="checkboxeighteen"><label
					for="checkboxeighteen">Indian</label></li>
				<li><input type="checkbox" id="checkboxninteen"><label
					for="checkboxninteen">Derpy Hooves</label></li>
				<li><input type="checkbox" id="checkboxtwenteen"><label
					for="checkboxtwenteen">Princess Celestia</label></li>
				<li><input type="checkbox" id="checkboxtwenone"><label
					for="checkboxtwenone">Gusty</label></li>
				<li><input type="checkbox" id="checkboxtwentwo"><label
					for="checkboxtwentwo">Discord</label></li>
				<li><input type="checkbox" id="checkboxtewnthree"><label
					for="checkboxtewnthree">Clover</label></li>
				<li><input type="checkbox" id="checkboxTwenfour"><label
					for="checkboxTwenfour">Baby Moondancer</label></li>
				<li><input type="checkbox" id="checkboxtwenfive"><label
					for="checkboxtwenfive">Medley</label></li>
				<li><input type="checkbox" id="checkboxtwensix"><label
					for="checkboxtwensix">Firefly</label></li>
				<li><input type="checkbox" id="checkboxtwenseven"><label
					for="checkboxtwenseven">Princess Celestia</label></li>
				<li><input type="checkbox" id="checkboxtweneight"><label
					for="checkboxtweneight">Gusty</label></li>
				<li><input type="checkbox" id="checkboxtwennine"><label
					for="checkboxtwennine">Discord</label></li>
				<li><input type="checkbox" id="checkboxthirtee"><label
					for="checkboxthirtee">Clover</label></li>
				<li><input type="checkbox" id="checkboxthirteeone"><label
					for="checkboxthirteeone">Baby Moondancer</label></li>
			</ul>



		</div>

		<div class="proceend_bnt">
			<a href="product.html" class="proceed_btn">Proceed</a>
		</div>

	</div>
	<script type="text/javascript">
		$(document).ready(function() {
			$('#mongi').popup();
		});
	</script>


	<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>

	<div class="head_marg">

		<!--product listing-->
		<div class="find_store with_bread">
			<div class="wrapper">

				<div class="breadcrums">
					<a href="#">Home</a> <i class="fa fa-angle-right"
						aria-hidden="true"></i> <a href="#">${prodHeader.subCatName}</a> <i
						class="fa fa-angle-right" aria-hidden="true"></i>${prodHeader.productName}

				</div>

				<div class="detail_row">
					<div class="detail_l">
						<div class="detail_slide">
							<!-- <div id="el"></div> -->

							<div class="xzoom-container">
								<img class="xzoom" id="xzoom-default"
									src="${prodImgUrl}${prodHeader.prodImagePrimary}"
									xoriginal="${prodImgUrl}${prodHeader.prodImagePrimary}" />
								<div class="mobile_Scrl">
									<div class="xzoom-thumbs">
										<a href="${prodImgUrl}${prodHeader.prodImagePrimary}"><img
											class="xzoom-gallery" width="80"
											src="${prodImgUrl}${prodHeader.prodImagePrimary}"
											xpreview="${prodImgUrl}${prodHeader.prodImagePrimary}"
											title="${prodHeader.productDesc}"></a>
										<c:forEach items="${prodHeader.productImages}"
											var="prod_image">
											<a href="${prodImgUrl}${prod_image}"><img
												class="xzoom-gallery" width="80"
												src="${prodImgUrl}${prod_image}"
												title="${prodHeader.productDesc}"></a>
										</c:forEach>
									</div>
								</div>
							</div>


						</div>
					</div>
					<div class="detail_r">
						<div class="detail_content">
							<!--product name row-->
							<div class="stock_row">
								<div class="stock_l">
									<h2 class="product_nm">
										<span>In Stock</span>${prodHeader.productName}
									</h2>
									<div class="stock_review">
										4.8 <img
											src="${pageContext.request.contextPath}/resources/images/review_star.png"
											alt=""> <span>32 Review</span>
									</div>
								</div>
								<div class="stock_r">
									<img
										src="${pageContext.request.contextPath}/resources/images/protection.png"
										alt="">
								</div>
								<div class="clr"></div>
							</div>
							<!--product price row-->
							<div class="stock_prc">
								<i class="fa fa-inr cake_prc_detail_iclass"
															aria-hidden="true"></i>
														<p class="cake_prc_detail_pclass"
															id="cake_prc1">${prodHeader.defaultPrice}</p>
														<span class="off_prc" id="off_prc1"></span> <span
															id="prc_off1" class="prc_off"></span>
							</div>
							<!--product txt row-->
							<div class="prod_txt">${prodHeader.productDesc}. Key
								attributes :</div>
			<div class="detail_drop">

							<ul>
								<!-- <li><i class="fa fa-circle" aria-hidden="true"></i> Shape :
									Round</li>
								<li><i class="fa fa-circle" aria-hidden="true"></i>
									Flavours : Black Forest</li>
								<li><i class="fa fa-circle" aria-hidden="true"></i> Weight
									: 0.5 kg</li> -->
<c:if test="${prodHeader.defaultShapeId!=0}">
								<li>Shape<select class="select-css" id="shape" name="shape" 
								onchange="changeWtFlavor('${prodHeader.productId}')" >
										<c:forEach items="${prodHeader.shapeId}" var="prodDetail">
											<c:forEach items="${flavTagStatusList}" var="flavorFilter"
												varStatus="flavorFilterCount">

												<c:if test="${flavorFilter.filterTypeId==1}">

													<c:choose>
														<c:when test="${prodDetail==flavorFilter.filterId}">
															<c:choose>
																<c:when test="${prodDetail==prodHeader.defaultShapeId}">
																	<option value="${prodDetail}" selected>${flavorFilter.adminName}</option>
																</c:when>
																<c:otherwise>
																	<option value="${prodDetail}">${flavorFilter.adminName}</option>
																</c:otherwise>
															</c:choose>
														</c:when>
														<c:otherwise>

														</c:otherwise>
													</c:choose>
												</c:if>
											</c:forEach>
										</c:forEach>

										
								</select></li></c:if>
<c:if test="${prodHeader.defaultFlavorId!=0}">

								<li>Flavor<select class="select-css" name="flavor" id="flavor" 
								onchange="changeWtFlavor('${prodHeader.productId}')" >
									<c:forEach items="${prodHeader.flavourIds}" var="prodDetail">
											<c:forEach items="${flavTagStatusList}" var="flavorFilter"
												varStatus="flavorFilterCount">

												<c:if test="${flavorFilter.filterTypeId==4}">

													<c:choose>
														<c:when test="${prodDetail==flavorFilter.filterId}">
															<c:choose>
																<c:when test="${prodDetail==prodHeader.defaultFlavorId}">
																	<option value="${prodDetail}" selected>${flavorFilter.adminName}</option>
																</c:when>
																<c:otherwise>
																	<option value="${prodDetail}">${flavorFilter.adminName}</option>
																</c:otherwise>
															</c:choose>
														</c:when>
														<c:otherwise>

														</c:otherwise>
													</c:choose>
												</c:if>
											</c:forEach>
										</c:forEach>
								</select></li></c:if>

								<li>Weight<select class="select-css" id="weight" onchange="changeWtFlavor('${prodHeader.productId}')">
											<c:forEach items="${prodHeader.availInWeights}"
											 var="prodDetailwt">
											<option value="${prodDetailwt}">${prodDetailwt}</option>
											</c:forEach>
								</select></li>

							</ul>
</div>
							<div class="delivery_row">
								<div class="delivery_l">
									<div class="a">
										<h4 class="highlight_title">Product Highlights :</h4>
										<ul class="highlist_list">
										<c:if test="${prodHeader.defaultFlavorId!=0}">
											<li><i class="fa fa-circle" aria-hidden="true"></i> Cake
												Flavour: ${prodHeader.flavorNames}</li></c:if>
												<c:if test="${prodHeader.prodTypeId!=0}">
											<li><i class="fa fa-circle" aria-hidden="true"></i> Type
												of Cake: ${prodHeader.prodTypeName}</li></c:if>
											<c:if test="${prodHeader.typeOfBread!=0}"><li><i class="fa fa-circle" aria-hidden="true"></i> Type
												of Bread: ${prodHeader.breadTypeName}</li></c:if>
										</ul>
										<a href="#" onclick="moveCursor()" class="more_highlight">Read More</a>
									</div>

									<!--eagless or with eeg row-->
									<div class="eagless_row">
										<ul>
										
										<c:set var="isVegFound" value="0"></c:set>
																<c:set var="isNonVegFound" value="0"></c:set>
																<c:forEach items="${prodHeader.isVeg}"
																	var="prodDetailVegNon">


																	<c:forEach items="${flavTagStatusList}"
																		var="vegNonFilter" varStatus="flavorFilterCount">
																		<c:if test="${vegNonFilter.filterTypeId==12}">
																			<c:if
																				test="${vegNonFilter.filterId==prodDetailVegNon}">
																				<c:if test="${vegNonFilter.adminName eq 'Veg'}">
																					<c:set var="isVegFound" value="1"></c:set>
																				</c:if>

																				<c:if test="${vegNonFilter.adminName eq 'NonVeg'}">
																					<c:set var="isNonVegFound" value="1"></c:set>
																				</c:if>
																			</c:if>
																		</c:if>
																	</c:forEach>

																</c:forEach>
																
											<c:if test="${isVegFound==1}">
											<li><label class="radio-button"> <input
													type="radio" id="v_radio" value="0" name="vnv_radio"> <span
													class="label-visible"> <span
														class="fake-radiobutton"></span> Veg
												</span>
											</label></li>
											</c:if>
											<c:if test="${isNonVegFound==1}">
											<li><label class="radio-button"> <input
													type="radio" value="1" id="nv_radio" name="vnv_radio"> <span
													class="label-visible"> <span
														class="fake-radiobutton"></span>Non Veg
												</span>
											</label></li>
											</c:if>
										</ul> 
										<div class="clr"></div>
									</div>
									<!--cake-kgs-->
								</div>
								<!--right form-->
								<c:if test="${prodHeader.allowSpecialInstruction==1 or prodHeader.allowBasePhotoUpload==1}">
								<div class="delivery_r">
									<div class="delivery_bx">
										<h4 class="delivery_title">Delivery Details</h4>
										<div class="delivery_frm">
											<form action="" method="post">
											<c:if test="${prodHeader.allowBasePhotoUpload==1}">
												<div class="delivery_frm_l">
													<img
														alt="" id="del_image" style="size: portrait;" name="del_image"/>
													<div class="inputbrowsebtn">
														<label for="img_input_btn"> <span class="fg">Upload
																Image </span> <input type="file" accept="image/*" name="img_input_btn" id="img_input_btn" 
												accept=".jpg,.png,.gif,.jpeg,.bmp" onchange="loadFile(event)">
														</label>
													</div>
												</div>
												</c:if>
											<c:if test="${prodHeader.allowSpecialInstruction==1}">
												<div class="delivery_frm_r">
													<div class="delivery_txtarea">
														<textarea name="" cols="" id="sp_inst", name="sp_inst" rows="3" class="input_txt"
															placeholder="Special Instructon"></textarea>
													</div>
													<div class="a">
														<input name="" type="text" id="msg_on_cake" name="msg_on_cake" class="input_txt"
															placeholder="Message / Name on the Cake" />
													</div>
												</div>
												</c:if>
												<div class="clr"></div>
											</form>
										</div>
									</div>
								</div>
								</c:if>
								<div class="clr"></div>
							</div>

							<div class="button_row">
								<a href="#" class="cart_button" onclick="addToCartClick(${prodHeader.productId})">Add To Cart</a> <a
									href="${pageContext.request.contextPath}/viewcart" class="buy_button">Buy Now</a>
								<div class="clr"></div>
							</div>

							<!--mobile-buttons-->
							<div class="mobile_button">
								<a href="#" class="mobile_cart" onclick="addToCartClick('${prodHeader.productId}')">Add To Cart</a> <a
									href="${pageContext.request.contextPath}/viewcart" class="mobile_buy">Buy Now</a>
							</div>
						</div>
					</div>
					<div class="clr"></div>
				</div>

				<!--product-discription-->
				<div class="prod_disc" id="prod_disc">
					<h3 class="prod_title">Product Description:</h3>
					<div class="prod_listing">
						<div class="prod_listing_one">
							<h4 class="highlight_title">Highlights :</h4>
							<ul class="highlist_list">
								
								<c:if test="${prodHeader.defaultFlavorId!=0}"><li><i class="fa fa-circle" aria-hidden="true"></i> Cake
									Flavor: ${prodHeader.flavorNames}</li></c:if>
								<c:if test="${prodHeader.prodTypeId!=0}"><li><i class="fa fa-circle" aria-hidden="true"></i> Type of
									Cake: ${prodHeader.prodTypeName}</li></c:if>
								<c:if test="${prodHeader.typeOfBread!=0}"><li><i class="fa fa-circle" aria-hidden="true"></i> Type of
									Bread: ${prodHeader.breadTypeName}</li></c:if>
								<c:if test="${prodHeader.typeOfCream!=0}"><li><i class="fa fa-circle" aria-hidden="true"></i> Type of
									cream: ${prodHeader.creamTypeName}</li></c:if>
								<c:if test="${prodHeader.layeringCream!=0}"><li><i class="fa fa-circle" aria-hidden="true"></i> Filling
									in Layers: ${prodHeader.layeringCreamNames}</li></c:if>
								<c:if test="${prodHeader.toppingCream!=0}"><li><i class="fa fa-circle" aria-hidden="true"></i>
									Toppings: ${prodHeader.toppingCreamNames}</li></c:if>
							</ul>
						</div>

						<div class="prod_listing_one extra_width">
							<div class="divide_two">
								<h4 class="highlight_title">Delivery Details :</h4>
								<ul class="highlist_list">
									<li><i class="fa fa-circle" aria-hidden="true"></i> The
										delicious cake is hand-delivered by our delivery boy in a good
										quality cardboard box.</li>
									<li><i class="fa fa-circle" aria-hidden="true"></i> Candle
										and knife will be delivered as per the availability</li>
								</ul>
							</div>

							<div class="divide_two marg_none">
								<h4 class="highlight_title">Care Instructions :</h4>
								<ul class="highlist_list">
									<li><i class="fa fa-circle" aria-hidden="true"></i> Store
										cake in a refrigerator.</li>
									<li><i class="fa fa-circle" aria-hidden="true"></i>
										Consume the cake within 24 hours</li>
								</ul>
							</div>
						</div>
					</div>
				</div>

				<div class="product_boxes">
					<h2 class="sec_title">
						<center>
							Shop by Best Seller Categories <span>3 Hour Delivery &amp;
								Free Shipping in India</span>
						</center>
					</h2>

					<ul>
						<!--product-row-1-->
						<c:forEach items="${prodHeaderList}" var="product"
									varStatus="prodCount">
						<li>
							<div class="cake_one product_padd">
								<div class="cake_pic">
									<img
										src="${prodImgUrl}${product.prodImagePrimary}"
										alt="" class="mobile_fit transition">
									<div class="circle_tag">
										<img
											src="${pageContext.request.contextPath}/resources/images/heart-1.svg"
											alt=""> <img
											src="${pageContext.request.contextPath}/resources/images/heart.svg"
											alt="">
									</div>
									<div class="cake_prc">
														<i class="fa fa-inr cake_prc_detail_iclass" aria-hidden="true"></i><p class="cake_prc_detail_pclass" id="cake_prc" >xx${product.defaultPrice}</p>
														<span class="off_prc" id="off_prc"><i class="fa fa-inr"
															aria-hidden="true"></i></span> <span
															class="prc_off" id="prc_off"></span>
									</div>
								</div>

								<div class="cake_container">
									<h4 class="cake_nm single_row">
										<a href="${pageContext.request.contextPath}/showProdDetail/${prodCount.index}">${product.productName}</a>
									</h4>
								</div>
							</div>
						</li>
						</c:forEach>
					</ul>
					<div class="more_product">
						<a href="#">Load More Products</a>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!--testimonial-box-->
	<div class="testimonial_bx">
		<h2 class="sec_title">
			<center>
				Our Testimonials <span>Customer Reviews regarding to our Shop</span>
			</center>
		</h2>

		<div class="wrapper">
			<section class="regular slider">
				<div>
					<div class="testimonial_one">
						<i class="fa fa-quote-left" aria-hidden="true"></i>
						<p class="testimoial_txt">There are many variations of
							passages of Lorem Ipsum available, but the majority have suffered
							alteration in some form, by injected humour, or randomised words
							which dont look even slightly believable. If you are going to use
							a passage of Lorem Ipsum, you need to be sure there isn't
							anything embarrassing hidden.</p>

						<div class="testimonial_nm">
							<img
								src="${pageContext.request.contextPath}/resources/images/testimonial_pic.jpg"
								alt="">
							<h2 class="testimonial_date">
								Sumit Mahshalkar <span>Date : 17-09-2020</span> <span>Location:
									Nashik</span>
							</h2>
						</div>
					</div>
				</div>
			</section>
		</div>

	</div>





	<!-- bottom -->
	<jsp:include page="/WEB-INF/views/include/bottomMenu.jsp"></jsp:include>

<script type="text/javascript">

function addToCartClick(productId){
	//alert("In addToCartClick " +productId);
	
	var selectWt = document.getElementById("weight").value;
	var selectFlav=0;
	try{
		selectFlav = document.getElementById("flavor").value;
	}catch (e) {
		selectFlav=0;
	}
	if(selectFlav==""||isNaN(selectFlav)||selectFlav==null){
		selectFlav=0;
	}
	//Shape
	
	var selectShape=0;
	try{
		selectShape = document.getElementById("shape").value;
	}catch (e) {
		selectShape=0;
	}
	
	//End of Shape
	
	var isVeg=$('input[name="vnv_radio"]:checked').val();
	var dataList='${sessionScope.dataList}';
	var data=$.parseJSON(dataList);
	var selectVegNon="Veg";

	var prodHead=data.feProductHeadList;
	var prodMaster;
	for(var h=0;h<prodHead.length;h++){
		if(parseInt(productId)==parseInt(prodHead[h].productId)){
			prodMaster=prodHead[h];
				if (typeof(isVeg) == "undefined"){
					selectVegNon=prodMaster.defaultVegNonvegName;
				}else if(parseInt(isVeg)==1){
					selectVegNon="NonVeg";
				}else{
					selectVegNon="Veg";
				}
			break;
		}
	}//end of prodHead For H
	if(selectShape==""||isNaN(selectShape)||selectShape==null){
		selectShape=0;
		selectShape=prodMaster.defaultShapeId;
	}

	var prodDetail=prodMaster.prodDetailList;
	for(var d=0;d<prodDetail.length;d++){
		
		if(parseInt(selectShape)==parseInt(prodDetail[d].shapeId)){
			if(parseInt(prodDetail[d].flavorId)==parseInt(selectFlav)){
				if(prodDetail[d].vegNonvegName==selectVegNon){
					//Calc Price;
					if(parseFloat(selectWt)==parseFloat(prodDetail[d].qty)){
					//alert(prodDetail[d].configDetailId);
					var qty=1;
					//document.getElementById("cake_price").innerHTML = ""+prodDetail[d].actualRate;
					document.getElementById("cake_prc").innerHTML=""+prodDetail[d].actualRate;
					document.getElementById("cake_prc1").innerHTML=""+prodDetail[d].actualRate;
					actualRate=prodDetail[d].actualRate;
					var priceDiff=parseFloat(prodDetail[d].displayRate)-parseFloat(actualRate);
					offPer=(parseFloat(priceDiff)/parseFloat(prodDetail[d].displayRate)*100);
					
					taxableAmt=actualRate;
					
					cgstAmt=(parseFloat(actualRate)*parseFloat(prodMaster.cgstPer))/100;
					sgstAmt=(parseFloat(actualRate)*parseFloat(prodMaster.sgstPer))/100;
					igstAmt=(parseFloat(actualRate)*parseFloat(prodMaster.igstPer))/100;
					
					taxAmt=(cgstAmt+sgstAmt+igstAmt).toFixed(2);
					totalAmt=(parseFloat(taxableAmt)).toFixed(2);
					
					if (sessionStorage.getItem("cartValue") == null) {
						var table = [];
						sessionStorage.setItem("cartValue", JSON.stringify(table));
					}
					
					var cartValue = sessionStorage.getItem("cartValue");
					var table = $.parseJSON(cartValue);
					
					table.push({
						orderDetailId: 0,
						orderId: 0,
						itemId: prodMaster.productId,
						hsnCode:prodMaster.hsnCode,
						qty: 1,
						mrp : prodDetail[d].displayRate,
						rate :prodDetail[d].actualRate,
						taxableAmt : taxableAmt,
						cgstPer : prodMaster.cgstPer,
						sgstPer: prodMaster.sgstPer,
						igstPer : prodMaster.igstPer ,
						cgstAmt: cgstAmt,
						sgstAmt: sgstAmt,
						igstAmt: igstAmt,
						discAmt: 0,
						taxAmt: taxAmt,
						totalAmt :totalAmt ,
						delStatus :1 ,
						remark : 'no remark',
						exInt1 : prodDetail[d].configDetailId ,
						exInt2 : prodDetail[d].flavorId,
						exInt3 : prodDetail[d].isVeg,
						exInt4 : prodDetail[d].shapeId,
						exVar1 : prodMaster.productName ,
						exVar2 : 1,
						exVar3 : 1,
						exVar4 : 1,
						exFloat1 :1 ,
						exFloat2 :1 ,
						exFloat3: 1,
						exFloat4 :1 ,
					});
					sessionStorage.setItem("cartValue", JSON.stringify(table));
				appendCartData();
				
					break;
					}
					//alert("Do calc");
				}else{
					continue;
				}
			}else{
				continue;
			}
		}else{
			continue;
		}
		
	}//end of For prodDetailList pd

	}//end of Function addToCartClick
	
	</script>
	<script type="text/javascript">
	function changeWtFlavor(productId) {
		var selectWt = document.getElementById("weight").value;
		var selectFlav = 0;
		try {
			selectFlav = document.getElementById("flavor").value;
		} catch (e) {
			selectFlav = 0;
		}
		if (selectFlav == "" || isNaN(selectFlav) || selectFlav == null) {
			selectFlav = 0;
		}
		
		//Shape
		
		var selectShape=0;
		try{
			selectShape = document.getElementById("shape").value;
		}catch (e) {
			selectShape=0;
		}
		
		//End of Shape
		
		var isVeg=$('input[name="vnv_radio"]:checked').val();
		
		var dataList = '${sessionScope.dataList}';
		var data = $.parseJSON(dataList);
		var selectVegNon = "Veg";
		var prodHead = data.feProductHeadList;
		var prodMaster;
		for (var h = 0; h < prodHead.length; h++) {
			if (parseInt(productId) == parseInt(prodHead[h].productId)) {
				prodMaster = prodHead[h];
				if (typeof (isVeg) == "undefined") {
					selectVegNon = prodMaster.defaultVegNonvegName;
				} else if (parseInt(isVeg) == 1) {
					selectVegNon = "NonVeg";
				} else {
					selectVegNon = "Veg";
				}
				break;
			}
		}//end of prodHead For H
		var prodDetail = prodMaster.prodDetailList;
		for (var d = 0; d < prodDetail.length; d++) {
			if (parseInt(prodMaster.defaultShapeId) == parseInt(prodDetail[d].shapeId)) {
				if (parseInt(prodDetail[d].flavorId) == parseInt(selectFlav)) {
					if (prodDetail[d].vegNonvegName == selectVegNon) {
						//Calc Price;
						if (parseFloat(selectWt) == parseFloat(prodDetail[d].qty)) {

							var qty = 1;
						document.getElementById("cake_prc").innerHTML=""+prodDetail[d].actualRate;
						document.getElementById("cake_prc1").innerHTML=""+prodDetail[d].actualRate;
					//alert("" +prodDetail[d].actualRate);
						var actualRate = prodDetail[d].actualRate;
							var priceDiff = parseFloat(prodDetail[d].displayRate) - parseFloat(actualRate);
							var offPer = (parseFloat(priceDiff) / parseFloat(prodDetail[d].displayRate) * 100);
							
							
							document.getElementById('off_prc').innerHTML = "<i class='fa fa-inr' aria-hidden='true'>"+priceDiff.toFixed(2)+"</i>";
							document.getElementById("prc_off").innerHTML = ""+offPer.toFixed(2);
							
							document.getElementById('off_prc1').innerHTML = "<i class='fa fa-inr' aria-hidden='true'>"+priceDiff.toFixed(2)+"</i>";
							document.getElementById("prc_off1").innerHTML = ""+offPer.toFixed(2);
						
							break;
						}
						//alert("Do calc");
					} else {
						continue;
					}
				} else {
					continue;
				}
			} else {
				continue;
			}
		}//end of For prodDetailList pd

	}//end of Function changeWtFlavor
</script>
<script>
function moveCursor(){
	$('html,body').animate({
	        scrollTop: $(".prod_disc").offset().top},
	        'slow'); 
		//var elmnt = document.getElementById("prod_disc");
	  //elmnt.scrollIntoView();
}
	var loadFile = function(event) {
	 document.getElementById('del_image').style.display="none";
	 try {
		var image = document.getElementById('del_image');
		image.src = URL.createObjectURL(event.target.files[0]);
		document.getElementById('del_image').style="display:block"
			//postFilesData(event.target.files[0]);
			postFilesData();
	 } catch(err) {
		 console.log(err);
		}
	};
	
	function postFilesData()
	{
		var file = $('#img_input_btn')[0].files[0];
		//alert("after file1 " +file.size);
		var fd = new FormData();
		fd.append('data', file);
	 $.ajax({
        url: '${pageContext.request.contextPath}/uploadImg',
        type: 'POST',
        data: fd,
        dataType: 'json',
        processData: false, 
        contentType: false, 
        success: function(resData, textStatus, jqXHR)
        {
        	alert(resData);
        },
        error: function(jqXHR, textStatus, errorThrown)
        {
            console.log('ERRORS: ' + textStatus);
        }
	    });
	}
</script>


	<!--zoom slider-->


	<%-- <script src="${pageContext.request.contextPath}/resources/js/zoomy.js"></script>
	<link type="text/css" rel="stylesheet"
		href="${pageContext.request.contextPath}/resources/css/zoomy.css">
	<script>
		var urls = [ '${pageContext.request.contextPath}/resources/images/zoom_slide_3.jpg', '${pageContext.request.contextPath}/resources/images/zoom_slide_4.jpg',
				'${pageContext.request.contextPath}/resources/images/zoom_slide_5.jpg', '${pageContext.request.contextPath}/resources/images/zoom_slide_3.jpg',
				'${pageContext.request.contextPath}/resources/images/zoom_slide_4.jpg'
		
		];
		var options = {
		};
		$('#el').zoomy(urls, options);
	</script> --%>
	<script type="text/javascript">
		var _gaq = _gaq || [];
		_gaq.push([ '_setAccount', 'UA-36251023-1' ]);
		_gaq.push([ '_setDomainName', 'jqueryscript.net' ]);
		_gaq.push([ '_trackPageview' ]);

		(function() {
			var ga = document.createElement('script');
			ga.type = 'text/javascript';
			ga.async = true;
			ga.src = ('https:' == document.location.protocol ? 'https://ssl'
					: 'http://www')
					+ '.google-analytics.com/ga.js';
			var s = document.getElementsByTagName('script')[0];
			s.parentNode.insertBefore(ga, s);
		})();
	</script>


	<!--cart-sidepanel-->
	<script type="text/javascript">
		function openNav() {
			document.getElementById("mySidepanel").style.width = "300px";
		}
		function closeNav() {
			document.getElementById("mySidepanel").style.width = "0";
		}
	</script>

	<!--cart-sidepanel-->
	<script type="text/javascript">
		function openNav2() {
			document.getElementById("mySidepanel2").style.width = "300px";
		}
		function closeNav2() {
			document.getElementById("mySidepanel2").style.width = "0";
		}
	</script>

	<!--main-menu-js-->
	<script>
		function openNav1() {
			document.getElementById("myNav").style.height = "100%";
		}

		function closeNav1() {
			document.getElementById("myNav").style.height = "0%";
		}
	</script>

	<!--menuzord -->
	<script type="text/javascript">
		jQuery(document).ready(function() {
			jQuery("#menuzord").menuzord({
				align : "left"
			});
		});
	</script>
	<!--menuzord-->

	<script type="text/javascript">
		jQuery(document)
				.ready(
						function() {
							// This button will increment the value
							$('.qtyplus')
									.click(
											function(e) {
												// Stop acting like a button
												e.preventDefault();
												// Get the field name
												fieldName = $(this).attr(
														'field');
												// Get its current value
												var currentVal = parseInt($(
														'input[name='
																+ fieldName
																+ ']').val());
												// If is not undefined
												if (!isNaN(currentVal)) {
													// Increment
													$(
															'input[name='
																	+ fieldName
																	+ ']').val(
															currentVal + 1);
												} else {
													// Otherwise put a 0 there
													$(
															'input[name='
																	+ fieldName
																	+ ']').val(
															0);
												}
											});
							// This button will decrement the value till 0
							$(".qtyminus")
									.click(
											function(e) {
												// Stop acting like a button
												e.preventDefault();
												// Get the field name
												fieldName = $(this).attr(
														'field');
												// Get its current value
												var currentVal = parseInt($(
														'input[name='
																+ fieldName
																+ ']').val());
												// If it isn't undefined or its greater than 0
												if (!isNaN(currentVal)
														&& currentVal > 0) {
													// Decrement one
													$(
															'input[name='
																	+ fieldName
																	+ ']').val(
															currentVal - 1);
												} else {
													// Otherwise put a 0 there
													$(
															'input[name='
																	+ fieldName
																	+ ']').val(
															0);
												}
											});
						});
	</script>


	<!--slick slider-->
	<script type="text/javascript">
		$(document).on('ready', function() {
			$(".regular").slick({
				dots : true,
				infinite : true,
				slidesToShow : 3,
				slidesToScroll : 1,
				autoplay : true,
				responsive : [ {
					breakpoint : 1024,
					settings : {
						slidesToShow : 3,
						slidesToScroll : 1,
						infinite : true,
						dots : true
					}
				}, {
					breakpoint : 768,
					settings : {
						slidesToShow : 2,
						slidesToScroll : 1
					}
				}, {
					breakpoint : 480,
					settings : {
						slidesToShow : 1,
						slidesToScroll : 1
					}
				}
				// You can unslick at a given breakpoint now by adding:
				// settings: "unslick"
				// instead of a settings object
				]
			});

			$(".regular-cake").slick({
				dots : true,
				infinite : true,
				slidesToShow : 4,
				slidesToScroll : 1,
				autoplay : true,
				responsive : [ {
					breakpoint : 1024,
					settings : {
						slidesToShow : 3,
						slidesToScroll : 1,
						infinite : true,
						dots : true
					}
				}, {
					breakpoint : 768,
					settings : {
						slidesToShow : 2,
						slidesToScroll : 1
					}
				}, {
					breakpoint : 480,
					settings : {
						slidesToShow : 1,
						slidesToScroll : 1
					}
				}
				// You can unslick at a given breakpoint now by adding:
				// settings: "unslick"
				// instead of a settings object
				]
			});

		});
	</script>




	<script type="text/javascript">
		/*Dropdown Menu*/
		$('.dropdown').click(function() {
			$(this).attr('tabindex', 1).focus();
			$(this).toggleClass('active');
			$(this).find('.dropdown-menu').slideToggle(300);
		});
		$('.dropdown').focusout(function() {
			$(this).removeClass('active');
			$(this).find('.dropdown-menu').slideUp(300);
		});
		$('.dropdown .dropdown-menu li').click(
				function() {
					$(this).parents('.dropdown').find('span').text(
							$(this).text());
					$(this).parents('.dropdown').find('input').attr('value',
							$(this).attr('id'));
				});
		/*End Dropdown Menu*/

		$('.dropdown2').click(function() {
			$(this).attr('tabindex', 1).focus();
			$(this).toggleClass('active');
			$(this).find('.dropdown-menu').slideToggle(300);
		});
		$('.dropdown2').focusout(function() {
			$(this).removeClass('active');
			$(this).find('.dropdown-menu').slideUp(300);
		});
		$('.dropdown2 .dropdown-menu li').click(
				function() {
					$(this).parents('.dropdown2').find('span').text(
							$(this).text());
					$(this).parents('.dropdown2').find('input').attr('value',
							$(this).attr('id'));
				});
	</script>

	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/xzoom.min.js"></script>
	<link rel="stylesheet" type="text/css"
		href="${pageContext.request.contextPath}/resources/css/xzoom.css"
		media="all" />
	<script src="${pageContext.request.contextPath}/resources/js/setup.js"></script>

	<script type="text/javascript">
		document
				.addEventListener(
						"DOMContentLoaded",
						function() {
							var lazyloadImages;

							if ("IntersectionObserver" in window) {
								lazyloadImages = document
										.querySelectorAll(".lazy");
								var imageObserver = new IntersectionObserver(
										function(entries, observer) {
											entries
													.forEach(function(entry) {
														if (entry.isIntersecting) {
															var image = entry.target;
															image.src = image.dataset.src;
															image.classList
																	.remove("lazy");
															imageObserver
																	.unobserve(image);
														}
													});
										});

								lazyloadImages.forEach(function(image) {
									imageObserver.observe(image);
								});
							} else {
								var lazyloadThrottleTimeout;
								lazyloadImages = document
										.querySelectorAll(".lazy");

								function lazyload() {
									if (lazyloadThrottleTimeout) {
										clearTimeout(lazyloadThrottleTimeout);
									}

									lazyloadThrottleTimeout = setTimeout(
											function() {
												var scrollTop = window.pageYOffset;
												lazyloadImages
														.forEach(function(img) {
															if (img.offsetTop < (window.innerHeight + scrollTop)) {
																img.src = img.dataset.src;
																img.classList
																		.remove('lazy');
															}
														});
												if (lazyloadImages.length == 0) {
													document
															.removeEventListener(
																	"scroll",
																	lazyload);
													window.removeEventListener(
															"resize", lazyload);
													window
															.removeEventListener(
																	"orientationChange",
																	lazyload);
												}
											}, 20);
								}

								document.addEventListener("scroll", lazyload);
								window.addEventListener("resize", lazyload);
								window.addEventListener("orientationChange",
										lazyload);
							}
						})
	</script>



</body>

</html>