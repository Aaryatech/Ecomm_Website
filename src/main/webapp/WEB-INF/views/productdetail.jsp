<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<jsp:include page="/WEB-INF/views/include/metacssjs.jsp"></jsp:include>


<body>
<c:url value="/setLikeOrDislike" var="setLikeOrDislike"></c:url>

	<jsp:include page="/WEB-INF/views/include/tags.jsp"></jsp:include>

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
							
							
								<div class="purity_icn">
									<c:choose>
										<c:when test="${prodHeader.vegNonvegName eq 'VEG'}">
											<img src="${pageContext.request.contextPath}/resources/images/veg_icn.jpg" class="slick-initialized slick-slider"
												data-src="${pageContext.request.contextPath}/resources/images/veg_icn.jpg"
												alt="">
										</c:when>
										<c:when test="${prodHeader.vegNonvegName eq 'NON-VEG'}">
											<img src="${pageContext.request.contextPath}/resources/images/nonveg_icn.jpg" class="slick-initialized slick-slider"
												data-src="${pageContext.request.contextPath}/resources/images/nonveg_icn.jpg"
												alt="">
										</c:when>
										<c:otherwise>
											<img src="${pageContext.request.contextPath}/resources/images/veg_icn.jpg" class="slick-initialized slick-slider"
												data-src="${pageContext.request.contextPath}/resources/images/veg_icn.jpg"
												alt="">
											<img src="${pageContext.request.contextPath}/resources/images/nonveg_icn.jpg" class="slick-initialized slick-slider"
												data-src="${pageContext.request.contextPath}/resources/images/nonveg_icn.jpg"
												alt="">
										</c:otherwise>
									</c:choose>
									<!-- <img src="/ecommerce/resources/images/veg_icn.jpg"
										class="slick-initialized slick-slider"
										data-src="/ecommerce/resources/images/veg_icn.jpg" alt=""> -->
								</div>

								<img class="xzoom" id="xzoom-default"
									src="${prodImgUrl}${prodHeader.prodImagePrimary}"
									xoriginal="${prodImgUrl}${prodHeader.prodImagePrimary}"
									onerror="this.src='${pageContext.request.contextPath}/resources/images/no_img_folder/no-product-image.jpg'" />
								
								<div class="mobile_Scrl">
									<div class="xzoom-thumbs">
										<a href="${prodImgUrl}${prodHeader.prodImagePrimary}"><img
											class="xzoom-gallery" width="70" height="70"
											src="${prodImgUrl}${prodHeader.prodImagePrimary}"
											xpreview="${prodImgUrl}${prodHeader.prodImagePrimary}"
											title="${prodHeader.productDesc}" onerror="this.src='${pageContext.request.contextPath}/resources/images/no_img_folder/no-product-image.jpg'"></a>
										<c:forEach items="${prodHeader.productImages}"
											var="prod_image">
											<a href="${prodImgUrl}${prod_image}"><img
												class="xzoom-gallery" width="70" height="70"
												src="${prodImgUrl}${prod_image}" onerror="this.src='${pageContext.request.contextPath}/resources/images/no_img_folder/no-product-image.jpg'"
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
									<input type="hidden" id="prodId"
										value="${prodHeader.productId}" />
									<h2 class="product_nm">
										<span>In Stock</span>
										
														<c:choose>
															<c:when test="${prodHeader.vegNonvegName eq 'VEG'}">
																<img src="#" class="lazy"
																	data-src="${pageContext.request.contextPath}/resources/images/veg_icn.jpg"
																	alt="">
															</c:when>
															<c:when test="${prodHeader.vegNonvegName eq 'NON-VEG'}">
																<img src="#" class="lazy"
																	data-src="${pageContext.request.contextPath}/resources/images/nonveg_icn.jpg"
																	alt="">
															</c:when>
															<c:otherwise>
																<img src="#" class="lazy"
																	data-src="${pageContext.request.contextPath}/resources/images/veg_icn.jpg"
																	alt="">
																<img src="#" class="lazy"
																	data-src="${pageContext.request.contextPath}/resources/images/nonveg_icn.jpg"
																	alt="">
															</c:otherwise>
														</c:choose>
														
										
										${prodHeader.productName}
									</h2>
									<div class="stock_review">
										4.8 <img
											src="${pageContext.request.contextPath}/resources/images/review_star.png"
											alt=""> <span>32 Review</span>
									</div>
								</div>
								
								<div class="stock_r">
								<div class="detail_like">
									<div class="circle_tag active" onclick="setLike(${prodHeader.productId})">
														
										<c:choose>
										
										<c:when test="${prodHeader.isLike==0}">
										<img src="#" class="lazy" id="like${prodHeader.productId}"
											data-src="${pageContext.request.contextPath}/resources/images/heart-1.svg"
											alt="">
										</c:when>
										<c:when test="${prodHeader.isLike==1}">
										<img src="#" class="lazy" id="like${prodHeader.productId}"
											data-src="${pageContext.request.contextPath}/resources/images/heart.svg"
											alt="">
										</c:when>
										
										</c:choose>
										
										
									</div>
								</div> </div>
								<%-- <div class="stock_r">
									<img
										src="${pageContext.request.contextPath}/resources/images/protection.png"
										alt="">
										<div class="stock_prc">
											<div class="actual_prc">
												<i class="fa fa-inr" aria-hidden="true"></i>
												<p id="cake_prc1">${prodHeader.defaultPrice}</p>
											</div>
											<div class="actual_off_prc">
												<i class="fa fa-inr cake_prc_detail_iclass" aria-hidden="true"></i>${prodHeader.defaultPrice}
											</div>
										</div>
										<div class="stock_off_prc">
											<span class="save aaa"> 20% off (Save 150) </span> 
											<span class="inclusive_txt aaa">Inclusive of all taxes</span>
										</div>
										<div class="clr"></div>
										
										
										
								</div> --%>
								<div class="clr"></div>
							</div>
							<!--product price row-->
							<%-- <div class="stock_prc">
								<i class="fa fa-inr cake_prc_detail_iclass aaa" aria-hidden="true"></i>
											<p class="cake_prc_detail_pclass aaa" id="cake_prc1">${prodHeader.defaultPrice}</p>
								 
								<span class="act_prc aaa"><i class="fa fa-inr cake_prc_detail_iclass" aria-hidden="true"></i>${prodHeader.defaultPrice}</span>
								<span class="save aaa"> 20% off (Save 150) </span> 
								<span class="inclusive_txt aaa">Inclusive of all taxes</span>
							</div> --%>
							<!--product txt row-->
							<!--<div class="prod_txt">${prodHeader.productDesc} Thisclassic
								round Black Forest cake makes a highly tempting gift. It weighs
								half kg, and is stuffed with whipped cream and studded with
								cherries. Its eggless version is also available. You can give
								this gift on any joyous occasion . Key attributes :</div>-->



							<div class="delivery_row">
								<div class="delivery_l">
									<div class="a">
										<h4 class="highlight_title">Product Highlights :</h4>
										<ul class="highlist_list">

											<li><i class="fa fa-circle" aria-hidden="true"></i> Sub
												Category: ${prodHeader.subCatName}</li>

											<c:if test="${prodHeader.prodTypeId!=0}">
												<li><i class="fa fa-circle" aria-hidden="true"></i>
													Type of Cake: ${prodHeader.prodTypeName}</li>
											</c:if>

											<c:if test="${prodHeader.defaultFlavorId!=0}">
												<li><i class="fa fa-circle" aria-hidden="true"></i>
													Cake Flavour: ${prodHeader.flavorNames}</li>
											</c:if>



											<%-- <c:if test="${prodHeader.typeOfBread!=0}">
												<li><i class="fa fa-circle" aria-hidden="true"></i>
													Type of Bread: ${prodHeader.breadTypeName}</li>
											</c:if> --%>
										</ul>
										<a href="#" onclick="moveCursor()" class="more_highlight">Read
											More</a>
									</div>

									<!--eagless or with eeg row-->
									<%-- <div class="eagless_row">
										<ul>

											<c:set var="isVegFound" value="0"></c:set>
											<c:set var="isNonVegFound" value="0"></c:set>
											<c:forEach items="${prodHeader.isVeg}" var="prodDetailVegNon">


												<c:forEach items="${flavTagStatusList}" var="vegNonFilter"
													varStatus="flavorFilterCount">
													<c:if test="${vegNonFilter.filterTypeId==12}">
														<c:if test="${vegNonFilter.filterId==prodDetailVegNon}">
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
														type="radio" id="v_radio" value="0" name="vnv_radio">
														<span class="label-visible"> <span
															class="fake-radiobutton"></span> Veg
													</span>
												</label></li>
											</c:if>
											<c:if test="${isNonVegFound==1}">
												<li><label class="radio-button"> <input
														type="radio" value="1" id="nv_radio" name="vnv_radio">
														<span class="label-visible"> <span
															class="fake-radiobutton"></span>Non Veg
													</span>
												</label></li>
											</c:if>
										</ul>
										<div class="clr"></div>
									</div> --%>
									<!--cake-kgs-->
									
									<div class="detail_drop">
								<ul>

									<c:choose>

										<c:when test="${prodHeader.rateSettingType==0}">

											<li>
												<button type="button" value="" field="quantity"
													class="qtyminus cart"
													onclick="setQtyText(${prodHeader.productId},0,'${prodHeader.prodDetailList}')">
													<i class="fa fa-minus" aria-hidden="true"></i>
												</button> <input type="text" id="txtWt" value="1"
												style="text-align: center;" class="qty cart">
												<button type="button" value="" field="quantity"
													onclick="setQtyText(${prodHeader.productId},1,'${prodHeader.prodDetailList}')"
													class="qtyplus cart">
													<i class="fa fa-plus" aria-hidden="true"></i>
												</button>

											</li>

										</c:when>

										<c:otherwise>

											<c:if test="${prodHeader.defaultFlavorId!=0}">

												<li>Flavor <select class="select-css" name="flavor"
													id="flavor"
													onchange="setPriceByWtAndFlavour(${prodHeader.productId},${prodHeader.rateSettingType})">
														<c:forEach items="${prodHeader.flavourIds}"
															var="prodDetail">
															<c:forEach items="${flavTagStatusList}"
																var="flavorFilter" varStatus="flavorFilterCount">

																<c:if test="${flavorFilter.filterTypeId==4}">

																	<c:choose>
																		<c:when test="${prodDetail==flavorFilter.filterId}">
																			<c:choose>
																				<c:when
																					test="${prodDetail==prodHeader.defaultFlavorId}">
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
												</select></li>
											</c:if>

											<li>Weight<select class="select-css" id="weight"
												onchange="changeWeight(); setPriceByWtAndFlavour(${prodHeader.productId},${prodHeader.rateSettingType})">
													<c:forEach items="${prodHeader.availInWeights}"
														var="prodDetailwt">
														<option value="${prodDetailwt}">${prodDetailwt}</option>
													</c:forEach>
											</select></li>

										</c:otherwise>

									</c:choose>

								</ul>

								<ul> 
									<li>
										<div class="detail_price_tp">
										    <span>Price :</span>
											<i class="fa fa-inr cake_prc_detail_iclass aprice"
												aria-hidden="true"></i>

											<c:set value="${prodHeader.defaultPrice}" var="price"></c:set>
											<c:set value="1" var="defaultWt"></c:set>

											<c:choose>

												<c:when test="${prodHeader.rateSettingType == 1}">

													<c:forEach items="${prodHeader.availInWeights}" var="proWt"
														varStatus="loop" begin="0" end="0">
														<c:set value="${proWt}" var="defaultWt"></c:set>
													</c:forEach>

													<c:set value="${prodHeader.defaultPrice * defaultWt}"
														var="price"></c:set>

												</c:when>

												<c:when test="${prodHeader.rateSettingType == 2}">

													<c:forEach items="${prodHeader.availInWeights}" var="proWt"
														varStatus="loop" begin="0" end="0">
														<c:set value="${proWt}" var="defaultWt"></c:set>
													</c:forEach>

													<c:forEach items="${prodHeader.prodDetailList}"
														var="proDetail">

														<c:choose>
															<c:when
																test="${proDetail.flavorId==product.defaultFlavorId and proDetail.qty==defaultWt}">
																<c:set value="${proDetail.actualRate}" var="price"></c:set>
															</c:when>
														</c:choose>
													</c:forEach>

												</c:when>

											</c:choose>



											<p class="cake_prc_detail_pclass"
												id="newPrice${prodHeader.productId}">${price}</p>
										</div>
									</li>
								</ul>
							</div>
									
									
								</div>


								<!--right form-->
								<c:if
									test="${prodHeader.allowSpecialInstruction==1 or prodHeader.allowBasePhotoUpload==1}">
									<div class="delivery_r">
										<div class="delivery_bx">
											<h4 class="delivery_title">Delivery Details</h4>
											<div class="delivery_frm">
												<form action="" method="post">
												<c:choose>
													<c:when test="${prodHeader.allowBasePhotoUpload==1}">
														<div class="delivery_frm_l">
															<img alt="" id="del_image" style="size: portrait;"
																name="del_image" />
															<div class="inputbrowsebtn">
																<label for="img_input_btn"> <span class="fg">Upload
																		Image </span> <input type="file" accept="image/*"
																	name="img_input_btn" id="img_input_btn"
																	accept=".jpg,.png,.gif,.jpeg,.bmp"
																	onchange="loadFile(event)"> <!-- onchange="loadFile(event)" -->

																</label>
															</div>
														</div>
													</c:when>
													<c:otherwise>
													 <input style="display: none" type="file" accept="image/*"
																	name="img_input_btn" id="img_input_btn"
																	accept=".jpg,.png,.gif,.jpeg,.bmp"
																	onchange="loadFile(event)">
													</c:otherwise>
													</c:choose>

													<div class="delivery_frm_r">
														<c:if test="${prodHeader.allowSpecialInstruction==1}">

															<div class="delivery_txtarea" style="display: none">
																<textarea name="" cols="" id="sp_inst" name="sp_inst"
																	rows="3" class="input_txt"
																	placeholder="Special Instructon">NA</textarea>
															</div>


														</c:if>

														<c:if test="${prodHeader.allowMsgOnCake==1}">

															<div class="a">
																<input name="" type="text" id="msg_on_cake"
																	name="msg_on_cake" class="input_txt"
																	placeholder="Message / Name on the Cake" />
															</div>

														</c:if>
													</div>




													<div class="clr"></div>
												</form>
											</div>
										</div>
									</div>
								</c:if>
								<div class="clr"></div>
							</div>

							 

							<div class="button_row btm">
								<a href="javascript:void(0)" class="cart_button"
									onclick="addCart(${prodHeader.productId},${prodHeader.rateSettingType})">Add
									To Cart</a> <a onclick="addCart(${prodHeader.productId},${prodHeader.rateSettingType})" href="${pageContext.request.contextPath}/checkout"
									class="buy_button">Buy Now</a>
								<div class="clr"></div>
							</div>

							<!--mobile-buttons-->
							<div class="mobile_button">
								<a href="javascript:void(0)" class="mobile_cart"
									onclick="addCart(${prodHeader.productId},${prodHeader.rateSettingType})">Add
									To Cart</a> <a onclick="addCart(${prodHeader.productId},${prodHeader.rateSettingType})" href="${pageContext.request.contextPath}/checkout"
									class="mobile_buy">Buy Now</a>
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

								<c:if test="${prodHeader.defaultFlavorId!=0}">
									<li><i class="fa fa-circle" aria-hidden="true"></i> Cake
										Flavor: ${prodHeader.flavorNames}</li>
								</c:if>
								<c:if test="${prodHeader.prodTypeId!=0}">
									<li><i class="fa fa-circle" aria-hidden="true"></i> Type
										of Cake: ${prodHeader.prodTypeName}</li>
								</c:if>
								<c:if test="${prodHeader.typeOfBread!=0}">
									<li><i class="fa fa-circle" aria-hidden="true"></i> Type
										of Bread: ${prodHeader.breadTypeName}</li>
								</c:if>
								<c:if test="${prodHeader.typeOfCream!=0}">
									<li><i class="fa fa-circle" aria-hidden="true"></i> Type
										of cream: ${prodHeader.creamTypeName}</li>
								</c:if>
								<c:if test="${prodHeader.layeringCream!=0}">
									<li><i class="fa fa-circle" aria-hidden="true"></i>
										Filling in Layers: ${prodHeader.layeringCreamNames}</li>
								</c:if>
								<c:if test="${prodHeader.toppingCream!=0}">
									<li><i class="fa fa-circle" aria-hidden="true"></i>
										Toppings: ${prodHeader.toppingCreamNames}</li>
								</c:if>
								
								<c:if test="${prodHeader.defaultShapeId!=0}">
									<li><i class="fa fa-circle" aria-hidden="true"></i>
										Shapes: ${prodHeader.shapeNames}</li>
								</c:if>
								
								
								
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
							<c:set value="0" var="is_related"></c:set>
							<li>
							<c:forEach items="${relateItemArray}" var="relProdId"
							varStatus="prodCount">
							<c:if test="${relProdId==product.productId}">
							<c:set value="1" var="is_related"></c:set>
							</c:if>
							</c:forEach>
							<c:if test="${is_related==1}">
								<div class="cake_one product_padd">
									<div class="cake_pic">
									<a href="${pageContext.request.contextPath}/showProductDetail/${product.productId}">
										<img src="${prodImgUrl}${product.prodImagePrimary}" alt=""
											class="mobile_fit transition"></a>
											
										<%-- <div class="circle_tag">
											<img
												src="${pageContext.request.contextPath}/resources/images/heart-1.svg"
												alt=""> <img
												src="${pageContext.request.contextPath}/resources/images/heart.svg"
												alt="">
										</div> --%>
										
										<div class="purity_icn">
														<c:choose>
															<c:when test="${product.vegNonvegName eq 'VEG'}">
																<img src="#" class="lazy" id="veg${product.productId}"
																	data-src="${pageContext.request.contextPath}/resources/images/veg_icn.jpg"
																	alt="">
															</c:when>
															<c:when test="${product.vegNonvegName eq 'NON-VEG'}">
																<img src="#" class="lazy"
																	id="nonveg${product.productId}"
																	data-src="${pageContext.request.contextPath}/resources/images/nonveg_icn.jpg"
																	alt="">
															</c:when>
															<c:otherwise>
																<img src="#" class="lazy" id="veg${product.productId}"
																	data-src="${pageContext.request.contextPath}/resources/images/veg_icn.jpg"
																	alt="">
																<img src="#" class="lazy"
																	id="nonveg${product.productId}"
																	data-src="${pageContext.request.contextPath}/resources/images/nonveg_icn.jpg"
																	alt="">
															</c:otherwise>
														</c:choose>
													</div>
													
										<div class="circle_tag active"
														onclick="setLike(${product.productId},${product.isLike})">
														<c:choose>
														
														<c:when test="${product.isLike==0}">
														 <img src="#" class="lazy" id="like${product.productId}"
															data-src="${pageContext.request.contextPath}/resources/images/heart-1.svg"
															alt="">
															
														</c:when>
														<c:when test="${product.isLike==1}">
														<img src="#" class="lazy" id="like${product.productId}"
															data-src="${pageContext.request.contextPath}/resources/images/heart.svg"
															alt="">
														</c:when>
														
														</c:choose>
														
														
													</div>
													
										<div class="cake_prc">
											<i class="fa fa-inr cake_prc_detail_iclass"
												aria-hidden="true"></i>
											<p class="cake_prc_detail_pclass" id="cake_prc">${product.defaultPrice}</p>
											<span class="off_prc" id="off_prc"><i
												class="fa fa-inr" aria-hidden="true"></i></span> <span
												class="prc_off" id="prc_off"></span>
										</div>
										
									</div>

									<div class="cake_container">
										<h4 class="cake_nm single_row">
											<a 
												href="${pageContext.request.contextPath}/showProdDetail/${prodCount.index}">${product.productName}</a>
											<input type="hidden" id="prodIdText"
												value="${product.productId}" />
										</h4>
									</div>
								</div>
								</c:if>
							</li>
						</c:forEach>
					</ul>
					<div class="more_product" style="display: none;">
						<a href="#">Load More Products</a>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!--testimonial-box-->
	<%-- <div class="testimonial_bx">
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
		<canvas id="canvas-element"></canvas>
	</div> --%>





	<!-- bottom -->
	<jsp:include page="/WEB-INF/views/include/bottomMenu.jsp"></jsp:include>
