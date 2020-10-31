<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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
		<div class="find_store">
			<div class="wrapper">


				<div class="cart_row">
					<div class="cart_l">

						<h2 class="address_title">
							Shipping Address <span>Is the address you'd like to use
								displayed below? If so, click the corresponnding "Deliver to
								this address" button. <a href="location.html">Add Address</a>
							</span>


						</h2>

						<div class="address_row">
							<ul>
								<li>
									<div class="address_one">
										<h3 class="address_txt">
											<i class="fa fa-user user_icn" aria-hidden="true"></i> David
											Johnson Warner <span><i class="fa fa-map-marker"
												aria-hidden="true"></i> Arham Hospital, Canada Corner, Near
												Kulkarni Garden. NASHIK-422005 <br> MAHARASHTRA, India.</span>
											<span><i class="fa fa-phone" aria-hidden="true"></i>
												+91 9011877864</span>

										</h3>


										<div class="deliver_add">
											<a href="#">Deliver to this address</a>
										</div>

										<div class="dropdown border_one">
											<div class="select">
												<span>Select your nearest franchisee</span>
											</div>
											<input type="hidden" name="gender">
											<ul class="dropdown-menu">
												<li id="male">Pune</li>
												<li id="female">Mumbai</li>
												<li id="female">Nashik</li>
											</ul>
										</div>

										<div class="delivery_two">
											<div class="deliver_edit">
												<a href="#">Edit</a>
											</div>
											<div class="deliver_edit right_side">
												<a href="#">Delete</a>
											</div>
											<div class="clr"></div>
										</div>
									</div>
								</li>
								<li>
									<div class="address_one">
										<h3 class="address_txt">
											<i class="fa fa-user user_icn" aria-hidden="true"></i> David
											Johnson Warner <span><i class="fa fa-map-marker"
												aria-hidden="true"></i> Arham Hospital, Canada Corner, Near
												Kulkarni Garden. NASHIK-422005 <br> MAHARASHTRA, India.</span>
											<span><i class="fa fa-phone" aria-hidden="true"></i>
												+91 9011877864</span>

										</h3>


										<div class="deliver_add">
											<a href="#">Deliver to this address</a>
										</div>

										<div class="dropdown border_one">
											<div class="select">
												<span>Select your nearest franchisee</span>
											</div>
											<input type="hidden" name="gender">
											<ul class="dropdown-menu">
												<li id="male">Pune</li>
												<li id="female">Mumbai</li>
												<li id="female">Nashik</li>
											</ul>
										</div>

										<div class="delivery_two">
											<div class="deliver_edit">
												<a href="#">Edit</a>
											</div>
											<div class="deliver_edit right_side">
												<a href="#">Delete</a>
											</div>
											<div class="clr"></div>
										</div>
									</div>
								</li>
								<li>
									<div class="address_one">
										<h3 class="address_txt">
											<i class="fa fa-user user_icn" aria-hidden="true"></i> David
											Johnson Warner <span><i class="fa fa-map-marker"
												aria-hidden="true"></i> Arham Hospital, Canada Corner, Near
												Kulkarni Garden. NASHIK-422005 <br> MAHARASHTRA, India.</span>
											<span><i class="fa fa-phone" aria-hidden="true"></i>
												+91 9011877864</span>

										</h3>


										<div class="deliver_add">
											<a href="#">Deliver to this address</a>
										</div>

										<div class="dropdown border_one">
											<div class="select">
												<span>Select your nearest franchisee</span>
											</div>
											<input type="hidden" name="gender">
											<ul class="dropdown-menu">
												<li id="male">Pune</li>
												<li id="female">Mumbai</li>
												<li id="female">Nashik</li>
											</ul>
										</div>

										<div class="delivery_two">
											<div class="deliver_edit">
												<a href="#">Edit</a>
											</div>
											<div class="deliver_edit right_side">
												<a href="#">Delete</a>
											</div>
											<div class="clr"></div>
										</div>
									</div>
								</li>
							</ul>
						</div>

					</div>




					<!--related-product-box-->
					<div class="cart_r">
						<h3 class="sidebar_title">Order Summary</h3>
						<div class="related_container">


							<div class="prod_count">3 Product in your Cart</div>
							<!--related-product-1-->
							<div class="related_one">
								<a href="#"><img
									src="${pageContext.request.contextPath}/resources/images/related_itm_1.jpg"
									alt=""></a> <a href="#" class="related_nm">Black Forest
									Cake (Half Kg)</a>
								<div class="related_prc">490.00</div>
								<div class="related_deliver">
									Earlist Delivery : <span>Today</span>
								</div>

							</div>
							<!--related-product-2-->
							<div class="related_one">
								<a href="#"><img
									src="${pageContext.request.contextPath}/resources/images/related_itm_2.jpg"
									alt=""></a> <a href="#" class="related_nm">Black Forest
									Cake (Half Kg)</a>
								<div class="related_prc">
									490.00 <span> 690.00</span>
								</div>
								<div class="related_deliver">
									Earlist Delivery : <span>Today</span>
								</div>
							</div>
							<!--related-product-3-->
							<div class="related_one">
								<a href="#"><img
									src="${pageContext.request.contextPath}/resources/images/related_itm_3.jpg"
									alt=""></a> <a href="#" class="related_nm">Black Forest
									Cake (Half Kg)</a>
								<div class="related_prc">
									490.00 <span>690.00</span>
								</div>
								<div class="related_deliver">
									Earlist Delivery : <span>Today</span>
								</div>
							</div>


						</div>
					</div>
					<div class="clr"></div>
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





	<!--date or time picker-->
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.datetimepicker.full.js"></script>
	<script>
		/*jslint browser:true*/
		/*global jQuery, document*/
		jQuery(document).ready(
				function() {
					'use strict';
					jQuery('#filter-date, #search-from-date, #search-to-date')
							.datetimepicker();
				});
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