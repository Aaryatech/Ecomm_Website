<!-- this is mohsins product filter page -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<jsp:include page="/WEB-INF/views/include/metacssjs.jsp"></jsp:include>

<c:url value="/setLikeOrDislike" var="setLikeOrDislike"></c:url>

<body>


	<!-- TAGS -->
	<jsp:include page="/WEB-INF/views/include/tags.jsp"></jsp:include>
	<!-- TAGS End -->

	<!-- Header -->
	<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
	<!-- Header End -->
	<jsp:include page="/WEB-INF/views/include/menubar.jsp"></jsp:include>


	<!-- mega menu -->
	<%-- <div class="mega_menu_row">

		<div class="wrapper">

			<div id="menuzord" class="menuzord red menuzord-responsive">
				<ul
					class="menuzord-menu me#menusnuzord-right menuzord-indented scrollable">


					<li><a href="javascript:void(0)" class="same_day">Same Day
							Delivery</a></li>

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
													name="radioPrice" class="menuPrice"
													onclick="checkPriceFilter(${menuCat.cateId})"> <span
													class="checkmark"></span>
											</label></li>

											<li><label class="radio_menu">500 to 599 <input
													type="radio" id="radioPrice" value="500-599"
													name="radioPrice" class="menuPrice" onclick="checkPriceFilter(${menuCat.cateId})"> <span
													class="checkmark"></span>
											</label></li>

											<li><label class="radio_menu">600 to 999 <input
													type="radio" id="radioPrice" value="600-999"
													name="radioPrice" class="menuPrice" onclick="checkPriceFilter(${menuCat.cateId})"> <span
													class="checkmark"></span>
											</label></li>

											<li><label class="radio_menu">1000 to 1999 <input
													type="radio" id="radioPrice" value="1000-1999"
													name="radioPrice" class="menuPrice" onclick="checkPriceFilter(${menuCat.cateId})"> <span
													class="checkmark"></span>
											</label></li>

											<li><label class="radio_menu">Above 2000 <input
													type="radio" id="radioPrice" value="2000-10000"
													name="radioPrice" class="menuPrice" onclick="checkPriceFilter(${menuCat.cateId})"> <span
													class="checkmark"></span>
											</label></li>

										</ul>
									</div>

									${menuCat.typeIdList}
									${allFilterTypeList}

									<c:forEach items="${menuCat.typeIdList}" var="menuTypeList">

										<c:forEach items="${allFilterTypeList}" var="filterType">

											<c:choose>


												<c:when
													test="${menuTypeList == filterType.filterTypeId and menuTypeList==16}">

													<div class="row_one">
														<ul class="drop_mainmenu">
															<li>${filterType.filterTypeName}</li>

															<c:forEach items="${allFilterList}" var="filter">

																<c:choose>

																	<c:when
																		test="${filterType.filterTypeId == filter.filterTypeId}">

																		<li><label class="radio_menu">
																				${filter.adminName} <input type="radio"
																				id="radioPrice" value=" ${filter.filterDesc}"
																				name="radioPrice" class="menuPrice"> <span
																				class="checkmark"></span>
																		</label></li>

																	</c:when>

																</c:choose>

															</c:forEach>

														</ul>
													</div>

												</c:when>

												<c:when
													test="${menuTypeList == filterType.filterTypeId and menuTypeList != 16}">

													<div class="row_one">
														<ul class="drop_mainmenu">
															<li>${filterType.filterTypeName}</li>

															<c:forEach items="${allFilterList}" var="filter">

																<c:choose>

																	<c:when
																		test="${filterType.filterTypeId == filter.filterTypeId}">

																		<li><label class="check_menu"> <input
																				type="checkbox" id="menuFilter${filter.filterId}"
																				value="${filter.adminName}~${filter.filterTypeId}"
																				class="menuFilter"
																				onclick="checkFilter(${menuCat.cateId},${filter.filterId})">
																				<span class="checkmark_check"></span>
																				${filter.adminName}
																		</label></li>

																	</c:when>

																</c:choose>

															</c:forEach>


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
	</div> --%>

	<div class="head_marg with_menu">

		<!--product listing-->
		<div class="find_store">
			<div class="wrapper">

				<div class="product_boxes">

					<div id="hiddenProductList" style="display: none;"></div>
