<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page import = "java.util.Date" %>
	<%@ page import = "java.text.SimpleDateFormat" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html>

<jsp:include page="/WEB-INF/views/include/metacssjs.jsp"></jsp:include>

<body>


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
						<div class="cakes_cat_1 new">
							<a
								href="${pageContext.request.contextPath}/filterCategoryProduct/${frCat.catId}">
								<div class="img_cap">
									<img
										src="https://d3s16h6oq3j5fb.cloudfront.net/img/Spinner-2.gif"
										class="lazy" data-src="${catImgUrl}${frCat.imageName}" alt="">
									<div class="prod_cat_cap">
										<span>${frCat.catName}</span>
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
			<c:forEach items="${festiveEventList}" var="festEvent"
		varStatus="count">
		<c:set var="td" value="${festEvent.toDate}"></c:set>
		<%String dt=(String)pageContext.getAttribute("td");
		Date curDate=new Date();
		SimpleDateFormat sdf=new SimpleDateFormat("dd-MM-yyyy");
		Date date=sdf.parse(dt);
		if(curDate.compareTo(date)<=0){
			pageContext.setAttribute("show",1);
		}else{
			pageContext.setAttribute("show",0);
		}
		%>
		<c:set var="isShow" value="${show}"></c:set>
		<c:if test="${isShow==1}">
				<div>
					<div class="festival_offer">
				<a href="${pageContext.request.contextPath}/showEventBasedCakes/${count.index}" title="${festEvent.description}">${festEvent.eventName}
