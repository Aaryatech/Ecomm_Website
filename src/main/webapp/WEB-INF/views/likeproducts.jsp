<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>

<jsp:include page="/WEB-INF/views/include/metacssjs.jsp"></jsp:include>

<c:url value="/setLikeOrDislike" var="setLikeOrDislike"></c:url>

<body>

	<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>


	<div class="head_marg">
		<!--product listing-->
		<div class="find_store">
			<div class="wrapper">

				<div class="product_boxes">
					<h2 class="sec_title">
						<center>Customer Like this Products</center>
					</h2>


					<ul id="itemListUl">

						<c:forEach items="${allData.feProductHeadList}" var="product">

							<c:if test="${product.isLike==1}">

								<li>
									<div class="cake_one product_padd">
										<div class="cake_pic">
											<a
												href="${pageContext.request.contextPath}/showProductDetail/${product.productId}">
												<img src="${prodImgUrl}${product.prodImagePrimary}" alt=""
												onerror="this.src='${pageContext.request.contextPath}/resources/images/no_img_folder/no-product-image.jpg'"
												class="mobile_fit transition">
											</a>

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
												<i class="fa fa-inr" aria-hidden="true"></i>
												<fmt:formatNumber type="number" groupingUsed="false"
													value="${product.defaultPrice}" maxFractionDigits="0"
													minFractionDigits="0" />
												/-
												<p class="per_kg"
													style="font-size: 12px; vertical-align: middle; display: inline-block;">${product.uomShowName}</p>
												<span class="off_prc"><i class="fa fa-inr"
													aria-hidden="true"></i> <fmt:formatNumber type="number"
														groupingUsed="false" value="${product.defaultPrice}"
														maxFractionDigits="0" minFractionDigits="0" /></span> <span
													class="prc_off"></span>
											</div>

											<!-- </a> -->
										</div>

										<div class="cake_container">
											<h4 class="cake_nm single_row">
												<a
													href="${pageContext.request.contextPath}/showProductDetail/${product.productId}">${product.productName}</a>
											</h4>
										</div>

									</div>
								</li>

							</c:if>


						</c:forEach>


					</ul>
				</div>




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
	</div>

	<!--strip-->
	<div class="type_strip">
		<div class="wrapper">
			<ul class="strip_divid">
				<li>
					<div class="strip_payment">
						<img
							src="${pageContext.request.contextPath}/resources/images/secure_icn.png"
							alt=""> 100% Secure Payments <span>All major credit
							&amp; debit cards accepted</span>
					</div>
				</li>
				<li>
					<div class="strip_payment extra_padd">
						<img
							src="${pageContext.request.contextPath}/resources/images/customer.png"
							alt=""> 3,000,000 <span>Customers across the world</span>
					</div>
				</li>
				<li>
					<div class="strip_payment extra_padd">
						<img
							src="${pageContext.request.contextPath}/resources/images/gifts.png"
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
	<script type="text/javascript" src="js/menuzord.js"></script>
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
	<script src="js/slick.js" type="text/javascript"></script>
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
					
					
					
					var divStr='';
					
					//alert(data.statusText)
					
					//alert(JSON.parse(data.statusText))
					
					var data1=JSON.parse(data.statusText);
					
					var noimage='onerror="this.src=\'${pageContext.request.contextPath}/resources/images/no_img_folder/no-product-image.jpg\'"'

					$.each(data1.feProductHeadList,
											function(key, product) {
						
						if(product.isLike ==1){
						var detail='<a href="${pageContext.request.contextPath}/showProductDetail/'+product.productId+'">'
							var like='<div class="circle_tag active" onclick="setLike('+product.productId+')">'
							+ '<img  id="like'+product.productId+'"  src="${pageContext.request.contextPath}/resources/images/heart.svg" alt="">'
							+ '</div>';
							
							divStr = divStr
							+ '<li>'
							+ ' <div class="item_div"> '
							+ ' <div class="cake_one product_padd"> '
							+ ' <div class="cake_pic"> '+detail
							+ ' <img src="${prodImgUrl}'+product.prodImagePrimary+'" '+noimage+' data-src="${prodImgUrl}'+product.prodImagePrimary+'" alt="" class="mobile_fit transition"></a> '
							+ like
							+ ' <div class="cake_prc"> <i class="fa fa-inr" aria-hidden="true"></i>'
							+ product.defaultPrice
							+ ' /- <p class="per_kg" style="font-size: 12px; vertical-align: middle; display: inline-block;">'+product.uomShowName+'</p><span class="off_prc"><i class="fa fa-inr" aria-hidden="true"></i>'
							+ product.defaultPrice
							+ '</span> <span class="prc_off"></span> </div> '
							+ ' <input type="hidden" class="tagNameHide" value="'+product.appliTagNames+'"> '
							+ ' </div> '
							+ ' <div class="cake_container"> '
							+ ' <h4 class="cake_nm single_row"> <a href="${pageContext.request.contextPath}/showProductDetail/'+product.productId+'">'
							+ product.productName + '</a> </h4>'
							+ ' </div> </div> </div> </li> ';
							
							
						
							
							
							
							
							
						}
						
					
						setLikeCount(data.statusText);	
					});
					
					document.getElementById("itemListUl").innerHTML = divStr;
					
				});

		
		
	}
	
	
	
	
	</script>

</body>

</html>