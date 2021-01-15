<!-- this is mohsins product filter page -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<jsp:include page="/WEB-INF/views/include/metacssjs.jsp"></jsp:include>

<style>
html {
	scroll-behavior: smooth;
}
</style>

<c:url value="/setLikeOrDislike" var="setLikeOrDislike"></c:url>

<body>





	<!-- TAGS -->
	<jsp:include page="/WEB-INF/views/include/tags.jsp"></jsp:include>
	<!-- TAGS End -->

	<!-- Header -->
	<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
	<!-- Header End -->

	<div class="head_marg with_menu">
		<c:forEach items="${allData.frSubCatList}" var="subCat">

			<c:set value="0" var="count"></c:set>

			<c:forEach items="${allData.feProductHeadList}" var="product">
				<c:if test="${product.prodSubCatId == subCat.subCatId}">
					<c:set value="1" var="count"></c:set>
				</c:if>
			</c:forEach>



			<c:if test="${subCat.catId == catId && count==1}">

				<c:set var="totSubCnt" value="${totSubCnt+1}"></c:set>


			</c:if>
		</c:forEach>
		<c:choose>
		<c:when test="${totSubCnt>1}">
			<section class="product_category">
				<div class="wrapper">

					<div class="regular-filter slider">
					
						<c:forEach items="${allData.frSubCatList}" var="subCat">

							<c:set value="0" var="count"></c:set>

							<c:forEach items="${allData.feProductHeadList}" var="product">
								<c:if test="${product.prodSubCatId == subCat.subCatId}">
									<c:set value="1" var="count"></c:set>
								</c:if>
							</c:forEach>



							<c:if test="${subCat.catId == catId && count==1}">

								
								<div>
									<div class="filter_slide_bx">
										<div class="product_filter_one">
											<a href="#${subCat.subCatId}"
												onclick="setDivPadding(${subCat.subCatId})"> <img
												src="${subCatImgUrl}${subCat.imageName}" alt=""
												onerror="this.src='${pageContext.request.contextPath}/resources/images/no_img_folder/product-filter-noimg.jpg'">
												<span><c:out value="${subCat.subCatName}"></c:out></span>
											</a>
										</div>
									</div>
								</div>

							</c:if>
						</c:forEach>



					</div>


				</div>
			</section>
		</c:when>
		<c:otherwise>
		<section class="product_category">
				<div class="wrapper">
				<h2 class="sec_title">
					<center>Sorry No Products Found!!!
					</center>
				</h2>
				
				</div>
			</section>
		
		</c:otherwise>
		
		
		</c:choose>
		
		
		
		
		
		
		





		<c:set value="0" var="index"></c:set>
		<c:forEach items="${allData.frSubCatList}" var="subCat">


			<c:set value="0" var="count"></c:set>

			<c:forEach items="${allData.feProductHeadList}" var="product">
				<c:if test="${product.prodSubCatId == subCat.subCatId}">
					<c:set value="1" var="count"></c:set>
				</c:if>
			</c:forEach>

			<c:if test="${subCat.catId==catId && count==1}">


				<!--product listing-->
				<c:choose>
					<c:when test="${index%2==0}">
						<div class="find_store btm_space" id="${subCat.subCatId}">
					</c:when>
					<c:otherwise>
						<div class="testimonial_bx btm_space" id="${subCat.subCatId}">
					</c:otherwise>
				</c:choose>

				<div class="wrapper">


					<div class="product_boxes">
						<h2 class="sec_title">
							<center>
								Shop by ${subCat.subCatName}<span>${subCat.catName}</span>
							</center>
						</h2>


						<ul>

							<c:forEach items="${allData.feProductHeadList}" var="product">

								<c:if test="${product.prodSubCatId == subCat.subCatId}">

									<li>
										<div class="cake_one product_padd">
											<div class="cake_pic">
												<a
													href="${pageContext.request.contextPath}/showProductDetail/${product.productId}">
													<img src="${prodImgUrl}${product.prodImagePrimary}"
													onerror="this.src='${pageContext.request.contextPath}/resources/images/no_img_folder/no-product-image.jpg'"
													alt="" class="mobile_fit transition">
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
													<i class="fa fa-inr" aria-hidden="true"></i>${product.defaultPrice}
													<span class="off_prc"><i class="fa fa-inr"
														aria-hidden="true"></i>${product.defaultPrice}</span> <span
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

				</div>
	</div>
	<c:set value="${index+1}" var="index"></c:set>
	</c:if>



	</c:forEach>








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
			
			$(".regular-filter").slick({
				dots : true,
				infinite : true,
				slidesToShow : 6,
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
				},
				 {
					breakpoint : 1100,
					settings : {
						slidesToShow : 5,
						slidesToScroll : 1
					}
				},
				{
					breakpoint : 800,
					settings : {
						slidesToShow : 4,
						slidesToScroll : 1
					}
				}, {
					breakpoint : 480,
					settings : {
						slidesToShow : 2,
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

	function setDivPadding(id) {
		
		$(".find_store")
			.each(
				function(counter) {
					document.getElementsByClassName("find_store")[counter].style.paddingTop = "50px";
					document.getElementsByClassName("find_store")[counter].style.paddingBottom = "0px";
			});
		
		
						document.getElementById(id).style.paddingTop = "135px";
	}
	
	
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


</body>

</html>
