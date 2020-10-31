<!DOCTYPE html>
<html>
<jsp:include page="/WEB-INF/views/include/metacssjs.jsp"></jsp:include>

<body>


	<!--mongi help-popup-->
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


	<!-- Header -->
	<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
	<!-- Header End -->


	<div class="head_marg">

		<div class="mega_menu_row">
			<div class="wrapper">

				<div id="menuzord" class="menuzord red menuzord-responsive">
					<div class="showhide32"></div>
					<ul
						class="menuzord-menu me#menusnuzord-right menuzord-indented scrollable">


						<li><a href="#" class="same_day">Same Day Delivery </a></li>

						<!--four colum dropdown-->
						<li><a href="#">Cakes <span><i
									class="fa fa-angle-down" aria-hidden="true"></i></span></a> <!--cake dropdown-->
							<ul class="megamenu four-row">
								<div class="four_row_dropdown">
									<!--row-1-->
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



									<!--row-2-->
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

									<!--row-3-->
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

									<!--row-4-->
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

						<!--three-colum dropdown-->
						<li><a href="#">Pastries <span><i
									class="fa fa-angle-down" aria-hidden="true"></i></span></a>
							<ul class="megamenu three-row">
								<div class="four_row_dropdown">
									<!--1-->
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

									<!--2-->
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

									<!--1-->
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
									class="fa fa-angle-down" aria-hidden="true"></i></span></a> <!--combos dropdown-->
							<ul class="megamenu four-row">
								<div class="four_row_dropdown">
									<!--row-1-->
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



									<!--row-2-->
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

									<!--row-3-->
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

									<!--row-4-->
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
									class="fa fa-angle-down" aria-hidden="true"></i></span></a> <!--chocolates dropdown-->
							<ul class="megamenu two-row">
								<div class="four_row_dropdown">
									<!--row-1-->
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



									<!--row-2-->
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
						<!--full-row dropdown-->
						<li><a href="#">Chocolates <span><i
									class="fa fa-angle-down" aria-hidden="true"></i></span></a> <!--chocolates dropdown-->
							<ul class="megamenu full-row">
								<div class="four_row_dropdown">
									<!--row-1-->
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

									<!--row-2-->
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

									<!--row-3-->
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

									<!--row-4-->
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

									<!--row-5-->
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

									<!--row-6-->
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
									class="fa fa-angle-down" aria-hidden="true"></i></span></a> <!--anniversary-dropdown-->
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
						<li><a href="#">Anniversary <span><i
									class="fa fa-angle-down" aria-hidden="true"></i></span></a></li>
					</ul>
				</div>

			</div>
		</div>


		<section class="product_category">
			<div class="wrapper">
				<div class="prod_filt">
					<ul>
						<li>
							<div class="product_filter_one">
								<a href="#"><img src="${pageContext.request.contextPath}/resources/images/birthday-cake-20.jpg" alt="">
									Birthday Cakes</a>
							</div>
						</li>
						<li>
							<div class="product_filter_one">
								<a href="#"><img src="${pageContext.request.contextPath}/resources/images/birthday-cake-20.jpg" alt="">
									Anniversary Cakes</a>
							</div>
						</li>
						<li>
							<div class="product_filter_one">
								<a href="#"><img src="${pageContext.request.contextPath}/resources/images/birthday-cake-20.jpg" alt="">
									Combos</a>
							</div>
						</li>
						<li>
							<div class="product_filter_one">
								<a href="#"><img src="${pageContext.request.contextPath}/resources/images/birthday-cake-20.jpg" alt="">
									Eggless Cakes</a>
							</div>
						</li>
						<li>
							<div class="product_filter_one">
								<a href="#"><img src="${pageContext.request.contextPath}/resources/images/birthday-cake-20.jpg" alt="">
									Photo Cakes</a>
							</div>
						</li>
						<li>
							<div class="product_filter_one">
								<a href="#"><img src="${pageContext.request.contextPath}/resources/images/birthday-cake-20.jpg" alt="">
									Express Cakes</a>
							</div>
						</li>
					</ul>
				</div>



			</div>
		</section>



		<!--product listing-->
		<div class="find_store">
			<div class="wrapper">

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
									<!--<div class="circle_tag"><img src="images/heart-1.svg" alt=""> <img src="images/heart.svg" alt=""></div>-->
									<div class="cake_prc">
										<i class="fa fa-inr" aria-hidden="true"></i>499 <span
											class="off_prc"><i class="fa fa-inr"
											aria-hidden="true"></i>649</span> <span class="prc_off">(23%
											Off)</span>
									</div>
								</div>

								<div class="cake_container">
									<h4 class="cake_nm single_row">
										<a href="product-detail.html">Classic Red Velvet Cake
											(Half Kg)</a>
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
									<!--<div class="circle_tag"><img src="images/heart-1.svg" alt=""> <img src="images/heart.svg" alt=""></div>-->
									<div class="cake_prc">
										<i class="fa fa-inr" aria-hidden="true"></i>499 <span
											class="off_prc"><i class="fa fa-inr"
											aria-hidden="true"></i>649</span> <span class="prc_off">(23%
											Off)</span>
									</div>
								</div>

								<div class="cake_container">
									<h4 class="cake_nm single_row">
										<a href="product-detail.html">Classic Red Velvet Cake
											(Half Kg)</a>
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
									<!--<div class="circle_tag"><img src="images/heart-1.svg" alt=""> <img src="images/heart.svg" alt=""></div>-->
									<div class="cake_prc">
										<i class="fa fa-inr" aria-hidden="true"></i>499 <span
											class="off_prc"><i class="fa fa-inr"
											aria-hidden="true"></i>649</span> <span class="prc_off">(23%
											Off)</span>
									</div>
								</div>

								<div class="cake_container">
									<h4 class="cake_nm single_row">
										<a href="product-detail.html">Classic Red Velvet Cake
											(Half Kg)</a>
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
									<!--<div class="circle_tag"><img src="images/heart-1.svg" alt=""> <img src="images/heart.svg" alt=""></div>-->
									<div class="cake_prc">
										<i class="fa fa-inr" aria-hidden="true"></i>499 <span
											class="off_prc"><i class="fa fa-inr"
											aria-hidden="true"></i>649</span> <span class="prc_off">(23%
											Off)</span>
									</div>
								</div>

								<div class="cake_container">
									<h4 class="cake_nm single_row">
										<a href="product-detail.html">Classic Red Velvet Cake
											(Half Kg)</a>
									</h4>

								</div>

							</div>
						</li>

						<!--product-row-2-->
						<li>
							<div class="cake_one product_padd">
								<div class="cake_pic">
									<img
										src="${pageContext.request.contextPath}/resources/images/new_cake_1.jpg"
										alt="" class="mobile_fit transition">
									<!--<div class="circle_tag"><img src="images/heart-1.svg" alt=""> <img src="images/heart.svg" alt=""></div>-->
									<div class="cake_prc">
										<i class="fa fa-inr" aria-hidden="true"></i>499 <span
											class="off_prc"><i class="fa fa-inr"
											aria-hidden="true"></i>649</span> <span class="prc_off">(23%
											Off)</span>
									</div>
								</div>

								<div class="cake_container">
									<h4 class="cake_nm single_row">
										<a href="product-detail.html">Classic Red Velvet Cake
											(Half Kg)</a>
									</h4>

								</div>

							</div>
						</li>
						<li>
							<div class="cake_one product_padd">
								<div class="cake_pic">
									<img
										src="${pageContext.request.contextPath}/resources/images/new_cake_2.jpg"
										alt="" class="mobile_fit transition">
									<!--<div class="circle_tag"><img src="images/heart-1.svg" alt=""> <img src="images/heart.svg" alt=""></div>-->
									<div class="cake_prc">
										<i class="fa fa-inr" aria-hidden="true"></i>499 <span
											class="off_prc"><i class="fa fa-inr"
											aria-hidden="true"></i>649</span> <span class="prc_off">(23%
											Off)</span>
									</div>
								</div>

								<div class="cake_container">
									<h4 class="cake_nm single_row">
										<a href="product-detail.html">Classic Red Velvet Cake
											(Half Kg)</a>
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
									<!--<div class="circle_tag"><img src="images/heart-1.svg" alt=""> <img src="images/heart.svg" alt=""></div>-->
									<div class="cake_prc">
										<i class="fa fa-inr" aria-hidden="true"></i>499 <span
											class="off_prc"><i class="fa fa-inr"
											aria-hidden="true"></i>649</span> <span class="prc_off">(23%
											Off)</span>
									</div>
								</div>

								<div class="cake_container">
									<h4 class="cake_nm single_row">
										<a href="product-detail.html">Classic Red Velvet Cake
											(Half Kg)</a>
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
									<!--<div class="circle_tag"><img src="images/heart-1.svg" alt=""> <img src="images/heart.svg" alt=""></div>-->
									<div class="cake_prc">
										<i class="fa fa-inr" aria-hidden="true"></i>499 <span
											class="off_prc"><i class="fa fa-inr"
											aria-hidden="true"></i>649</span> <span class="prc_off">(23%
											Off)</span>
									</div>
								</div>

								<div class="cake_container">
									<h4 class="cake_nm single_row">
										<a href="product-detail.html">Classic Red Velvet Cake
											(Half Kg)</a>
									</h4>

								</div>

							</div>
						</li>


						<!--product-row-3-->
						<li>
							<div class="cake_one product_padd">
								<div class="cake_pic">
									<img
										src="${pageContext.request.contextPath}/resources/images/new_cake_1.jpg"
										alt="" class="mobile_fit transition">
									<!--<div class="circle_tag"><img src="images/heart-1.svg" alt=""> <img src="images/heart.svg" alt=""></div>-->
									<div class="cake_prc">
										<i class="fa fa-inr" aria-hidden="true"></i>499 <span
											class="off_prc"><i class="fa fa-inr"
											aria-hidden="true"></i>649</span> <span class="prc_off">(23%
											Off)</span>
									</div>
								</div>

								<div class="cake_container">
									<h4 class="cake_nm single_row">
										<a href="product-detail.html">Classic Red Velvet Cake
											(Half Kg)</a>
									</h4>

								</div>

							</div>
						</li>
						<li>
							<div class="cake_one product_padd">
								<div class="cake_pic">
									<img
										src="${pageContext.request.contextPath}/resources/images/new_cake_2.jpg"
										alt="" class="mobile_fit transition">
									<!--<div class="circle_tag"><img src="images/heart-1.svg" alt=""> <img src="images/heart.svg" alt=""></div>-->
									<div class="cake_prc">
										<i class="fa fa-inr" aria-hidden="true"></i>499 <span
											class="off_prc"><i class="fa fa-inr"
											aria-hidden="true"></i>649</span> <span class="prc_off">(23%
											Off)</span>
									</div>
								</div>

								<div class="cake_container">
									<h4 class="cake_nm single_row">
										<a href="product-detail.html">Classic Red Velvet Cake
											(Half Kg)</a>
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
									<!--<div class="circle_tag"><img src="images/heart-1.svg" alt=""> <img src="images/heart.svg" alt=""></div>-->
									<div class="cake_prc">
										<i class="fa fa-inr" aria-hidden="true"></i>499 <span
											class="off_prc"><i class="fa fa-inr"
											aria-hidden="true"></i>649</span> <span class="prc_off">(23%
											Off)</span>
									</div>
								</div>

								<div class="cake_container">
									<h4 class="cake_nm single_row">
										<a href="product-detail.html">Classic Red Velvet Cake
											(Half Kg)</a>
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
									<!--<div class="circle_tag"><img src="images/heart-1.svg" alt=""> <img src="images/heart.svg" alt=""></div>-->
									<div class="cake_prc">
										<i class="fa fa-inr" aria-hidden="true"></i>499 <span
											class="off_prc"><i class="fa fa-inr"
											aria-hidden="true"></i>649</span> <span class="prc_off">(23%
											Off)</span>
									</div>
								</div>

								<div class="cake_container">
									<h4 class="cake_nm single_row">
										<a href="product-detail.html">Classic Red Velvet Cake
											(Half Kg)</a>
									</h4>

								</div>

							</div>
						</li>

					</ul>
				</div>

			</div>
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