<div class="search_class">
					<div class="find_store">
						<h2 class="sec_title">
							<center>
								<p id="prodCount"></p>
							</center>
						</h2>
					<div class="arrow_right">	<ul>
			<li><a href="javascript:void(0)" onclick="priceSort(1)"><i
					class="fa fa-arrow-up" aria-hidden="true"></i></a></li>
			<li><a href="javascript:void(0)" onclick="priceSort(0)"><i
					class="fa fa-arrow-down" aria-hidden="true"></i></a></li>
		</ul></div>
		</div>
					</div>


					<ul id="itemListUl">
						<!--product-row-1-->

						<%-- <c:forEach items="${prodHeaderList}" var="product"
							varStatus="prodCount">

							<li>
								<div class="item_div">
									<div class="cake_one product_padd">
										<div class="cake_pic">
											<img src="${prodImgUrl}${product.prodImagePrimary}"
												data-src="${prodImgUrl}${product.prodImagePrimary}" alt=""
												class="mobile_fit transition">
											<!--<div class="circle_tag"><img src="images/heart-1.svg" alt=""> <img src="images/heart.svg" alt=""></div>-->
											<div class="cake_prc">
												<i class="fa fa-inr" aria-hidden="true"></i>${product.defaultPrice}<span
													class="off_prc"><i class="fa fa-inr"
													aria-hidden="true"></i>${product.defaultPrice}</span> <span
													class="prc_off">(23% Off)</span>
											</div>

											<input type="hidden" class="tagNameHide"
												value="${product.appliTagNames}">

										</div>
										<div class="cake_container">
											<h4 class="cake_nm single_row">
												<a href="${pageContext.request.contextPath}/showProdDetail/${prodCount.index}">${product.productName}</a>
											</h4>
										</div>
									</div>
								</div>
							</li>

						</c:forEach> --%>
					</ul>

				</div>
				<!--product-row-2-->
				<!--product-row-3-->
			</div>
		</div>


		<!-- Prod Filter For Evenr Based Cakes -->
		<div class="find_store">
			<div class="wrapper">


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
														href="${pageContext.request.contextPath}/showProductDetail/${product.productId}">
														<img src="${prodImgUrl}${product.prodImagePrimary}"
														data-src="${prodImgUrl}${product.prodImagePrimary}" alt=""
														class="mobile_fit transition"
														onerror="this.src='${pageContext.request.contextPath}/resources/images/no_img_folder/no-product-image.jpg'">
													</a>
													<!--<div class="circle_tag"><img src="images/heart-1.svg" alt=""> <img src="images/heart.svg" alt=""></div>-->
													<div class="cake_prc" id="newPrice${product.productId}">
														<i class="fa fa-inr" aria-hidden="true"></i>${product.defaultPrice}<span
															class="off_prc" style="display:none;"><i class="fa fa-inr"
															aria-hidden="true"></i>${product.defaultPrice}</span> <span
															class="prc_off" style="display:none;"></span>
													</div>
												</div>
												<div class="cake_container">
													<h4 class="cake_nm single_row">
														<a
															href="${pageContext.request.contextPath}/showProductDetail/${product.productId}">${product.productName}</a>
													</h4>

													<div class="card_cart_btn">
														<a href="javascript:void(0)"
															onclick="addCart(${product.productId},${product.rateSettingType})"
															class="cart_btn">Add to Cart</a>
													</div>
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


	<!-- ##################################################################################################################### -->

	<!-- RESET TAGS -->
	<script type="text/javascript">
		$(document).ready(function() {
			//setFlavourData();
			loadData();
		});
		
		function checkFilter(catId,id) {
			
			//alert(catId)
			
			var cId=sessionStorage.getItem("tempCatId");
			sessionStorage.setItem("tempCatId", catId);
			
			if(catId!=cId){
				
				resetPriceRadio();
				resetFilterCheckbox();
				
				//document.getElementsById("menuFilter"+id).checked=true;

			}
			
		}
		
		function checkPriceFilter(catId) {
			
			var cId=sessionStorage.getItem("tempCatId");
			sessionStorage.setItem("tempCatId", catId);
			
			if(catId!=cId){
				
				resetPriceRadio();
				resetFilterCheckbox();
				
				//document.getElementsById("menuFilter"+id).checked=true;

			}
		}
		
		
		function resetPriceRadio() {
			$(".menuPrice")
			.each(
					function(counter) {
						document.getElementsByClassName("menuPrice")[counter].checked=false;
					});
		}
		
		function resetFilterCheckbox() {
			/* $(".menuFilter")
			.each(
					function(counter) {
						document.getElementsByClassName("menuFilter")[counter].checked=false;
					}); */
			
			
			  var inputs = document.querySelectorAll('.menuFilter');
			  for (var i = 0; i < inputs.length; i++) {
			    inputs[i].checked = false;
			  }
			  
			  
		}
		

		function resetAllTags() {

			$(".resetTags")
					.each(
							function(counter) {
								document.getElementsByClassName("resetTags")[counter].checked = false;
							});

		}

		function searchByTags() {

			//itemListUl

			//alert("hi")

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

			window.open('${pageContext.request.contextPath}/products/0',
					'_self');

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

			//alert(selTags + "    ====> ");

			var divStr = "";

			var count = 0;

			for (var i = 0; i < allItemArr.length; i++) {
				if (allItemArr[i].appliTagNames === selTags[t]) {
					
					
					var wtList=allItemArr[i].availInWeights.split(',');
					//alert(tempArr[i].productName +"-"+tempArr[i].defaultPrice)
if(allItemArr[i].rateSettingType==0){
						
					}
					 else if(wtList[0]<=1){
						 allItemArr[i].defaultPrice=allItemArr[i].defaultPrice*wtList[0];
					}
				if (selTags.length > 0) {

					for (var t = 0; t < selTags.length; t++) {

						console.log("A",1)
							
							//alert(allItemArr[i]);
							var detail='<a href="${pageContext.request.contextPath}/showProductDetail/'+allItemArr[i].productId+'">'
							divStr = divStr
									+ '<li>'
									+ ' <div class="item_div"> '
									+ ' <div class="cake_one product_padd"> '
									+ ' <div class="cake_pic"> '+detail
									+ ' <img src="${prodImgUrl}'+allItemArr[i].prodImagePrimary+'" '+noimage+' data-src="${prodImgUrl}'+allItemArr[i].prodImagePrimary+'" alt="" class="mobile_fit transition"></a> '
									+ ' <div class="cake_prc" id="newPrice'+allItemArr[i].productId+'"> <i class="fa fa-inr" aria-hidden="true"></i>'
									+ allItemArr[i].defaultPrice +'<p class="per_kg" style="font-size: 12px; vertical-align: middle; display: none;">'+allItemArr[i].uomShowName+'</p>'
									+ ' <span style="display:none;" class="off_prc"><i class="fa fa-inr" aria-hidden="true"></i>'
									+ allItemArr[i].defaultPrice
									+ '</span> <span style="display:none;"  class="prc_off">(23% Off)</span> </div> '
									+ ' <input type="hidden" class="tagNameHide" value="'+allItemArr[i].appliTagNames+'"> '
									+ ' </div> '
									+ ' <div class="cake_container"> '
									+ ' <h4 class="cake_nm single_row"> <a href="${pageContext.request.contextPath}/showProductDetail/'+allItemArr[i].productId+'">'
									+ allItemArr[i].productName + '</a> </h4><div class="card_cart_btn"> <a href="javascript:void(0)" onclick="addCart('+allItemArr[i].productId+','+allItemArr[i].rateSettingType+')" class="cart_btn">Add to Cart</a> </div>'
									+ ' </div> </div> </div> </li> '
									console.log("CC",1)
							count++;
 	
						}

					}

				} else {
					console.log("B",1)
					var detail='<a href="${pageContext.request.contextPath}/showProductDetail/'+allItemArr[i].productId+'">'
					divStr = divStr
							+ '<li>'
							+ ' <div class="item_div"> '
							+ ' <div class="cake_one product_padd"> '
							+ ' <div class="cake_pic"> '+detail
							+ ' <img src="${prodImgUrl}'+allItemArr[i].prodImagePrimary+'" '+noimage+' data-src="${prodImgUrl}'+allItemArr[i].prodImagePrimary+'" alt="" class="mobile_fit transition"></a> '
							+ ' <div class="cake_prc" id="newPrice'+allItemArr[i].productId+'"> <i class="fa fa-inr" aria-hidden="true"></i>'
							+ allItemArr[i].defaultPrice+'<p class="per_kg" style="font-size: 12px; vertical-align: middle; display: none;">'+allItemArr[i].uomShowName+'</p>'
							+ ' <span style="display:none;" class="off_prc"><i class="fa fa-inr" aria-hidden="true"></i>'
							+ allItemArr[i].defaultPrice
							+ '</span> <span style="display:none;"  class="prc_off">(23% Off)</span> </div> '
							+ ' <input type="hidden" class="tagNameHide" value="'+allItemArr[i].appliTagNames+'"> '
							+ ' </div> '
							+ ' <div class="cake_container"> '
							+ ' <h4 class="cake_nm single_row"> <a href="${pageContext.request.contextPath}/showProductDetail/'+allItemArr[i].productId+'">'
							+ allItemArr[i].productName + '</a> </h4><div class="card_cart_btn"> <a href="javascript:void(0)" onclick="addCart('+allItemArr[i].productId+','+allItemArr[i].rateSettingType+')" class="cart_btn">Add to Cart</a> </div>'
							+ ' </div> </div> </div> </li> '

					count++;

				}

			}
			document.getElementById("itemListUl").innerHTML = divStr;

			document.getElementById("divClose").click();
			//$("#mongi").hide();

			window.open('${pageContext.request.contextPath}/products/0',
					'_self');

		}

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
		
		
		function priceSort(val){

			var tempArr=$.parseJSON(document.getElementById("hiddenProductList").innerHTML);
			
			
			
			var noimage='onerror="this.src=\'${pageContext.request.contextPath}/resources/images/no_img_folder/no-product-image.jpg\'"';

			
			
			if(tempArr.length>0){
				//alert(tempArr)
				if(parseInt(val)==1){
					tempArr.sort(function(a, b){
					    return parseFloat(b.defaultPrice)-parseFloat(a.defaultPrice)
					})

				}else{
					tempArr.sort(function(a, b){
					    return parseFloat(a.defaultPrice)-parseFloat(b.defaultPrice)
					})

				}
				
			
				//alert(JSON.stringify(tempArr))
				
				
				var noimage='onerror="this.src=\'${pageContext.request.contextPath}/resources/images/no_img_folder/no-product-image.jpg\'"';

				
				
				var divStr="";
				var count=0;
				for (var i = 0; i < tempArr.length; i++) {
							/*try{
						var isLike=tempArr[i].isLike;						
						var like = '';
						
						var isVegType = '';
						var isVegItem = tempArr[i].vegNonvegName;
						
						if(isVegItem=='VEG'){
							isVegType = '<div class="purity_icn">'
							+ '<img src="${pageContext.request.contextPath}/resources/images/veg_icn.jpg" alt="">' 
							+ '</div>';
						}else if(isVegItem=='NON-VEG'){
							isVegType = '<div class="purity_icn">'
							+ '<img src="${pageContext.request.contextPath}/resources/images/nonveg_icn.jpg" alt="">' 
							+ '</div>';
						}else{
							isVegType = '<div class="purity_icn">'
								+ '<img src="${pageContext.request.contextPath}/resources/images/veg_icn.jpg" alt="">' 
								+ '</div><div class="purity_icn">'
								+ '<img src="${pageContext.request.contextPath}/resources/images/nonveg_icn.jpg" alt="">' 
								+ '</div>';
						}
						
						if(isLike ==1){
						
							like = '<div class="circle_tag active" onclick="setLike('+tempArr[i].productId+')">'
							+ '<img id="like'+tempArr[i].productId+'" src="${pageContext.request.contextPath}/resources/images/heart.svg" alt="">' 
							+ '</div>';
						}else{
							
							like = '<div class="circle_tag active" onclick="setLike('+tempArr[i].productId+')">'
							+ '<img id="like'+tempArr[i].productId+'" src="${pageContext.request.contextPath}/resources/images/heart-1.svg" alt="">' 
							+ '</div>';
						}
						//var detail='<a href="${pageContext.request.contextPath}/showProductDetail/'+hiddenProductListArr[i].productId+'">'
						divStr = divStr
						+ '<li>'
						+ ' <div class="item_div"> '
						+ ' <div class="cake_one product_padd"> '
						+ ' <div class="cake_pic"> '
						+ ' <a href="${pageContext.request.contextPath}/showProductDetail/'+tempArr[i].productId+'">'
						+ ' <img src="${prodImgUrl}'+tempArr[i].prodImagePrimary+'" '+noimage+' data-src="${prodImgUrl}'+tempArr[i].prodImagePrimary+'" alt="" class="mobile_fit transition"> </a>'
						+ like
						+ isVegType						
						+ ' <div class="cake_prc" id="newPrice'+tempArr[i].productId+'"> <i class="fa fa-inr" aria-hidden="true"></i>'
						+ tempArr[i].defaultPrice+'/- <p class="per_kg" style="font-size: 12px; vertical-align: middle; display: inline-block;">'+tempArr[i].uomShowName+'</p>'
						+ ' <span style="display:none;" class="off_prc"><i class="fa fa-inr" aria-hidden="true"></i>'
						+ tempArr[i].defaultPrice
						+ '</span> <span style="display:none;"  class="prc_off"></span> </div> '
						+ ' <input type="hidden" class="tagNameHide" value="'+tempArr[i].appliTagNames+'"> '
						+ ' </div> '
						+ ' <div class="cake_container"> '
						+ ' <h4 class="cake_nm single_row"> <a href="${pageContext.request.contextPath}/showProductDetail/'+tempArr[i].productId+'">'
						+ tempArr[i].productName + '</a> </h4><div class="card_cart_btn"> <a href="javascript:void(0)" onclick="addCart('+tempArr[i].productId+','+tempArr[i].rateSettingType+')" class="cart_btn">Add to Cart</a> </div>'
						+ ' </div> </div> </div> </li> ';

								
								
							}catch (e) {
								alert(e);
							}	*/
							console.log("C",1)
					var cakeDrpDwn=setWeightOrQtyDropDown(tempArr[i]);
					var wtList=tempArr[i].availInWeights.split(',');
					//alert(tempArr[i].productName +"-"+tempArr[i].defaultPrice)
					 
/* if(tempArr[i].rateSettingType==0){
						
					}
					 else if(wtList[0]<=1){
						tempArr[i].defaultPrice=tempArr[i].defaultPrice*wtList[0];
					} */
					//alert("hi")
					//alert(tempArr[i].productName +"-"+tempArr[i].defaultPrice);
					var isLike=tempArr[i].isLike;
					var like = '';
					
					var isVegType = '';
					var isVegItem = tempArr[i].vegNonvegName;
					
					if(isVegItem=='VEG'){
						isVegType = '<div class="purity_icn">'
						+ '<img src="${pageContext.request.contextPath}/resources/images/veg_icn.jpg" alt="">' 
						+ '</div>';
					}else if(isVegItem=='NON-VEG'){
						isVegType = '<div class="purity_icn">'
						+ '<img src="${pageContext.request.contextPath}/resources/images/nonveg_icn.jpg" alt="">' 
						+ '</div>';
					}else{
						isVegType = '<div class="purity_icn">'
							+ '<img src="${pageContext.request.contextPath}/resources/images/veg_icn.jpg" alt="">' 
							+ '</div><div class="purity_icn">'
							+ '<img src="${pageContext.request.contextPath}/resources/images/nonveg_icn.jpg" alt="">' 
							+ '</div>';
					}	
					
					if(isLike ==1){
					
						like = '<div class="circle_tag active" onclick="setLike('+tempArr[i].productId+')">'
						+ '<img id="like'+tempArr[i].productId+'" src="${pageContext.request.contextPath}/resources/images/heart.svg" alt="">' 
						+ '</div>';
					}else{
						
						like = '<div class="circle_tag active" onclick="setLike('+tempArr[i].productId+')">'
						+ '<img id="like'+tempArr[i].productId+'" src="${pageContext.request.contextPath}/resources/images/heart-1.svg" alt="">' 
						+ '</div>';
					}
					var detail='<a href="${pageContext.request.contextPath}/showProductDetail/'+tempArr[i].productId+'">'
						divStr = divStr
					+ '<li>'
					+ ' <div class="item_div"> '
					+ ' <div class="cake_one product_padd"> '
					+ ' <div class="cake_pic"> '+detail
					+ ' <img src="${prodImgUrl}'+tempArr[i].prodImagePrimary+'" '+noimage+' data-src="${prodImgUrl}'+tempArr[i].prodImagePrimary+'" alt="" class="mobile_fit transition"></a> '
					+ isVegType
					+ like
					+ ' <div class="cake_prc" id="newPrice'+tempArr[i].productId+'"> <i class="fa fa-inr" aria-hidden="true"></i>'
					+ tempArr[i].defaultPrice+'<p class="per_kg" style="font-size: 12px; vertical-align: middle; display: none;">'+tempArr[i].uomShowName+'</p>'
					+ ' <span style="display:none;" class="off_prc" ><i class="fa fa-inr" aria-hidden="true"></i>'
					+ tempArr[i].defaultPrice
					+ '</span> <span style="display:none;"  class="prc_off">(23% Off)</span> </div> '
					+ ' <input type="hidden" class="tagNameHide" value="'+tempArr[i].appliTagNames+'"> '
					+ ' </div> '
					+ ' <div class="cake_container"> '
					+ ' <h4 class="cake_nm single_row"> <a href="${pageContext.request.contextPath}/showProductDetail/'+tempArr[i].productId+'">'
					+ tempArr[i].productName + '</a> </h4>'+cakeDrpDwn+'<div class="radio_r"> <a href="javascript:void(0)" onclick="addCart('+tempArr[i].productId+','+tempArr[i].rateSettingType+')" title="Add To Cart"><i class="fa fa-shopping-cart shop_cart"></i></a> </div>'
					+ ' </div> </div> </div> </li> ';


						count++;

				}
				document.getElementById("itemListUl").innerHTML = "";
				document.getElementById("itemListUl").innerHTML = divStr;
				
			}
			
			
		}
		
		
		/* ********************************************************************** */
		
		
		function loadData() {

			var noimage='onerror="this.src=\'${pageContext.request.contextPath}/resources/images/no_img_folder/no-product-image.jpg\'"';

			
			if (sessionStorage.getItem("selTags") == null) {
				var table = [];
				sessionStorage.setItem("selTags", JSON.stringify(table));
			}

			if (sessionStorage.getItem("allItemList") == null) {
				var table = [];
				sessionStorage.setItem("allItemList", JSON.stringify(table));
			}

			if (sessionStorage.getItem("priceFilterMin") == null) {
				sessionStorage.setItem("priceFilterMin", "0");
			}

			if (sessionStorage.getItem("priceFilterMax") == null) {
				sessionStorage.setItem("priceFilterMax", "0");
			}

			if (sessionStorage.getItem("menuFilterName") == null) {
				sessionStorage.setItem("menuFilterName", "");
			}
			
			

			var filterArr = [];
			var menuFilter=sessionStorage.getItem("menuFilterName");
			if(menuFilter!=''){
				filterArr=menuFilter.split(",");
			}

			var min = sessionStorage.getItem("priceFilterMin");
			var max = sessionStorage.getItem("priceFilterMax");

			var allItemList = sessionStorage.getItem("allItemList");
			var allItemArr = $.parseJSON(allItemList);

			var tags = sessionStorage.getItem("selTags");
			var selTags = $.parseJSON(tags);
			
			var catId=sessionStorage.getItem("findCatId");
			var isFilterMenu=sessionStorage.getItem("filterMenu");
			
			/* var flvTagStatusList=parseJSON(document.getElementById("hideFlvList").innerHTML);
			var flvTagStatusList=${allData};
			alert(flvTagStatusList) */

			var divStr = "";

			var count = 0;
			
			var hiddenProductListArr = [];
			var displayListArr = [];
			
			
			if(isFilterMenu == 1){
				
				//Search from filter menu
				
				var tempFilterIdArr=[];
				var tempFilterRes=[];
				var finalFilterRes=[];
				var filteredList=[];
				
				var tempFilterNameForCount1=[];
				
				var checkForCount2=0;
				
				
				for (var f = 0; f < filterArr.length; f++) {
				
					if(!tempFilterIdArr.includes(filterArr[f].split("~")[1])){
						tempFilterIdArr.push(filterArr[f].split("~")[1]);
					}
					
				}
				
				//alert(tempFilterIdArr+"          "+tempFilterIdArr.length+"                  "+filterArr.length)
				
				
				//for count=1
				for (var t = 0; t < tempFilterIdArr.length; t++) {
				
					var tempCount=0;
					for (var f = 0; f < filterArr.length; f++) {
						if(tempFilterIdArr[t] == filterArr[f].split("~")[1]){
							tempCount = tempCount+1;
						}
					}
					
					//alert(tempFilterIdArr[t]+" -----------> "+tempCount);
					
					if(tempCount==1){
						checkForCount2 = 1;
						//alert("count 1")
						
						for (var f = 0; f < filterArr.length; f++) {
							if (tempFilterIdArr[t] == filterArr[f].split("~")[1]){
								tempFilterNameForCount1.push(filterArr[f].split("~")[0]);
							}
						}
						
					}
					
				}
				
				//alert(tempFilterNameForCount1)
				
				
				for (var i = 0; i < allItemArr.length; i++) {
					
					var isPresent=0;
					
					for (var f = 0; f < tempFilterNameForCount1.length; f++) {
						
						var tempFilterArr=allItemArr[i].allFilterNames.split(",");
						
						if(tempFilterArr.length>0){
							
							if( tempFilterArr.includes(tempFilterNameForCount1[f]) && allItemArr[i].prodCatId == catId ){
								isPresent=1;
							}else{
								isPresent=0;
								break;
							}
							
						}
					
					}
					
					//alert(allItemArr[i].productName+" ------------> "+isPresent)
					
					if(isPresent==1){
						finalFilterRes.push(allItemArr[i]);
						filteredList.push(allItemArr[i]);
					}
				
				}
				
				
				//alert("-------------------------  "+finalFilterRes)
				
				//alert("check 2 ------------ "+checkForCount2)
				
				
				//---------------------------------------------------
				
				//for count 2
			 	for (var t = 0; t < tempFilterIdArr.length; t++) {
				
					var tempCount=0;
					for (var f = 0; f < filterArr.length; f++) {
						if(tempFilterIdArr[t] == filterArr[f].split("~")[1]){
							tempCount = tempCount+1;
						}
					}
					
					//alert(tempFilterIdArr[t]+" -----------> "+tempCount);
					
					if(tempCount>1){
						//alert("count 2")
						
						if(checkForCount2 == 1){
							
							//alert(checkForCount2)
							
							if(finalFilterRes.length>0){
								
								for (var i = 0; i < finalFilterRes.length; i++) {
									
									for (var f = 0; f < filterArr.length; f++) {
										
										var tempFilterArr=finalFilterRes[i].allFilterNames.split(",");
										
										if(tempFilterArr.length>0){
											
											if( tempFilterArr.includes(filterArr[f].split("~")[0])){
												var prodIsPresent=0;

												for (var k = 0; k < filteredList.length; k++) {
													if(filteredList[k].productId==finalFilterRes[i].productId){
														prodIsPresent=1;
														break;
													}
												}
												
												if(prodIsPresent==0){
													filteredList.push(finalFilterRes[i]);
												}
												
											}
											
										}
									
									}
								
								}
								
							}
							
						}else{
							
							for (var i = 0; i < allItemArr.length; i++) {
								
								for (var f = 0; f < filterArr.length; f++) {
									
									var tempFilterArr=allItemArr[i].allFilterNames.split(",");
									
									if(tempFilterArr.length>0){
										
										if( tempFilterArr.includes(filterArr[f].split("~")[0])){
											
											var prodIsPresent=0;
											for (var k = 0; k < filteredList.length; k++) {
												if(filteredList[k].productId==allItemArr[i].productId){
													prodIsPresent=1;
													break;
												}
											}
											
											if(prodIsPresent==0){
												filteredList.push(allItemArr[i]);
											}
											
										}
										
									}
								
								}
							
							}
							
						}
						
						
					}else{
						//alert("naaaa   "+filteredList.length)
					}
				}
				
			 	for (var i = 0; i < filteredList.length; i++) {
			 		
			 		/* if(filteredList[i].isLike==1){
			 			alert(filteredList[i])
			 		} */
			 		hiddenProductListArr.push(filteredList[i]);
			 	}
				
			 	
			//********************************************************************************************
				//end isFilterMenu--------------------------------------
			}else{
				
				
				for (var i = 0; i < allItemArr.length; i++) {

					if (selTags.length > 0) {
						
						for (var t = 0; t < selTags.length; t++) {

							if (allItemArr[i].appliTagNames.toLowerCase().indexOf(selTags[t].toLowerCase())>=0) {
								
								var isFound=0;
								for(var y=0; y<hiddenProductListArr.length; y++){
									if(allItemArr[i].productId==hiddenProductListArr[y].productId){
										isFound=1;
									}
								}
								
								if(isFound == 0){
									hiddenProductListArr.push(allItemArr[i]);
								}
								
								break;
								
							}
						}

					} else {
						
						//alert("filterArr  = "+filterArr.length);
						
							if(filterArr.length>0){
								
								
								if(isFilterMenu==1){
									
								}else{
									
									for (var f = 0; f < filterArr.length; f++) {
										
										if(catId == 0){
											
			
											var tempFilterArr=allItemArr[i].allFilterNames.split(",");
											
											if(tempFilterArr.length>0){
												
												if (tempFilterArr.includes(filterArr[f])) {
													
													
													var isFound=0;
													for(var y=0; y<hiddenProductListArr.length; y++){
														if(allItemArr[i].productId==hiddenProductListArr[y].productId){
															isFound=1;
														}
													}
													
													if(isFound == 0){
														hiddenProductListArr.push(allItemArr[i]);
													}
													
													break;
													
												}else if(allItemArr[i].productName.toLowerCase().indexOf(filterArr[f].toLowerCase())>=0 || allItemArr[i].allFilterNames.toLowerCase().indexOf(filterArr[f].toLowerCase())>=0){
													
													var isFound=0;
													for(var y=0; y<hiddenProductListArr.length; y++){
														if(allItemArr[i].productId==hiddenProductListArr[y].productId){
															isFound=1;
														}
													}
													
													if(isFound == 0){
														hiddenProductListArr.push(allItemArr[i]);
													}
													
													break;
												
													
												}
												
											}
											
										}else{
											
											//NOT USED CURRENTLY*************************************************
											
											//alert("catId - "+catId)
											

											var tempFilterArr=allItemArr[i].allFilterNames.split(",");
											
											if(tempFilterArr.length>0){
												
												//alert("tempFilterArr  :  "+tempFilterArr+"           filterArr[f] : "+filterArr[f]+"    prodCatId : "+allItemArr[i].prodCatId+"          CAT ID : "+catId);
												
												if (tempFilterArr.includes(filterArr[f]) && allItemArr[i].prodCatId == catId) {
													
													
													
													var isFound=0;
													for(var y=0; y<hiddenProductListArr.length; y++){
														if(allItemArr[i].productId==hiddenProductListArr[y].productId){
															isFound=1;
														}
													}
													
													if(isFound == 0){
														//alert("MATCH ---- "+allItemArr[i])
														hiddenProductListArr.push(allItemArr[i]);
													}
													
													break;
													
												}else if(allItemArr[i].productName.toLowerCase().indexOf(filterArr[f].toLowerCase())>=0   && allItemArr[i].prodCatId == catId){
													
													var isFound=0;
													for(var y=0; y<hiddenProductListArr.length; y++){
														if(allItemArr[i].productId==hiddenProductListArr[y].productId){
															isFound=1;
														}
													}
													
													if(isFound == 0){
														hiddenProductListArr.push(allItemArr[i]);
													}
													
													break;
												
												}
												
											}
										}//else catId not zero
										
										
										
									}
									
								}
								
								
								
								
							}
							

					}//tags else

				}//all item list for end
				
			}
			
			
			

		
			
			//alert(hiddenProductListArr.length)
			
			if(hiddenProductListArr.length > 0){
				
				//alert("Anmol")
				var val;
				for(var i=0; i<hiddenProductListArr.length; i++){
					 /* if(hiddenProductListArr[i].isLike==1){
						alert("Ok 1488"+hiddenProductListArr[i].productName)
					} */
					if(catId==0){
						//alert("OkAAAA 06-04-2021")
						displayListArr.push(hiddenProductListArr[i]);
						//setProductData(hiddenProductListArr[i]);
						console.log("Z",1)
						var drpDwn = '';
						/* var cakeDrpDwn = '<div class="cake_dropdown">'
							cakeDrpDwn += '<div class="cake_dropdown_l">' */
							//SACHIN CODE
							//console.log("my data ",hiddenProductListArr[0]);
								var cakeDrpDwn= null;
								var isHalfKg=0;
									if(hiddenProductListArr[i].rateSettingType==0){
									cakeDrpDwn =
											'<div class="cake_dropdown_l"><div class="plus_minus_one">'+
											'<button type="button" value="" field="quantity"class="qtyminus slide" '
												+'onclick="setQtyText('+hiddenProductListArr[i].productId+',0)">'
												+'<i class="fa fa-minus" aria-hidden="true"></i></button>'+
											'<input type="text" id="txtWt'+hiddenProductListArr[i].productId+'"'
												+'value="1" readonly style="text-align: center;"'+
												'class="qty slide">'+
											'<button type="button" value="" field="quantity"'+
												'onclick="setQtyText('+hiddenProductListArr[i].productId+',1)"'
												+'class="qtyplus slide">'+
												'<i class="fa fa-plus" aria-hidden="true"></i>'+
											'</button></div>'
										}
										else{
											var dataOption=''
												var wtList=hiddenProductListArr[i].availInWeights.split(',');
												//alert(wtList);
										//	var dataOption='<option value="0">Select Weight</option>'
										//var wtList=hiddenProductListArr[i].availInWeights.split(',');
											if(allItemArr[i].rateSettingType==0){
												
											}else if(wtList[0]<=1){
												hiddenProductListArr[i].defaultPrice=hiddenProductListArr[i].defaultPrice*wtList[0];
											}
										
											if(parseFloat(wtList[0])>0){
											for(var d=0;d<wtList.length;d++){
												dataOption+='<option value="'+wtList[d]+'">'+wtList[d]+'</option>'
											}
											}
											//alert(dataOption)
											
											cakeDrpDwn =
									'<div class="cake_dropdown_l"><div class="small_field">'+
										'<select class="select-css" id="wt'+hiddenProductListArr[i].productId+'"'+
											'onchange="setPriceByWtAndFlavour('+hiddenProductListArr[i].productId+','+hiddenProductListArr[i].rateSettingType+')">'+
											dataOption+
										'</select></div>'
										}
								//cakeDrpDwn +='<span class="prod_kgs">'+hiddenProductListArr[i].uomShowName+'</span></div>'
																cakeDrpDwn +='<span class="prod_kgs"></span></div>'

								//SACHIN CODE END
								dataOption=null;
						
						 var isLike=hiddenProductListArr[i].isLike;						
						var like = '';
						
						var isVegType = '';
						var isVegItem = hiddenProductListArr[i].vegNonvegName;
						
						if(isVegItem=='VEG'){
							isVegType = '<div class="purity_icn">'
							+ '<img src="${pageContext.request.contextPath}/resources/images/veg_icn.jpg" alt="">' 
							+ '</div>';
						}else if(isVegItem=='NON-VEG'){
							isVegType = '<div class="purity_icn">'
							+ '<img src="${pageContext.request.contextPath}/resources/images/nonveg_icn.jpg" alt="">' 
							+ '</div>';
						}else{
							isVegType = '<div class="purity_icn">'
								+ '<img src="${pageContext.request.contextPath}/resources/images/veg_icn.jpg" alt="">' 
								+ '</div><div class="purity_icn">'
								+ '<img src="${pageContext.request.contextPath}/resources/images/nonveg_icn.jpg" alt="">' 
								+ '</div>';
						}
						
						if(isLike ==1){
						
							like = '<div class="circle_tag active" onclick="setLike('+hiddenProductListArr[i].productId+')">'
							+ '<img id="like'+hiddenProductListArr[i].productId+'" src="${pageContext.request.contextPath}/resources/images/heart.svg" alt="">' 
							+ '</div>';
						}else{
							
							like = '<div class="circle_tag active" onclick="setLike('+hiddenProductListArr[i].productId+')">'
							+ '<img id="like'+hiddenProductListArr[i].productId+'" src="${pageContext.request.contextPath}/resources/images/heart-1.svg" alt="">' 
							+ '</div>';
						}
						//var detail='<a href="${pageContext.request.contextPath}/showProductDetail/'+hiddenProductListArr[i].productId+'">'
						divStr = divStr
						+ '<li>'
						+ ' <div class="item_div"> '
						+ ' <div class="cake_one product_padd"> '
						+ ' <div class="cake_pic"> '
						+ ' <a href="${pageContext.request.contextPath}/showProductDetail/'+hiddenProductListArr[i].productId+'">'
						+ ' <img src="${prodImgUrl}'+hiddenProductListArr[i].prodImagePrimary+'" '+noimage+' data-src="${prodImgUrl}'+hiddenProductListArr[i].prodImagePrimary+'" alt="" class="mobile_fit transition"> </a>'
						+ like
						+ isVegType						
						+ ' <div class="cake_prc" id="newPrice'+hiddenProductListArr[i].productId+'"> <i class="fa fa-inr" aria-hidden="true"></i>'
						+ hiddenProductListArr[i].defaultPrice+'<p class="per_kg" style="font-size: 12px; vertical-align: middle; display: none;">'+hiddenProductListArr[i].uomShowName+'</p>'
						+ ' <span style="display:none;" class="off_prc"><i class="fa fa-inr" aria-hidden="true"></i>'
						+ hiddenProductListArr[i].defaultPrice
						+ '</span> <span style="display:none;"  class="prc_off"></span> </div> '
						+ ' <input type="hidden" class="tagNameHide" value="'+hiddenProductListArr[i].appliTagNames+'"> '
						+ ' </div> '
						+ ' <div class="cake_container"> '
						+ ' <h4 class="cake_nm single_row"> <a href="${pageContext.request.contextPath}/showProductDetail/'+hiddenProductListArr[i].productId+'">'
						+ hiddenProductListArr[i].productName + '</a> </h4>'+cakeDrpDwn+'<div class="radio_r"> <a href="javascript:void(0)" onclick="addCart('+hiddenProductListArr[i].productId+','+hiddenProductListArr[i].rateSettingType+')" title="Add To Cart"><i class="fa fa-shopping-cart shop_cart"></i></a> </div>'
						+ ' </div> </div> </div> </li> ';

						count++;
						console.log("X",1)
					}else{
						
						//alert("hi")
						
						//alert("cat - "+hiddenProductListArr[i].prodCatId+"                "+catId);
						
						if(max > 0 && hiddenProductListArr[i].defaultPrice >= min && hiddenProductListArr[i].defaultPrice <= max && hiddenProductListArr[i].prodCatId == catId){
							console.log("UU",1)
							displayListArr.push(hiddenProductListArr[i]);
							//SAC NEW
							var cakeDrpDwn=setWeightOrQtyDropDown(hiddenProductListArr[i]);
							var wtList=hiddenProductListArr[i].availInWeights.split(',');
							if(allItemArr[i].rateSettingType==0){
								
							}else if(wtList[0]<=1){
								hiddenProductListArr[i].defaultPrice=hiddenProductListArr[i].defaultPrice*wtList[0];
							}
							var isLike=hiddenProductListArr[i].isLike;
							var like = '';
							
							var isVegType = '';
							var isVegItem = hiddenProductListArr[i].vegNonvegName;
							
							if(isVegItem=='VEG'){
								isVegType = '<div class="purity_icn">'
								+ '<img src="${pageContext.request.contextPath}/resources/images/veg_icn.jpg" alt="">' 
								+ '</div>';
							}else if(isVegItem=='NON-VEG'){
								isVegType = '<div class="purity_icn">'
								+ '<img src="${pageContext.request.contextPath}/resources/images/nonveg_icn.jpg" alt="">' 
								+ '</div>';
							}else{
								isVegType = '<div class="purity_icn">'
									+ '<img src="${pageContext.request.contextPath}/resources/images/veg_icn.jpg" alt="">' 
									+ '</div><div class="purity_icn">'
									+ '<img src="${pageContext.request.contextPath}/resources/images/nonveg_icn.jpg" alt="">' 
									+ '</div>';
							}
							
							if(isLike ==1){
							
								like = '<div class="circle_tag active" onclick="setLike('+hiddenProductListArr[i].productId+')">'
								+ '<img id="like'+hiddenProductListArr[i].productId+'" src="${pageContext.request.contextPath}/resources/images/heart.svg" alt="">' 
								+ '</div>';
							}else{
								
								like = '<div class="circle_tag active" onclick="setLike('+hiddenProductListArr[i].productId+')">'
								+ '<img id="like'+hiddenProductListArr[i].productId+'" src="${pageContext.request.contextPath}/resources/images/heart-1.svg" alt="">' 
								+ '</div>';
							}
							var detail='<a href="${pageContext.request.contextPath}/showProductDetail/'+hiddenProductListArr[i].productId+'">'
							divStr = divStr
							+ '<li>'
							+ ' <div class="item_div"> '
							+ ' <div class="cake_one product_padd"> '
							+ ' <div class="cake_pic"> '+detail
							+ ' <img src="${prodImgUrl}'+hiddenProductListArr[i].prodImagePrimary+'" '+noimage+' data-src="${prodImgUrl}'+hiddenProductListArr[i].prodImagePrimary+'" alt="" class="mobile_fit transition"> </a>'
							+ isVegType
							+ like							
							+ ' <div class="cake_prc" id="newPrice'+hiddenProductListArr[i].productId+'"> <i class="fa fa-inr" aria-hidden="true"></i>'
							+ hiddenProductListArr[i].defaultPrice+'<p class="per_kg" style="font-size: 12px; vertical-align: middle; display: none;">'+hiddenProductListArr[i].uomShowName+'</p>'
							+ ' <span style="display:none;" class="off_prc"><i class="fa fa-inr" aria-hidden="true"></i>'
							+ hiddenProductListArr[i].defaultPrice
							+ '</span> <span style="display:none;"  class="prc_off">(23% Off)</span> </div> '
							+ ' <input type="hidden" class="tagNameHide" value="'+hiddenProductListArr[i].appliTagNames+'"> '
							+ ' </div> '
							+ ' <div class="cake_container"> '
							+ ' <h4 class="cake_nm single_row"> <a href="${pageContext.request.contextPath}/showProductDetail/'+hiddenProductListArr[i].productId+'">'
							+ hiddenProductListArr[i].productName + '</a> </h4>'+cakeDrpDwn+'<div class="radio_r"> <a href="javascript:void(0)" onclick="addCart('+hiddenProductListArr[i].productId+','+hiddenProductListArr[i].rateSettingType+')" title="Add To Cart"><i class="fa fa-shopping-cart shop_cart"></i></a> </div>'
							+ ' </div> </div> </div> </li> ';
							console.log("UK",1)
							count++;
							
						}else if(max == 0  && hiddenProductListArr[i].prodCatId == catId){
							
							//alert("aaaaaaaaa")
							
							displayListArr.push(hiddenProductListArr[i]);
							//SAC NEW
							var cakeDrpDwn=setWeightOrQtyDropDown(hiddenProductListArr[i]);
							var wtList=hiddenProductListArr[i].availInWeights.split(',');
							//alert(allItemArr[i].rateSettingType+"wt "+wtList)
							if(hiddenProductListArr[i].rateSettingType==0){
								
							}else if(wtList[0]<=1){
								hiddenProductListArr[i].defaultPrice=hiddenProductListArr[i].defaultPrice*wtList[0];
							}
							var isLike=hiddenProductListArr[i].isLike;
							var like = '';
							
							var isVegType = '';
							var isVegItem = hiddenProductListArr[i].vegNonvegName;
							
							if(isVegItem=='VEG'){
								isVegType = '<div class="purity_icn">'
								+ '<img src="${pageContext.request.contextPath}/resources/images/veg_icn.jpg" alt="">' 
								+ '</div>';
							}else if(isVegItem=='NON-VEG'){
								isVegType = '<div class="purity_icn">'
								+ '<img src="${pageContext.request.contextPath}/resources/images/nonveg_icn.jpg" alt="">' 
								+ '</div>';
							}else{
								isVegType = '<div class="purity_icn">'
									+ '<img src="${pageContext.request.contextPath}/resources/images/veg_icn.jpg" alt="">' 
									+ '</div><div class="purity_icn">'
									+ '<img src="${pageContext.request.contextPath}/resources/images/nonveg_icn.jpg" alt="">' 
									+ '</div>';
							}
							
							if(isLike ==1){
							
								like = '<div class="circle_tag active" onclick="setLike('+hiddenProductListArr[i].productId+')">'
								+ '<img id="like'+hiddenProductListArr[i].productId+'" src="${pageContext.request.contextPath}/resources/images/heart.svg" alt="">' 
								+ '</div>';
							}else{
								
								like = '<div class="circle_tag active" onclick="setLike('+hiddenProductListArr[i].productId+')">'
								+ '<img id="like'+hiddenProductListArr[i].productId+'" src="${pageContext.request.contextPath}/resources/images/heart-1.svg" alt="">' 
								+ '</div>';
							}
							var detail='<a href="${pageContext.request.contextPath}/showProductDetail/'+hiddenProductListArr[i].productId+'">'
							divStr = divStr
							+ '<li>'
							+ ' <div class="item_div"> '
							+ ' <div class="cake_one product_padd"> '
							+ ' <div class="cake_pic"> '+detail
							+ ' <img src="${prodImgUrl}'+hiddenProductListArr[i].prodImagePrimary+'" '+noimage+' data-src="${prodImgUrl}'+hiddenProductListArr[i].prodImagePrimary+'" alt="" class="mobile_fit transition"> </a>'
							+ isVegType
							+ like							
							+ ' <div class="cake_prc" id="newPrice'+hiddenProductListArr[i].productId+'"> <i class="fa fa-inr" aria-hidden="true"></i>'
							+ hiddenProductListArr[i].defaultPrice+'<p class="per_kg" style="font-size: 12px; vertical-align: middle; display: none;">'+hiddenProductListArr[i].uomShowName+'</p>'
							+ ' <span style="display:none;" class="off_prc"><i class="fa fa-inr" aria-hidden="true"></i>'
							+ hiddenProductListArr[i].defaultPrice
							+ '</span> <span style="display:none;"  class="prc_off">(23% Off)</span> </div> '
							+ ' <input type="hidden" class="tagNameHide" value="'+hiddenProductListArr[i].appliTagNames+'"> '
							+ ' </div> '
							+ ' <div class="cake_container"> '
							+ ' <h4 class="cake_nm single_row"> <a href="${pageContext.request.contextPath}/showProductDetail/'+hiddenProductListArr[i].productId+'">'
							+ hiddenProductListArr[i].productName + '</a> </h4>'+cakeDrpDwn+'<div class="radio_r"> <a href="javascript:void(0)" onclick="addCart('+hiddenProductListArr[i].productId+','+hiddenProductListArr[i].rateSettingType+')" title="Add To Cart"><i class="fa fa-shopping-cart shop_cart"></i></a> </div>'
							+ ' </div> </div> </div> </li> ';
							console.log("SD",1)
							
							count++;
						}
					}
				}
				
			}else{
				
				for (var i = 0; i < allItemArr.length; i++) {
					
					if(catId == 0){
						
						displayListArr.push(allItemArr[i]);
						//SAC NEW
						var cakeDrpDwn=setWeightOrQtyDropDown(allItemArr[i]);
						var wtList=allItemArr[i].availInWeights.split(',');
						if(allItemArr[i].rateSettingType==0){
							
						}else if(wtList[0]<=1){
							allItemArr[i].defaultPrice=allItemArr[i].defaultPrice*wtList[0];
						}
						var isLike=allItemArr[i].isLike;
						var like = '';
						
						var isVegType = '';
						var isVegItem = allItemArr[i].vegNonvegName;
						
						if(isVegItem=='VEG'){
							isVegType = '<div class="purity_icn">'
							+ '<img src="${pageContext.request.contextPath}/resources/images/veg_icn.jpg" alt="">' 
							+ '</div>';
						}else if(isVegItem=='NON-VEG'){
							isVegType = '<div class="purity_icn">'
							+ '<img src="${pageContext.request.contextPath}/resources/images/nonveg_icn.jpg" alt="">' 
							+ '</div>';
						}else{
							isVegType = '<div class="purity_icn">'
								+ '<img src="${pageContext.request.contextPath}/resources/images/veg_icn.jpg" alt="">' 
								+ '</div><div class="purity_icn">'
								+ '<img src="${pageContext.request.contextPath}/resources/images/nonveg_icn.jpg" alt="">' 
								+ '</div>';
						}						
						
						if(isLike ==1){
						
							like = '<div class="circle_tag active" onclick="setLike('+allItemArr[i].productId+')">'
							+ '<img id="like'+allItemArr[i].productId+'"   src="${pageContext.request.contextPath}/resources/images/heart.svg" alt="">' 
							+ '</div>';
						}else{
							
							like = '<div class="circle_tag active" onclick="setLike('+allItemArr[i].productId+')">'
							+ '<img id="like'+allItemArr[i].productId+'" src="${pageContext.request.contextPath}/resources/images/heart-1.svg" alt="">' 
							+ '</div>';
						}
						
						var detail='<a href="${pageContext.request.contextPath}/showProductDetail/'+allItemArr[i].productId+'">'
						divStr = divStr
						+ '<li>'
						+ ' <div class="item_div"> '
						+ ' <div class="cake_one product_padd"> '
						+ ' <div class="cake_pic"> '+detail
						+ ' <a href="${pageContext.request.contextPath}/showProductDetail/'+allItemArr[i].productId+'">'
						+ ' <img src="${prodImgUrl}'+allItemArr[i].prodImagePrimary+'" '+noimage+' data-src="${prodImgUrl}'+allItemArr[i].prodImagePrimary+'" alt="" class="mobile_fit transition"></a> '
						+ isVegType
						+ like						
						+ ' <div class="cake_prc" id="newPrice'+allItemArr[i].productId+'"> <i class="fa fa-inr" aria-hidden="true"></i>'
						+ allItemArr[i].defaultPrice+'<p class="per_kg" style="font-size: 12px; vertical-align: middle; display: none;">'+allItemArr[i].uomShowName+'</p>'
						+ ' <span style="display:none;" class="off_prc"><i class="fa fa-inr" aria-hidden="true"></i>'
						+ allItemArr[i].defaultPrice
						+ '</span> <span style="display:none;"  class="prc_off">(23% Off)</span> </div> '
						+ ' <input type="hidden" class="tagNameHide" value="'+allItemArr[i].appliTagNames+'"> '
						+ ' </a>'
						+ ' </div> '
						+ ' <div class="cake_container"> '
						+ ' <h4 class="cake_nm single_row"> <a href="${pageContext.request.contextPath}/showProductDetail/'+allItemArr[i].productId+'">'
						+ allItemArr[i].productName + '</a> </h4>'+cakeDrpDwn+'<div class="radio_r"><a href="javascript:void(0)" onclick="addCart('+allItemArr[i].productId+','+allItemArr[i].rateSettingType+')" title="Add To Cart"><i class="fa fa-shopping-cart shop_cart"></i></a> </div>'
						+ ' </div> </div> </div> </li> ';
						
						console.log("HJ",1)
						count++;
						
					} else{
						 
						// alert("hi")
						
						if(max > 0){
							
							if(allItemArr[i].defaultPrice >= min && allItemArr[i].defaultPrice <= max && allItemArr[i].prodCatId==catId){
								
								displayListArr.push(allItemArr[i]);
								//SAC NEW
								var cakeDrpDwn=setWeightOrQtyDropDown(allItemArr[i]);
								var wtList=allItemArr[i].availInWeights.split(',');
if(allItemArr[i].rateSettingType==0){
									
								}else if(wtList[0]<=1){
									allItemArr[i].defaultPrice=allItemArr[i].defaultPrice*wtList[0];
								}
								var isLike=allItemArr[i].isLike;
								var like = '';
								
								var isVegType = '';
								var isVegItem = allItemArr[i].vegNonvegName;
								
								if(isVegItem=='VEG'){
									isVegType = '<div class="purity_icn">'
									+ '<img src="${pageContext.request.contextPath}/resources/images/veg_icn.jpg" alt="">' 
									+ '</div>';
								}else if(isVegItem=='NON-VEG'){
									isVegType = '<div class="purity_icn">'
									+ '<img src="${pageContext.request.contextPath}/resources/images/nonveg_icn.jpg" alt="">' 
									+ '</div>';
								}else{
									isVegType = '<div class="purity_icn">'
										+ '<img src="${pageContext.request.contextPath}/resources/images/veg_icn.jpg" alt="">' 
										+ '</div><div class="purity_icn">'
										+ '<img src="${pageContext.request.contextPath}/resources/images/nonveg_icn.jpg" alt="">' 
										+ '</div>';
								}	
								
								if(isLike ==1){
								
									like = '<div class="circle_tag active" onclick="setLike('+allItemArr[i].productId+')">'
									+ '<img id="like'+allItemArr[i].productId+'" src="${pageContext.request.contextPath}/resources/images/heart.svg" alt="">' 
									+ '</div>';
								}else{
									
									like = '<div class="circle_tag active" onclick="setLike('+allItemArr[i].productId+')">'
									+ '<img id="like'+allItemArr[i].productId+'" src="${pageContext.request.contextPath}/resources/images/heart-1.svg" alt="">' 
									+ '</div>';
								}
								var detail='<a href="${pageContext.request.contextPath}/showProductDetail/'+allItemArr[i].productId+'">'
								divStr = divStr
								+ '<li>'
								+ ' <div class="item_div"> '
								+ ' <div class="cake_one product_padd"> '
								+ ' <div class="cake_pic"> '+detail
								+ ' <img src="${prodImgUrl}'+allItemArr[i].prodImagePrimary+'" '+noimage+' data-src="${prodImgUrl}'+allItemArr[i].prodImagePrimary+'" alt="" class="mobile_fit transition"></a> '
								+ isVegType
								+ like								
								+ ' <div class="cake_prc" id="newPrice'+allItemArr[i].productId+'"> <i class="fa fa-inr" aria-hidden="true"></i>'
								+ allItemArr[i].defaultPrice+'<p class="per_kg" style="font-size: 12px; vertical-align: middle; display: none;">'+allItemArr[i].uomShowName+'</p>'
								+ ' <span style="display:none;" class="off_prc"><i class="fa fa-inr" aria-hidden="true"></i>'
								+ allItemArr[i].defaultPrice
								+ '</span> <span style="display:none;"  class="prc_off">(23% Off)</span> </div> '
								+ ' <input type="hidden" class="tagNameHide" value="'+allItemArr[i].appliTagNames+'"> '
								+ ' </div> '
								+ ' <div class="cake_container"> '
								+ ' <h4 class="cake_nm single_row"> <a href="${pageContext.request.contextPath}/showProductDetail/'+allItemArr[i].productId+'">'
								+ allItemArr[i].productName + '</a> </h4>'+cakeDrpDwn+'<div class="radio_r"> <a href="javascript:void(0)" onclick="addCart('+allItemArr[i].productId+','+allItemArr[i].rateSettingType+')" title="Add To Cart"><i class="fa fa-shopping-cart shop_cart"></i></a> </div>'
								+ ' </div> </div> </div> </li> ';
								console.log("KLL",1)
								count++;
								
							}
							
						} else{
							
							if(allItemArr[i].prodCatId==catId && isFilterMenu==0){
								
								//alert("1819")
								
								displayListArr.push(allItemArr[i]);
								//SAC NEW
								var cakeDrpDwn=setWeightOrQtyDropDown(allItemArr[i]);
								var wtList=allItemArr[i].availInWeights.split(',');
								if(allItemArr[i].rateSettingType==0){
									
								}else
								if(wtList[0]<=1){
									allItemArr[i].defaultPrice=allItemArr[i].defaultPrice*wtList[0];
								}
								//alert("hi")
								
								var isLike=allItemArr[i].isLike;
								var like = '';
								
								var isVegType = '';
								var isVegItem = allItemArr[i].vegNonvegName;
								
								if(isVegItem=='VEG'){
									isVegType = '<div class="purity_icn">'
									+ '<img src="${pageContext.request.contextPath}/resources/images/veg_icn.jpg" alt="">' 
									+ '</div>';
								}else if(isVegItem=='NON-VEG'){
									isVegType = '<div class="purity_icn">'
									+ '<img src="${pageContext.request.contextPath}/resources/images/nonveg_icn.jpg" alt="">' 
									+ '</div>';
								}else{
									isVegType = '<div class="purity_icn">'
										+ '<img src="${pageContext.request.contextPath}/resources/images/veg_icn.jpg" alt="">' 
										+ '</div><div class="purity_icn">'
										+ '<img src="${pageContext.request.contextPath}/resources/images/nonveg_icn.jpg" alt="">' 
										+ '</div>';
								}	
								
								if(isLike ==1){
								
									like = '<div class="circle_tag active" onclick="setLike('+allItemArr[i].productId+')">'
									+ '<img id="like'+allItemArr[i].productId+'" src="${pageContext.request.contextPath}/resources/images/heart.svg" alt="">' 
									+ '</div>';
								}else{
									
									like = '<div class="circle_tag active" onclick="setLike('+allItemArr[i].productId+')">'
									+ '<img id="like'+allItemArr[i].productId+'" src="${pageContext.request.contextPath}/resources/images/heart-1.svg" alt="">' 
									+ '</div>';
								}
								var detail='<a href="${pageContext.request.contextPath}/showProductDetail/'+allItemArr[i].productId+'">'
	 							divStr = divStr
								+ '<li>'
								+ ' <div class="item_div"> '
								+ ' <div class="cake_one product_padd"> '
								+ ' <div class="cake_pic"> '+detail
								+ ' <img src="${prodImgUrl}'+allItemArr[i].prodImagePrimary+'" '+noimage+' data-src="${prodImgUrl}'+allItemArr[i].prodImagePrimary+'" alt="" class="mobile_fit transition"></a> '
								+ isVegType
								+ like
								+ ' <div class="cake_prc" id="newPrice'+allItemArr[i].productId+'"> <i class="fa fa-inr" aria-hidden="true"></i>'
								+ allItemArr[i].defaultPrice+' <p class="per_kg" style="font-size: 12px; vertical-align: middle; display: none;">'+allItemArr[i].uomShowName+'</p>'
								+ ' <span style="display:none;" class="off_prc" ><i class="fa fa-inr" aria-hidden="true"></i>'
								+ allItemArr[i].defaultPrice
								+ '</span> <span style="display:none;"  class="prc_off">(23% Off)</span> </div> '
								+ ' <input type="hidden" class="tagNameHide" value="'+allItemArr[i].appliTagNames+'"> '
								+ ' </div> '
								+ ' <div class="cake_container"> '
								+ ' <h4 class="cake_nm single_row"> <a href="${pageContext.request.contextPath}/showProductDetail/'+allItemArr[i].productId+'">'
								+ allItemArr[i].productName + '</a> </h4>'+cakeDrpDwn+'<div class="radio_r"> <a href="javascript:void(0)" onclick="addCart('+allItemArr[i].productId+','+allItemArr[i].rateSettingType+')" title="Add To Cart"><i class="fa fa-shopping-cart shop_cart"></i></a> </div>'
								+ ' </div> </div> </div> </li> ';
								console.log("LOPP",1)
								count++;
							
							}
						}
						
					} 
					
					
					
					
					
				}
				
			}
			

			
			if (selTags.length > 0) {
				for (var t = 0; t < selTags.length; t++) {
					menuFilter=menuFilter+","+selTags[t];
				}
				menuFilter=menuFilter.slice(1);
			}
			
			
			var table = [];
			sessionStorage.setItem("selTags", JSON.stringify(table));
			document.getElementById("itemListUl").innerHTML = divStr;
			document.getElementById("hiddenProductList").innerHTML = JSON.stringify(displayListArr);
			
			/* sessionStorage.setItem("priceFilterMin", "0");
			sessionStorage.setItem("priceFilterMax", "0");
			sessionStorage.setItem("menuFilterName", "");
			sessionStorage.setItem("findCatId", "0");
			sessionStorage.setItem("filterMenu", "0"); */
			
			
			var filterName=menuFilter.split(",");
			var names="";
			for (var t = 0; t < filterName.length; t++) {
				names=names+", "+filterName[t].split("~")[0];
			}
			names=names.slice(1);
			
			var prodCountTxt="";
			if(menuFilter!=""){
				prodCountTxt=count+' results found for '+'"'+names+'"';
			}else{
				prodCountTxt=count+" results found";
			}
			
			document.getElementById("prodCount").innerHTML = prodCountTxt;

		}