<img src="${festEventImgUrl}${festEvent.exVar2}"
	class="lazy" data-src="${festEventImgUrl}${festEvent.exVar2}"
							alt=""></a>
					</div>
				</div>
				</c:if>
				</c:forEach>
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

							<c:forEach items="${prodHeaderList}" var="product"
								varStatus="prodCount">
								<c:choose>
									<c:when
											test="${product.prodStatusId==statusFilter.filterId && product.isHomePageProd==1}">
								<%-- 	<c:when test="${product.prodStatusId==statusFilter.filterId}"> --%>
										<div>
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
													<%-- <div class="cake_prc">
														<i class="fa fa-inr" aria-hidden="true"></i>
														<p id="cake_prc${product.productId}">${product.defaultPrice}</p>
														<span class="off_prc"><i class="fa fa-inr"
															aria-hidden="true"></i>${product.defaultPrice}</span> <span
															class="prc_off">(23% Off)</span>
													</div> --%>


													<div class="cake_prc">
														<i class="fa fa-inr cake_prc_detail_iclass"
															aria-hidden="true"></i>
														<p class="cake_prc_detail_pclass"
															id="cake_prc${product.productId}">${product.defaultPrice}</p>
														<span class="off_prc" id="off_prc${product.productId}"><!-- <i class="fa fa-inr" 
															aria-hidden="true"></i> --></span> <span
															id="prc_off${product.productId}" class="prc_off"></span>
													</div>

												</div>
												<div class="cake_container">
													<h4 class="cake_nm">
														<a
															href="${pageContext.request.contextPath}/showProdDetail/${prodCount.index}">${product.productName}</a>
													</h4>
													<div class="cake_dropdown">
														<div class="cake_dropdown_l">
															<c:if test="${product.flavourIds!=0}">
																<select class="select-css" id="flav${product.productId}"
																	onchange="changeWtFlavor('${product.productId}')">
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
														<div class="cake_dropdown_r">
															<!-- <div class="custom-select-new1"> -->
															<select class="select-css" id="wt${product.productId}"
																 onchange="changeWtFlavor('${product.productId}')" >
																<option value="7">7</option>
																<c:forEach items="${product.availInWeights}"
																	var="prodDetailwt">
																	<option value="${prodDetailwt}">${prodDetailwt}</option>
																</c:forEach>
															</select>
															<!-- </div> -->
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
																<ul>
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
																		<li><input type="radio" value="0"
																			id="prod_veg${product.productId}"
																			name="prod_vnv${product.productId}"> <label
																			for="prod_veg${product.productId}"> Veg</label>
																			<div class="check">
																				<div class="inside"></div>
																			</div></li>

																	</c:if>

																	<c:if test="${isNonVegFound==1}">
																		<li><input type="radio" value="1"
																			id="prod_nonveg${product.productId}"
																			name="prod_vnv${product.productId}"> <label
																			for="prod_nonveg${product.productId}"> Non
																				Veg</label>
																			<div class="check">
																				<div class="inside"></div>
																			</div></li>
																	</c:if>
																</ul>
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
															<a href="#"
																onclick="addToCartClick('${product.productId}')"
																class="cart_btn">Add to Cart</a>
														</div>
														<div class="clr"></div>
													</div>

												</div>

											</div>
										</div>
										<!-- End of div cake one -->
									</c:when>
									<c:otherwise>

									</c:otherwise>
								</c:choose>
							</c:forEach>
						</section>
						<div class="more_cakes">
							<a href="${pageContext.request.contextPath}/moreCakeStatusWise/${statusFilter.filterId}">More ${statusFilter.filterName}</a>
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
			<center >
				Our Testimonials <span>Customer Reviews regarding to our Shop</span>
			</center>
		</h2>

		<div class="wrapper">
			<section class="regular slider">
				<c:forEach items="${testMonialList}" var="testmoni" varStatus="count">
            <div>
              <div class="testimonial_one">
                <i class="fa fa-quote-left" aria-hidden="true"></i>  
                <p class="testimoial_txt">${testmoni.messages}</p>

                <div class="testimonial_nm">
                    <img src="${TestimonialImgUrl}${testmoni.images}" alt="">
                    <h2 class="testimonial_date">
                        ${testmoni.name}
                        <span>Date : date</span>
                       <!--  <span>Location: location</span> -->
                    </h2>
                  </div>  
              </div>
 </div>
 </c:forEach>
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




	<script type="text/javascript">
		function changeWtFlavor(productId) {
			var selectWt = document.getElementById("wt" + productId).value;
			var selectFlav = 0;
			try {
				selectFlav = document.getElementById("flav" + productId).value;
			} catch (e) {
				selectFlav = 0;
			}
			if (selectFlav == "" || isNaN(selectFlav) || selectFlav == null) {
				selectFlav = 0;
			}
			var isVeg = $('input[name="prod_vnv' + productId + '"]:checked').val();
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
							document.getElementById("cake_prc" + productId).innerHTML = ""+prodDetail[d].actualRate;
							actualRate = prodDetail[d].actualRate;
								var priceDiff = parseFloat(prodDetail[d].displayRate) - parseFloat(actualRate);
								offPer = (parseFloat(priceDiff) / parseFloat(prodDetail[d].displayRate) * 100);
								//document.getElementById("prc_off" + productId).innerHTML = ""+priceDiff.toFixed(2);
								if(parseFloat(priceDiff)<=1){
									priceDiff=10;
								}
									document.getElementById('off_prc'+productId).innerHTML = "<i class='fa fa-inr' aria-hidden='true'>"+priceDiff.toFixed(2)+"</i>";
					//document.getElementById('off_prc'+productId).innerHTML = "<i class='fa fa-inr' aria-hidden='true'>414</i>";
								document.getElementById("prc_off" + productId).innerHTML = ""+offPer.toFixed(2);
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
<script type="text/javascript">
		function addToCartClick(productId) {
			//alert("In addToCartClick " +productId);
			var selectWt = document.getElementById("wt" + productId).value;
			var selectFlav = 0;
			try {
				selectFlav = document.getElementById("flav" + productId).value;
			} catch (e) {
				selectFlav = 0;
			}
			if (selectFlav == "" || isNaN(selectFlav) || selectFlav == null) {
				selectFlav = 0;
			}

			var isVeg = $('input[name="prod_vnv' + productId + '"]:checked')
					.val();
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
				//alert("OKkk");
				if (parseInt(prodMaster.defaultShapeId) == parseInt(prodDetail[d].shapeId)) {
					if (parseInt(prodDetail[d].flavorId) == parseInt(selectFlav)) {
						if (prodDetail[d].vegNonvegName == selectVegNon) {
							//Calc Price;
							if (parseFloat(selectWt) == parseFloat(prodDetail[d].qty)) {
								//alert(prodDetail[d].configDetailId);
								var qty = 1;
								document.getElementById("cake_prc" + productId).innerHTML = ""
										+ prodDetail[d].actualRate;
								actualRate = prodDetail[d].actualRate;
								var priceDiff = parseFloat(prodDetail[d].displayRate)
										- parseFloat(actualRate);
								offPer = (parseFloat(priceDiff)
										/ parseFloat(prodDetail[d].displayRate) * 100);

								taxableAmt = actualRate;

								cgstAmt = (parseFloat(actualRate) * parseFloat(prodMaster.cgstPer)) / 100;
								sgstAmt = (parseFloat(actualRate) * parseFloat(prodMaster.sgstPer)) / 100;
								igstAmt = (parseFloat(actualRate) * parseFloat(prodMaster.igstPer)) / 100;

								taxAmt = (cgstAmt + sgstAmt + igstAmt)
										.toFixed(2);
								totalAmt = (parseFloat(taxableAmt)).toFixed(2);

								if (sessionStorage.getItem("cartValue") == null) {
									var table = [];
									sessionStorage.setItem("cartValue", JSON
											.stringify(table));
								}

								var cartValue = sessionStorage
										.getItem("cartValue");
								var table = $.parseJSON(cartValue);

								table.push({
									orderDetailId : 0,
									orderId : 0,
									itemId : prodMaster.productId,
									hsnCode : prodMaster.hsnCode,
									qty : 1,
									mrp : prodDetail[d].displayRate,
									rate : prodDetail[d].actualRate,
									taxableAmt : taxableAmt,
									cgstPer : prodMaster.cgstPer,
									sgstPer : prodMaster.sgstPer,
									igstPer : prodMaster.igstPer,
									cgstAmt : cgstAmt,
									sgstAmt : sgstAmt,
									igstAmt : igstAmt,
									discAmt : 0,
									taxAmt : taxAmt,
									totalAmt : totalAmt,
									delStatus : 1,
									remark : '',
									exInt1 : prodDetail[d].configDetailId,
									exInt2 : prodDetail[d].flavorId,
									exInt3 : prodDetail[d].isVeg,
									exInt4 : prodDetail[d].shapeId,
									exVar1 : prodMaster.productName,
									exVar2 : '',
									exVar3 : '',
									exVar4 : '',
									exFloat1 : 1,
									exFloat2 : 1,
									exFloat3 : 1,
									exFloat4 : 1,
									weight : selectWt,
									veg : selectVegNon
								});
								sessionStorage.setItem("cartValue", JSON
										.stringify(table));
								appendCartData();
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

		}//end of Function addToCartClick
		function appendCartData() {

			if (sessionStorage.getItem("allItemList") == null) {
				var table = [];
				sessionStorage.setItem("allItemList", JSON.stringify(table));
			}

			if (sessionStorage.getItem("cartValue") == null) {
				var table = [];
				sessionStorage.setItem("cartValue", JSON.stringify(table));
			}

			var cartValue = sessionStorage.getItem("cartValue");
			var table = $.parseJSON(cartValue);

			var allItemList = sessionStorage.getItem("allItemList");
			var allItemArr = $.parseJSON(allItemList);

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

			/* else {

				if (sessionStorage.getItem("cartValue") == null) {
					var table = [];
					sessionStorage.setItem("cartValue", JSON.stringify(table));
				}

				var cartValue = sessionStorage.getItem("cartValue");
				var table = $.parseJSON(cartValue);

				var newCartVal = [];

				for (var i = 0; i < table.length; i++) {
					if (productId != table[i].itemId) {
						newCartVal.push(table[i]);
					}
				}

				sessionStorage.setItem("cartValue", JSON.stringify(newCartVal));
				appendCartData();
			} */

			if (parseInt(ischanged) == 1) {
				var cartValue = sessionStorage.getItem("cartValue");
				var table = $.parseJSON(cartValue);
				table[position].qty = curQty;

				var qty = parseFloat(curQty);
				var taxableAmt = parseFloat(table[position].rate)
						* parseFloat(qty).toFixed(2);
				var cgstAmt = (parseFloat(table[position].rate)
						* parseFloat(qty) * parseFloat(table[position].cgstPer)) / 100;
				var sgstAmt = (parseFloat(table[position].rate)
						* parseFloat(qty) * parseFloat(table[position].sgstPer)) / 100;
				var igstAmt = (parseFloat(table[position].rate)
						* parseFloat(qty) * parseFloat(table[position].igstPer)) / 100;

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
				} ]
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
				} ]
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
