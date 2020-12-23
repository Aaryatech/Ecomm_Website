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



	<!-- mega menu -->
	<div class="mega_menu_row">

		<div class="wrapper">

			<div id="menuzord" class="menuzord red menuzord-responsive">
				<div class="showhide32"></div>
				<ul
					class="menuzord-menu me#menusnuzord-right menuzord-indented scrollable">


					<li><a href="#" class="same_day">Same Day Delivery </a></li>

					<c:forEach items="${allData.catFilterConfig}" var="menuCat">

						<li><a href="#">${menuCat.exVar2} <span><i
									class="fa fa-angle-down" aria-hidden="true"></i></span></a> <!--cake dropdown-->
							<ul class="megamenu four-row">
								<div class="four_row_dropdown">

									<!--row-1-->
									<div class="row_one">
										<ul class="drop_mainmenu">

											<li>By Price</li>

											<li><input type="radio" id="radioPrice"
												name="radioPrice" class="menuPrice" value="0-499"> <label
												for="male">Under 499</label></li>

											<li><input type="radio" id="radioPrice"
												name="radioPrice" class="menuPrice" value="500-599">
												<label for="male">500 to 599</label></li>

											<li><input type="radio" id="radioPrice"
												name="radioPrice" class="menuPrice" value="600-999">
												<label for="male">600 to 999</label></li>

											<li><input type="radio" id="radioPrice"
												name="radioPrice" class="menuPrice" value="1000-1999">
												<label for="male">1000 to 1999</label></li>

											<li><input type="radio" id="radioPrice"
												name="radioPrice" class="menuPrice" value="2000-50000">
												<label for="male">Above 2000</label></li>

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

																		<li><input type="checkbox" class="menuFilter"
																			value="${filter.adminName}">${filter.adminName}</li>

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


									<a href="javascript:void(0)" class="proceed_btn"
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

	<div class="head_marg with_menu">

		<!--product listing-->
		<div class="find_store">
			<div class="wrapper">

				<div class="product_boxes">
				
					<div id="hiddenProductList" style="display: none;"></div>

					<div class="find_store">
						<h2 class="sec_title">
							<center>
								<p id="prodCount"></p>
							</center>
						</h2>
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
												<a
													href="${pageContext.request.contextPath}/showProdDetail/${prodCount.index}">${product.productName}</a>
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
												</div>
												<div class="cake_container">
													<h4 class="cake_nm single_row">
														<a
															href="${pageContext.request.contextPath}/showProductDetail/${product.productId}">${product.productName}</a>
													</h4>
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

				if (selTags.length > 0) {

					for (var t = 0; t < selTags.length; t++) {

						if (allItemArr[i].appliTagNames === selTags[t]) {

							//alert(allItemArr[i]);

							divStr = divStr
									+ '<li>'
									+ ' <div class="item_div"> '
									+ ' <div class="cake_one product_padd"> '
									+ ' <div class="cake_pic"> '
									+ ' <img src="${prodImgUrl}'+allItemArr[i].prodImagePrimary+'" data-src="${prodImgUrl}'+allItemArr[i].prodImagePrimary+'" alt="" class="mobile_fit transition"> '
									+ ' <div class="cake_prc"> <i class="fa fa-inr" aria-hidden="true"></i>'
									+ allItemArr[i].defaultPrice
									+ ' <span class="off_prc"><i class="fa fa-inr" aria-hidden="true"></i>'
									+ allItemArr[i].defaultPrice
									+ '</span> <span class="prc_off">(23% Off)</span> </div> '
									+ ' <input type="hidden" class="tagNameHide" value="'+allItemArr[i].appliTagNames+'"> '
									+ ' </div> '
									+ ' <div class="cake_container"> '
									+ ' <h4 class="cake_nm single_row"> <a href="${pageContext.request.contextPath}/showProductDetail/'+allItemArr[i].productId+'">'
									+ allItemArr[i].productName + '</a> </h4>'
									+ ' </div> </div> </div> </li> '

							count++;

						}

					}

				} else {

					divStr = divStr
							+ '<li>'
							+ ' <div class="item_div"> '
							+ ' <div class="cake_one product_padd"> '
							+ ' <div class="cake_pic"> '
							+ ' <img src="${prodImgUrl}'+allItemArr[i].prodImagePrimary+'" data-src="${prodImgUrl}'+allItemArr[i].prodImagePrimary+'" alt="" class="mobile_fit transition"> '
							+ ' <div class="cake_prc"> <i class="fa fa-inr" aria-hidden="true"></i>'
							+ allItemArr[i].defaultPrice
							+ ' <span class="off_prc"><i class="fa fa-inr" aria-hidden="true"></i>'
							+ allItemArr[i].defaultPrice
							+ '</span> <span class="prc_off">(23% Off)</span> </div> '
							+ ' <input type="hidden" class="tagNameHide" value="'+allItemArr[i].appliTagNames+'"> '
							+ ' </div> '
							+ ' <div class="cake_container"> '
							+ ' <h4 class="cake_nm single_row"> <a href="${pageContext.request.contextPath}/showProductDetail/'+allItemArr[i].productId+'">'
							+ allItemArr[i].productName + '</a> </h4>'
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
			//alert(tempArr)
			
			
			
			if(tempArr.length>0){
				
				if(val==1){
					tempArr.sort(function(a, b){
					    return parseFloat(b.defaultPrice)-parseFloat(a.defaultPrice)
					})

				}else{
					tempArr.sort(function(a, b){
					    return parseFloat(a.defaultPrice)-parseFloat(b.defaultPrice)
					})

				}
				
			
				//alert(JSON.stringify(tempArr))
				
				var divStr="";
				var count=0;
				for (var i = 0; i < tempArr.length; i++) {
					
						divStr = divStr
								+ '<li>'
								+ ' <div class="item_div"> '
								+ ' <div class="cake_one product_padd"> '
								+ ' <div class="cake_pic"> '
								+ ' <img src="${prodImgUrl}'+tempArr[i].prodImagePrimary+'" data-src="${prodImgUrl}'+tempArr[i].prodImagePrimary+'" alt="" class="mobile_fit transition"> '
								+ ' <div class="cake_prc"> <i class="fa fa-inr" aria-hidden="true"></i>'
								+ tempArr[i].defaultPrice
								+ ' <span class="off_prc"><i class="fa fa-inr" aria-hidden="true"></i>'
								+ tempArr[i].defaultPrice
								+ '</span> <span class="prc_off">(0% Off)</span> </div> '
								+ ' <input type="hidden" class="tagNameHide" value="'+tempArr[i].appliTagNames+'"> '
								+ ' </div> '
								+ ' <div class="cake_container"> '
								+ ' <h4 class="cake_nm single_row"> <a href="${pageContext.request.contextPath}/showProductDetail/'+tempArr[i].productId+'">'
								+ tempArr[i].productName + '</a> </h4>'
								+ ' </div> </div> </div> </li> '

						count++;

				}
				document.getElementById("itemListUl").innerHTML = "";
				document.getElementById("itemListUl").innerHTML = divStr;
				
			}
			
			
		}
		
		
		/* ********************************************************************** */
		
		
		function loadData() {

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
			
			/* var flvTagStatusList=parseJSON(document.getElementById("hideFlvList").innerHTML);
			var flvTagStatusList=${allData};
			alert(flvTagStatusList) */

			var divStr = "";

			var count = 0;
			
			var hiddenProductListArr = [];
			var displayListArr = [];

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
									
									//alert("catId - "+catId)
									

									var tempFilterArr=allItemArr[i].allFilterNames.split(",");
									
									if(tempFilterArr.length>0){
										
										if (tempFilterArr.includes(filterArr[f]) && allItemArr[i].prodCatId == catId) {
											
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
						

				}//tags else

			}//all item list for end
			
			//alert(hiddenProductListArr.length)
			
			if(hiddenProductListArr.length > 0){
				
				
				
				for(var i=0; i<hiddenProductListArr.length; i++){
					
					if(catId==0){
						
						displayListArr.push(hiddenProductListArr[i]);
						
						var isLike=allItemArr[i].isLike;
						var like = '';
						
						if(isLike ==1){
						
							like = '<div class="circle_tag active" onclick="setLike('+allItemArr[i].productId+')">'
							+ '<img id="like'+allItemArr[i].productId+'" src="${pageContext.request.contextPath}/resources/images/heart.svg" alt="">' 
							+ '</div>';
						}else{
							
							like = '<div class="circle_tag active" onclick="setLike('+allItemArr[i].productId+')">'
							+ '<img id="like'+allItemArr[i].productId+'" src="${pageContext.request.contextPath}/resources/images/heart-1.svg" alt="">' 
							+ '</div>';
						}
						
						divStr = divStr
						+ '<li>'
						+ ' <div class="item_div"> '
						+ ' <div class="cake_one product_padd"> '
						+ ' <div class="cake_pic"> '
						+ ' <img src="${prodImgUrl}'+hiddenProductListArr[i].prodImagePrimary+'" data-src="${prodImgUrl}'+hiddenProductListArr[i].prodImagePrimary+'" alt="" class="mobile_fit transition"> '
						+ like
						+ ' <div class="cake_prc"> <i class="fa fa-inr" aria-hidden="true"></i>'
						+ hiddenProductListArr[i].defaultPrice
						+ ' <span class="off_prc"><i class="fa fa-inr" aria-hidden="true"></i>'
						+ hiddenProductListArr[i].defaultPrice
						+ '</span> <span class="prc_off">(23% Off)</span> </div> '
						+ ' <input type="hidden" class="tagNameHide" value="'+hiddenProductListArr[i].appliTagNames+'"> '
						+ ' </div> '
						+ ' <div class="cake_container"> '
						+ ' <h4 class="cake_nm single_row"> <a href="${pageContext.request.contextPath}/showProductDetail/'+hiddenProductListArr[i].productId+'">'
						+ hiddenProductListArr[i].productName + '</a> </h4>'
						+ ' </div> </div> </div> </li> ';

						count++;
						
					}else{
						
						if(max > 0 && hiddenProductListArr[i].defaultPrice >= min && hiddenProductListArr[i].defaultPrice <= max && hiddenProductListArr[i].prodCatId == catId){
							
							displayListArr.push(hiddenProductListArr[i]);
							
							var isLike=allItemArr[i].isLike;
							var like = '';
							
							if(isLike ==1){
							
								like = '<div class="circle_tag active" onclick="setLike('+allItemArr[i].productId+')">'
								+ '<img id="like'+allItemArr[i].productId+'" src="${pageContext.request.contextPath}/resources/images/heart.svg" alt="">' 
								+ '</div>';
							}else{
								
								like = '<div class="circle_tag active" onclick="setLike('+allItemArr[i].productId+')">'
								+ '<img id="like'+allItemArr[i].productId+'" src="${pageContext.request.contextPath}/resources/images/heart-1.svg" alt="">' 
								+ '</div>';
							}
							
							divStr = divStr
							+ '<li>'
							+ ' <div class="item_div"> '
							+ ' <div class="cake_one product_padd"> '
							+ ' <div class="cake_pic"> '
							+ ' <img src="${prodImgUrl}'+hiddenProductListArr[i].prodImagePrimary+'" data-src="${prodImgUrl}'+hiddenProductListArr[i].prodImagePrimary+'" alt="" class="mobile_fit transition"> '
							+ like
							+ ' <div class="cake_prc"> <i class="fa fa-inr" aria-hidden="true"></i>'
							+ hiddenProductListArr[i].defaultPrice
							+ ' <span class="off_prc"><i class="fa fa-inr" aria-hidden="true"></i>'
							+ hiddenProductListArr[i].defaultPrice
							+ '</span> <span class="prc_off">(23% Off)</span> </div> '
							+ ' <input type="hidden" class="tagNameHide" value="'+hiddenProductListArr[i].appliTagNames+'"> '
							+ ' </div> '
							+ ' <div class="cake_container"> '
							+ ' <h4 class="cake_nm single_row"> <a href="${pageContext.request.contextPath}/showProductDetail/'+hiddenProductListArr[i].productId+'">'
							+ hiddenProductListArr[i].productName + '</a> </h4>'
							+ ' </div> </div> </div> </li> ';

							count++;
							
						}else if(max == 0  && hiddenProductListArr[i].prodCatId == catId){
							displayListArr.push(hiddenProductListArr[i]);
							
							var isLike=allItemArr[i].isLike;
							var like = '';
							
							if(isLike ==1){
							
								like = '<div class="circle_tag active" onclick="setLike('+allItemArr[i].productId+')">'
								+ '<img id="like'+allItemArr[i].productId+'" src="${pageContext.request.contextPath}/resources/images/heart.svg" alt="">' 
								+ '</div>';
							}else{
								
								like = '<div class="circle_tag active" onclick="setLike('+allItemArr[i].productId+')">'
								+ '<img id="like'+allItemArr[i].productId+'" src="${pageContext.request.contextPath}/resources/images/heart-1.svg" alt="">' 
								+ '</div>';
							}
							
							divStr = divStr
							+ '<li>'
							+ ' <div class="item_div"> '
							+ ' <div class="cake_one product_padd"> '
							+ ' <div class="cake_pic"> '
							+ ' <img src="${prodImgUrl}'+hiddenProductListArr[i].prodImagePrimary+'" data-src="${prodImgUrl}'+hiddenProductListArr[i].prodImagePrimary+'" alt="" class="mobile_fit transition"> '
							+ like
							+ ' <div class="cake_prc"> <i class="fa fa-inr" aria-hidden="true"></i>'
							+ hiddenProductListArr[i].defaultPrice
							+ ' <span class="off_prc"><i class="fa fa-inr" aria-hidden="true"></i>'
							+ hiddenProductListArr[i].defaultPrice
							+ '</span> <span class="prc_off">(23% Off)</span> </div> '
							+ ' <input type="hidden" class="tagNameHide" value="'+hiddenProductListArr[i].appliTagNames+'"> '
							+ ' </div> '
							+ ' <div class="cake_container"> '
							+ ' <h4 class="cake_nm single_row"> <a href="${pageContext.request.contextPath}/showProductDetail/'+hiddenProductListArr[i].productId+'">'
							+ hiddenProductListArr[i].productName + '</a> </h4>'
							+ ' </div> </div> </div> </li> ';

							count++;
						}
						
					}
					
					
					
					
					
					
					
				}
				
			}else{
				
			
				
				for (var i = 0; i < allItemArr.length; i++) {
					
					if(catId == 0){
						
						displayListArr.push(allItemArr[i]);
						
						var isLike=allItemArr[i].isLike;
						var like = '';
						
						if(isLike ==1){
						
							like = '<div class="circle_tag active" onclick="setLike('+allItemArr[i].productId+')">'
							+ '<img id="like'+allItemArr[i].productId+'" src="${pageContext.request.contextPath}/resources/images/heart.svg" alt="">' 
							+ '</div>';
						}else{
							
							like = '<div class="circle_tag active" onclick="setLike('+allItemArr[i].productId+')">'
							+ '<img id="like'+allItemArr[i].productId+'" src="${pageContext.request.contextPath}/resources/images/heart-1.svg" alt="">' 
							+ '</div>';
						}
						
						
						divStr = divStr
						+ '<li>'
						+ ' <div class="item_div"> '
						+ ' <div class="cake_one product_padd"> '
						+ ' <div class="cake_pic"> '
						+ ' <img src="${prodImgUrl}'+allItemArr[i].prodImagePrimary+'" data-src="${prodImgUrl}'+allItemArr[i].prodImagePrimary+'" alt="" class="mobile_fit transition"> '
						+ like
						+ ' <div class="cake_prc"> <i class="fa fa-inr" aria-hidden="true"></i>'
						+ allItemArr[i].defaultPrice
						+ ' <span class="off_prc"><i class="fa fa-inr" aria-hidden="true"></i>'
						+ allItemArr[i].defaultPrice
						+ '</span> <span class="prc_off">(23% Off)</span> </div> '
						+ ' <input type="hidden" class="tagNameHide" value="'+allItemArr[i].appliTagNames+'"> '
						+ ' </div> '
						+ ' <div class="cake_container"> '
						+ ' <h4 class="cake_nm single_row"> <a href="${pageContext.request.contextPath}/showProductDetail/'+allItemArr[i].productId+'">'
						+ allItemArr[i].productName + '</a> </h4>'
						+ ' </div> </div> </div> </li> ';

						//count++;
						
						/* var price=allItemArr[i].defaultPrice;
						var defaultWt=1;
						
						var rateSetting='';
						var rateSettingType=allItemArr[i].rateSettingType;
						
						
						
						if(allItemArr[i].rateSettingType == 0){
							
							rateSetting='<button type="button" value="" field="quantity" class="qtyminus cart" onclick="setQtyText('+allItemArr[i].productId+',0,'+allItemArr[i].prodDetailList+')"><i class="fa fa-minus" aria-hidden="true"></i></button>'
							+ '<input type="text" id="txtWt'+allItemArr[i].productId+'" value="1" style="text-align: center;" class="qty cart">'
							+ '<button type="button" value="" field="quantity" onclick="setQtyText('+allItemArr[i].productId+',1,'+allItemArr[i].prodDetailList+')" class="qtyplus cart"><i class="fa fa-plus" aria-hidden="true"></i></button>';	

						
						}else if(allItemArr[i].rateSettingType == 1){
							
							rateSetting ='<select class="select-css" id="wt'+allItemArr[i].productId+'" onchange="setPriceByWtAndFlavour('+allItemArr[i].productId+','+allItemArr[i].rateSettingType+')">';
							var options='';
							var wtStr=allItemArr[i].availInWeights.split(",");
							
							if(wtStr.length>0){
								for(var w=0; w<wtStr.length; w++){
									options = options+'<option value="'+wtStr[w]+'">'+wtStr[w]+'</option>';
								}
								defaultWt=parseFloat(wtStr[0]);
								price = parseFloat(price) * defaultWt;
							}
									
							rateSetting = rateSetting + options + '</select>';
							
						} 
						
						else if(allItemArr[i].rateSettingType == 2){
							
							rateSetting ='<select class="select-css" id="wt'+allItemArr[i].productId+'" onchange="setPriceByWtAndFlavour('+allItemArr[i].productId+','+allItemArr[i].rateSettingType+')">';
							var options='';
							var wtStr=allItemArr[i].availInWeights.split(",");
							
							if(wtStr.length>0){
								for(var w=0; w<wtStr.length; w++){
									options = options+'<option value="'+wtStr[w]+'">'+wtStr[w]+'</option>';
								}
								
								defaultWt=parseFloat(wtStr[0]);
							}
							
							if(allItemArr[i].prodDetailList.length > 0){
								for(var p=0; p < allItemArr[i].prodDetailList.length; p++){
									if(allItemArr[i].prodDetailList[p].flavorId == allItemArr[i].defaultFlavorId && allItemArr[i].prodDetailList[p].qty == defaultWt){
										price = allItemArr[i].prodDetailList[p].actualRate;
										break;
									}
										
								}
							}
							
							rateSetting = rateSetting + options + '</select>';
							
						}
						
						var flvDiv='';
						
						//var flvTagStatusList=${allData.flavorTagStatusList};
						
						
						if(allItemArr[i].flavourIds !=0 ){
							flvDiv = '<select class="select-css" id="flav'+allItemArr[i].productId+'" onchange="setPriceByWtAndFlavour('+allItemArr[i].productId+','+rateSettingType+')">';
						
							var options='';
							
							var flvStr=allItemArr[i].flavourIds.split(",");
							
						 	if(flvStr.length>0){
								for(var w=0; w < flvStr.length; w++){
									
									for( var t=0 ; t < flvTagStatusList.length; t++){
										
										if(flvTagStatusList.filterTypeId == 4 && flvStr[w] == flvTagStatusList.filterId && flvStr[w] == allItemArr[i].defaultFlavorId){
											options=options + '<option value="'+flvStr[w]+'" selected>'+flvTagStatusList.adminName+'</option>';
										}else{
											options=options + '<option value="'+flvStr[w]+'">'+flvTagStatusList.adminName+'</option>';
										}
										
									}
									
								}
							} 
							
							flvDiv = flvDiv + options + '</select>';
							
						
						}
						
					
						
						
						divStr = divStr
						+ '<div class="cake_one">'
						+ '<div class="cake_pic">'
						+ '<img src="${prodImgUrl}'+allItemArr[i].prodImagePrimary+'" data-src="${prodImgUrl}'+allItemArr[i].prodImagePrimary+'" alt="" class="mobile_fit transition lazy">'
						+ '<div class="circle_tag active">'
						+ '<img src="#" class="lazy" data-src="${pageContext.request.contextPath}/resources/images/heart-1.svg" alt="">'
						+ '<img src="#" class="lazy" data-src="${pageContext.request.contextPath}/resources/images/heart.svg" alt="">'
						+ '</div>'
						+ '<div class="cake_prc">'
						+ '<i class="fa fa-inr cake_prc_detail_iclass" aria-hidden="true"></i>'
						+ '<p class="cake_prc_detail_pclass" id="cake_prc'+allItemArr[i].productId+'">'+allItemArr[i].defaultPrice+'</p>'
						+ '<span class="off_prc" id="off_prc'+allItemArr[i].productId+'"></span>'
						+ '<span id="prc_off'+allItemArr[i].productId+'" class="prc_off"></span>'
						+ '</div>'
						+ '</div>'
						
						+ '<div class="cake_container">'
						+ '<h4 class="cake_nm">'
						+ '<a href="${pageContext.request.contextPath}/showProdDetail/0">'+allItemArr[i].productName+'</a>'
						+ '</h4>'
						+ '</div>'
						
						+ '<div class="cake_dropdown">'
						+ '<div class="cake_dropdown_l">'
						+ rateSetting 
						+ '<span>'+allItemArr[i].uomShowName+'</span>'
						+ '</div>'
 						+ '<div class="cake_dropdown_r">'
						+ '<div>'
						+ '<i class="fa fa-inr cake_prc_detail_iclass" aria-hidden="true"></i>'
						+ '<p class="cake_prc_detail_pclass" id="newPrice'+allItemArr[i].productId+'">'+price+'</p>'
						+ '</div>'
						+ '</div>'
						+ '<div class="clr"></div>'
						+ '</div>'
						
						+ '<div class="cake_radio_row">'
						+ '<div class="radio_l">'
						+ '<div class="radio_1">'
						+ '<ul>'
						+ flvDiv
						+ '</ul>'
						+ '</div>'
						+ '</div>'
						+ '<div class="radio_r">'
						+ '<a href="javascript:void(0)" onclick="addCart('+allItemArr[i].productId+','+rateSettingType+')" class="cart_btn">Add to Cart</a>'
						+ '</div>'
						+ '<div class="clr"></div>'
						+ '</div>'
						
						
						+ '</div>';
 */
						

						count++;
						
					}else{
						
						if(max > 0){
							
							if(allItemArr[i].defaultPrice >= min && allItemArr[i].defaultPrice <= max){
								
								displayListArr.push(allItemArr[i]);
								
								var isLike=allItemArr[i].isLike;
								var like = '';
								
								if(isLike ==1){
								
									like = '<div class="circle_tag active" onclick="setLike('+allItemArr[i].productId+')">'
									+ '<img id="like'+allItemArr[i].productId+'" src="${pageContext.request.contextPath}/resources/images/heart.svg" alt="">' 
									+ '</div>';
								}else{
									
									like = '<div class="circle_tag active" onclick="setLike('+allItemArr[i].productId+')">'
									+ '<img id="like'+allItemArr[i].productId+'" src="${pageContext.request.contextPath}/resources/images/heart-1.svg" alt="">' 
									+ '</div>';
								}
								
								divStr = divStr
								+ '<li>'
								+ ' <div class="item_div"> '
								+ ' <div class="cake_one product_padd"> '
								+ ' <div class="cake_pic"> '
								+ ' <img src="${prodImgUrl}'+allItemArr[i].prodImagePrimary+'" data-src="${prodImgUrl}'+allItemArr[i].prodImagePrimary+'" alt="" class="mobile_fit transition"> '
								+ like
								+ ' <div class="cake_prc"> <i class="fa fa-inr" aria-hidden="true"></i>'
								+ allItemArr[i].defaultPrice
								+ ' <span class="off_prc"><i class="fa fa-inr" aria-hidden="true"></i>'
								+ allItemArr[i].defaultPrice
								+ '</span> <span class="prc_off">(23% Off)</span> </div> '
								+ ' <input type="hidden" class="tagNameHide" value="'+allItemArr[i].appliTagNames+'"> '
								+ ' </div> '
								+ ' <div class="cake_container"> '
								+ ' <h4 class="cake_nm single_row"> <a href="${pageContext.request.contextPath}/showProductDetail/'+allItemArr[i].productId+'">'
								+ allItemArr[i].productName + '</a> </h4>'
								+ ' </div> </div> </div> </li> ';

								count++;
								
							}
							
						} else{
							
							displayListArr.push(allItemArr[i]);
							
							//alert("hi")
							
							var isLike=allItemArr[i].isLike;
							var like = '';
							
							if(isLike ==1){
							
								like = '<div class="circle_tag active" onclick="setLike('+allItemArr[i].productId+')">'
								+ '<img id="like'+allItemArr[i].productId+'" src="${pageContext.request.contextPath}/resources/images/heart.svg" alt="">' 
								+ '</div>';
							}else{
								
								like = '<div class="circle_tag active" onclick="setLike('+allItemArr[i].productId+')">'
								+ '<img id="like'+allItemArr[i].productId+'" src="${pageContext.request.contextPath}/resources/images/heart-1.svg" alt="">' 
								+ '</div>';
							}
							
 							divStr = divStr
							+ '<li>'
							+ ' <div class="item_div"> '
							+ ' <div class="cake_one product_padd"> '
							+ ' <div class="cake_pic"> '
							+ ' <img src="${prodImgUrl}'+allItemArr[i].prodImagePrimary+'" data-src="${prodImgUrl}'+allItemArr[i].prodImagePrimary+'" alt="" class="mobile_fit transition"> '
							+ like
							+ ' <div class="cake_prc"> <i class="fa fa-inr" aria-hidden="true"></i>'
							+ allItemArr[i].defaultPrice
							+ ' <span class="off_prc"><i class="fa fa-inr" aria-hidden="true"></i>'
							+ allItemArr[i].defaultPrice
							+ '</span> <span class="prc_off">(23% Off)</span> </div> '
							+ ' <input type="hidden" class="tagNameHide" value="'+allItemArr[i].appliTagNames+'"> '
							+ ' </div> '
							+ ' <div class="cake_container"> '
							+ ' <h4 class="cake_nm single_row"> <a href="${pageContext.request.contextPath}/showProductDetail/'+allItemArr[i].productId+'">'
							+ allItemArr[i].productName + '</a> </h4>'
							+ ' </div> </div> </div> </li> ';
 
							count++;
							
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
			
			
			
			document.getElementById("itemListUl").innerHTML = divStr;
			document.getElementById("hiddenProductList").innerHTML = JSON.stringify(displayListArr);
			
			sessionStorage.setItem("priceFilterMin", "0");
			sessionStorage.setItem("priceFilterMax", "0");
			sessionStorage.setItem("menuFilterName", "");
			sessionStorage.setItem("findCatId", "0");
			
			var prodCountTxt="";
			if(menuFilter!=""){
				prodCountTxt=count+' results found for '+'"'+menuFilter+'"';
			}else{
				prodCountTxt=count+" results found";
			}
			
			document.getElementById("prodCount").innerHTML = prodCountTxt;

		}
		
		
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
						
						
					});
			
		}
		
	</script>

</body>

</html>