//Sachin 27-01-2021	For Setting data after search/filter/applying tag search.
var divStr='';
function setProductData(productObj){
			//alert("ll")
			var isLike=productObj.isLike;
			var like = '';
			var noimage='onerror="this.src=\'${pageContext.request.contextPath}/resources/images/no_img_folder/no-product-image.jpg\'"';

			var isVegType = '';
			var isVegItem = productObj.vegNonvegName;
			
			if(isVegItem=='VEG'){
				isVegType = '<div class="purity_icn">'
				+ '<img src="${pageContext.request.contextPath}/resources/images/veg_icn.jpg" alt="">' 
				+ '</div>';
			}else if(isVegItem=='NON-VEG'){
				isVegType = '<div class="purity_icn">'
				+ '<img src="${pageContext.request.contextPath}/resources/images/nonveg_icn.jpg" alt="">' 
				+ '</div>';
			}else{
				isVegType = '<div class="purity_icn">'
					+ '<img src="${pageContext.request.contextPath}/resources/images/veg_icn.jpg" alt="">' 
					+ '</div><div class="purity_icn">'
					+ '<img src="${pageContext.request.contextPath}/resources/images/nonveg_icn.jpg" alt="">' 
					+ '</div>';
			}	
			
			if(isLike ==1){
			
				like = '<div class="circle_tag active" onclick="setLike('+productObj.productId+')">'
				+ '<img id="like'+productObj.productId+'" src="${pageContext.request.contextPath}/resources/images/heart.svg" alt="">' 
				+ '</div>';
			}else{
				
				like = '<div class="circle_tag active" onclick="setLike('+productObj.productId+')">'
				+ '<img id="like'+productObj.productId+'" src="${pageContext.request.contextPath}/resources/images/heart-1.svg" alt="">' 
				+ '</div>';
			}
			var detail='<a href="${pageContext.request.contextPath}/showProductDetail/'+productObj.productId+'">'
			
			 divStr =divStr
			 +'<li>'
			+ ' <div class="item_div"> '
			+ ' <div class="cake_one product_padd"> '
			+ ' <div class="cake_pic"> '+detail
			+ ' <img src="${prodImgUrl}'+productObj.prodImagePrimary+'" '+noimage+' data-src="${prodImgUrl}'+productObj.prodImagePrimary+'" alt="" class="mobile_fit transition"></a> '
			+ isVegType
			+ like
			+ ' <div class="cake_prc" id="newPrice'+productObj.productId+'"> <i class="fa fa-inr" aria-hidden="true"></i>'
			+ productObj.defaultPrice+' <p class="per_kg" style="font-size: 12px; vertical-align: middle; display: none;">'+productObj.uomShowName+'</p>'
			+ ' <span style="display:none;" class="off_prc"><i class="fa fa-inr" aria-hidden="true"></i>'
			+ productObj.defaultPrice
			+ '</span> <span style="display:none;" class="prc_off">(23% Off)</span> </div> '
			+ ' <input type="hidden" class="tagNameHide" value="'+productObj.appliTagNames+'"> '
			+ ' </div> '
			+ ' <div class="cake_container"> '
			+ ' <h4 class="cake_nm single_row"> <a href="${pageContext.request.contextPath}/showProductDetail/'+productObj.productId+'">'
			+ productObj.productName + '</a> </h4><div class="card_cart_btn"> <a href="javascript:void(0)" onclick="addCart('+productObj.productId+','+productObj.rateSettingType+')" class="cart_btn">Add to Cart</a> </div>'
			+ ' </div> </div> </div> </li> ';
			//alert("end")
			$("#itemListUl").append(divStr);
					
		}//End of Functin setProductData
		function setLike(id) {
			
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
						
						
						var data1=JSON.parse(data.statusText);
						
						sessionStorage.setItem("allItemList", JSON.stringify(data1.feProductHeadList));
						setLikeCount(data.statusText);
						
					});
			
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
		function addCart_OLD(id,type) {
			
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
				
				selectFlav = prodMaster.defaultFlavorId;
				 
				//selFlvName = "akshay";
				var defFlvName =prodMaster.flavorNames.split(",");
				selFlvName=defFlvName[0];
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
		</script>
		<script>
		
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
					break;
				}
			}
			
			for(var i=0;i<allItemArr.length;i++){
				if(allItemArr[i].productId==id){
					for(var j=0;j<allItemArr[i].prodDetailList.length;j++){
						if(type==1){
							rate=parseFloat(allItemArr[i].prodDetailList[j].actualRate);
							break;
						}else if(allItemArr[i].prodDetailList[j].qty==selectWt && type==2){
							rate=parseFloat(allItemArr[i].prodDetailList[j].actualRate);
							break;
						}
					}
				}
			}
			
			if(type==1){
				rate=rate*parseFloat(selectWt);
			}
			
			document.getElementById("newPrice"+id).innerHTML="<i class='fa fa-inr' aria-hidden='true'></i>"+rate.toFixed(1);
			
		}
		
