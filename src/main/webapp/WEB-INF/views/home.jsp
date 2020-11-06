<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html>
<jsp:include page="/WEB-INF/views/include/metacssjs.jsp"></jsp:include>

<body onload="changeFlavor(777)">


	<div class="mongi_help">
		<a href="#mongi" class="initialism mongi_open"><img src="#"
			class="lazy"
			data-src="${pageContext.request.contextPath}/resources/images/mongi_help.png"
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


	<!-- Header -->
	<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
	<!-- Header End -->

	<div class="head_marg">

		<!--main banner -->
		<div class="main_banner"
			style="background: url(${pageContext.request.contextPath}/resources/images/main_banner.jpg) no-repeat center top; background-size: cover;">
			<div class="banner_caption">
				<h3 class="banner_title">
					Just Launched <span>Can't wait to send surprises?</span>
				</h3>
				<p class="banner_txt">Choose Same Day Delivery Gifts</p>
				<a href="${pageContext.request.contextPath}/productlist"
					class="send_now_btn">Send Now</a>
			</div>
		</div>

	</div>

	<!-- multiple product boxes -->
	<div class="find_store">
		<div class="wrapper">
			<div class="prod_cat_bx">

				<c:forEach items="${frCatList}" var="frCat" varStatus="count">
					<div class="prod_cat_1">
						<div class="cakes_cat_1">
							<a
								href="${pageContext.request.contextPath}/filterCategoryProduct/${frCat.catId}">
								<div class="img_cap">
									<img
										src="https://d3s16h6oq3j5fb.cloudfront.net/img/Spinner-2.gif"
										class="lazy" data-src="${catImgUrl}${frCat.imageName}" alt="">
									<div class="prod_cat_cap">
										<span>Cakes</span>
									</div>
								</div>
							</a>
						</div>
					</div>
				</c:forEach>

				<div class="clr"></div>
			</div>
		</div>
	</div>
	<!--festival offoer box-->
	<div class="testimonial_bx">
		<div class="wrapper">
			<section class="regular-cake slider">
				<div>
					<div class="festival_offer">
						<a href="product-filter.html"><img
							src="${pageContext.request.contextPath}/resources/images/festival_banner_1.jpg"
							class="lazy"
							data-src="${pageContext.request.contextPath}/resources/images/festival_banner_1.jpg"
							alt=""></a>
					</div>
				</div>
				<div>
					<div class="festival_offer">
						<a href="product-filter.html"><img
							src="${pageContext.request.contextPath}/resources/images/festival_banner_2.jpg"
							class="lazy"
							data-src="${pageContext.request.contextPath}/resources/images/festival_banner_2.jpg"
							alt=""></a>
					</div>
				</div>
				<div>
					<div class="festival_offer">
						<a href="product-filter.html"><img
							src="${pageContext.request.contextPath}/resources/images/festival_banner_1.jpg"
							class="lazy"
							data-src="${pageContext.request.contextPath}/resources/images/festival_banner_1.jpg"
							alt=""></a>
					</div>
				</div>
				<div>
					<div class="festival_offer">
						<a href="product-filter.html"><img
							src="${pageContext.request.contextPath}/resources/images/festival_banner_2.jpg"
							class="lazy"
							data-src="${pageContext.request.contextPath}/resources/images/festival_banner_2.jpg"
							alt=""></a>
					</div>
				</div>

			</section>
		</div>
	</div>


	<!--new cake box-->
	<c:forEach items="${flavTagStatusList}" var="statusFilter"
		varStatus="count">
		<c:choose>
			<c:when test="${statusFilter.filterTypeId==5}">
				<div class="find_store">
					<h2 class="sec_title">
						<center>
							${statusFilter.filterName} <span>${statusFilter.filterName}</span>
						</center>
					</h2>

					<div class="wrapper">
						<section class="regular-cake slider">
							<div>
								<c:forEach items="${prodHeaderList}" var="product"
									varStatus="prodCount">
									<c:choose>
										<%-- <c:when
											test="${product.prodStatusId==statusFilter.filterId && product.isHomePageProd==1}"> --%>
										<c:when test="${product.prodStatusId==statusFilter.filterId}">
											<div class="cake_one">
												<div class="cake_pic">
													<img src="${prodImgUrl}${product.prodImagePrimary}"
														data-src="${prodImgUrl}${product.prodImagePrimary}" alt=""
														class="mobile_fit transition lazy">

													<div class="circle_tag active">
														<img src="#" class="lazy"
															data-src="${pageContext.request.contextPath}/resources/images/heart-1.svg"
															alt=""> <img src="#" class="lazy"
															data-src="${pageContext.request.contextPath}/resources/images/heart.svg"
															alt="">
													</div>
													<div class="cake_prc">
														<i class="fa fa-inr" aria-hidden="true"></i><p id="cake_prc${product.productId}">${product.defaultPrice}</p>
														<span class="off_prc"><i class="fa fa-inr"
															aria-hidden="true"></i>${product.defaultPrice}</span> <span
															class="prc_off">(23% Off)</span>
													</div>
												</div>
												<div class="cake_container">
													<h4 class="cake_nm">
														<a
															href="${pageContext.request.contextPath}/showProdDetail/${product.productId}">${product.productName}</a>
													</h4>
													<div class="cake_dropdown">
														<div class="cake_dropdown_l">
															<div class="custom-select-new1">
															<c:if test="${product.flavourIds!=0}">
																<select id="flav${product.productId}"
																	onchange="changeFlavor(${product.productId})">
																	<c:forEach items="${product.flavourIds}"
																		var="prodDetail">
																		
																		<c:forEach items="${flavTagStatusList}"
																			var="flavorFilter" varStatus="flavorFilterCount">

																			<c:if test="${flavorFilter.filterTypeId==4}">

																				<c:choose>
																					<c:when test="${prodDetail==flavorFilter.filterId}">
																						<c:choose>
																							<c:when
																								test="${prodDetail==product.defaultFlavorId}">
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
																</select>
																</c:if>
															</div>
														</div>
														<div class="cake_dropdown_r">
															<div class="custom-select-new1">
																<select id="wt${product.productId}"
																	onchange="changeWt(${product.productId})">
																	<option value="7">7</option>
																	<c:forEach items="${product.availInWeights}"
																		var="prodDetailwt">
																		<option value="${prodDetailwt}">${prodDetailwt}</option>
																	</c:forEach>
																</select>
															</div>
														</div>
														<div class="clr"></div>
													</div>
													<!-- <div class="cake_radio_row">
														<div class="radio_l">

															<div class="radio_1">
																<ul>
																	<li><input type="radio" id="a-option"
																		name="selector"> <label for="a-option">Veg</label>
																		<div class="check"></div></li>

																	<li><input type="radio" id="b-option"
																		name="selector"> <label for="b-option">Non
																			Veg</label>
																		<div class="check">
																			<div class="inside"></div>
																		</div></li>

																</ul>
															</div>

														</div>
														<div class="radio_r">
															<a href="my-cart.html" class="cart_btn">Add to Cart</a>
														</div>
														<div class="clr"></div>
													</div> -->


													<div class="cake_radio_row">
														<div class="radio_l">

															<div class="radio_1">
																<c:set var="isVegFound" value="0"></c:set>
																<c:set var="isNonVegFound" value="0"></c:set>
																<c:forEach items="${product.isVeg}"
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
																	<input type="radio" value="0" id="prod_veg${product.productId}"
																		name="prod_vnv${product.productId}">
																	<label for="b-option"> Veg VG </label>
																	<div class="check">
																		<div class="inside"></div>
																	</div>


																</c:if>

																<c:if test="${isNonVegFound==1}">
																	<input type="radio" value="1"
																		id="prod_nonveg${product.productId}"
																		name="prod_vnv${product.productId}">
																	<label for="b-option">Non Veg NV</label>
																	<div class="check">
																		<div class="inside"></div>
																	</div>
																</c:if>

																<!-- <ul>
																	<li><input type="radio" id="a-option"
																		name="selector"> <label for="a-option">Veg</label>
																		<div class="check"></div></li>

																	<li><input type="radio" id="b-option"
																		name="selector"> <label for="b-option">Non
																			Veg</label>
																		<div class="check">
																			<div class="inside"></div>
																		</div></li>

																</ul> -->
															</div>

														</div>
														<div class="radio_r">
															<a href="#" onclick="addToCartClick(${product.productId})" class="cart_btn">Add
																to Cart</a>
														</div>
														<div class="clr"></div>
													</div>

												</div>

											</div>
											<!-- End of div cake one -->
										</c:when>
										<c:otherwise>

										</c:otherwise>
									</c:choose>
								</c:forEach>

							</div>

						</section>

						<div class="more_cakes">
							<a href="product.html">More ${statusFilter.filterName}</a>
						</div>
					</div>
				</div>
				<!--  End of Find_Store Div -->
			</c:when>
			<c:otherwise>

			</c:otherwise>
		</c:choose>

	</c:forEach>

	<!--premium cake box-- cake_one_demo>
