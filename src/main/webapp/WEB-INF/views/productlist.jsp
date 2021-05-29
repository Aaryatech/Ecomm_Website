<!-- this is mohsins product filter page -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<jsp:include page="/WEB-INF/views/include/metacssjs.jsp"></jsp:include>

<body>
<c:url value="/setLikeOrDislike" var="setLikeOrDislike"></c:url>

	<%-- <!--mongi help-popup-->
	<div class="mongi_help">
		<a href="#mongi" class="initialism mongi_open"><img
			src="${pageContext.request.contextPath}/resources/images/mongi_help.png"
			alt=""></a>
	</div>

	<!--apply now pop up-->
	<div id="mongi" class="well">
		<div class="mongi_title">
			<span><a href="javascript:void(0)" onclick="resetAllTags()">
					Clear</a></span> Select Our Best Filter
			<div class="mongi_close close_pop">
				<i class="fa fa-times" aria-hidden="true"></i>
			</div>
		</div>

		<div class="mongi_cont">
			<ul class="ks-cboxtags">
				<c:forEach items="${flavTagStatusList}" var="tags">
					<c:if test="${tags.filterTypeId == 7}">
						<li><input type="checkbox" id="chkTag${tags.filterId}"
							onchange="searchByTags()" value="${tags.adminName}"
							class="resetTags"><label for="chkTag${tags.filterId}">${tags.adminName}</label></li>
					</c:if>
				</c:forEach>
			</ul>
		</div>

		<div class="proceend_bnt">
			<a href="javascript:void(0)" onclick="itemSearchByTagFilter()" class="proceed_btn">Proceed</a>
		</div>

	</div>
	<script type="text/javascript">
		$(document).ready(function() {
			$('#mongi').popup();
		});
	</script> --%>


	<!-- TAGS -->
	<%-- <jsp:include page="/WEB-INF/views/include/tags.jsp"></jsp:include> --%>
	<!-- TAGS End -->

	<!-- Header -->
	<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
	<!-- Header End -->

	<div class="mega_menu_row">

		<div class="wrapper">

			<div id="menuzord" class="menuzord red menuzord-responsive">
				<ul
					class="menuzord-menu me#menusnuzord-right menuzord-indented scrollable">


					<li><a href="#" class="same_day">Same Day Delivery</a></li>

					<c:forEach items="${allData.catFilterConfig}" var="menuCat">

						<li><a href="#">${menuCat.exVar2} <span><i
									class="fa fa-angle-down" aria-hidden="true"></i></span></a> <!--cake dropdown-->

							<c:if test="${menuCat.exInt2==1}">
								<c:set value="dropdown" var="row_class"></c:set>
							</c:if> <c:if test="${menuCat.exInt2==2}">
								<c:set value="megamenu two-row" var="row_class"></c:set>
							</c:if> <c:if test="${menuCat.exInt2==3}">
								<c:set value="megamenu three-row" var="row_class"></c:set>

							</c:if> <c:if test="${menuCat.exInt2==4}">
								<c:set value="megamenu four-row" var="row_class"></c:set>
							</c:if> <c:if test="${menuCat.exInt2>4}">
								<c:set value="megamenu full-row" var="row_class"></c:set>
							</c:if>
							<ul class="${row_class}">
								<div class="four_row_dropdown">
									<!--row-1-->
									<div class="row_one">
										<ul class="drop_mainmenu">

											<li>By Price</li>

											<li><label class="radio_menu">Under 499 <input
													type="radio" id="radioPrice" value="0-499"
													name="radioPrice" class="menuPrice"> <span
													class="checkmark"></span>
											</label></li>

											<li><label class="radio_menu">500 to 599 <input
													type="radio" id="radioPrice" value="500-599"
													name="radioPrice" class="menuPrice"> <span
													class="checkmark"></span>
											</label></li>

											<li><label class="radio_menu">600 to 999 <input
													type="radio" id="radioPrice" value="600-999"
													name="radioPrice" class="menuPrice"> <span
													class="checkmark"></span>
											</label></li>

											<li><label class="radio_menu">1000 to 1999 <input
													type="radio" id="radioPrice" value="1000-1999"
													name="radioPrice" class="menuPrice"> <span
													class="checkmark"></span>
											</label></li>

											<li><label class="radio_menu">Above 2000 <input
													type="radio" id="radioPrice" value="2000-10000"
													name="radioPrice" class="menuPrice"> <span
													class="checkmark"></span>
											</label></li>

										</ul>
									</div>

									<%-- ${menuCat.typeIdList} --%>
									<%-- ${allFilterTypeList} --%>

									<c:forEach items="${menuCat.typeIdList}" var="menuTypeList">

										<c:forEach items="${allFilterTypeList}" var="filterType">

											<c:choose>

												<c:when test="${menuTypeList == filterType.filterTypeId}">

													<div class="row_one">
														<ul class="drop_mainmenu">
															<li>${filterType.filterTypeName}</li>

															<c:forEach items="${allFilterList}" var="filter">

																<c:choose>

																	<c:when
																		test="${filterType.filterTypeId == filter.filterTypeId}">

																		<li><label class="check_menu"> <input
																				type="checkbox"
																				value="${filter.adminName}~${filter.filterTypeId}"
																				class="menuFilter"> <span
																				class="checkmark_check"></span> ${filter.adminName}
																		</label> <%-- <input type="checkbox" class="menuFilter"
																			value="${filter.adminName}"><span>${filter.adminName}</span> --%></li>

																	</c:when>

																</c:choose>

															</c:forEach>

															<!-- <li><a href="#"> Chocolate Cakes </a></li>
															<li><a href="#"> Red Velvet Cakes </a></li>
															<li><a href="#"> Black Forest Cakes </a></li>
															<li><a href="#"> Butter Scotch Cakes </a></li>
															<li><a href="#"> Strawberry Cakes </a></li>  -->

														</ul>
													</div>

												</c:when>
											</c:choose>

										</c:forEach>

									</c:forEach>

									<!-- proceed_btn -->
									<a href="javascript:void(0)" class="drop_search"
										onclick="searchMenu(${menuCat.cateId})">Search</a>

								</div>
							</ul></li>

					</c:forEach>

				</ul>
			</div>

		</div>


		<div class="arrow_right">
			<ul>
				<li><a href="javascript:void(0)" onclick="priceSort(1)"><i
						class="fa fa-arrow-up" aria-hidden="true"></i></a></li>
				<li><a href="javascript:void(0)" onclick="priceSort(0)"><i
						class="fa fa-arrow-down" aria-hidden="true"></i></a></li>
			</ul>
		</div>
	</div>

	<!-- mega menu -->
	<!-- <div class="mega_menu_row">

		<div class="wrapper">

			<div id="menuzord" class="menuzord red menuzord-responsive">
				<div class="showhide32"></div>
				<ul
					class="menuzord-menu me#menusnuzord-right menuzord-indented scrollable">


					<li><a href="#" class="same_day">Same Day Delivery </a></li>

					four colum dropdown
					<li><a href="#">Cakes <span><i
								class="fa fa-angle-down" aria-hidden="true"></i></span></a> cake dropdown
						<ul class="megamenu four-row">
							<div class="four_row_dropdown">
								row-1
								<div class="row_one">
									<ul class="drop_mainmenu">
										<li>By Price</li>
										<li><a href="#"> Under 499 </a></li>
										<li><a href="#"> 500 to 599 </a></li>
										<li><a href="#"> 600 to 999 </a></li>
										<li><a href="#"> 1000 to 1999 </a></li>
										<li><a href="#"> Above 2000 </a></li>
									</ul>
								</div>



								row-2
								<div class="row_one">
									<ul class="drop_mainmenu">
										<li>Cakes By Flavour</li>
										<li><a href="#"> Chocolate Cakes </a></li>
										<li><a href="#"> Red Velvet Cakes </a></li>
										<li><a href="#"> Black Forest Cakes </a></li>
										<li><a href="#"> Butter Scotch Cakes </a></li>
										<li><a href="#"> Strawberry Cakes </a></li>
									</ul>
								</div>

								row-3
								<div class="row_one">
									<ul class="drop_mainmenu">
										<li>Cakes By Shape</li>
										<li><a href="#"> Tier Cakes </a></li>
										<li><a href="#"> Barbie Doll Cakes </a></li>
										<li><a href="#"> Minion Cakes </a></li>
										<li><a href="#"> Spiderman Cakes </a></li>
										<li><a href="#"> Mickey Mouse Cakes </a></li>
									</ul>
								</div>

								row-4
								<div class="row_one">
									<ul class="drop_mainmenu">
										<li>Cakes By Type</li>
										<li><a href="#"> Eggless Cakes </a></li>
										<li><a href="#"> Midnight Cakes </a></li>
										<li><a href="#"> Kids Cakes </a></li>
										<li><a href="#"> Photo Cakes </a></li>
										<li><a href="#"> Premium Cakes </a></li>
									</ul>
								</div>
							</div>
						</ul></li>

					three-colum dropdown
					<li><a href="#">Pastries <span><i
								class="fa fa-angle-down" aria-hidden="true"></i></span></a>
						<ul class="megamenu three-row">
							<div class="four_row_dropdown">
								1
								<div class="three_one">
									<ul class="drop_mainmenu">
										<li>By Price</li>
										<li><a href="#"> Under 499 </a></li>
										<li><a href="#"> 500 to 699 </a></li>
										<li><a href="#"> 700 to 999 </a></li>
										<li><a href="#"> 1000 to 1999 </a></li>
										<li><a href="#"> Above 2000 </a></li>
									</ul>
								</div>

								2
								<div class="three_one">
									<ul class="drop_mainmenu">
										<li>By Type</li>
										<li><a href="#"> All Flowers </a></li>
										<li><a href="#"> Roses </a></li>
										<li><a href="#"> Gerberas </a></li>
										<li><a href="#"> Lilies </a></li>
										<li><a href="#"> Orchids </a></li>
									</ul>
								</div>

								1
								<div class="three_one">
									<ul class="drop_mainmenu">
										<li>By Color</li>
										<li><a href="#"> Red Flowers </a></li>
										<li><a href="#"> Yellow Flowers </a></li>
										<li><a href="#"> Purple Flowers </a></li>
										<li><a href="#"> Pink Flowers </a></li>
										<li><a href="#"> White Flowers </a></li>
									</ul>
								</div>
							</div>
						</ul></li>

					<li><a href="#">Savories <span><i
								class="fa fa-angle-down" aria-hidden="true"></i></span></a> combos dropdown
						<ul class="megamenu four-row">
							<div class="four_row_dropdown">
								row-1
								<div class="row_one">
									<ul class="drop_mainmenu">
										<li>By Price</li>
										<li><a href="#"> Under 499 </a></li>
										<li><a href="#"> 500 to 599 </a></li>
										<li><a href="#"> 600 to 999 </a></li>
										<li><a href="#"> 1000 to 1999 </a></li>
										<li><a href="#"> Above 2000 </a></li>
									</ul>
								</div>



								row-2
								<div class="row_one">
									<ul class="drop_mainmenu">
										<li>Cakes By Flavour</li>
										<li><a href="#"> Chocolate Cakes </a></li>
										<li><a href="#"> Red Velvet Cakes </a></li>
										<li><a href="#"> Black Forest Cakes </a></li>
										<li><a href="#"> Butter Scotch Cakes </a></li>
										<li><a href="#"> Strawberry Cakes </a></li>
									</ul>
								</div>

								row-3
								<div class="row_one">
									<ul class="drop_mainmenu">
										<li>Cakes By Shape</li>
										<li><a href="#"> Tier Cakes </a></li>
										<li><a href="#"> Barbie Doll Cakes </a></li>
										<li><a href="#"> Minion Cakes </a></li>
										<li><a href="#"> Spiderman Cakes </a></li>
										<li><a href="#"> Mickey Mouse Cakes </a></li>
									</ul>
								</div>

								row-4
								<div class="row_one">
									<ul class="drop_mainmenu">
										<li>Cakes By Type</li>
										<li><a href="#"> Eggless Cakes </a></li>
										<li><a href="#"> Midnight Cakes </a></li>
										<li><a href="#"> Kids Cakes </a></li>
										<li><a href="#"> Photo Cakes </a></li>
										<li><a href="#"> Premium Cakes </a></li>
									</ul>
								</div>
							</div>
						</ul></li>
					<li><a href="#">Packaged Cakes <span><i
								class="fa fa-angle-down" aria-hidden="true"></i></span></a> chocolates dropdown
						<ul class="megamenu two-row">
							<div class="four_row_dropdown">
								row-1
								<div class="two_one">
									<ul class="drop_mainmenu">
										<li>By Price</li>
										<li><a href="#"> Under 399 </a></li>
										<li><a href="#"> 400 to 599 </a></li>
										<li><a href="#"> 600 to 999 </a></li>
										<li><a href="#"> 1000 to 1999 </a></li>
										<li><a href="#"> Above 2000 </a></li>
									</ul>
								</div>



								row-2
								<div class="two_one">
									<ul class="drop_mainmenu">
										<li>By Type</li>
										<li><a href="#"> All Chocolates </a></li>
										<li><a href="#"> Chocolates Combos </a></li>
										<li><a href="#"> Chocolate Bouquet </a></li>
										<li><a href="#"> Cadbury Chocolates </a></li>
										<li><a href="#"> Sugar Free Chocolates </a></li>
									</ul>
								</div>


							</div>
						</ul></li>
					full-row dropdown
					<li><a href="#">Chocolates <span><i
								class="fa fa-angle-down" aria-hidden="true"></i></span></a> chocolates dropdown
						<ul class="megamenu full-row">
							<div class="four_row_dropdown">
								row-1
								<div class="full_divid">
									<ul class="drop_mainmenu">
										<li>By Price</li>
										<li><a href="#"> Under 499 </a></li>
										<li><a href="#"> 500 to 699 </a></li>
										<li><a href="#"> 700 to 999 </a></li>
										<li><a href="#"> 1000 to 1999 </a></li>
										<li><a href="#"> Under 499 </a></li>
										<li><a href="#"> 500 to 699 </a></li>
										<li><a href="#"> 700 to 999 </a></li>
										<li><a href="#"> 1000 to 1999 </a></li>
									</ul>
								</div>

								row-2
								<div class="full_divid">
									<ul class="drop_mainmenu">
										<li>By Recipient</li>
										<li><a href="#"> Gifts for girls </a></li>
										<li><a href="#"> Gifts for girlfriend </a></li>
										<li><a href="#"> Gifts for her </a></li>
										<li><a href="#"> Gifts for wife </a></li>
										<li><a href="#"> Gifts for sister </a></li>
										<li><a href="#"> Gifts for mother </a></li>
										<li><a href="#"> Gifts for daughter </a></li>
										<li><a href="#"> Gifts for fiancee </a></li>
									</ul>
								</div>

								row-3
								<div class="full_divid">
									<ul class="drop_mainmenu">
										<li>By Recipient</li>
										<li><a href="#"> Gifts for boys </a></li>
										<li><a href="#"> Gifts for boyfriend </a></li>
										<li><a href="#"> Gifts for him </a></li>
										<li><a href="#"> Gifts for husband </a></li>
										<li><a href="#"> Gifts for brother </a></li>
										<li><a href="#"> Gifts for father </a></li>
										<li><a href="#"> Gifts for son </a></li>
										<li><a href="#"> Gifts for fiance </a></li>
									</ul>
								</div>

								row-4
								<div class="full_divid">
									<ul class="drop_mainmenu">
										<li>By Type</li>
										<li><a href="#"> All gifts </a></li>
										<li><a href="#"> Handbags </a></li>
										<li><a href="#"> Clutches </a></li>
										<li><a href="#"> Scented Candles </a></li>
										<li><a href="#"> Metallic Utensils </a></li>
										<li><a href="#"> Jewellery </a></li>
										<li><a href="#"> Gold Plated Gifts </a></li>
										<li><a href="#"> Home Decor Gifts </a></li>
									</ul>
								</div>

								row-5
								<div class="full_divid">
									<ul class="drop_mainmenu">
										<li>By Type</li>
										<li><a href="#"> Gift Baskets </a></li>
										<li><a href="#"> Scarfs </a></li>
										<li><a href="#"> Men Accessories </a></li>
										<li><a href="#"> Artificial Plants </a></li>
										<li><a href="#"> Electric Diffusers </a></li>
										<li><a href="#"> Soft toys </a></li>
										<li><a href="#"> Crystal Gifts </a></li>
										<li><a href="#"> Greeting Cards </a></li>
									</ul>
								</div>

								row-6
								<div class="full_divid">
									<ul class="drop_mainmenu">
										<li>Personalised Gifts</li>
										<li><a href="#"> All Personalised Gifts </a></li>
										<li><a href="#"> Personalised Mugs </a></li>
										<li><a href="#"> Personalised Cushions </a></li>
										<li><a href="#"> Personlised Tshirts </a></li>
										<li><a href="#"> Personalised Keychains </a></li>
										<li><a href="#"> Personalised Beer Mugs </a></li>
										<li><a href="#"> Personalised Jewellery </a></li>
										<li><a href="#"> Personalised Chocolates </a></li>
									</ul>
								</div>


							</div>
						</ul></li>

					<li><a href="#">Bakersware <span><i
								class="fa fa-angle-down" aria-hidden="true"></i></span></a> anniversary-dropdown
						<ul class="dropdown">
							<li><a href="#"> Anniversary Gifts </a></li>
							<li><a href="#"> Anniversary Cakes </a></li>
							<li><a href="#"> Anniversary Flowers </a></li>
							<li><a href="#"> First Anniversary Cakes </a></li>
							<li><a href="#"> 25<sup>th</sup> Anniversary Cakes
							</a></li>
						</ul></li>
					<li><a href="#">Combo <span><i
								class="fa fa-angle-down" aria-hidden="true"></i></span></a></li>
					<li><a href="#">Gifts <span><i
								class="fa fa-angle-down" aria-hidden="true"></i></span></a></li>
				</ul>
			</div>

		</div>


		<div class="arrow_right">
			<ul>
				<li><a href="#"><i class="fa fa-arrow-up"
						aria-hidden="true"></i></a></li>
				<li><a href="#"><i class="fa fa-arrow-down"
						aria-hidden="true"></i></a></li>
			</ul>
		</div>
	</div> -->

	<div class="head_marg with_menu">
		<%-- <section class="product_category">
			<div class="wrapper">
				<div class="mobile_scroll">

					<div class="prod_filt">
						<ul>

							<c:forEach items="${allData.festEventList}" var="events">
								<li>
									<div class="product_filter_one">
										<a href="#"><img
											src="${pageContext.request.contextPath}/resources/images/birthday-cake-20.jpg"
											alt=""> <c:out value="${events.eventName}"></c:out> </a>
									</div>
								</li>
							</c:forEach>

						</ul>
					</div>

				</div>


			</div>
		</section> --%>


		<c:if test="${isEvent==0}">

			<!--product listing-->
			<div class="find_store">
				<div class="wrapper">

					<div class="product_boxes">

						<c:choose>

							<c:when test="${allListFilter==0}">

								<c:forEach items="${flavTagStatusList}" var="statusFilter"
									varStatus="count">
									<c:if test="${statusFilter.filterId==statusId}">
										<h2 class="sec_title">
											<center>
												<!-- Shop by -->
												${statusFilter.filterName}
												<!-- <span>3 Hour
												Delivery &amp; Free Shipping in India</span> -->
											</center>
										</h2>


										<ul id="itemListUl">
											<!--product-row-1-->

											<c:forEach items="${prodHeaderList}" var="product"
												varStatus="prodCount">

												<c:choose>

													<c:when
														test="${product.prodStatusId==statusFilter.filterId}">
														<li>
															<div class="cake_one product_padd">
																<div class="cake_pic">
																	<a
																		href="${pageContext.request.contextPath}/showProductDetail/${product.productId}"><img
																		src="${prodImgUrl}${product.prodImagePrimary}"
																		onerror="this.src='${pageContext.request.contextPath}/resources/images/no_img_folder/no-product-image.jpg'"
																		class="mobile_fit transition"></a>
																	<!--<div class="circle_tag"><img src="images/heart-1.svg" alt=""> <img src="images/heart.svg" alt=""></div>-->
																	<div class="cake_prc">
																		<div>
																			<i class="fa fa-inr cake_prc_detail_iclass"
																				aria-hidden="true"></i>

																			<c:set value="${product.defaultPrice}" var="price"></c:set>
																			<c:set value="1" var="defaultWt"></c:set>

																			<c:choose>

																				<c:when test="${product.rateSettingType == 1}">

																					<c:forEach items="${product.availInWeights}"
																						var="proWt" varStatus="loop" begin="0" end="0">
																						<c:set value="${proWt}" var="defaultWt"></c:set>
																					</c:forEach>

																					<c:set value="${product.defaultPrice * defaultWt}"
																						var="price"></c:set>

																				</c:when>

																				<c:when test="${product.rateSettingType == 2}">

																					<c:forEach items="${product.availInWeights}"
																						var="proWt" varStatus="loop" begin="0" end="0">
																						<c:set value="${proWt}" var="defaultWt"></c:set>
																					</c:forEach>

																					<c:forEach items="${product.prodDetailList}"
																						var="proDetail">

																						<c:choose>
																							<c:when
																								test="${proDetail.flavorId==product.defaultFlavorId and proDetail.qty==defaultWt}">
																								<c:set value="${proDetail.actualRate}"
																									var="price"></c:set>
																							</c:when>
																						</c:choose>
																					</c:forEach>

																				</c:when>


																			</c:choose>

																			<p class="cake_prc_detail_pclass"
																				id="newPrice${product.productId}">${price}/-</p>

																		</div>
																		<%-- <i class="fa fa-inr" aria-hidden="true"></i>
													<fmt:formatNumber type="number" groupingUsed="false"
														value="${product.defaultPrice}" maxFractionDigits="0"
														minFractionDigits="0" /> 													
													<p class="per_kg">${product.uomShowName}</p>--%>

																		<%-- <span class="off_prc"><i class="fa fa-inr"
														aria-hidden="true"></i> <fmt:formatNumber type="number"
															groupingUsed="false" value="${product.defaultPrice}"
															maxFractionDigits="0" minFractionDigits="0" /></span>  --%>
																		<span class="prc_off"></span>
																	</div>
																</div>
																<div class="cake_container">
																	<h4 class="cake_nm single_row">
																		<a
																			href="${pageContext.request.contextPath}/showProductDetail/${product.productId}">${product.productName}</a>
																	</h4>
																				<!-- Cake Container Right -->
												<div class="cake_dropdown">
														<div class="cake_dropdown_l">
															<c:choose>

																<c:when test="${product.rateSettingType==0}">
																	<!-- <input type="number" id="wt" value="1" max="2" min="0"
																		limit="1" style="text-align: center;"> -->
																	<div class="plus_minus_one">
																		<button type="button" value="" field="quantity"
																			class="qtyminus slide"
																			onclick="setQtyText(${product.productId},0,'${product.prodDetailList}')">
																			<i class="fa fa-minus" aria-hidden="true"></i>
																		</button>
																		<input type="text" id="txtWt${product.productId}"
																			value="1" style="text-align: center;"
																			class="qty slide">
																		<button type="button" value="" field="quantity"
																			onclick="setQtyText(${product.productId},1,'${product.prodDetailList}')"
																			class="qtyplus slide">
																			<i class="fa fa-plus" aria-hidden="true"></i>
																		</button>
																	</div>
																</c:when>

																<c:otherwise>

																	
																	<div class="small_field">
																		<select class="select-css" id="wt${product.productId}"
																			onchange="setPriceByWtAndFlavour('${product.productId}','${product.rateSettingType}')">
																			<!-- <option value="7">7</option> -->
																			<c:forEach items="${product.availInWeights}"
																				var="prodDetailwt">
																				<option value="${prodDetailwt}">${prodDetailwt}</option>
																			</c:forEach>
																		</select>
																		<!-- </div> -->
																	</div>

																</c:otherwise>

															</c:choose>

															<span class="prod_kgs">${product.uomShowName}</span>

														</div>
														<div class="cake_dropdown_r">
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
																					<c:if test="${vegNonFilter.adminName eq 'VEG'}">
																						<c:set var="isVegFound" value="1"></c:set>
																					</c:if>

																					<c:if test="${vegNonFilter.adminName eq 'NONVEG'}">
																						<c:set var="isNonVegFound" value="1"></c:set>
																					</c:if>
																				</c:if>
																			</c:if>
																		</c:forEach>

																	</c:forEach>
																	<div style="display: none;">
																	<%-- <c:if test="${product.flavourIds!=0}">
																		<select class="select-css"
																			id="flav${product.productId}"
																			onchange="setPriceByWtAndFlavour('${product.productId}','${product.rateSettingType}')">
																			<c:forEach items="${product.flavourIds}"
																				var="prodDetail">

																				<c:forEach items="${flavTagStatusList}"
																					var="flavorFilter" varStatus="flavorFilterCount">

																					<c:if test="${flavorFilter.filterTypeId==4}">

																						<c:choose>
																							<c:when
																								test="${prodDetail==flavorFilter.filterId}">
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
																	</c:if> --%>
																	</div>
																</ul>																
															</div>
														</div>
														<div class="radio_r">
															<a href="javascript:void(0)"
																onclick="addCart('${product.productId}','${product.rateSettingType}')">
																<i class="fa fa-shopping-cart shop_cart"></i></a>
														</div>
														<div class="clr"></div>
													</div>
												<!-- End Cake Container Right -->

												<!--Cake Container Left -->
													<%-- <div class="cake_radio_row">
														<div class="radio_l">

															<!-- Flavor 25-12-2020 -->

															<div>
																<i class="fa fa-inr cake_prc_detail_iclass"
																	aria-hidden="true"></i>

																<c:set value="${product.defaultPrice}" var="price"></c:set>
																<c:set value="1" var="defaultWt"></c:set>

																<c:choose>

																	<c:when test="${product.rateSettingType == 1}">

																		<c:forEach items="${product.availInWeights}"
																			var="proWt" varStatus="loop" begin="0" end="0">
																			<c:set value="${proWt}" var="defaultWt"></c:set>
																		</c:forEach>

																		<c:set value="${product.defaultPrice * defaultWt}"
																			var="price"></c:set>

																	</c:when>

																	<c:when test="${product.rateSettingType == 2}">

																		<c:forEach items="${product.availInWeights}"
																			var="proWt" varStatus="loop" begin="0" end="0">
																			<c:set value="${proWt}" var="defaultWt"></c:set>
																		</c:forEach>

																		<c:forEach items="${product.prodDetailList}"
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
																	id="newPrice${product.productId}">${price}</p>

															</div>


														</div>
														<div class="radio_r">
															<a href="javascript:void(0)"
																onclick="addCart('${product.productId}','${product.rateSettingType}')"
																class="cart_btn">Add to Cart</a>
														</div>
														<div class="clr"></div>
													</div>	 --%>
													
												
												<%-- <div class="card_cart_btn">
													<a href="javascript:void(0)"
														onclick="addCart(${product.productId},${product.rateSettingType})"
														class="cart_btn">Add to Cart</a>
												</div> --%>
												
												<!-- End Cake Container Left -->
																	
																</div>
															</div>
														</li>
													</c:when>

													<c:otherwise>
													</c:otherwise>

												</c:choose>

											</c:forEach>
										</ul>
									</c:if>
								</c:forEach>

							</c:when>

							<c:otherwise>

								<ul id="itemListUl">
									<!--product-row-1-->

									<c:forEach items="${prodHeaderList}" var="product"
										varStatus="prodCount">

										<li>
											<div class="item_div">
												<div class="cake_one product_padd">
													<div class="cake_pic">
																	<a
																		href="${pageContext.request.contextPath}/showProductDetail/${product.productId}"><img
																		src="${prodImgUrl}${product.prodImagePrimary}"
																		onerror="this.src='${pageContext.request.contextPath}/resources/images/no_img_folder/no-product-image.jpg'"
																		class="mobile_fit transition"></a>
																	<!--<div class="circle_tag"><img src="images/heart-1.svg" alt=""> <img src="images/heart.svg" alt=""></div>-->
																	<div class="cake_prc">
																		<div>
																			<i class="fa fa-inr cake_prc_detail_iclass"
																				aria-hidden="true"></i>

																			<c:set value="${product.defaultPrice}" var="price"></c:set>
																			<c:set value="1" var="defaultWt"></c:set>

																			<c:choose>

																				<c:when test="${product.rateSettingType == 1}">

																					<c:forEach items="${product.availInWeights}"
																						var="proWt" varStatus="loop" begin="0" end="0">
																						<c:set value="${proWt}" var="defaultWt"></c:set>
																					</c:forEach>

																					<c:set value="${product.defaultPrice * defaultWt}"
																						var="price"></c:set>

																				</c:when>

																				<c:when test="${product.rateSettingType == 2}">

																					<c:forEach items="${product.availInWeights}"
																						var="proWt" varStatus="loop" begin="0" end="0">
																						<c:set value="${proWt}" var="defaultWt"></c:set>
																					</c:forEach>

																					<c:forEach items="${product.prodDetailList}"
																						var="proDetail">

																						<c:choose>
																							<c:when
																								test="${proDetail.flavorId==product.defaultFlavorId and proDetail.qty==defaultWt}">
																								<c:set value="${proDetail.actualRate}"
																									var="price"></c:set>
																							</c:when>
																						</c:choose>
																					</c:forEach>

																				</c:when>


																			</c:choose>

																			<p class="cake_prc_detail_pclass"
																				id="newPrice${product.productId}">${price}/-</p>

																		</div>
																		<%-- <i class="fa fa-inr" aria-hidden="true"></i>
													<fmt:formatNumber type="number" groupingUsed="false"
														value="${product.defaultPrice}" maxFractionDigits="0"
														minFractionDigits="0" /> 													
													<p class="per_kg">${product.uomShowName}</p>--%>

																		<%-- <span class="off_prc"><i class="fa fa-inr"
														aria-hidden="true"></i> <fmt:formatNumber type="number"
															groupingUsed="false" value="${product.defaultPrice}"
															maxFractionDigits="0" minFractionDigits="0" /></span>  --%>
																		<span class="prc_off"></span>
																	</div>
																</div>
													<div class="cake_container">
														<h4 class="cake_nm single_row">
															<a
																href="${pageContext.request.contextPath}/showProductDetail/${product.productId}">${product.productName}</a>
														</h4>
																	<!-- Cake Container Right -->
												<div class="cake_dropdown">
														<div class="cake_dropdown_l">
															<c:choose>

																<c:when test="${product.rateSettingType==0}">
																	<!-- <input type="number" id="wt" value="1" max="2" min="0"
																		limit="1" style="text-align: center;"> -->
																	<div class="plus_minus_one">
																		<button type="button" value="" field="quantity"
																			class="qtyminus slide"
																			onclick="setQtyText(${product.productId},0,'${product.prodDetailList}')">
																			<i class="fa fa-minus" aria-hidden="true"></i>
																		</button>
																		<input type="text" id="txtWt${product.productId}"
																			value="1" style="text-align: center;"
																			class="qty slide">
																		<button type="button" value="" field="quantity"
																			onclick="setQtyText(${product.productId},1,'${product.prodDetailList}')"
																			class="qtyplus slide">
																			<i class="fa fa-plus" aria-hidden="true"></i>
																		</button>
																	</div>
																</c:when>

																<c:otherwise>

																	
																	<div class="small_field">
																		<select class="select-css" id="wt${product.productId}"
																			onchange="setPriceByWtAndFlavour('${product.productId}','${product.rateSettingType}')">
																			<!-- <option value="7">7</option> -->
																			<c:forEach items="${product.availInWeights}"
																				var="prodDetailwt">
																				<option value="${prodDetailwt}">${prodDetailwt}</option>
																			</c:forEach>
																		</select>
																		<!-- </div> -->
																	</div>

																</c:otherwise>

															</c:choose>

															<span class="prod_kgs">${product.uomShowName}</span>

														</div>
														<div class="cake_dropdown_r">
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
																					<c:if test="${vegNonFilter.adminName eq 'VEG'}">
																						<c:set var="isVegFound" value="1"></c:set>
																					</c:if>

																					<c:if test="${vegNonFilter.adminName eq 'NONVEG'}">
																						<c:set var="isNonVegFound" value="1"></c:set>
																					</c:if>
																				</c:if>
																			</c:if>
																		</c:forEach>

																	</c:forEach>
																	<div style="display: none;">
																	<%-- <c:if test="${product.flavourIds!=0}">
																		<select class="select-css"
																			id="flav${product.productId}"
																			onchange="setPriceByWtAndFlavour('${product.productId}','${product.rateSettingType}')">
																			<c:forEach items="${product.flavourIds}"
																				var="prodDetail">

																				<c:forEach items="${flavTagStatusList}"
																					var="flavorFilter" varStatus="flavorFilterCount">

																					<c:if test="${flavorFilter.filterTypeId==4}">

																						<c:choose>
																							<c:when
																								test="${prodDetail==flavorFilter.filterId}">
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
																	</c:if> --%>
																	</div>
																</ul>																
															</div>
														</div>
														<div class="radio_r">
															<a href="javascript:void(0)"
																onclick="addCart('${product.productId}','${product.rateSettingType}')">
																<i class="fa fa-shopping-cart shop_cart"></i></a>
														</div>
														<div class="clr"></div>
													</div>
												<!-- End Cake Container Right -->

												<!--Cake Container Left -->
													<%-- <div class="cake_radio_row">
														<div class="radio_l">

															<!-- Flavor 25-12-2020 -->

															<div>
																<i class="fa fa-inr cake_prc_detail_iclass"
																	aria-hidden="true"></i>

																<c:set value="${product.defaultPrice}" var="price"></c:set>
																<c:set value="1" var="defaultWt"></c:set>

																<c:choose>

																	<c:when test="${product.rateSettingType == 1}">

																		<c:forEach items="${product.availInWeights}"
																			var="proWt" varStatus="loop" begin="0" end="0">
																			<c:set value="${proWt}" var="defaultWt"></c:set>
																		</c:forEach>

																		<c:set value="${product.defaultPrice * defaultWt}"
																			var="price"></c:set>

																	</c:when>

																	<c:when test="${product.rateSettingType == 2}">

																		<c:forEach items="${product.availInWeights}"
																			var="proWt" varStatus="loop" begin="0" end="0">
																			<c:set value="${proWt}" var="defaultWt"></c:set>
																		</c:forEach>

																		<c:forEach items="${product.prodDetailList}"
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
																	id="newPrice${product.productId}">${price}</p>

															</div>


														</div>
														<div class="radio_r">
															<a href="javascript:void(0)"
																onclick="addCart('${product.productId}','${product.rateSettingType}')"
																class="cart_btn">Add to Cart</a>
														</div>
														<div class="clr"></div>
													</div>	 --%>
													
													
													
													
												<!-- End Cake Container Left -->
												<%-- <div class="card_cart_btn">
													<a href="javascript:void(0)"
														onclick="addCart(${product.productId},${product.rateSettingType})"
														class="cart_btn">Add to Cart</a>
												</div> --%>
												
												<!-- End Cake Container Left -->
												
												
													</div>
												</div>
											</div>
										</li>

									</c:forEach>
								</ul>


							</c:otherwise>

						</c:choose>



					</div>
					<!--product-row-2-->
					<!--product-row-3-->
				</div>
			</div>
		</c:if>

		<!-- Prod Filter For Evenr Based Cakes -->
		<div class="testimonial_bx">
			<div class="wrapper">
				<h2 class="sec_title">
					<center>
						<!-- Shop by -->
						${festiveEvent.eventName} <span> <!-- 3 Hour Delivery
							&amp; Free Shipping in India -->
						</span>
					</center>
				</h2>

				<div class="product_boxes">
					<c:forEach items="${festiveEvent.productIds}" var="prodId"
						varStatus="count">


						<ul>
							<!--product-row-1-->
							<c:forEach items="${prodHeaderList}" var="product"
								varStatus="prodCount">
								<c:choose>
									<c:when test="${product.productId==prodId}">
										<li>
											<div class="cake_one product_padd">
												<div class="cake_pic">
																	<a
																		href="${pageContext.request.contextPath}/showProductDetail/${product.productId}"><img
																		src="${prodImgUrl}${product.prodImagePrimary}"
																		onerror="this.src='${pageContext.request.contextPath}/resources/images/no_img_folder/no-product-image.jpg'"
																		class="mobile_fit transition"></a>
																	<!--<div class="circle_tag"><img src="images/heart-1.svg" alt=""> <img src="images/heart.svg" alt=""></div>-->
																	<div class="cake_prc">
																		<div>
																			<i class="fa fa-inr cake_prc_detail_iclass"
																				aria-hidden="true"></i>

																			<c:set value="${product.defaultPrice}" var="price"></c:set>
																			<c:set value="1" var="defaultWt"></c:set>

																			<c:choose>

																				<c:when test="${product.rateSettingType == 1}">

																					<c:forEach items="${product.availInWeights}"
																						var="proWt" varStatus="loop" begin="0" end="0">
																						<c:set value="${proWt}" var="defaultWt"></c:set>
																					</c:forEach>

																					<c:set value="${product.defaultPrice * defaultWt}"
																						var="price"></c:set>

																				</c:when>

																				<c:when test="${product.rateSettingType == 2}">

																					<c:forEach items="${product.availInWeights}"
																						var="proWt" varStatus="loop" begin="0" end="0">
																						<c:set value="${proWt}" var="defaultWt"></c:set>
																					</c:forEach>

																					<c:forEach items="${product.prodDetailList}"
																						var="proDetail">

																						<c:choose>
																							<c:when
																								test="${proDetail.flavorId==product.defaultFlavorId and proDetail.qty==defaultWt}">
																								<c:set value="${proDetail.actualRate}"
																									var="price"></c:set>
																							</c:when>
																						</c:choose>
																					</c:forEach>

																				</c:when>


																			</c:choose>

																			<p class="cake_prc_detail_pclass"
																				id="newPrice${product.productId}">${price}/-</p>

																		</div>
																		<%-- <i class="fa fa-inr" aria-hidden="true"></i>
													<fmt:formatNumber type="number" groupingUsed="false"
														value="${product.defaultPrice}" maxFractionDigits="0"
														minFractionDigits="0" /> 													
													<p class="per_kg">${product.uomShowName}</p>--%>

																		<%-- <span class="off_prc"><i class="fa fa-inr"
														aria-hidden="true"></i> <fmt:formatNumber type="number"
															groupingUsed="false" value="${product.defaultPrice}"
															maxFractionDigits="0" minFractionDigits="0" /></span>  --%>
																		<span class="prc_off"></span>
																	</div>
																</div>
												<div class="cake_container">
													<h4 class="cake_nm single_row">
														<a
															href="${pageContext.request.contextPath}/showProductDetail/${product.productId}">${product.productName}</a>
													</h4>
																	<!-- Cake Container Right -->
												<div class="cake_dropdown">
														<div class="cake_dropdown_l">
															<c:choose>

																<c:when test="${product.rateSettingType==0}">
																	<!-- <input type="number" id="wt" value="1" max="2" min="0"
																		limit="1" style="text-align: center;"> -->
																	<div class="plus_minus_one">
																		<button type="button" value="" field="quantity"
																			class="qtyminus slide"
																			onclick="setQtyText(${product.productId},0,'${product.prodDetailList}')">
																			<i class="fa fa-minus" aria-hidden="true"></i>
																		</button>
																		<input type="text" id="txtWt${product.productId}"
																			value="1" style="text-align: center;"
																			class="qty slide">
																		<button type="button" value="" field="quantity"
																			onclick="setQtyText(${product.productId},1,'${product.prodDetailList}')"
																			class="qtyplus slide">
																			<i class="fa fa-plus" aria-hidden="true"></i>
																		</button>
																	</div>
																</c:when>

																<c:otherwise>

																	
																	<div class="small_field">
																		<select class="select-css" id="wt${product.productId}"
																			onchange="setPriceByWtAndFlavour('${product.productId}','${product.rateSettingType}')">
																			<!-- <option value="7">7</option> -->
																			<c:forEach items="${product.availInWeights}"
																				var="prodDetailwt">
																				<option value="${prodDetailwt}">${prodDetailwt}</option>
																			</c:forEach>
																		</select>
																		<!-- </div> -->
																	</div>

																</c:otherwise>

															</c:choose>

															<span class="prod_kgs">${product.uomShowName}</span>

														</div>
														<div class="cake_dropdown_r">
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
																					<c:if test="${vegNonFilter.adminName eq 'VEG'}">
																						<c:set var="isVegFound" value="1"></c:set>
																					</c:if>

																					<c:if test="${vegNonFilter.adminName eq 'NONVEG'}">
																						<c:set var="isNonVegFound" value="1"></c:set>
																					</c:if>
																				</c:if>
																			</c:if>
																		</c:forEach>

																	</c:forEach>
																	<div style="display: none;">
																	<%-- <c:if test="${product.flavourIds!=0}">
																		<select class="select-css"
																			id="flav${product.productId}"
																			onchange="setPriceByWtAndFlavour('${product.productId}','${product.rateSettingType}')">
																			<c:forEach items="${product.flavourIds}"
																				var="prodDetail">

																				<c:forEach items="${flavTagStatusList}"
																					var="flavorFilter" varStatus="flavorFilterCount">

																					<c:if test="${flavorFilter.filterTypeId==4}">

																						<c:choose>
																							<c:when
																								test="${prodDetail==flavorFilter.filterId}">
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
																	</c:if> --%>
																	</div>
																</ul>																
															</div>
														</div>
														<div class="radio_r">
															<a href="javascript:void(0)"
																onclick="addCart('${product.productId}','${product.rateSettingType}')" title="Add To Cart">
																<i class="fa fa-shopping-cart shop_cart"></i></a>
														</div>
														<div class="clr"></div>
													</div>
												<!-- End Cake Container Right -->

												<!--Cake Container Left -->
													<%-- <div class="cake_radio_row">
														<div class="radio_l">

															<!-- Flavor 25-12-2020 -->

															<div>
																<i class="fa fa-inr cake_prc_detail_iclass"
																	aria-hidden="true"></i>

																<c:set value="${product.defaultPrice}" var="price"></c:set>
																<c:set value="1" var="defaultWt"></c:set>

																<c:choose>

																	<c:when test="${product.rateSettingType == 1}">

																		<c:forEach items="${product.availInWeights}"
																			var="proWt" varStatus="loop" begin="0" end="0">
																			<c:set value="${proWt}" var="defaultWt"></c:set>
																		</c:forEach>

																		<c:set value="${product.defaultPrice * defaultWt}"
																			var="price"></c:set>

																	</c:when>

																	<c:when test="${product.rateSettingType == 2}">

																		<c:forEach items="${product.availInWeights}"
																			var="proWt" varStatus="loop" begin="0" end="0">
																			<c:set value="${proWt}" var="defaultWt"></c:set>
																		</c:forEach>

																		<c:forEach items="${product.prodDetailList}"
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
																	id="newPrice${product.productId}">${price}</p>

															</div>


														</div>
														<div class="radio_r">
															<a href="javascript:void(0)"
																onclick="addCart('${product.productId}','${product.rateSettingType}')"
																class="cart_btn">Add to Cart</a>
														</div>
														<div class="clr"></div>
													</div>	 --%>
													
													
													
													
												<!-- End Cake Container Left -->
												<%-- <div class="card_cart_btn">
													<a href="javascript:void(0)"
														onclick="addCart(${product.productId},${product.rateSettingType})"
														class="cart_btn">Add to Cart</a>
												</div> --%>
												
												<!-- End Cake Container Left -->
												
												
												</div>
											</div>
										</li>
									</c:when>
									<c:otherwise>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</ul>
					</c:forEach>
				</div>
			</div>
		</div>
		<!--End of Prod Filter For Event Based Cakes  -->
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


	<!-- <script type="text/javascript">
		function addCart(id,type) {
			
			//alert("--------------- "+document.getElementById("txtWt").value)
		 
			 var prodMaster;
				
				if (sessionStorage.getItem("allItemList") == null) {
					var table = [];
					sessionStorage.setItem("allItemList", JSON.stringify(table));
				}
		
				var allItemList = sessionStorage.getItem("allItemList");
				var prodHead = $.parseJSON(allItemList);
				
				for (var h = 0; h < prodHead.length; h++) {
					if (parseInt(id) == parseInt(prodHead[h].productId)) {
						prodMaster = prodHead[h];
						break;
					}
				}
				
			var selectFlav = 0;
			
			var selectWt = 0;
			
			var selFlvName ="";
			
			if(type == 0){
				selectWt = 1;	
			}else if(type == 1 || type == 2){
				
				
				try {
					
					var availablewt =prodMaster.availInWeights.split(",");
					selectWt = availablewt[0];
					
					selectFlav = prodMaster.defaultFlavorId;
					 
					selFlvName = "akshay";
					
				} catch (e) {
					selectFlav = 0;
				}
				if (selectFlav == "" || isNaN(selectFlav) || selectFlav == null) {
					selectFlav = 0;
				}
			}
			 
				
				var prodDetail = prodMaster.prodDetailList;
				
				
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
				
				var spInst;
				var msgonCake;
				
			 	if(prodMaster.allowSpecialInstruction==1){
					spInst="NA";
				}

				if(prodMaster.allowMsgOnCake==1){
					msgonCake ="NA";
				} 
				
				

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
		</script> -->
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




	<!-- RESET TAGS -->
	<script type="text/javascript">
		function resetAllTags() {

			$(".resetTags")
					.each(
							function(counter) {
								document.getElementsByClassName("resetTags")[counter].checked = false;
							});

		}

		function searchByTags() {

			//itemListUl

			alert("hi")

			var list = [];

			$(".resetTags")
					.each(
							function(counter) {
								if (document
										.getElementsByClassName("resetTags")[counter].checked) {

									list.push($(this).val());
								}
							});

			sessionStorage.setItem("selTags", JSON.stringify(list));
			//itemSearchByTagFilter();

		}

		function itemSearchByTagFilter() {

			if (sessionStorage.getItem("selTags") == null) {
				var table = [];
				sessionStorage.setItem("selTags", JSON.stringify(table));
			}

			if (sessionStorage.getItem("allItemList") == null) {
				var table = [];
				sessionStorage.setItem("allItemList", JSON.stringify(table));
			}

			var allItemList = sessionStorage.getItem("allItemList");
			var allItemArr = $.parseJSON(allItemList);

			var tags = sessionStorage.getItem("selTags");
			var selTags = $.parseJSON(tags);

			alert(selTags + "    ====> ");

			for (var i = 0; i < allItemArr.length; i++) {
				for (var t = 0; t < selTags.length; t++) {

					if (allItemArr[i].appliTagNames === selTags[t]) {

						alert(allItemArr[i]);

					}

				}
			}

			/* $(".item_div")
					.each(
							function(counter) {

								if (list.length > 0) {
									for (var i = 0; i < list.length; i++) {

										if (document
												.getElementsByClassName("tagNameHide")[counter].value == list[i]) {
											$(this).show();
										}

									}
								}

							}); */

		}
	</script>
	<script type="text/javascript">
	
	function searchMenu(catId) {
		
		//alert(catId)
		
		var table = [];
		sessionStorage.setItem("selTags", JSON.stringify(table));
		
		sessionStorage.setItem("findCatId", catId);
		sessionStorage.setItem("filterMenu", 1);

		var priceListTemp = [];

		$(".menuPrice")
				.each(
						function(counter) {
							if (document
									.getElementsByClassName("menuPrice")[counter].checked) {

								priceListTemp
										.push(document
												.getElementsByClassName("menuPrice")[counter].value);
							}
						});

		if (priceListTemp.length > 0) {

			for (var i = 0; i < priceListTemp.length; i++) {
				//alert()
				var temp = priceListTemp[i].split("-");
				if (temp.length > 0) {
					sessionStorage.setItem("priceFilterMin", temp[0]);
					sessionStorage.setItem("priceFilterMax", temp[1]);
				}
			}

		} else {
			sessionStorage.setItem("priceFilterMin", "0");
			sessionStorage.setItem("priceFilterMax", "0");
		}

		var nameFilter = [];

		$(".menuFilter")
				.each(
						function(counter) {
							if (document
									.getElementsByClassName("menuFilter")[counter].checked) {

								nameFilter
										.push(document
												.getElementsByClassName("menuFilter")[counter].value);
							}
						});

		/* alert(JSON.stringify(nameFilter)); */
		
		sessionStorage.setItem("menuFilterName", nameFilter);

		window.open('${pageContext.request.contextPath}/products/0',
				'_self');

	}
	</script>

<script type="text/javascript">
		
		function setQtyText(id, type) {

			/* type  :  0 - minus,  1 - plus */
			
			var wt=document.getElementById("txtWt"+id).value;
		//alert(id+"    "+type+ "     "+wt)
		
		//alert(detailList);
			
			/* if(type==0){
			
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
			 */
			 
			var maxValue=document.getElementById("maxValue").value;
			if(type==0){
				var newWt=wt+1;
				if(parseInt(wt)>1 && wt<=parseInt(maxValue)){
					wt=parseInt(wt)-1;
				}
			}
			else if(type==1){
				if(parseInt(wt)>=1 && parseInt(wt)<parseInt(maxValue)){
					wt=parseInt(wt)+1;
				}
			}
			document.getElementById("txtWt"+id).value=wt;
			
			
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
			
			//27-04document.getElementById("newPrice"+id).innerHTML=rate.toFixed(1);
			document.getElementById("newPrice"+id).innerHTML="<i class='fa fa-inr' aria-hidden='true'></i>"+rate.toFixed(1);


		}
		
		</script>
		
		<script type="text/javascript">
		
		function setPriceByWtAndFlavour(id,type) {
			
			//alert(id+"      "+type)
			
			var selectWt = document.getElementById("wt" + id).value;
			var selectFlav = 0;
			try {
				selectFlav = document.getElementById("flav" + id).value;
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
				selectWt = document.getElementById("txtWt"+id).value;	
			}else if(type == 1 || type == 2){
				selectWt = document.getElementById("wt" + id).value;
				
				try {
					selectFlav = document.getElementById("flav" + id).value;
					
					var docFlv = document.getElementById("flav" + id);
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
				var defFlvName =prodMaster.flavorNames.split(",");
				selFlvName=defFlvName[0];
				var prodDetail = prodMaster.prodDetailList;
				//alert(prodDetail)
					selectFlav = prodMaster.defaultFlavorId;
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
				
				
				if (sessionStorage.getItem("cartValue") == null) {
					var table = [];
					sessionStorage.setItem("cartValue", JSON.stringify(table));
				}

				var cartValue = sessionStorage.getItem("cartValue");
				var cartArray = $.parseJSON(cartValue);
				
				var imgFile="";
				var imgName="";
				
			
				
				var index=0,itemFound=0;
				
			
				
				for(var i=0; i<cartArray.length;i++){
					
					//alert(selectWt+"      "+cartArray[i].qty+"         Type - "+type)
					
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
						spInst : "NA",
						msgonCake : 'NA'
						
					}
				
				if(itemFound==1){
					table[index]=obj;
				}else{
					table.push(obj);	
				}
				
				sessionStorage.setItem("cartValue", JSON
						.stringify(table));
				appendCartData();
				
					openNav();
				  	setTimeout(function(){ closeNav(); }, 4000);
				 
		} 		
		
	</script>
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
	<jsp:include page="/WEB-INF/views/include/qty_validation.jsp"></jsp:include>
</body>

</html>