function setQtyText(id, type) {

	/* type  :  0 - minus,  1 - plus */
	try{
	var wt=document.getElementById("txtWt"+id).value;

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
	//27-04 document.getElementById("newPrice"+id).innerHTML=rate.toFixed(1);
   //document.getElementById("newPrice"+id).innerHTML=rate.toFixed(1);
	document.getElementById("newPrice"+id).innerHTML="<i class='fa fa-inr' aria-hidden='true'></i>"+rate.toFixed(1);

	}catch (e) {
		alert(e);
	}

}

		function setWeightOrQtyDropDown(hiddenProductListArr){
		//SACHIN CODE
			var dataOption=''
				var wtList=hiddenProductListArr.availInWeights.split(',');
				//alert(wtList);
		//	var dataOption='<option value="0">Select Weight</option>'
			
			if(parseFloat(wtList[0])>0){
			for(var d=0;d<wtList.length;d++){
				dataOption+='<option value="'+wtList[d]+'">'+wtList[d]+'</option>'
			}
			}
										var cakeDrpDwn= null;
											if(hiddenProductListArr.rateSettingType==0){
											cakeDrpDwn =
													'<div class="cake_dropdown_l"><div class="plus_minus_one">'+
													'<button type="button" value="" field="quantity"class="qtyminus slide" '
														+'onclick="setQtyText('+hiddenProductListArr.productId+',0)">'
														+'<i class="fa fa-minus" aria-hidden="true"></i></button>'+
													'<input type="text" id="txtWt'+hiddenProductListArr.productId+'"'
														+'value="1" readonly style="text-align: center;"'+
														'class="qty slide">'+
													'<button type="button" value="" field="quantity"'+
														'onclick="setQtyText('+hiddenProductListArr.productId+',1)"'
														+'class="qtyplus slide">'+
														'<i class="fa fa-plus" aria-hidden="true"></i>'+
													'</button></div>'
												}
												else{
													cakeDrpDwn =
											'<div class="cake_dropdown_l"><div class="small_field">'+
												'<select class="select-css" id="wt'+hiddenProductListArr.productId+'"'+
													'onchange="setPriceByWtAndFlavour('+hiddenProductListArr.productId+','+hiddenProductListArr.rateSettingType+')">'+
													dataOption+
												'</select></div>'
												}
										//cakeDrpDwn +='<span class="prod_kgs">'+hiddenProductListArr.uomShowName+'</span></div>'
																				cakeDrpDwn +='<span class="prod_kgs">'+hiddenProductListArr.uomShowName+'</span></div>'

										//SACHIN CODE END
										return cakeDrpDwn;
	
		}
		</script>
		<script type="text/javascript">
    function refreshAndClose1() {
    	
		var tags = sessionStorage.getItem("selTags_SAC");
		var tags2 = sessionStorage.getItem("selTags");

		//alert(tags);alert(tags2);
	//	var selTags = $.parseJSON(tags);
		sessionStorage.setItem("menuFilterName", tags);

		//window.open('${pageContext.request.contextPath}/products/0', '_target');
		
      //  window.opener.location.reload(true);
    }
    
</script>
		<jsp:include page="/WEB-INF/views/include/qty_validation.jsp"></jsp:include>
</body>

</html>


