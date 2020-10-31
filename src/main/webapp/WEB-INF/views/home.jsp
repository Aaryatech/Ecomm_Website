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
				<div class="prod_cat_1">
					<div class="cakes_cat_1">
						<a href="product-filter.html">
							<div class="img_cap">
								<img
									src="https://d3s16h6oq3j5fb.cloudfront.net/img/Spinner-2.gif"
									class="lazy"
									data-src="${pageContext.request.contextPath}/resources/images/cakes_1.jpg"
									alt="">
								<div class="prod_cat_cap">
									<span>Cakes</span>
								</div>
							</div>
						</a>
					</div>
				</div>
				<div class="prod_cat_2">
					<div class="divid_two">
						<div class="divide_one_pic left">
							<div class="single_pic">
								<a href="product-filter.html"> <img
									src="https://d3s16h6oq3j5fb.cloudfront.net/img/Spinner-2.gif"
									class="lazy"
									data-src="${pageContext.request.contextPath}/resources/images/offers_prod_1.jpg"
									alt="">
									<div class="prod_cat_cap1">
										<span>Pastries</span>
									</div>
								</a>
							</div>
						</div>
						<div class="divide_one_pic right">
							<div class="single_pic">
								<a href="product-filter.html"> <img
									src="https://d3s16h6oq3j5fb.cloudfront.net/img/Spinner-2.gif"
									class="lazy"
									data-src="${pageContext.request.contextPath}/resources/images/offers_prod_2.jpg"
									alt="">
									<div class="prod_cat_cap1">
										<span>Savories</span>
									</div>
								</a>
							</div>
						</div>
						<div class="clr"></div>
					</div>
					<div class="divid_two">
						<div class="divide_one_pic left">
							<div class="single_pic">
								<a href="product-filter.html"> <img
									src="https://d3s16h6oq3j5fb.cloudfront.net/img/Spinner-2.gif"
									class="lazy"
									data-src="${pageContext.request.contextPath}/resources/images/offers_prod_3.jpg"
									alt="">
									<div class="prod_cat_cap1">
										<span>Packaged Cakes</span>
									</div>
								</a>
							</div>
						</div>
						<div class="divide_one_pic right">
							<div class="single_pic">
								<a href="product-filter.html"> <img
									src="https://d3s16h6oq3j5fb.cloudfront.net/img/Spinner-2.gif"
									class="lazy"
									data-src="${pageContext.request.contextPath}/resources/images/offers_prod_4.jpg"
									alt="">
									<div class="prod_cat_cap1">
										<span>Chocolates</span>
									</div>
								</a>
							</div>
						</div>
						<div class="clr"></div>
					</div>
					<div class="single_prod">
						<div class="single_pic">
							<a href="product-filter.html"> <img
								src="https://d3s16h6oq3j5fb.cloudfront.net/img/Spinner-2.gif"
								class="lazy"
								data-src="${pageContext.request.contextPath}/resources/images/offers_prod_5.jpg"
								alt="">
								<div class="prod_cat_cap1">
									<span>Bakersware</span>
								</div>
							</a>

						</div>
					</div>
				</div>
				<div class="prod_cat_3">
					<div class="lst_tow marg_btm divice">
						<div class="single_pic">
							<a href="product-filter.html"> <img src="#" class="lazy"
								data-src="${pageContext.request.contextPath}/resources/images/combo_2.jpg"
								alt="">
								<div class="prod_cat_cap1">
									<span>Combo</span>
								</div>
							</a>
						</div>
					</div>
					<div class="lst_tow divice1">
						<div class="single_pic ">
							<a href="product-filter.html"> <img src="#" class="lazy"
								data-src="${pageContext.request.contextPath}/resources/images/combo_2.jpg"
								alt="">
								<div class="prod_cat_cap1">
									<span>Combo</span>
								</div>
							</a>
						</div>
					</div>
				</div>
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
						<a href="product-filter.html"><img src="#" class="lazy"
							data-src="${pageContext.request.contextPath}/resources/images/festival_banner_1.jpg"
							alt=""></a>
					</div>
				</div>
				<div>
					<div class="festival_offer">
						<a href="product-filter.html"><img src="#" class="lazy"
							data-src="${pageContext.request.contextPath}/resources/images/festival_banner_2.jpg"
							alt=""></a>
					</div>
				</div>
				<div>
					<div class="festival_offer">
						<a href="product-filter.html"><img src="#" class="lazy"
							data-src="${pageContext.request.contextPath}/resources/images/festival_banner_1.jpg"
							alt=""></a>
					</div>
				</div>
				<div>
					<div class="festival_offer">
						<a href="product-filter.html"><img src="#" class="lazy"
							data-src="${pageContext.request.contextPath}/resources/images/festival_banner_2.jpg"
							alt=""></a>
					</div>
				</div>

			</section>
		</div>
	</div>


	<!--new cake box-->
	<div class="find_store">
		<h2 class="sec_title">
			<center>
				Best Seller Cake <span>Best Seller Cake Regarding sublines</span>
			</center>
		</h2>

		<div class="wrapper">
			<section class="regular-cake slider">
				<div>
					<div class="cake_one">
						<div class="cake_pic">
							<img src="#" 
								data-src="${pageContext.request.contextPath}/resources/images/new_cake_1.jpg"
								alt="" class="mobile_fit transition lazy">



							<div class="circle_tag active">
								<img src="#" class="lazy"
									data-src="${pageContext.request.contextPath}/resources/images/heart-1.svg"
									alt=""> <img src="#" class="lazy"
									data-src="${pageContext.request.contextPath}/resources/images/heart.svg"
									alt="">
							</div>
							<div class="cake_prc">
								<i class="fa fa-inr" aria-hidden="true"></i>499 <span
									class="off_prc"><i class="fa fa-inr" aria-hidden="true"></i>649</span>
								<span class="prc_off">(23% Off)</span>
							</div>

						</div>

						<div class="cake_container">
							<h4 class="cake_nm">
								<a href="product-detail.html">Classic Red Velvet Cake (Half
									Kg)</a>
							</h4>
							<div class="cake_dropdown">
								<div class="cake_dropdown_l">
									<div class="dropdown2">
										<div class="select">
											<span>Select Flavour</span>
										</div>
										<input type="hidden" name="gender">
										<ul class="dropdown-menu">
											<li id="male">Vanilla</li>
											<li id="female">Pineapple</li>
											<li id="female">Butter Scotch</li>
										</ul>
									</div>
								</div>
								<div class="cake_dropdown_r">
									<div class="dropdown2">
										<div class="select">
											<span>Select Weight</span>
										</div>
										<input type="hidden" name="gender">
										<ul class="dropdown-menu">
											<li id="male">500 gm</li>
											<li id="female">1 Kg</li>
											<li id="female">2 Kg</li>
										</ul>
									</div>
								</div>
								<div class="clr"></div>
							</div>
							<div class="cake_radio_row">
								<div class="radio_l">

									<div class="radio_1">
										<ul>
											<li><input type="radio" id="a-option" name="selector">
												<label for="a-option">Veg</label>
												<div class="check"></div></li>

											<li><input type="radio" id="b-option" name="selector">
												<label for="b-option">Non Veg</label>
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
							</div>
						</div>

					</div>
				</div>
				<div>
					<div class="cake_one">
						<div class="cake_pic">
							<img src="#" 
								data-src="${pageContext.request.contextPath}/resources/images/new_cake_2.jpg"
								alt="" class="mobile_fit transition lazy">
							<div class="circle_tag">
								<img src="#" class="lazy"
									data-src="${pageContext.request.contextPath}/resources/images/heart-1.svg"
									alt=""> <img src="#" class="lazy"
									data-src="${pageContext.request.contextPath}/resources/images/heart.svg"
									alt="">
							</div>
							<div class="cake_prc">
								<i class="fa fa-inr" aria-hidden="true"></i>499 <span
									class="off_prc"><i class="fa fa-inr" aria-hidden="true"></i>649</span>
								<span class="prc_off">(23% Off)</span>
							</div>
						</div>

						<div class="cake_container">
							<h4 class="cake_nm">
								<a href="product-detail.html">Classic Red Velvet Cake (Half
									Kg)</a>
							</h4>
							<div class="cake_dropdown">
								<div class="cake_dropdown_l">
									<div class="dropdown2">
										<div class="select">
											<span>Select Flavour</span>
										</div>
										<input type="hidden" name="gender">
										<ul class="dropdown-menu">
											<li id="male">Vanilla</li>
											<li id="female">Pineapple</li>
											<li id="female">Butter Scotch</li>
										</ul>
									</div>
								</div>
								<div class="cake_dropdown_r">
									<div class="dropdown2">
										<div class="select">
											<span>Select Weight</span>
										</div>
										<input type="hidden" name="gender">
										<ul class="dropdown-menu">
											<li id="male">500 gm</li>
											<li id="female">1 Kg</li>
											<li id="female">2 Kg</li>
										</ul>
									</div>
								</div>
								<div class="clr"></div>
							</div>
							<div class="cake_radio_row">
								<div class="radio_l">

									<div class="radio_1">

										<ul>
											<li><input type="radio" id="c-option" name="selector">
												<label for="c-option">Veg</label>

												<div class="check"></div></li>

											<li><input type="radio" id="d-option" name="selector">
												<label for="d-option">Non Veg</label>

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
							</div>
						</div>

					</div>
				</div>
				<div>
					<div class="cake_one">
						<div class="cake_pic">
							<img src="#" 
								data-src="${pageContext.request.contextPath}/resources/images/new_cake_3.jpg"
								alt="" class="mobile_fit transition lazy">
							<div class="circle_tag">
								<img src="#" class="lazy"
									data-src="${pageContext.request.contextPath}/resources/images/heart-1.svg"
									alt=""> <img src="#" class="lazy"
									data-src="${pageContext.request.contextPath}/resources/images/heart.svg"
									alt="">
							</div>
							<div class="cake_prc">
								<i class="fa fa-inr" aria-hidden="true"></i>499 <span
									class="off_prc"><i class="fa fa-inr" aria-hidden="true"></i>649</span>
								<span class="prc_off">(23% Off)</span>
							</div>
						</div>

						<div class="cake_container">
							<h4 class="cake_nm">
								<a href="product-detail.html">Classic Red Velvet Cake (Half
									Kg)</a>
							</h4>
							<div class="cake_dropdown">
								<div class="cake_dropdown_l">
									<div class="dropdown2">
										<div class="select">
											<span>Select Flavour</span>
										</div>
										<input type="hidden" name="gender">
										<ul class="dropdown-menu">
											<li id="male">Vanilla</li>
											<li id="female">Pineapple</li>
											<li id="female">Butter Scotch</li>
										</ul>
									</div>
								</div>
								<div class="cake_dropdown_r">
									<div class="dropdown2">
										<div class="select">
											<span>Select Weight</span>
										</div>
										<input type="hidden" name="gender">
										<ul class="dropdown-menu">
											<li id="male">500 gm</li>
											<li id="female">1 Kg</li>
											<li id="female">2 Kg</li>
										</ul>
									</div>
								</div>
								<div class="clr"></div>
							</div>
							<div class="cake_radio_row">
								<div class="radio_l">

									<div class="radio_1">

										<ul>
											<li><input type="radio" id="e-option" name="selector">
												<label for="e-option">Veg</label>

												<div class="check"></div></li>

											<li><input type="radio" id="f-option" name="selector">
												<label for="f-option">Non Veg</label>

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
							</div>
						</div>

					</div>
				</div>
				<div>
					<div class="cake_one">
						<div class="cake_pic">
							<img src="#" 
								data-src="${pageContext.request.contextPath}/resources/images/new_cake_4.jpg"
								alt="" class="mobile_fit transition lazy">
							<div class="circle_tag">
								<img src="#" class="lazy"
									data-src="${pageContext.request.contextPath}/resources/images/heart-1.svg"
									alt=""> <img src="#" class="lazy"
									data-src="${pageContext.request.contextPath}/resources/images/heart.svg"
									alt="">
							</div>
							<div class="cake_prc">
								<i class="fa fa-inr" aria-hidden="true"></i>499 <span
									class="off_prc"><i class="fa fa-inr" aria-hidden="true"></i>649</span>
								<span class="prc_off">(23% Off)</span>
							</div>
						</div>

						<div class="cake_container">
							<h4 class="cake_nm">
								<a href="product-detail.html">Classic Red Velvet Cake (Half
									Kg)</a>
							</h4>
							<div class="cake_dropdown">
								<div class="cake_dropdown_l">
									<div class="dropdown2">
										<div class="select">
											<span>Select Flavour</span>
										</div>
										<input type="hidden" name="gender">
										<ul class="dropdown-menu">
											<li id="male">Vanilla</li>
											<li id="female">Pineapple</li>
											<li id="female">Butter Scotch</li>
										</ul>
									</div>
								</div>
								<div class="cake_dropdown_r">
									<div class="dropdown2">
										<div class="select">
											<span>Select Weight</span>
										</div>
										<input type="hidden" name="gender">
										<ul class="dropdown-menu">
											<li id="male">500 gm</li>
											<li id="female">1 Kg</li>
											<li id="female">2 Kg</li>
										</ul>
									</div>
								</div>
								<div class="clr"></div>
							</div>
							<div class="cake_radio_row">
								<div class="radio_l">

									<div class="radio_1">

										<ul>
											<li><input type="radio" id="g-option" name="selector">
												<label for="g-option">Veg</label>

												<div class="check"></div></li>

											<li><input type="radio" id="h-option" name="selector">
												<label for="h-option">Non Veg</label>

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
							</div>
						</div>

					</div>
				</div>
				<div>
					<div class="cake_one">
						<div class="cake_pic">
							<img src="#" 
								data-src="${pageContext.request.contextPath}/resources/images/new_cake_2.jpg"
								alt="" class="mobile_fit transition lazy">
							<div class="circle_tag">
								<img src="#" class="lazy"
									data-src="${pageContext.request.contextPath}/resources/images/heart-1.svg"
									alt=""> <img src="#" class="lazy"
									data-src="${pageContext.request.contextPath}/resources/images/heart.svg"
									alt="">
							</div>
							<div class="cake_prc">
								<i class="fa fa-inr" aria-hidden="true"></i>499 <span
									class="off_prc"><i class="fa fa-inr" aria-hidden="true"></i>649</span>
								<span class="prc_off">(23% Off)</span>
							</div>
						</div>

						<div class="cake_container">
							<h4 class="cake_nm">
								<a href="product-detail.html">Classic Red Velvet Cake (Half
									Kg)</a>
							</h4>
							<div class="cake_dropdown">
								<div class="cake_dropdown_l">
									<div class="dropdown2">
										<div class="select">
											<span>Select Flavour</span>
										</div>
										<input type="hidden" name="gender">
										<ul class="dropdown-menu">
											<li id="male">Vanilla</li>
											<li id="female">Pineapple</li>
											<li id="female">Butter Scotch</li>
										</ul>
									</div>
								</div>
								<div class="cake_dropdown_r">
									<div class="dropdown2">
										<div class="select">
											<span>Select Weight</span>
										</div>
										<input type="hidden" name="gender">
										<ul class="dropdown-menu">
											<li id="male">500 gm</li>
											<li id="female">1 Kg</li>
											<li id="female">2 Kg</li>
										</ul>
									</div>
								</div>
								<div class="clr"></div>
							</div>
							<div class="cake_radio_row">
								<div class="radio_l">

									<div class="radio_1">

										<ul>
											<li><input type="radio" id="i-option" name="selector">
												<label for="i-option">Veg</label>

												<div class="check"></div></li>

											<li><input type="radio" id="iii-option" name="selector">
												<label for="iii-option">Non Veg</label>

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
							</div>
						</div>

					</div>
				</div>
			</section>

			<div class="more_cakes">
				<a href="product.html">More Best Seller Cakes</a>
			</div>
		</div>


	</div>

	<!--premium cake box-->
	<div class="testimonial_bx">
		<h2 class="sec_title">
			<center>
				Premium Cake <span>Premium Cake Regarding sublines</span>
			</center>

		</h2>

		<div class="wrapper">
			<section class="regular-cake slider">
				<div>
					<div class="cake_one">
						<div class="cake_pic">
							<img src="#" 
								data-src="${pageContext.request.contextPath}/resources/images/new_cake_1.jpg"
								alt="" class="mobile_fit transition lazy">
							<div class="circle_tag active">
								<img src="#" class="lazy"
									data-src="${pageContext.request.contextPath}/resources/images/heart-1.svg"
									alt=""> <img src="#" class="lazy"
									data-src="${pageContext.request.contextPath}/resources/images/heart.svg"
									alt="">
							</div>
							<div class="cake_prc">
								<i class="fa fa-inr" aria-hidden="true"></i>499 <span
									class="off_prc"><i class="fa fa-inr" aria-hidden="true"></i>649</span>
								<span class="prc_off">(23% Off)</span>
							</div>

						</div>

						<div class="cake_container">
							<h4 class="cake_nm">
								<a href="product-detail.html">Classic Red Velvet Cake (Half
									Kg)</a>
							</h4>
							<div class="cake_dropdown">
								<div class="cake_dropdown_l">
									<div class="dropdown2">
										<div class="select">
											<span>Select Flavour</span>
										</div>
										<input type="hidden" name="gender">
										<ul class="dropdown-menu">
											<li id="male">Vanilla</li>
											<li id="female">Pineapple</li>
											<li id="female">Butter Scotch</li>
										</ul>
									</div>
								</div>
								<div class="cake_dropdown_r">
									<div class="dropdown2">
										<div class="select">
											<span>Select Weight</span>
										</div>
										<input type="hidden" name="gender">
										<ul class="dropdown-menu">
											<li id="male">500 gm</li>
											<li id="female">1 Kg</li>
											<li id="female">2 Kg</li>
										</ul>
									</div>
								</div>
								<div class="clr"></div>
							</div>
							<div class="cake_radio_row">
								<div class="radio_l">

									<div class="radio_1">
										<ul>
											<li><input type="radio" id="j-option" name="selector">
												<label for="j-option">Veg</label>
												<div class="check"></div></li>

											<li><input type="radio" id="k-option" name="selector">
												<label for="k-option">Non Veg</label>
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
							</div>
						</div>

					</div>
				</div>
				<div>
					<div class="cake_one">
						<div class="cake_pic">
							<img src="#" 
								data-src="${pageContext.request.contextPath}/resources/images/new_cake_2.jpg"
								alt="" class="mobile_fit transition lazy">
							<div class="circle_tag">
								<img src="#" class="lazy"
									data-src="${pageContext.request.contextPath}/resources/images/heart-1.svg"
									alt=""> <img src="#" class="lazy"
									data-src="${pageContext.request.contextPath}/resources/images/heart.svg"
									alt="">
							</div>
							<div class="cake_prc">
								<i class="fa fa-inr" aria-hidden="true"></i>499 <span
									class="off_prc"><i class="fa fa-inr" aria-hidden="true"></i>649</span>
								<span class="prc_off">(23% Off)</span>
							</div>
						</div>

						<div class="cake_container">
							<h4 class="cake_nm">
								<a href="product-detail.html">Classic Red Velvet Cake (Half
									Kg)</a>
							</h4>
							<div class="cake_dropdown">
								<div class="cake_dropdown_l">
									<div class="dropdown2">
										<div class="select">
											<span>Select Flavour</span>
										</div>
										<input type="hidden" name="gender">
										<ul class="dropdown-menu">
											<li id="male">Vanilla</li>
											<li id="female">Pineapple</li>
											<li id="female">Butter Scotch</li>
										</ul>
									</div>
								</div>
								<div class="cake_dropdown_r">
									<div class="dropdown2">
										<div class="select">
											<span>Select Weight</span>
										</div>
										<input type="hidden" name="gender">
										<ul class="dropdown-menu">
											<li id="male">500 gm</li>
											<li id="female">1 Kg</li>
											<li id="female">2 Kg</li>
										</ul>
									</div>
								</div>
								<div class="clr"></div>
							</div>
							<div class="cake_radio_row">
								<div class="radio_l">

									<div class="radio_1">

										<ul>
											<li><input type="radio" id="l-option" name="selector">
												<label for="l-option">Veg</label>

												<div class="check"></div></li>

											<li><input type="radio" id="m-option" name="selector">
												<label for="m-option">Non Veg</label>

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
							</div>
						</div>

					</div>
				</div>
				<div>
					<div class="cake_one">
						<div class="cake_pic">
							<img src="#" 
								data-src="${pageContext.request.contextPath}/resources/images/new_cake_3.jpg"
								alt="" class="mobile_fit transition lazy">
							<div class="circle_tag">
								<img src="#" class="lazy"
									data-src="${pageContext.request.contextPath}/resources/images/heart-1.svg"
									alt=""> <img src="#" class="lazy"
									data-src="${pageContext.request.contextPath}/resources/images/heart.svg"
									alt="">
							</div>
							<div class="cake_prc">
								<i class="fa fa-inr" aria-hidden="true"></i>499 <span
									class="off_prc"><i class="fa fa-inr" aria-hidden="true"></i>649</span>
								<span class="prc_off">(23% Off)</span>
							</div>
						</div>

						<div class="cake_container">
							<h4 class="cake_nm">
								<a href="product-detail.html">Classic Red Velvet Cake (Half
									Kg)</a>
							</h4>
							<div class="cake_dropdown">
								<div class="cake_dropdown_l">
									<div class="dropdown2">
										<div class="select">
											<span>Select Flavour</span>
										</div>
										<input type="hidden" name="gender">
										<ul class="dropdown-menu">
											<li id="male">Vanilla</li>
											<li id="female">Pineapple</li>
											<li id="female">Butter Scotch</li>
										</ul>
									</div>
								</div>
								<div class="cake_dropdown_r">
									<div class="dropdown2">
										<div class="select">
											<span>Select Weight</span>
										</div>
										<input type="hidden" name="gender">
										<ul class="dropdown-menu">
											<li id="male">500 gm</li>
											<li id="female">1 Kg</li>
											<li id="female">2 Kg</li>
										</ul>
									</div>
								</div>
								<div class="clr"></div>
							</div>
							<div class="cake_radio_row">
								<div class="radio_l">

									<div class="radio_1">

										<ul>
											<li><input type="radio" id="n-option" name="selector">
												<label for="n-option">Veg</label>

												<div class="check"></div></li>

											<li><input type="radio" id="o-option" name="selector">
												<label for="o-option">Non Veg</label>

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
							</div>
						</div>

					</div>
				</div>
				<div>
					<div class="cake_one">
						<div class="cake_pic">
							<img src="#" 
								data-src="${pageContext.request.contextPath}/resources/images/new_cake_4.jpg"
								alt="" class="mobile_fit transition lazy">
							<div class="circle_tag">
								<img src="#" class="lazy"
									data-src="${pageContext.request.contextPath}/resources/images/heart-1.svg"
									alt=""> <img src="#" class="lazy"
									data-src="${pageContext.request.contextPath}/resources/images/heart.svg"
									alt="">
							</div>
							<div class="cake_prc">
								<i class="fa fa-inr" aria-hidden="true"></i>499 <span
									class="off_prc"><i class="fa fa-inr" aria-hidden="true"></i>649</span>
								<span class="prc_off">(23% Off)</span>
							</div>
						</div>

						<div class="cake_container">
							<h4 class="cake_nm">
								<a href="product-detail.html">Classic Red Velvet Cake (Half
									Kg)</a>
							</h4>
							<div class="cake_dropdown">
								<div class="cake_dropdown_l">
									<div class="dropdown2">
										<div class="select">
											<span>Select Flavour</span>
										</div>
										<input type="hidden" name="gender">
										<ul class="dropdown-menu">
											<li id="male">Vanilla</li>
											<li id="female">Pineapple</li>
											<li id="female">Butter Scotch</li>
										</ul>
									</div>
								</div>
								<div class="cake_dropdown_r">
									<div class="dropdown2">
										<div class="select">
											<span>Select Weight</span>
										</div>
										<input type="hidden" name="gender">
										<ul class="dropdown-menu">
											<li id="male">500 gm</li>
											<li id="female">1 Kg</li>
											<li id="female">2 Kg</li>
										</ul>
									</div>
								</div>
								<div class="clr"></div>
							</div>
							<div class="cake_radio_row">
								<div class="radio_l">

									<div class="radio_1">

										<ul>
											<li><input type="radio" id="p-option" name="selector">
												<label for="p-option">Veg</label>

												<div class="check"></div></li>

											<li><input type="radio" id="q-option" name="selector">
												<label for="q-option">Non Veg</label>

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
							</div>
						</div>

					</div>
				</div>
				<div>
					<div class="cake_one">
						<div class="cake_pic">
							<img src="#" 
								data-src="${pageContext.request.contextPath}/resources/images/new_cake_2.jpg"
								alt="" class="mobile_fit transition lazy">
							<div class="circle_tag">
								<img src="#" class="lazy"
									data-src="${pageContext.request.contextPath}/resources/images/heart-1.svg"
									alt=""> <img src="#" class="lazy"
									data-src="${pageContext.request.contextPath}/resources/images/heart.svg"
									alt="">
							</div>
							<div class="cake_prc">
								<i class="fa fa-inr" aria-hidden="true"></i>499 <span
									class="off_prc"><i class="fa fa-inr" aria-hidden="true"></i>649</span>
								<span class="prc_off">(23% Off)</span>
							</div>
						</div>

						<div class="cake_container">
							<h4 class="cake_nm">
								<a href="product-detail.html">Classic Red Velvet Cake (Half
									Kg)</a>
							</h4>
							<div class="cake_dropdown">
								<div class="cake_dropdown_l">
									<div class="dropdown2">
										<div class="select">
											<span>Select Flavour</span>
										</div>
										<input type="hidden" name="gender">
										<ul class="dropdown-menu">
											<li id="male">Vanilla</li>
											<li id="female">Pineapple</li>
											<li id="female">Butter Scotch</li>
										</ul>
									</div>
								</div>
								<div class="cake_dropdown_r">
									<div class="dropdown2">
										<div class="select">
											<span>Select Weight</span>
										</div>
										<input type="hidden" name="gender">
										<ul class="dropdown-menu">
											<li id="male">500 gm</li>
											<li id="female">1 Kg</li>
											<li id="female">2 Kg</li>
										</ul>
									</div>
								</div>
								<div class="clr"></div>
							</div>
							<div class="cake_radio_row">
								<div class="radio_l">

									<div class="radio_1">

										<ul>
											<li><input type="radio" id="r-option" name="selector">
												<label for="r-option">Veg</label>

												<div class="check"></div></li>

											<li><input type="radio" id="s-option" name="selector">
												<label for="s-option">Non Veg</label>

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
							</div>
						</div>

					</div>
				</div>
			</section>

			<div class="more_cakes">
				<a href="product.html">More Premium Cakes</a>
			</div>

		</div>
	</div>

	<!--new cake box-->
	<div class="find_store">
		<h2 class="sec_title">
			<center>
				New Cake <span>New Cake Regarding sublines</span>
			</center>
		</h2>

		<div class="wrapper">
			<section class="regular-cake slider">
				<div>
					<div class="cake_one">
						<div class="cake_pic">
							<img src="#" 
								data-src="${pageContext.request.contextPath}/resources/images/new_cake_1.jpg"
								alt="" class="mobile_fit transition lazy">
							<div class="circle_tag active">
								<img src="#" class="lazy"
									data-src="${pageContext.request.contextPath}/resources/images/heart-1.svg"
									alt=""> <img src="#" class="lazy"
									data-src="${pageContext.request.contextPath}/resources/images/heart.svg"
									alt="">
							</div>
							<div class="cake_prc">
								<i class="fa fa-inr" aria-hidden="true"></i>499 <span
									class="off_prc"><i class="fa fa-inr" aria-hidden="true"></i>649</span>
								<span class="prc_off">(23% Off)</span>
							</div>

						</div>

						<div class="cake_container">
							<h4 class="cake_nm">
								<a href="product-detail.html">Classic Red Velvet Cake (Half
									Kg)</a>
							</h4>
							<div class="cake_dropdown">
								<div class="cake_dropdown_l">
									<div class="dropdown2">
										<div class="select">
											<span>Select Flavour</span>
										</div>
										<input type="hidden" name="gender">
										<ul class="dropdown-menu">
											<li id="male">Vanilla</li>
											<li id="female">Pineapple</li>
											<li id="female">Butter Scotch</li>
										</ul>
									</div>
								</div>
								<div class="cake_dropdown_r">
									<div class="dropdown2">
										<div class="select">
											<span>Select Weight</span>
										</div>
										<input type="hidden" name="gender">
										<ul class="dropdown-menu">
											<li id="male">500 gm</li>
											<li id="female">1 Kg</li>
											<li id="female">2 Kg</li>
										</ul>
									</div>
								</div>
								<div class="clr"></div>
							</div>
							<div class="cake_radio_row">
								<div class="radio_l">

									<div class="radio_1">
										<ul>
											<li><input type="radio" id="t-option" name="selector">
												<label for="t-option">Veg</label>
												<div class="check"></div></li>

											<li><input type="radio" id="u-option" name="selector">
												<label for="u-option">Non Veg</label>
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
							</div>
						</div>

					</div>
				</div>
				<div>
					<div class="cake_one">
						<div class="cake_pic">
							<img src="#" 
								data-src="${pageContext.request.contextPath}/resources/images/new_cake_2.jpg"
								alt="" class="mobile_fit transition lazy">
							<div class="circle_tag">
								<img src="#" class="lazy"
									data-src="${pageContext.request.contextPath}/resources/images/heart-1.svg"
									alt=""> <img src="#" class="lazy"
									data-src="${pageContext.request.contextPath}/resources/images/heart.svg"
									alt="">
							</div>
							<div class="cake_prc">
								<i class="fa fa-inr" aria-hidden="true"></i>499 <span
									class="off_prc"><i class="fa fa-inr" aria-hidden="true"></i>649</span>
								<span class="prc_off">(23% Off)</span>
							</div>
						</div>

						<div class="cake_container">
							<h4 class="cake_nm">
								<a href="product-detail.html">Classic Red Velvet Cake (Half
									Kg)</a>
							</h4>
							<div class="cake_dropdown">
								<div class="cake_dropdown_l">
									<div class="dropdown2">
										<div class="select">
											<span>Select Flavour</span>
										</div>
										<input type="hidden" name="gender">
										<ul class="dropdown-menu">
											<li id="male">Vanilla</li>
											<li id="female">Pineapple</li>
											<li id="female">Butter Scotch</li>
										</ul>
									</div>
								</div>
								<div class="cake_dropdown_r">
									<div class="dropdown2">
										<div class="select">
											<span>Select Weight</span>
										</div>
										<input type="hidden" name="gender">
										<ul class="dropdown-menu">
											<li id="male">500 gm</li>
											<li id="female">1 Kg</li>
											<li id="female">2 Kg</li>
										</ul>
									</div>
								</div>
								<div class="clr"></div>
							</div>
							<div class="cake_radio_row">
								<div class="radio_l">

									<div class="radio_1">

										<ul>
											<li><input type="radio" id="v-option" name="selector">
												<label for="v-option">Veg</label>

												<div class="check"></div></li>

											<li><input type="radio" id="w-option" name="selector">
												<label for="w-option">Non Veg</label>

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
							</div>
						</div>

					</div>
				</div>
				<div>
					<div class="cake_one">
						<div class="cake_pic">
							<img src="#" 
								data-src="${pageContext.request.contextPath}/resources/images/new_cake_3.jpg"
								alt="" class="mobile_fit transition lazy">
							<div class="circle_tag">
								<img src="#" class="lazy"
									data-src="${pageContext.request.contextPath}/resources/images/heart-1.svg"
									alt=""> <img src="#" class="lazy"
									data-src="${pageContext.request.contextPath}/resources/images/heart.svg"
									alt="">
							</div>
							<div class="cake_prc">
								<i class="fa fa-inr" aria-hidden="true"></i>499 <span
									class="off_prc"><i class="fa fa-inr" aria-hidden="true"></i>649</span>
								<span class="prc_off">(23% Off)</span>
							</div>
						</div>

						<div class="cake_container">
							<h4 class="cake_nm">
								<a href="product-detail.html">Classic Red Velvet Cake (Half
									Kg)</a>
							</h4>
							<div class="cake_dropdown">
								<div class="cake_dropdown_l">
									<div class="dropdown2">
										<div class="select">
											<span>Select Flavour</span>
										</div>
										<input type="hidden" name="gender">
										<ul class="dropdown-menu">
											<li id="male">Vanilla</li>
											<li id="female">Pineapple</li>
											<li id="female">Butter Scotch</li>
										</ul>
									</div>
								</div>
								<div class="cake_dropdown_r">
									<div class="dropdown2">
										<div class="select">
											<span>Select Weight</span>
										</div>
										<input type="hidden" name="gender">
										<ul class="dropdown-menu">
											<li id="male">500 gm</li>
											<li id="female">1 Kg</li>
											<li id="female">2 Kg</li>
										</ul>
									</div>
								</div>
								<div class="clr"></div>
							</div>
							<div class="cake_radio_row">
								<div class="radio_l">

									<div class="radio_1">

										<ul>
											<li><input type="radio" id="x-option" name="selector">
												<label for="x-option">Veg</label>

												<div class="check"></div></li>

											<li><input type="radio" id="y-option" name="selector">
												<label for="y-option">Non Veg</label>

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
							</div>
						</div>

					</div>
				</div>
				<div>
					<div class="cake_one">
						<div class="cake_pic">
							<img src="#" 
								data-src="${pageContext.request.contextPath}/resources/images/new_cake_4.jpg"
								alt="" class="mobile_fit transition lazy">
							<div class="circle_tag">
								<img src="#" class="lazy"
									data-src="${pageContext.request.contextPath}/resources/images/heart-1.svg"
									alt=""> <img src="#" class="lazy"
									data-src="${pageContext.request.contextPath}/resources/images/heart.svg"
									alt="">
							</div>
							<div class="cake_prc">
								<i class="fa fa-inr" aria-hidden="true"></i>499 <span
									class="off_prc"><i class="fa fa-inr" aria-hidden="true"></i>649</span>
								<span class="prc_off">(23% Off)</span>
							</div>
						</div>

						<div class="cake_container">
							<h4 class="cake_nm">
								<a href="product-detail.html">Classic Red Velvet Cake (Half
									Kg)</a>
							</h4>
							<div class="cake_dropdown">
								<div class="cake_dropdown_l">
									<div class="dropdown2">
										<div class="select">
											<span>Select Flavour</span>
										</div>
										<input type="hidden" name="gender">
										<ul class="dropdown-menu">
											<li id="male">Vanilla</li>
											<li id="female">Pineapple</li>
											<li id="female">Butter Scotch</li>
										</ul>
									</div>
								</div>
								<div class="cake_dropdown_r">
									<div class="dropdown2">
										<div class="select">
											<span>Select Weight</span>
										</div>
										<input type="hidden" name="gender">
										<ul class="dropdown-menu">
											<li id="male">500 gm</li>
											<li id="female">1 Kg</li>
											<li id="female">2 Kg</li>
										</ul>
									</div>
								</div>
								<div class="clr"></div>
							</div>
							<div class="cake_radio_row">
								<div class="radio_l">

									<div class="radio_1">

										<ul>
											<li><input type="radio" id="z-option" name="selector">
												<label for="z-option">Veg</label>

												<div class="check"></div></li>

											<li><input type="radio" id="aa-option" name="selector">
												<label for="aa-option">Non Veg</label>

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
							</div>
						</div>

					</div>
				</div>
				<div>
					<div class="cake_one">
						<div class="cake_pic">
							<img src="#" 
								data-src="${pageContext.request.contextPath}/resources/images/new_cake_2.jpg"
								alt="" class="mobile_fit transition lazy">
							<div class="circle_tag">
								<img src="#" class="lazy"
									data-src="${pageContext.request.contextPath}/resources/images/heart-1.svg"
									alt=""> <img src="#" class="lazy"
									data-src="${pageContext.request.contextPath}/resources/images/heart.svg"
									alt="">
							</div>
							<div class="cake_prc">
								<i class="fa fa-inr" aria-hidden="true"></i>499 <span
									class="off_prc"><i class="fa fa-inr" aria-hidden="true"></i>649</span>
								<span class="prc_off">(23% Off)</span>
							</div>
						</div>

						<div class="cake_container">
							<h4 class="cake_nm">
								<a href="product-detail.html">Classic Red Velvet Cake (Half
									Kg)</a>
							</h4>
							<div class="cake_dropdown">
								<div class="cake_dropdown_l">
									<div class="dropdown2">
										<div class="select">
											<span>Select Flavour</span>
										</div>
										<input type="hidden" name="gender">
										<ul class="dropdown-menu">
											<li id="male">Vanilla</li>
											<li id="female">Pineapple</li>
											<li id="female">Butter Scotch</li>
										</ul>
									</div>
								</div>
								<div class="cake_dropdown_r">
									<div class="dropdown2">
										<div class="select">
											<span>Select Weight</span>
										</div>
										<input type="hidden" name="gender">
										<ul class="dropdown-menu">
											<li id="male">500 gm</li>
											<li id="female">1 Kg</li>
											<li id="female">2 Kg</li>
										</ul>
									</div>
								</div>
								<div class="clr"></div>
							</div>
							<div class="cake_radio_row">
								<div class="radio_l">

									<div class="radio_1">

										<ul>
											<li><input type="radio" id="bb-option" name="selector">
												<label for="bb-option">Veg</label>

												<div class="check"></div></li>

											<li><input type="radio" id="cc-option" name="selector">
												<label for="cc-option">Non Veg</label>

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
							</div>
						</div>

					</div>
				</div>
			</section>

			<div class="more_cakes">
				<a href="product.html">More New Cakes</a>
			</div>
		</div>

		<div class="wrapper"></div>
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