<script type="text/javascript">
function setLike(id,isLike) {
	
	if(parseInt(isLike)==0){
		document.getElementById("like"+id).src = "${pageContext.request.contextPath}/resources/images/heart.svg";
	}else{
		document.getElementById("like"+id).src = "${pageContext.request.contextPath}/resources/images/heart-1.svg";
	} 	
	$.getJSON(
			'${setLikeOrDislike}',
			{
				prodId : id,
				ajax : 'true'
			},
			function(data) {
				//alert(JSON.stringify(data));
				
				if(data.msg ==1){
					document.getElementById("like"+id).src = "${pageContext.request.contextPath}/resources/images/heart.svg";
					
				}else{
					document.getElementById("like"+id).src = "${pageContext.request.contextPath}/resources/images/heart-1.svg";
					
				}
				setLikeCount(data.statusText);
			}); 
	
}
</script>
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
	document.getElementById("prod_disc").style.paddingTop = "135px";
}
	var loadFile = function(event) {
	 document.getElementById('del_image').style.display="none";
	 try {
		var image = document.getElementById('del_image');
		image.src = URL.createObjectURL(event.target.files[0]);
		document.getElementById('del_image').style="display:block"
			//postFilesData(event.target.files[0]);
			var imgName=makeUniqueString(7);
			var prodIdText=document.getElementById('prodId').value
			imgName=imgName+"_"+prodIdText;
			//alert(imgName);
			var imgFile = $('#img_input_btn')[0].files[0];
				  var imgCanvas = document.getElementById('canvas-element'),
		       		 imgContext = imgCanvas.getContext("2d");
			
			    var img = document.getElementById('del_image');
			    imgCanvas.width = (img.width/4);
			    imgCanvas.height = (img.height/4);

			    // Draw image into canvas element
			    imgContext.drawImage(img, 0, 0, (img.width), (img.height));
			    // Get canvas contents as a data URL
			    var imgAsDataURL = imgCanvas.toDataURL("image/png");
			//postFilesData();
	 } catch(err) {
		 console.log(err);
		}
	 //bulkImageUpload();
	};
	//function x(){
		if (window.File && window.FileReader && window.FileList && window.Blob) {
			  document.getElementById('img_input_btn').addEventListener('change', handleFileSelect, false);
			} else {
			  alert('The File APIs are not fully supported in this browser.');
			}
			function handleFileSelect(evt) {
				 var base64String;
				var imgName=makeUniqueString(7);
				var prodIdText=document.getElementById('prodId').value;
				imgName=imgName+"_"+prodIdText;
				
				
				var wt=document.getElementById('weight').value;
				
				
				
				var f = evt.target.files[0]; // FileList object
			  var reader = new FileReader();
			  // Closure to capture the file information.
			  reader.onload = (function(theFile) {
			    return function(e) {
			      var binaryData = e.target.result;
			      //Converting Binary Data to base 64
			      base64String = window.btoa(binaryData);
			      //showing file converted to base64
			     // document.getElementById('base64').value = base64String;
			      var src = $('#img_input_btn').val(); // "static/images/banner/blue.jpg"
			      var tarr = src.split('.');      // ["static","images","banner","blue.jpg"]
			      var imgExt =tarr[tarr.length-1] //file.split('.')[0];  // "blue"
			     
			      if (sessionStorage.getItem("prodImageList") == null) {
						var table = [];
						sessionStorage.setItem("prodImageList", JSON
								.stringify(table));
					}
				/*   var cartValue = sessionStorage .getItem("prodImageList");
					var table = $.parseJSON(cartValue);
					isFound=0;
					for(var i=0;i<table.length;i++){
						if(parseInt(prodIdText)==parseInt(table[i].itemId) && wt == table[i].weight){
							isFound=0;
							table.splice(i);
							break;
						}
					}
					
					
					var uniq = (new Date()).getTime();
					
					if(parseInt(isFound)==0){
					table.push({
						itemId : prodIdText,
						imgName : imgName+"."+imgExt,
						//imgFile : imgAsDataURL
						imgFile : base64String,
						weight : wt,
						uniqueId : uniq
					});
					} */
					
					var uniq = (new Date()).getTime();
					
					var obj={
							itemId : prodIdText,
							imgName : imgName+"."+imgExt,
							//imgFile : imgAsDataURL
							imgFile : base64String,
							weight : wt,
							uniqueId : uniq
						};
					
					
					sessionStorage.setItem("prodImageList", JSON
							.stringify(obj));
					//bulkImageUpload();
			    };
			  })(f);
			  // Read in the image file as a data URL.
			  reader.readAsBinaryString(f);
			}
			//the below makeUniqueString function used in function handleFileSelect(evt)
	function makeUniqueString(length) {
		   var result           = '';
		   var characters       = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
		   var charactersLength = characters.length;
		   for ( var i = 0; i < length; i++ ) {
		      result += characters.charAt(Math.floor(Math.random() * charactersLength));
		   }
		   return result;
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
	<script type="text/javascript">
	function setPriceByWtAndFlavour(id,type) {
		
		//alert(id+"      "+type)
		
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
		
		//alert(selectWt+"          "+selectFlav)
		
		if (sessionStorage.getItem("allItemList") == null) {
			var table = [];
			sessionStorage.setItem("allItemList", JSON.stringify(table));
		}

		var allItemList = sessionStorage.getItem("allItemList");
		var allItemArr = $.parseJSON(allItemList);

		var rate=0;
		
		for(var i=0;i<allItemArr.length;i++){
			if(allItemArr[i].productId==id){
				rate=parseFloat(allItemArr[i].defaultPrice);
			}
		}
		
		for(var i=0;i<allItemArr.length;i++){
			if(allItemArr[i].productId==id){
				for(var j=0;j<allItemArr[i].prodDetailList.length;j++){
					if(allItemArr[i].prodDetailList[j].flavorId==selectFlav && type==1){
						rate=parseFloat(allItemArr[i].prodDetailList[j].actualRate);
						break;
					}else if(allItemArr[i].prodDetailList[j].flavorId==selectFlav && allItemArr[i].prodDetailList[j].qty==selectWt && type==2){
						rate=parseFloat(allItemArr[i].prodDetailList[j].actualRate);
						break;
					}
				}
			}
		}
		
		if(type==1){
			rate=rate*parseFloat(selectWt);
		}
		
		document.getElementById("newPrice"+id).innerHTML=rate.toFixed(1);
		
	}
	
	</script>
	<script type="text/javascript">
		function addCart(id,type) {
			
			var selectFlav = 0;
			
			var selectWt = 0;
			
			var selFlvName ="";
			
			if(type == 0){
				selectWt = document.getElementById("txtWt").value;	
			}else if(type == 1 || type == 2){
				selectWt = document.getElementById("weight").value;
				
				try {
					selectFlav = document.getElementById("flavor").value;
					
					var docFlv = document.getElementById("flavor");
					selFlvName = docFlv.options[docFlv.selectedIndex].text;
					
				} catch (e) {
					selectFlav = 0;
				}
				if (selectFlav == "" || isNaN(selectFlav) || selectFlav == null) {
					selectFlav = 0;
				}
			}
			
				
				
				var prodMaster;
				
				if (sessionStorage.getItem("allItemList") == null) {
					var table = [];
					sessionStorage.setItem("allItemList", JSON.stringify(table));
				}
		
				var allItemList = sessionStorage.getItem("allItemList");
				var prodHead = $.parseJSON(allItemList);
				
				//alert("dfdfd "+prodHead )
				
				
				for (var h = 0; h < prodHead.length; h++) {
					if (parseInt(id) == parseInt(prodHead[h].productId)) {
						prodMaster = prodHead[h];
						break;
					}
				}
				
				var prodDetail = prodMaster.prodDetailList;
				//alert(prodDetail)
				
				var actualRate=0;
				var calRate=0;
				var displayRate=0;
				var configDetailId=0;
				var flvId=0;
				var isVeg=0;
				var shapeId=0;
				var flvName=selFlvName;
				
				var qty = 1;
				
				var uniq = (new Date()).getTime();
				//alert(uniq)
						
				 for (var d = 0; d < prodDetail.length; d++) {
					
					if(type == 0){
						
						qty=selectWt;
						
						calRate=prodDetail[d].actualRate*selectWt;
						actualRate=prodDetail[d].actualRate;
						displayRate=prodDetail[d].displayRate;
						configDetailId=prodDetail[d].configDetailId;
						flvId=prodDetail[d].flavorId;
						isVeg=prodDetail[d].isVeg;
						shapeId=prodDetail[d].shapeId;
						
						break;
							
					}else if(type == 1){
						
						if (parseInt(prodDetail[d].flavorId) == parseInt(selectFlav)) {
							
							
							//alert("Shape = "+parseInt(prodDetail[d].shapeId)+"             Flv = "+parseInt(selectFlav))
							
							//alert("1  - "+prodDetail[d].configDetailId)
							
							calRate=prodDetail[d].actualRate*selectWt;
							actualRate=prodDetail[d].actualRate;
							displayRate=prodDetail[d].displayRate;
							configDetailId=prodDetail[d].configDetailId;
							flvId=prodDetail[d].flavorId;
							isVeg=prodDetail[d].isVeg;
							shapeId=prodDetail[d].shapeId;
							
							break;
		
						}
						
					} else if(type == 2){
						
						if (parseInt(prodDetail[d].flavorId) == parseInt(selectFlav) && parseFloat(selectWt) == parseFloat(prodDetail[d].qty)) {
							
							calRate=prodDetail[d].actualRate;
							actualRate=prodDetail[d].actualRate;
							displayRate=prodDetail[d].displayRate;
							configDetailId=prodDetail[d].configDetailId;
							flvId=prodDetail[d].flavorId;
							isVeg=prodDetail[d].isVeg;
							shapeId=prodDetail[d].shapeId;
							
							break;
		
						}
						
					} 
		
				}
				 
				
				
				
				var priceDiff = parseFloat(displayRate)
						- parseFloat(actualRate);
				
				offPer = (parseFloat(priceDiff)
						/ parseFloat(displayRate) * 100);
		
				taxableAmt = calRate;
		
				cgstAmt = ((calRate) * parseFloat(prodMaster.cgstPer)) / 100;
				sgstAmt = ((calRate) * parseFloat(prodMaster.sgstPer)) / 100;
				igstAmt = ((calRate) * parseFloat(prodMaster.igstPer)) / 100;
		
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
				
				if(type==0){
					calRate=actualRate;
				}
				
				var spInst=document.getElementById("sp_inst").value;
				var msgonCake =document.getElementById("msg_on_cake").value;
				
				if (sessionStorage.getItem("cartValue") == null) {
					var table = [];
					sessionStorage.setItem("cartValue", JSON.stringify(table));
				}
		
				var cartValue = sessionStorage.getItem("cartValue");
				var cartArray = $.parseJSON(cartValue);
				
				
				  if (sessionStorage.getItem("prodImageList") == null) {
						var table = [];
						sessionStorage.setItem("prodImageList", JSON
								.stringify(table));
					} 
			   		
				var imgValue = sessionStorage .getItem("prodImageList");
				var imgObj = $.parseJSON(imgValue);
				
				var imgFile="";
				var imgName="";
				if(id==imgObj.itemId){
					imgFile=imgObj.imgFile;
					imgName=imgObj.imgName;
				}
				
				var index=0,itemFound=0;
				
				for(var i=0; i<cartArray.length;i++){
					if(configDetailId==cartArray[i].exInt1 && type==0){
						index=i;
						itemFound=1;
						imgFile : cartArray[i].imgFile;
						imgName : cartArray[i].imgName;
						break;
					}else if(selectWt==cartArray[i].weight && configDetailId==cartArray[i].exInt1){
						//alert("asasas")
						index=i;
						itemFound=1;
						imgFile : cartArray[i].imgFile;
						imgName : cartArray[i].imgName;
						break;
					}
					//alert(selectWt+"      "+cartArray[i].qty+"         Type - "+type)
					
					/* if(configDetailId==cartArray[i].exInt1 && type==0){
						index=i;
						itemFound=1;
						break;
					}else if(selectWt==cartArray[i].weight && configDetailId==cartArray[i].exInt1){
						//alert("asasas")
						index=i;
						itemFound=1;
						break;
					} */
					/* else if(configDetailId==cartArray[i].exInt1){
						index=i;
						itemFound=1;
						break;
					} */
				}
				
				var obj={
						uniqueId : uniq,
						orderDetailId : 0,
						orderId : 0,
						itemId : prodMaster.productId,
						hsnCode : prodMaster.hsnCode,
						qty : qty,
						mrp : displayRate,
						rate : calRate,
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
						exInt1 : configDetailId,
						exInt2 : flvId,
						exInt3 : isVeg,
						exInt4 : shapeId,
						exVar1 : prodMaster.productName,
						exVar2 : '',
						exVar3 : '',
						exVar4 : '',
						exFloat1 : 1,
						exFloat2 : 1,
						exFloat3 : 1,
						exFloat4 : 1,
						weight : selectWt,
						veg : "",
						rateSettingType : type,
						flvName : flvName,
						imgFile : imgFile,
						imgName : imgName,
						spInst : spInst,
						msgonCake : msgonCake
					}
				
				
				
				if(itemFound==1){
					table[index]=obj;
				}else{
					table.push(obj);	
				}
				
				var tableClear = [];
				sessionStorage.setItem("prodImageList", JSON
						.stringify(tableClear));
				
				sessionStorage.setItem("cartValue", JSON
						.stringify(table));
				appendCartData();
				openNav();
			  	setTimeout(function(){ closeNav(); }, 4000);
			  	
		} 
		</script>
		<script type="text/javascript">
		function changeWeight(){
			document.getElementById("img_input_btn").value = "";
			//document.getElementById('del_image').style="display:none";
		}
		</script>
		<script type="text/javascript">
		function setQtyText(id, type) {

			/* type  :  0 - minus,  1 - plus */
			
			var wt=document.getElementById("txtWt").value;
		//alert(id+"    "+type+ "     "+wt)
		
		//alert(detailList);
			
			if(type==0){
			
				var newWt=wt+1;
				if(wt>1 && wt<=10){
					wt=parseInt(wt)-1;
				}
				
			}
			
			else if(type==1){
				if(wt>=1 && wt<10){
					wt=parseInt(wt)+1;
				}
			}
			
			document.getElementById("txtWt").value=wt;
			
			
			if (sessionStorage.getItem("allItemList") == null) {
				var table = [];
				sessionStorage.setItem("allItemList", JSON.stringify(table));
			}

			var allItemList = sessionStorage.getItem("allItemList");
			var allItemArr = $.parseJSON(allItemList);

			var rate=0;
			
			for(var i=0;i<allItemArr.length;i++){
				
				if(allItemArr[i].productId==id){
			
					rate=parseFloat(allItemArr[i].prodDetailList[0].actualRate);
				}
				
			}
			
			rate=rate*wt;
			
			document.getElementById("newPrice"+id).innerHTML=rate.toFixed(1);
			

		}


	</script>




</body>

</html>