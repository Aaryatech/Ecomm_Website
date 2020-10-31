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
		<div class="find_store with_bread">
			<div class="wrapper">

				<div class="breadcrums">
					<a href="#">Home</a> <i class="fa fa-angle-right"
						aria-hidden="true"></i> <a href="#">Eggless Cakes</a> <i
						class="fa fa-angle-right" aria-hidden="true"></i> Black Forest
					Cake

				</div>

				<div class="detail_row">
					<div class="detail_l">
						<div class="detail_slide">
							<div id="el"></div>
						</div>
					</div>
					<div class="detail_r">
						<div class="detail_content">
							<!--product name row-->
							<div class="stock_row">
								<div class="stock_l">
									<h2 class="product_nm">
										<span>In Stock</span> Fudge Brownie Cake Half kg
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
								599 <span class="act_prc">749</span> <span class="save">
									20% off (Save 150) </span> <span class="inclusive_txt">Inclusive
									of all taxes</span>
							</div>
							<!--product txt row-->
							<div class="prod_txt">This classic round Black Forest cake
								makes a highly tempting gift. It weighs half kg, and is stuffed
								with whipped cream and studded with cherries. Its eggless
								version is also available. You can give this gift on any joyous
								occasion. Key attributes :</div>

							<ul class="shape_list">
								<li><i class="fa fa-circle" aria-hidden="true"></i> Shape :
									Round</li>
								<li><i class="fa fa-circle" aria-hidden="true"></i>
									Flavours : Black Forest</li>
								<li><i class="fa fa-circle" aria-hidden="true"></i> Weight
									: 0.5 kg</li>
							</ul>

							<div class="delivery_row">
								<div class="delivery_l">
									<div class="a">
										<h4 class="highlight_title">Product Highlights :</h4>
										<ul class="highlist_list">
											<li><i class="fa fa-circle" aria-hidden="true"></i> Cake
												Flavour: Black Forest</li>
											<li><i class="fa fa-circle" aria-hidden="true"></i> Type
												of Cake: Cream</li>
											<li><i class="fa fa-circle" aria-hidden="true"></i> Type
												of Bread: Chocolate</li>
										</ul>
										<a href="#" class="more_highlight">Read More</a>
									</div>

									<!--eagless or with eeg row-->
									<div class="eagless_row">
										<ul>
											<li><label class="radio-button"> <input
													type="radio" name="radio" checked="checked"> <span
													class="label-visible"> <span
														class="fake-radiobutton"></span> Eggless Cake
												</span>
											</label></li>
											<li><label class="radio-button"> <input
													type="radio" name="radio"> <span
													class="label-visible"> <span
														class="fake-radiobutton"></span> Eggbass Cake
												</span>
											</label></li>
										</ul>

										<div class="clr"></div>

									</div>

									<!--cake-kgs-->
									<div class="radio_1 detail_kg">
										<ul>
											<li><input type="radio" id="zzz-option" name="selector"
												class="detail_round"> <label for="zzz-option">Veg</label>
												<div class="check"></div></li>

											<li><input type="radio" id="yyy-option" name="selector"
												tabindex="-1" class="detail_round"> <label
												for="yyy-option">1 Kg</label>
												<div class="check">
													<div class="inside"></div>
												</div></li>

											<li><input type="radio" id="www-option" name="selector"
												class="detail_round"> <label for="www-option">2
													kg</label>
												<div class="check"></div></li>

											<li><input type="radio" id="xxx-option" name="selector"
												class="detail_round"> <label for="xxx-option">3
													kg</label>
												<div class="check"></div></li>

										</ul>
									</div>


								</div>

								<!--right form-->
								<div class="delivery_r">
									<div class="delivery_bx">
										<h4 class="delivery_title">Delivery Details</h4>

										<div class="delivery_frm">
											<form action="" method="get">
												<div class="delivery_frm_l">
													<img
														src="${pageContext.request.contextPath}/resources/images/pic.jpg"
														alt="">

													<div class="inputbrowsebtn">

														<label for="test"> <span class="fg">Upload
																Image </span> <input type="file" id="test">
														</label>



													</div>
												</div>
												<div class="delivery_frm_r">
													<div class="delivery_txtarea">
														<textarea name="" cols="" rows="3" class="input_txt"
															placeholder="Special Instructon"></textarea>
													</div>
													<div class="a">
														<input name="" type="text" class="input_txt"
															placeholder="Message / Name on the Cake" />
													</div>
												</div>
												<div class="clr"></div>
											</form>
										</div>

									</div>
								</div>
								<div class="clr"></div>
							</div>

							<div class="button_row">
								<a href="#" class="cart_button">Add To Cart</a> <a
									href="my-cart.html" class="buy_button">Buy Now</a>
								<div class="clr"></div>
							</div>

						</div>
					</div>
					<div class="clr"></div>
				</div>

				<!--product-discription-->
				<div class="prod_disc">
					<h3 class="prod_title">Product Description:</h3>

					<div class="prod_listing">
						<div class="prod_listing_one">
							<h4 class="highlight_title">Highlights :</h4>
							<ul class="highlist_list">
								<li><i class="fa fa-circle" aria-hidden="true"></i> Cake
									Flavour: Black Forest</li>
								<li><i class="fa fa-circle" aria-hidden="true"></i> Type of
									Cake: Cream</li>
								<li><i class="fa fa-circle" aria-hidden="true"></i> Type of
									Bread: Chocolate</li>
								<li><i class="fa fa-circle" aria-hidden="true"></i> Type of
									cream: Vanilla</li>
								<li><i class="fa fa-circle" aria-hidden="true"></i> Filling
									in Layers: Dark cherry</li>
								<li><i class="fa fa-circle" aria-hidden="true"></i>
									Toppings: Chocolate Flakes &amp; Red Cherry</li>
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
						<li>
							<div class="cake_one product_padd">
								<div class="cake_pic">
									<img
										src="${pageContext.request.contextPath}/resources/images/new_cake_2.jpg"
										alt="" class="mobile_fit transition">
									<div class="circle_tag">
										<img
											src="${pageContext.request.contextPath}/resources/images/heart-1.svg"
											alt=""> <img
											src="${pageContext.request.contextPath}/resources/images/heart.svg"
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
									<h4 class="cake_nm single_row">
										<a href="#">Classic Red Velvet Cake (Half Kg)</a>
									</h4>
								</div>

							</div>
						</li>
						<li>
							<div class="cake_one product_padd">
								<div class="cake_pic">
									<img
										src="${pageContext.request.contextPath}/resources/images/new_cake_1.jpg"
										alt="" class="mobile_fit transition">
									<div class="circle_tag">
										<img
											src="${pageContext.request.contextPath}/resources/images/heart-1.svg"
											alt=""> <img
											src="${pageContext.request.contextPath}/resources/images/heart.svg"
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
									<h4 class="cake_nm single_row">
										<a href="#">Classic Red Velvet Cake (Half Kg)</a>
									</h4>

								</div>

							</div>
						</li>
						<li>
							<div class="cake_one product_padd">
								<div class="cake_pic">
									<img
										src="${pageContext.request.contextPath}/resources/images/new_cake_3.jpg"
										alt="" class="mobile_fit transition">
									<div class="circle_tag">
										<img
											src="${pageContext.request.contextPath}/resources/images/heart-1.svg"
											alt=""> <img
											src="${pageContext.request.contextPath}/resources/images/heart.svg"
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
									<h4 class="cake_nm single_row">
										<a href="#">Classic Red Velvet Cake (Half Kg)</a>
									</h4>

								</div>

							</div>
						</li>
						<li>
							<div class="cake_one product_padd">
								<div class="cake_pic">
									<img
										src="${pageContext.request.contextPath}/resources/images/new_cake_4.jpg"
										alt="" class="mobile_fit transition">
									<div class="circle_tag">
										<img
											src="${pageContext.request.contextPath}/resources/images/heart-1.svg"
											alt=""> <img
											src="${pageContext.request.contextPath}/resources/images/heart.svg"
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
									<h4 class="cake_nm single_row">
										<a href="#">Classic Red Velvet Cake (Half Kg)</a>
									</h4>

								</div>

							</div>
						</li>

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


	<!--zoom slider-->

	<script src="${pageContext.request.contextPath}/resources/js/zoomy.js"></script>
	<link type="text/css" rel="stylesheet"
		href="${pageContext.request.contextPath}/resources/css/zoomy.css">
	<script>
		var urls = [ '${pageContext.request.contextPath}/resources/images/zoom_slide_3.jpg', '${pageContext.request.contextPath}/resources/images/zoom_slide_4.jpg',
				'${pageContext.request.contextPath}/resources/images/zoom_slide_5.jpg', '${pageContext.request.contextPath}/resources/images/zoom_slide_3.jpg',
				'${pageContext.request.contextPath}/resources/images/zoom_slide_4.jpg'
		/*'https://source.unsplash.com/h0s58n-8R6w/600x350',
		'https://source.unsplash.com/jQ2_DWnIX7Y/600x350',
		'https://source.unsplash.com/u4gwRbr2_j0/600x350'*/
		];
		var options = {
		//thumbLeft:true,
		//thumbRight:true,
		//thumbHide:true,
		//width:300,
		//height:500,
		};
		$('#el').zoomy(urls, options);
	</script>
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