<%-- <div class="cake_one_demo">
												<div class="cake_pic">
													<img src="${prodImgUrl}dsd"
														data-src="${prodImgUrl}dsds" alt=""
														class="mobile_fit transition lazy">

													<div class="circle_tag active">
														<img src="#" class="lazy"
															data-src="${pageContext.request.contextPath}/resources/images/heart-1.svg"
															alt=""> <img src="#" class="lazy"
															data-src="${pageContext.request.contextPath}/resources/images/heart.svg"
															alt="">
													</div>
													<div class="cake_prc">
														<i class="fa fa-inr" aria-hidden="true"></i>499 <span
															class="off_prc"><i class="fa fa-inr"
															aria-hidden="true"></i>649</span> <span class="prc_off">(23%
															Off)</span>
															
															
													</div>
												</div>
												<div class="cake_container">
													<h4 class="cake_nm">
														<a
															href="${pageContext.request.contextPath}/showProdDetail/14">KKKKK</a>
													</h4>
													<div class="cake_dropdown">
														<div class="cake_dropdown_l">
															<div class="custom-select-new">
																     <select id="flav7LLL">
																     <option value="a">A</option>
																      <option value="b">B</option>
																	</select>
															</div>
														</div>
														<div class="cake_dropdown_r">
															
														<select onchange="changeWt1()" id="wt">
															 <option value="a">A</option>
																      <option value="b">B</option>
														<option value="d2">ffffff</option>
													
														</select>
															
														</div>
														<div class="clr"></div>
													</div>
													<div class="cake_radio_row">
														<div class="radio_l">

															<div class="radio_1">
																<ul>
																	<li><input type="radio" id="a-option"
																		name="selector"> <label for="a-option">Veg</label>
																		<div class="check"></div></li>

																	<li><input type="radio" id="b-option"
																		name="selector"> <label for="b-option">Non
																			Veg</label>
																		<div class="check">
																			<div class="inside"></div>
																		</div></li>

																</ul>
															</div>

														</div>
														<div class="radio_r">
															<a href="my-cart.html" class="cart_btn">Add to Cart222</a>
														</div>
														<div class="clr"></div>
													</div>
												</div>

											</div> --%>

	<!--new cake box-->

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
							which don't look even slightly believable. If you are going to
							use a passage of Lorem Ipsum, you need to be sure there isn't
							anything embarrassing hidden.</p>

						<div class="testimonial_nm">
							<img src="#" class="lazy"
								data-src="${pageContext.request.contextPath}/resources/images/testimonial_pic.jpg"
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

	<!--find-store-->
	<div class="find_store">
		<div class="wrapper">
			<div class="store_banner"
				style="background: url(${pageContext.request.contextPath}/resources/images/add_banner.jpg) no-repeat center top; background-size: cover;">
				<div class="store_content">
					<div class="visit_cont">
						<div class="experiance_bx">
							<div class="experiance_bor">
								<h2 class="visit_title">Visit &amp; Experience Our Service
									in Your City</h2>
								<a href="#" class="find_btn">Find Stores <i
									class="fa fa-angle-right" aria-hidden="true"></i></a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!--strip-->
	<div class="type_strip">
		<div class="wrapper">
			<ul class="strip_divid">
				<li>
					<div class="strip_payment">
						<img src="#" class="lazy"
							data-src="${pageContext.request.contextPath}/resources/images/secure_icn.png"
							alt=""> 100% Secure Payments <span>All major credit
							&amp; debit cards accepted</span>
					</div>
				</li>
				<li>
					<div class="strip_payment extra_padd">
						<img src="#" class="lazy"
							data-src="${pageContext.request.contextPath}/resources/images/customer.png"
							alt=""> 3,000,000 <span>Customers across the world</span>
					</div>
				</li>
				<li>
					<div class="strip_payment extra_padd">
						<img src="#" class="lazy"
							data-src="${pageContext.request.contextPath}/resources/images/gifts.png"
							alt=""> 2 Million+ Gift <span>boxes delivered
							worldwide</span>
					</div>
				</li>
			</ul>
		</div>
	</div>

	<!-- bottom -->
	<jsp:include page="/WEB-INF/views/include/bottomMenu.jsp"></jsp:include>

	<select id="jj" name="jjj" onchange="changeWt1()"><option></option></select>



	<script type="text/javascript">

	function changeFlavor(productId){
	console.log("Sachin");
	var x="${sessionScope.curDateTime}";
		var dataList='${sessionScope.dataList}';
		var data=$.parseJSON(dataList);
	//	alert(JSON.stringify(data));
		var prodHead=JSON.stringify(data.feProductHeadList);
		console.log(JSON.parse(prodHead).length);
		var selectWt = document.getElementById("wt"+productId).value;
		var selectFlav = document.getElementById("flav"+productId).value;
		alert("selectWt "+ selectWt + "selectFlav " +selectFlav);
	}//End of changeFlavor
function changeWt(productId){
	var selectWt = document.getElementById("wt"+productId).value;
	var selectFlav=0;
	try{
		selectFlav = document.getElementById("flav"+productId).value;
	}catch (e) {
		selectFlav=0;
	}
	if(selectFlav==""||isNaN(selectFlav)||selectFlav==null){
		selectFlav=0;
	}
	var isVeg=$('input[name="prod_vnv'+productId+'"]:checked').val();
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
	var prodDetail=prodMaster.prodDetailList;
	for(var d=0;d<prodDetail.length;d++){
		if(parseInt(prodMaster.defaultShapeId)==parseInt(prodDetail[d].shapeId)){
			if(parseInt(prodDetail[d].flavorId)==parseInt(selectFlav)){
				if(prodDetail[d].vegNonvegName==selectVegNon){
					//Calc Price;
					if(parseFloat(selectWt)==parseFloat(prodDetail[d].qty)){
					
						//alert(prodDetail[d].configDetailId);
					var qty=1;
					document.getElementById("cake_prc"+productId).innerHTML = ""+prodDetail[d].actualRate;
					actualRate=prodDetail[d].actualRate;
					var priceDiff=parseFloat(prodDetail[d].displayRate)-parseFloat(actualRate);
					offPer=(parseFloat(priceDiff)/parseFloat(prodDetail[d].displayRate)*100);
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
	
}//end of Function changeWt
	
function addToCartClick(productId){
	alert("In addToCartClick " +productId);
	var selectWt = document.getElementById("wt"+productId).value;
	var selectFlav=0;
	try{
		selectFlav = document.getElementById("flav"+productId).value;
	}catch (e) {
		selectFlav=0;
	}
	if(selectFlav==""||isNaN(selectFlav)||selectFlav==null){
		selectFlav=0;
	}
	var isVeg=$('input[name="prod_vnv'+productId+'"]:checked').val();
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
	var prodDetail=prodMaster.prodDetailList;
	for(var d=0;d<prodDetail.length;d++){
		//alert("OKkk");
		if(parseInt(prodMaster.defaultShapeId)==parseInt(prodDetail[d].shapeId)){
			if(parseInt(prodDetail[d].flavorId)==parseInt(selectFlav)){
				if(prodDetail[d].vegNonvegName==selectVegNon){
					//Calc Price;
					if(parseFloat(selectWt)==parseFloat(prodDetail[d].qty)){
					alert(prodDetail[d].configDetailId);
					var qty=1;
					document.getElementById("cake_prc"+productId).innerHTML = ""+prodDetail[d].actualRate;
					actualRate=prodDetail[d].actualRate;
					var priceDiff=parseFloat(prodDetail[d].displayRate)-parseFloat(actualRate);
					offPer=(parseFloat(priceDiff)/parseFloat(prodDetail[d].displayRate)*100);
					//alert(offPer);
					if (sessionStorage.getItem("cartValue") == null) {
						var table = [];
						sessionStorage.setItem("cartValue", JSON.stringify(table));
					}
					
					var cartValue = sessionStorage.getItem("cartValue");
					var table = $.parseJSON(cartValue);
					
					table.push({
						  itemId: 00,
						  price: 0,
						  itemName: 0,
						  qty: 1,
						  total: 11,
						  cgstPer : 5,
						  sgstPer :5,
						  igstPer : 2.5,
						  specialremark : ''
					});
					sessionStorage.setItem("cartValue", JSON.stringify(table));
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
	var cartValue = sessionStorage.getItem("cartValue");
	var table = $.parseJSON(cartValue);
	alert(table.length)
	
	
	}//end of Function addToCartClick

</script>
	<script type="text/javascript">
var x, i, j, l, ll, selElmnt, a, b, c;
/*look for any elements with the class "custom-select":*/
x = document.getElementsByClassName("custom-select-new");
l = x.length;
for (i = 0; i < l; i++) {
  selElmnt = x[i].getElementsByTagName("select")[0];
  ll = selElmnt.length;
  /*for each element, create a new DIV that will act as the selected item:*/
  a = document.createElement("DIV");
  a.setAttribute("class", 'select-selected');
  a.innerHTML = selElmnt.options[selElmnt.selectedIndex].innerHTML;
  x[i].appendChild(a);
  /*for each element, create a new DIV that will contain the option list:*/
  b = document.createElement("DIV");
  b.setAttribute("class", 'select-items select-hide');
  for (j = 1; j < ll; j++) {
    /*for each option in the original select element,
    create a new DIV that will act as an option item:*/
    c = document.createElement("DIV");
    c.innerHTML = selElmnt.options[j].innerHTML;
    c.addEventListener("click", function(e) {
        /*when an item is clicked, update the original select box,
        and the selected item:*/
        var y, i, k, s, h, sl, yl;
        s = this.parentNode.parentNode.getElementsByTagName("select")[0];
        sl = s.length;
        h = this.parentNode.previousSibling;
        for (i = 0; i < sl; i++) {
          if (s.options[i].innerHTML == this.innerHTML) {
            s.selectedIndex = i;
            h.innerHTML = this.innerHTML;
            y = this.parentNode.getElementsByClassName("same-as-selected");
            yl = y.length;
            for (k = 0; k < yl; k++) {
              y[k].removeAttribute("class");
            }
            this.setAttribute("class", "same-as-selected");
            break;
          }
        }
        h.click();
    });
    b.appendChild(c);
  }
  x[i].appendChild(b);
  a.addEventListener("click", function(e) {
      /*when the select box is clicked, close any other select boxes,
      and open/close the current select box:*/
      e.stopPropagation();
      closeAllSelect(this);
      this.nextSibling.classList.toggle("select-hide");
      this.classList.toggle("select-arrow-active");
    });
}
function closeAllSelect(elmnt) {
  /*a function that will close all select boxes in the document,
  except the current select box:*/
  var x, y, i, xl, yl, arrNo = [];
  x = document.getElementsByClassName("select-items");
  y = document.getElementsByClassName("select-selected");
  xl = x.length;
  yl = y.length;
  for (i = 0; i < yl; i++) {
    if (elmnt == y[i]) {
      arrNo.push(i)
    } else {
      y[i].classList.remove("select-arrow-active");
    }
  }
  for (i = 0; i < xl; i++) {
    if (arrNo.indexOf(i)) {
      x[i].classList.add("select-hide");
    }
  }
}
/*if the user clicks anywhere outside the select box,
then close all select boxes:*/
document.addEventListener("click", closeAllSelect);
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
												alert("fieldName" +fieldName)
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
					settings : {x`
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
