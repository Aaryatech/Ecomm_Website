<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<jsp:include page="/WEB-INF/views/include/metacssjs.jsp"></jsp:include>

<style>
.xdsoft_datetimepicker {
	z-index: 999999 !important;
}

.form-label-hint-error {
	color: red;
}
</style>

<body onload="getDeliveryCharges()">
	<div class="loader"
		style="text-align: center; width: 100%; vertical-align: middle; top: 45%; left: 3%; position: absolute;"
		id="loaderimg" style="display: none;">
		<%-- <img
			src="${pageContext.request.contextPath}/resources/images/loader.svg"
			alt=""> --%>
		<%-- <img
			src="${pageContext.request.contextPath}/resources/images/loading_logo.png"
			alt="" /> --%>
	</div>
	<c:url var="placeOrder" value="/placeOrder" />
	<c:url var="getDeliveryChargesByKm" value="/getDeliveryChargesByKm"></c:url>
	<c:url var="getOfferDetailListAjax" value="/getOfferDetailListAjax"></c:url>
	<c:url var="getOfferHeaderListAjax" value="/getOfferHeaderListAjax"></c:url>
	<c:url var="checkIsValidOffer" value="/checkIsValidOffer"></c:url>
	<c:url var="getCouponOfferListAjax" value="/getCouponOfferListAjax"></c:url>
	<c:url var="getCustomerOfferListAjax" value="/getCustomerOfferListAjax"></c:url>

	<c:url var="getFrExCharges" value="/getFrExCharges"></c:url>

	<!--apply now pop up-->
	<div id="mongi" class="well">
		<div class="mongi_title">
			<span><a href="#"> Clear</a></span> Select Our Best Filter
			<div class="mongi_close close_pop">
				<i class="fa fa-times" aria-hidden="true"></i>
			</div>
		</div>
		<div class="mongi_cont"></div>

		<div class="proceend_bnt">
			<a href="#" class="proceed_btn">Proceed</a>
		</div>

	</div>
	<script type="text/javascript">
		$(document).ready(function() {
			$('#mongi').popup();
		});
	</script>


	<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/include/menubar.jsp"></jsp:include>

	<div class="head_marg with_menu">
		<!--product listing-->
		<div class="find_store">
			<div class="wrapper">

				<h4 id="successMsg" style="text-align: center; color: green;">${sessionScope.successMsg}</h4>
				<%
					request.getSession().removeAttribute("successMsg");
				%>
				<h4 id="respMsg" style="text-align: center; color: red;">${sessionScope.respMsg}</h4>
				<%
					request.getSession().removeAttribute("respMsg");
				%>
				<div class="cart_row">
					<div class="cart_l">

						<!-- desktop table-->
						<div class="cart_able_bx">
							<div class="table_bx">
								<table class="cart" id="cartTable">
									<thead>
										<th>Product Name</th>
										<th>Quantity</th>
										<!-- <th>Delivery Option</th> -->
										<th>Sub Total</th>
										<th>Action</th>
									</thead>

									<tbody></tbody>

								</table>
							</div>
						</div>



						<!-- mobile-table-->
						<div class="mobile_table" id="mobile_table-div">
							<!--mobile-row-1-->
							<!-- <div id="mobile_table-div">
							
							</div> -->
							<%-- <div class="row_1">
								<div class="mob_prod">
									<div class="mob_prod_title">Product Name</div>
									<div class="cart_pic_row mobile_width">
										<div class="cart_pic">
											<img
												src="${pageContext.request.contextPath}/resources/images/cart_pic_1.jpg"
												alt=""> <img
												src="${pageContext.request.contextPath}/resources/images/icon_veg.png"
												alt="" class="veg_icn">
										</div>
										<div class="cart_cont width_inc">
											<h3 class="cart_cake">Cars Lightning McQueen Cake</h3>
											<h3 class="cart_prc">495.00</h3>
											<div class="cart_show" style="display: none;">
												<a href="#"><i class="fa fa-eye" aria-hidden="true"></i>
													Show Details</a>
											</div>
											<div class="cart_det">
												Weight - 500 gm <br> Eggless - False <br> Heart
												Shape - False <br>
											</div>
											

										</div>
									</div>
								</div>
								<div class="mob_quan">
									<div class="mob_quan_l">Quantity</div>
									<div class="mob_quan_r">
										<form id="myform" method="POST" action="#">
											<button type="button" value="" field="quantity"
												class="qtyminus cart">
												<i class="fa fa-minus" aria-hidden="true"></i>
											</button>
											<input type="text" name="quantity" value="0" class="qty cart">
											<button type="button" value="" field="quantity"
												class="qtyplus cart">
												<i class="fa fa-plus" aria-hidden="true"></i>
											</button>
										</form>
									</div>
									<div class="clr"></div>
								</div>
								<div class="mob_quan">
									<div class="mob_quan_l">Delivery Option</div>
									<div class="mob_quan_r">
										<div class="cart_option">
											<img src="images/user_pic.jpg" alt=""> <span>Message
												in the cake</span>
										</div>
									</div>
									<div class="clr"></div>
								</div>
								<div class="mob_quan">
									<div class="mob_quan_l">Sub Total</div>
									<div class="mob_quan_r">990.00</div>
									<div class="clr"></div>
								</div>
								<div class="mob_quan">
									<div class="mob_quan_l">Action</div>
									<div class="mob_quan_r">
										<div class="cart_delete">
											<a href="#"><i class="fa fa-trash-o" aria-hidden="true"></i></a>
										</div>
									</div>
									<div class="clr"></div>
								</div>
							</div> --%>

							<!--mobile-row-2-->
							<%-- <div class="row_1">
								<div class="mob_prod">
									<div class="mob_prod_title">Product Name</div>
									<div class="cart_pic_row mobile_width">
										<div class="cart_pic">
											<img
												src="${pageContext.request.contextPath}/resources/images/cart_pic_2.jpg"
												alt=""> <img
												src="${pageContext.request.contextPath}/resources/images/icon_nonveg.png"
												alt="" class="veg_icn">
										</div>
										<div class="cart_cont width_inc">
											<h3 class="cart_cake">Classic Red Velvet Cake</h3>
											<h3 class="cart_prc">495.00</h3>
											<div class="cart_show">
												<a href="#"><i class="fa fa-eye" aria-hidden="true"></i>
													Show Details</a>
											</div>
											
											<div class="cart_det" style="display: none;">
												Weight - 500 gm <br> Eggless - False <br> Heart
												Shape - False <br>
											</div>

										</div>
									</div>
								</div>
								<div class="mob_quan">
									<div class="mob_quan_l">Quantity</div>
									<div class="mob_quan_r">
										<form id="myform" method="POST" action="#">
											<button type="button" value="" field="quantity"
												class="qtyminus cart">
												<i class="fa fa-minus" aria-hidden="true"></i>
											</button>
											<input type="text" name="quantity" value="0" class="qty cart">
											<button type="button" value="" field="quantity"
												class="qtyplus cart">
												<i class="fa fa-plus" aria-hidden="true"></i>
											</button>
										</form>
									</div>
									<div class="clr"></div>
								</div>
								<div class="mob_quan">
									<div class="mob_quan_l">Delivery Option</div>
									<div class="mob_quan_r">
										<div class="cart_option">
											<img src="images/user_pic.jpg" alt=""> <span>Message
												in the cake</span>
										</div>
									</div>
									<div class="clr"></div>
								</div>
								<div class="mob_quan">
									<div class="mob_quan_l">Sub Total</div>
									<div class="mob_quan_r">
										<div class="cart_prc_1">990.00</div>
									</div>
									<div class="clr"></div>
								</div>
								<div class="mob_quan">
									<div class="mob_quan_l">Action</div>
									<div class="mob_quan_r">
										<div class="cart_delete">
											<a href="#"><i class="fa fa-trash-o" aria-hidden="true"></i></a>
										</div>
									</div>
									<div class="clr"></div>
								</div>
							</div> --%>
						</div>


						<!-- desktop table-->
						<div class="total_row">
							<!--cart-right-->
							<div class="total_row_r">
								<div class="total_one">
									Items Subtotal <span style="text-align: right;"><label
										id="lbl_ItemTotal">0.00</label></span>
								</div>
								<div class="total_one pink">
									Delivery & Additional Rs <span id="del_adc_rs"
										style="text-align: right;"></span>&nbsp; <a href="#new_pop"
										class="initialism new_pop_open"><i class="fa fa-info"
										aria-hidden="true"></i></a>
								</div>

								<!-- <div class="total_one">
									Tip <span>Rs. <label id="lbl_Tip">0.00</label></span>
								</div> -->
								<div class="total_one">
									Total <span style="text-align: right;"><label
										id="lbl_Total">0.00</label></span>
								</div>
								<div class="total_one">
									Offer Discount <span style="text-align: right;"> <label
										id="discAmt">0.00</label></span>
								</div>

								<div class="total_row_btm">
									Total <span style="text-align: right;"><label
										id="lbl_FinalTotal">0.00</label></span>
								</div>

							</div>

							<!--left form-->
							<div class="total_row_l">

								<div class="promo_row">
									<div class="applicabl_row last">
										<div class="applic_l">Applicable Discount Offers</div>
										<div class="applic_r">
											<div class="radio_1 promo">
												<ul>
													<li><input type="radio" id="couponWise"
														name="rdOfferType" class="option-input radio"
														onchange="setOfferList(1)" checked> <label
														for="couponWise">Coupon Wise</label>
														<div class="check"></div></li>
													<li><input type="radio" class="option-input radio"
														onchange="setOfferList(2)" id="custWise"
														name="rdOfferType"> <label for="custWise">Customer
															Wise</label>
														<div class="check">
															<div class="inside"></div>
														</div></li>
												</ul>
											</div>
										</div>
									</div>

									<div class="applicabl_row">
										<div>
											<div class="payment_two left">
												<div class="select-style">
													<select class="form-control" id="offer"
														onchange="getOfferDetails(this.value)" name="offer">
														<option value="0">Select Offer</option>
													</select>
												</div>
											</div>
											<div class="payment_two right">
												<input list="coupons" type="text" id="offerCoupon"
													placeholder="Select Coupon/Promo Code"
													onchange="setOfferDiscAmt()" name="offerCoupon"
													class="input_two" />
												<datalist id="coupons">
												</datalist>
											</div>
										</div>
										<div class="clr"></div>
										<!--  Div to show Offer details -->
										<div class="show_hide_div" id="show_hide_div"
											style="display: none;">
											<p id="offer_terms"></p>
											<p id="off_disc_per"></p>
											<p id="max_offer_amt"></p>
											<p id="min_order_amt"></p>
										</div>
									</div>

									<div class="chkout_divide">
										<input type="hidden" value="0" id="tempDiscPer"
											name="tempDiscPer" /> <input type="hidden" value="0"
											id="tempDiscMinAmt" name="tempDiscMinAmt" /> <input
											type="hidden" value="0" id="tempOfferLimit"
											name="tempOfferLimit" /> <input type="hidden" value="0"
											id="tempOfferType" name="tempOfferType" />

										<!-- Additional Charges -->
										<input name="addCh" id="addCh" type="hidden"
											class="table_inpt numbersOnly" value="${addCh}" /> <input
											name="disc" id="disc" type="hidden"
											class="table_inpt numbersOnly" value="0" /> <input
											name="discMin" id="discMin" type="hidden"
											class="table_inpt numbersOnly" value="0" /> <input
											name="deliveryCharges" value="0" id="deliveryCharges"
											readonly="readonly" type="hidden" />

									</div>
								</div>

								<div class="title_row_bx">
									<div class="left_side">
										<h3 class="payment_title">Payment Method</h3>
										<!-- <form action="" method="get"> -->
										<div class="payment_one">
											<div class="divide_marg">
												<!-- class="payment_two left" -->
												<div class="select-style">
													<select name="paymentMode" id="paymentMode">
														<option value="2" selected>Online Payment</option>
														<option value="1">Cash on Delivery (COD)</option>
														<!-- <option value="2">Card</option> -->

													</select>

												</div>

												<label class="form-label-hint-error" id="errorpaymentMode"
													style="display: none;">Please select payment option</label>
											</div>



											<div class="clr"></div>
										</div>

									</div>
									<div class="right_side">
										<h3 class="payment_title">Delivery Information</h3>
										<div class="divide_marg">
											<!-- class="payment_two right" -->
											<div id="filters">
												<input type="text" name="delvrDateTime" id="delvrDateTime"
													readonly class="input_two " placeholder="Delivery Date" />


											</div>
											<label class="form-label-hint-error" id="errordelvrDateTime"
												style="display: none;">Please select delivery time</label>
										</div>

										<div>
											<div class="divide_marg">
												<!-- class="payment_two left" -->
												<input name="delvrInst" id="delvrInst" type="hidden"
													class="input_two" placeholder="Delivery Instruction" />
											</div>
											<div class="divide_marg">
												<!-- class="payment_two right" -->

												<div class="select-style">
													<select name="del_time_slot" id="del_time_slot">
														<c:forEach items="${delSlotList}" var="delSlot">
															<option value="${delSlot.fromTime}-${delSlot.toTime}">${delSlot.deliverySlotName}(${delSlot.fromTime}-${delSlot.toTime})</option>
														</c:forEach>
													</select>
												</div>

											</div>
										</div>

									</div>
								</div>



								<div class="payment_click">
									By Clicking the button, you agree to the <a target="_blank"
										href="${pageContext.request.contextPath}/showT&CPage">Terms
										and Conditions.</a>
								</div>
								<div>
									<label class="form-label-hint-error" id="errorCartEmpty"
										style="display: none; float: right; padding-right: 185px;">Please
										add something in cart</label> <input name="" type="button"
										class="place_btn place_open" value="Place Order"
										onclick="checkCustSession()" />


								</div>
								<!--mongi help-popup-->
								<!--apply now pop up-->
								<script type="text/javascript">
									function checkCustSession() {
										//var sessCustId ='${sessionScope.custId}';
										//if (parseInt(sessCustId) > 0) {
										$(document)
												.ready(
														function() {
															payMode = true;
															if (!$(
																	"#paymentMode")
																	.val()
																	.trim()) {
																payMode = false;
																$(
																		"#errorpaymentMode")
																		.show();
															} else {
																$(
																		"#errorpaymentMode")
																		.hide();
															}
															delTime = true;
															if (!$(
																	"#delvrDateTime")
																	.val()
																	.trim()) {
																delTime = false;
																$(
																		"#errordelvrDateTime")
																		.show();
															} else {
																$(
																		"#errordelvrDateTime")
																		.hide();
															}
															var cartValue = sessionStorage
																	.getItem("cartValue");
															var table = $
																	.parseJSON(cartValue);
															if (table.length < 1) {
																$(
																		"#errorCartEmpty")
																		.show();
															} else {
																$(
																		"#errorCartEmpty")
																		.hide();
															}
															//alert(table.length)
															//alert("payMode" +payMode +"delTime " +delTime);
															if (payMode == true
																	&& delTime == true
																	&& table.length > 0)
																$('#place')
																		.popup();
														});
										//}
										/* else {
											var r = confirm("Please give your details");
											if (r == true) {
												var url = '${pageContext.request.contextPath}/addNewCustomer';
												window.location = url;
											}
										} */
									}//End of function checkCustSession()
								</script>
								<script type="text/javascript">
									//Sachin 24-12-2020

									function getDeliveryCharges() {
										//checkSession();
										//document.getElementById("loaderimg").style.display = "block";
										var km = '${sessionScope.frKm}'
										$
												.getJSON(
														'${getDeliveryChargesByKm}',
														{
															km : km,
															ajax : 'true'
														},
														function(data) {
															//alert(JSON.stringify(data));

															var fd = new FormData();
															fd
																	.append(
																			'frId',
																			0);
															$
																	.ajax({
																		url : '${pageContext.request.contextPath}/getFrExCharges',
																		type : 'POST',
																		data : fd,
																		dataType : 'json',
																		processData : false,
																		contentType : false,
																		async : false,
																		success : function(
																				resData,
																				textStatus,
																				jqXHR) {
																			//alert(data.amt1)
																			//var addCh=resData;//document.getElementById("addCh").value;
																			document
																					.getElementById("sfee").innerHTML = ''
																					+ resData.surchargeFee;
																			document
																					.getElementById("pfee").innerHTML = ''
																					+ resData.packingChg;
																			document
																					.getElementById("hfee").innerHTML = ''
																					+ resData.handlingChg;
																			document
																					.getElementById("efee").innerHTML = ''
																					+ resData.extraChg;
																			document
																					.getElementById("rfee").innerHTML = ''
																					+ resData.roundOffAmt;
																			var addCh = (parseFloat(resData.surchargeFee)
																					+ parseFloat(resData.packingChg)
																					+ parseFloat(resData.handlingChg)
																					+ parseFloat(resData.extraChg) + parseFloat(resData.roundOffAmt));
																			var billTotal = document
																					.getElementById("lbl_ItemTotal").innerHTML;
																			if (parseFloat(
																					billTotal)
																					.toFixed(
																							2) >= data.minAmt
																					&& parseFloat(
																							billTotal)
																							.toFixed(
																									2) <= data.freeDelvLimit) {
																				document
																						.getElementById("kmfee").innerHTML = ''
																						+ data.amt1;

																				document
																						.getElementById("deliveryCharges").value = data.amt1
																						+ parseFloat(addCh);
																				//document.getElementById("minOrderMsgDiv").style.display="none";
																			} else if (parseFloat(
																					billTotal)
																					.toFixed(
																							2) >= data.freeDelvLimit) {
																				document
																						.getElementById("kmfee").innerHTML = ''
																						+ data.amt2;
																				document
																						.getElementById("deliveryCharges").value = data.amt2
																						+ parseFloat(addCh);
																				//document.getElementById("minOrderMsgDiv").style.display="none";
																			} else {
																				document
																						.getElementById("deliveryCharges").value = 0 + parseFloat(addCh);
																				document
																						.getElementById("kmfee").innerHTML = 0;

																				//$('#placeBtn').hide();
																				//$('#parkBtn').hide();
																				//document.getElementById("minOrderMsgDiv").style.display="block";
																				//document.getElementById("minOrderMsg").innerHTML="Minimum order amount should be "+data.minAmt+"/-";
																			}
																			//alert("del " +document.getElementById("deliveryCharges").value)
																			//alert(addCh)
																			applyOffer();
																		},
																		error : function(
																				jqXHR,
																				textStatus,
																				errorThrown) {
																			console
																					.log('ERRORS: '
																							+ textStatus);
																		}
																	});

															/*var itemSubTotal=$("#item_sub_total").val();
															var taxTotal=document.getElementById("item_tax_total").innerHtml;
															var cartValue = sessionStorage.getItem("cartValue");
															var table = $.parseJSON(cartValue);
															$("#printtable1 tbody").empty();
															var subtotal = 0;
															var taxtotal = 0;
															var billTotal = 0;
															for (var i = 0; i < table.length; i++) {
															var baseValue = (parseFloat(table[i].total)*100)/(100+parseFloat(table[i].igstPer)).toFixed(2);
															var taxAmt = parseFloat(table[i].total)-parseFloat(baseValue).toFixed(2); 
															subtotal = parseFloat(subtotal)+parseFloat(baseValue);
															taxtotal = parseFloat(taxtotal)+parseFloat(taxAmt); 
															}
															billTotal=subtotal+taxtotal;
															$('#placeBtn').show();
															$('#parkBtn').show();
															var addCh=document.getElementById("addCh").value;
															if(parseFloat(billTotal).toFixed(2) >= data.minAmt && parseFloat(billTotal).toFixed(2) <= data.freeDelvLimit){
															document.getElementById("deliveryCharges").value=data.amt1+parseFloat(addCh);
															document.getElementById("minOrderMsgDiv").style.display="none";
															}else if(parseFloat(billTotal).toFixed(2) >= data.freeDelvLimit){
															document.getElementById("deliveryCharges").value=data.amt2+parseFloat(addCh);
															document.getElementById("minOrderMsgDiv").style.display="none";
															}else{
															document.getElementById("deliveryCharges").value=0+parseFloat(addCh);
															$('#placeBtn').hide();
															$('#parkBtn').hide();
															document.getElementById("minOrderMsgDiv").style.display="block";
															document.getElementById("minOrderMsg").innerHTML="Minimum order amount should be "+data.minAmt+"/-";
															} */
														});
										applyOffer();
										document.getElementById("loaderimg").style.display = "none";

									}
								</script>
								<!-- //Sachin 23-12-2020
 -->
								<script type="text/javascript">
									function checkValidOffer() {
										//alert("In  checkValidOffer");
										var offerId = document
												.getElementById("offer").value;
										var coupon = document
												.getElementById("offerCoupon").value;
										var custId = '${sessionScope.custId}';
										if (offerId != 0) {
											if (coupon == 0) {
												alert("Please select coupon/promo code");
												document.getElementById(
														"offerCoupon").focus();
												document.getElementById("disc").value = 0;
												document
														.getElementById("discMin").value = 0;
												//appendTableList();
											} else {
												//document.getElementById("loaderimg").style.display = "block";
												$.ajaxSetup({
													async : false
												});
												$
														.getJSON(
																'${checkIsValidOffer}',
																{
																	offerId : offerId,
																	coupon : coupon,
																	custId : custId,
																	ajax : 'true'
																},
																function(data) {
																	//alert(JSON.stringify(data));
																	if (data.error == true) {
																		res = true;
																		alert("Coupon/Promo code expires!");
																		document
																				.getElementById('offerCoupon').value = '';

																		document
																				.getElementById("tempDiscPer").value = discPer;
																		document
																				.getElementById("tempDiscMinAmt").value = discMinAmt;
																		document
																				.getElementById("tempOfferLimit").value = offerLimit;
																		document
																				.getElementById("tempOfferType").value = offerType;
																		document
																				.getElementById("disc").value = 0;
																		document
																				.getElementById("discMin").value = 0;
																		document
																				.getElementById("offerCoupon").value = "";
																		document
																				.getElementById(
																						'offerCoupon')
																				.focus();
																		document
																				.getElementById("loaderimg").style.display = "none";

																	} else {
																		//alert("In elseee checkValidOffer")
																		var discPer = document
																				.getElementById("tempDiscPer").value;
																		document
																				.getElementById("disc").value = discPer;
																		var discMinAmt = document
																				.getElementById("tempDiscMinAmt").value;
																		document
																				.getElementById("discMin").value = discMinAmt;
																		applyOffer();
																		document
																				.getElementById("loaderimg").style.display = "none";

																		//appendTableList();
																		//$("#error_offercoupon").hide();
																	}
																});
											}
										} else {
											document
													.getElementById("show_hide_div").style.display = "none";
										}
										document.getElementById("loaderimg").style.display = "none";
									}//End of function checkValidOffer()
								</script>
								<script type="text/javascript">
									function applyOffer() {

										var finaltotal = document
												.getElementById("lbl_ItemTotal").innerHTML;
										//alert("Ap Offer finaltotal " +finaltotal);
										discPer = document
												.getElementById("disc").value;
										discAmt = (parseFloat(discPer) * parseFloat(finaltotal)) / 100;
										var discMinAmt = document
												.getElementById("discMin").value;
										var deliveryCharges = document
												.getElementById("deliveryCharges").value;
										//alert("deliveryCharges applyOffer " +deliveryCharges)
										if (discMinAmt < discAmt) {
											discAmt = discMinAmt;
										}
										//deliveryCharges.toFixed(2);
										//billTotal=billTotal.toFixed(2)
										//discAmt=discAmt.toFixed(2);

										var billTotal = parseFloat(finaltotal)
												- parseFloat(discAmt)
												+ parseFloat(deliveryCharges);
										$("#discAmt").html(
												parseFloat(discAmt).toFixed(2));
										$("#lbl_Total")
												.html(
														(parseFloat(finaltotal) + parseFloat(deliveryCharges))
																.toFixed(2));
										$("#lbl_FinalTotal").html(
												parseFloat(billTotal)
														.toFixed(2));
										$("#del_adc_rs").html(
												parseFloat(deliveryCharges)
														.toFixed(2));
									}//End of function applyOffer()
								</script>
								<script type="text/javascript">
									function setOfferList(type) {
										var custId = '${sessionScope.custId}';
										//alert(custId)
										document
												.getElementById("show_hide_div").style.display = "none";
										if (type == 1) {
											$
													.getJSON(
															'${getCouponOfferListAjax}',
															{
																ajax : 'true'
															},
															function(data) {
																//alert(JSON.stringify(data));
																var len = data.length;
																$('#offer')
																		.find(
																				'option')
																		.remove()
																		.end()
																$("#offer")
																		.append(
																				$(
																						"<option selected></option>")
																						.attr(
																								"value",
																								0)
																						.text(
																								"Select Offer"));
																for (var i = 0; i < len; i++) {
																	$("#offer")
																			.append(
																					$(
																							"<option></option>")
																							.attr(
																									"value",
																									data[i].offerId)
																							.text(
																									data[i].offerName));
																}
																$("#offer")
																		.trigger(
																				"chosen:updated");
															});
										} else if (type == 2) {
											$
													.getJSON(
															'${getCustomerOfferListAjax}',
															{
																custId : custId,
																ajax : 'true'
															},
															function(data) {
																//alert(JSON.stringify(data));
																var len = data.length;
																$('#offer')
																		.find(
																				'option')
																		.remove()
																		.end()
																$("#offer")
																		.append(
																				$(
																						"<option selected></option>")
																						.attr(
																								"value",
																								0)
																						.text(
																								"Select Offer"));
																for (var i = 0; i < len; i++) {
																	$("#offer")
																			.append(
																					$(
																							"<option></option>")
																							.attr(
																									"value",
																									data[i].offerId)
																							.text(
																									data[i].offerName));
																}
																$("#offer")
																		.trigger(
																				"chosen:updated");
															});
										}
										$('#coupons').find('option').remove()
												.end()
										$("#coupons").trigger("chosen:updated");
										document.getElementById("offerCoupon").value = "";
										document.getElementById("disc").value = 0;
										document.getElementById("discMin").value = 0;
										$("#discAmt").html("0");
										//appendTableList();
									}//end of function setOfferList(type)

									function getOfferDetails(id) {
										//checkSession();
										if (parseInt(id) < 1) {
											document
													.getElementById("show_hide_div").style.display = "none";
											$("#offer_terms").html("");
											$("#min_order_amt").html("");
											$("#max_offer_amt").html("");
											$("#off_disc_per").html("");
										} else {
											document
													.getElementById("show_hide_div").style.display = "block";
										}
										$
												.getJSON(
														'${getOfferHeaderListAjax}',
														{
															ajax : 'true'
														},
														function(data) {
															//alert(JSON.stringify(data));
															var discPer = 0;
															var offerType = 0;
															var offerLimit = 0;
															var discMinAmt = 0;

															var len = data.length;
															for (var i = 0; i < len; i++) {
																if (data[i].offerId == id) {
																	discPer = data[i].offerDetailList[0].discPer;
																	offerType = data[i].exInt1;
																	offerLimit = data[i].offerDetailList[0].offerLimit;
																	discMinAmt = data[i].offerDetailList[0].exFloat1;
																	break;
																}
															}
															document
																	.getElementById("tempDiscPer").value = discPer;
															document
																	.getElementById("tempDiscMinAmt").value = discMinAmt;
															document
																	.getElementById("tempOfferLimit").value = offerLimit;
															document
																	.getElementById("tempOfferType").value = offerType;
															document
																	.getElementById("disc").value = 0;
															document
																	.getElementById("discMin").value = 0;
															//appendTableList();
															document
																	.getElementById("offerCoupon").value = "";
															document
																	.getElementById(
																			'offerCoupon')
																	.focus();

															$("#offer_terms")
																	.html(
																			"Offer Terms:");
															$("#min_order_amt")
																	.html(
																			"Minimum Order Value "
																					+ offerLimit);
															$("#max_offer_amt")
																	.html(
																			"Maximum Discount Value "
																					+ discMinAmt);
															$("#off_disc_per")
																	.html(
																			"Discount % "
																					+ discPer);
															//$("#del_adc_rs").html("0");
															$("#discAmt").html(
																	"0");

														});
										$
												.getJSON(
														'${getOfferDetailListAjax}',
														{
															ajax : 'true'
														},
														function(data) {
															//alert(JSON.stringify(data));
															var len = data.length;
															$('#coupons').find(
																	'option')
																	.remove()
																	.end()
															for (var i = 0; i < len; i++) {
																if (data[i].offerId == id) {
																	var coupons = data[i].couponCode
																			.split(',');
																	for (var c = 0; c < coupons.length; c++) {
																		$(
																				"#coupons")
																				.append(
																						$(
																								"<option></option>")
																								.attr(
																										"value",
																										coupons[c])
																								.text(
																										coupons[c]));
																	}
																}
															}
															$("#coupons")
																	.trigger(
																			"chosen:updated");
														});
									}//End of function  getOfferDetails(id)

									function setOfferDiscAmt() {
										//var billTotal=document.getElementById("bill_total").innerHTML;

										var billTotal = document
												.getElementById("lbl_FinalTotal").innerHTML;

										var offerLimit = document
												.getElementById("tempOfferLimit").value;
										if (parseFloat(billTotal) >= parseFloat(offerLimit)) {
											//	alert("In billTotal >= offerLimit")
											checkValidOffer();
										} else {
											alert("To use offer bill should be greater than "
													+ offerLimit + "/-");
											document
													.getElementById('offerCoupon').value = '';
											//$("#del_adc_rs").html("0");
											//$("#del_adc_rs").html("0");
											$("#discAmt").html("0");
										}
									}//End of function setOfferDiscAmt()
								</script>
								<!-- </form> -->
							</div>
						</div>
					</div>
					<!--related-product-box-->

					<div class="clr"></div>
				</div>
				<!-- PLACE ORDER POPUP -->
				<div id="place" class="well_palace" style="display: none;">
					<div class="mongi_title">
						Place Order
						<div class="place_close close_pop">
							<i class="fa fa-times" id="close_btn" aria-hidden="true"></i>
						</div>
					</div>
					<div class="mongi_cont">
						<%-- <form action="${pageContext.request.contextPath}/viewcart"
							method="post" onsubmit="return validateForm()"> --%>
						<div class="place_row">
							<div class="place_row_l" style="display: none">
								<span class="pop_lab_fld">Select City</span>
								<div class="select-style">
									<select id="txtCity" name=txtCity>
										<c:forEach items="${cityList}" var="city">
											<option value="${city.cityId}"
												${city.cityId==cust.cityId ? 'selected' : ''}>${city.cityName}</option>
										</c:forEach>
									</select>
								</div>
								<label class="form-label-hint-error" id="errorCity"
									style="display: none;">Please enter city</label>
							</div>
							<div class="place_row_r"></div>
							<div class="clr"></div>
						</div>
						<%-- <div class="place_row">
							<div class="place_row_l">
								<span class="pop_lab_fld">Customer Name</span> <input
									type="text" class="input_place" id="custName" name="custName"
									placeholder="Customer Name" value="${cust.custName}"
									autocomplete="off" /> <label class="form-label-hint-error"
									id="error_custName" style="display: none;">Please enter
									billing name</label>
							</div>

							<div class="clr"></div>
						</div> --%>
						<div class="place_row">
							<div class="place_row_l">
								<span class="pop_lab_fld">Recipient Name</span> <input type="text"
									class="input_place txtOnly" id="txtBillName" name="txtBillName"
									placeholder="Billing Name" value="${cust.custName}"
									autocomplete="off" maxlength="25" /> <label class="form-label-hint-error"
									id="errorBillName" style="display: none;">Please enter
									billing name</label>
							</div>
							<div class="place_row_r">
								<span class="pop_lab_fld">Mobile Number</span> <input
									type="text" class="input_place" id="txtMobile"
									value="${sessionScope.mobNo}" readonly maxlength="10"
									name="txtMobile" placeholder="Mobile Number" autocomplete="off" />
								<label class="form-label-hint-error" id="errorMobile"
									style="display: none;">Please enter mobile number</label> <label
									class="form-label-hint-error" id="errorMobileInvalid"
									style="display: none;">Invalid mobile number</label>
							</div>
							<div class="clr"></div>
						</div>
						<div class="place_row">
							<div class="place_row_l">
								<span class="pop_lab_fld">Email Address</span> <input
									type="text" class="input_place" id="txtEmail"
									value="${cust.emailId}" name="txtEmail" placeholder="Email ID"
									autocomplete="off" /> <label class="form-label-hint-error"
									id="errorEmail" style="display: none;">Please enter
									email id</label> <label class="form-label-hint-error"
									id="errorEmailInvalid" style="display: none;">Invalid
									email id</label>
							</div>
							<div class="place_row_r">
								<div class="gender_l">Gender</div>
								<div class="gender_r full">
									<div class="radio_1 gender">
										<ul>
											<li><input type="radio" id="a-option" name="gender"
												value="1"
												${cust.custGender==1||sessionScope.custId==0 ? 'checked' : ''}>
												<label for="a-option">Male</label>
												<div class="check"></div></li>
											<li><input type="radio" id="b-option" name="gender"
												value="2" ${cust.custGender==2 ? 'checked' : ''}> <label
												for="b-option">Female</label>
												<div class="check">
													<div class="inside"></div>
												</div></li>
											<li><input type="radio" id="c-option" name="gender"
												value="3" ${cust.custGender==3 ? 'checked' : ''}> <label
												for="c-option">Other</label>
												<div class="check">
													<div class="inside"></div>
												</div></li>
										</ul>
									</div>
								</div>
							</div>
							<div class="clr"></div>
						</div>

						<div class="place_row">
							<div class="place_row_l">
								<span class="pop_lab_fld">Date of Birth</span> <input
									type="text" class="input_place" id="txtDob"
									value="${cust.dateOfBirth}" name="txtDob"
									placeholder="Date of Birth" autocomplete="off" /> <label
									class="form-label-hint-error" id="errorDob"
									style="display: none;">Please enter date of birth</label>
							</div>
							<div class="place_row_r">
								<span class="pop_lab_fld">GST Number</span> <input type="text"
									class="input_place" id="txtGst" maxlength="15"
									value="${cust.exVar2}" name="txtGst" placeholder="GST Number"
									autocomplete="off" /> <span class="form-label-hint-error"
									id="errorGst" style="display: none;">Invalid GST number</span>
							</div>
							<div class="clr"></div>
						</div>
						<!-- ------------------------ -->
						<div class="place_row">
							<div class="place_row_l">
								<div class="gender_l">Order Type</div>
								<div class="gender_r full">
									<div class="radio_1 gender">
										<ul>
											<li><input type="radio" id="ownOrder" name="orderType"
												value="1" checked onclick="openGiftDiv(1)"> <label
												for="ownOrder">Own Order</label>
												<div class="check"></div></li>
											<li><input type="radio" id="giftOrder" name="orderType"
												value="2" onclick="openGiftDiv(2)"> <label
												for="giftOrder">Gift Order</label>
												<div class="check">
													<div class="inside"></div>
												</div></li>
										</ul>
									</div>
								</div>
							</div>
							<div class="place_row_r"></div>
							<div class="clr"></div>
						</div>
						<div class="place_row" id="giftOrderDiv" style="display: none;">
							<div class="place_row_l">
								<span class="pop_lab_fld">Person Name</span> <input type="text"
									class="input_place txtOnly" id="persnName" name="persnName"
									placeholder="Person Name" autocomplete="off" /> <label
									class="form-label-hint-error" id="errorPersnName"
									style="display: none;">Please Person name</label>
							</div>
							<div class="place_row_r">
								<span class="pop_lab_fld">Person Number</span> <input
									type="text" class="input_place" id="personMobile"
									maxlength="10" name="personMobile"
									placeholder="Person Mobile Number" autocomplete="off" /> <label
									class="form-label-hint-error" id="errorPersonMobile"
									style="display: none;">Please enter mobile number</label>
							</div>
							<div class="clr"></div>
						</div>
						<div class="place_row">
							<div class="place_row_l">
								<h3 class="payment_title">Delivery Address</h3>
							</div>
							<div class="place_row_r"></div>
							<div class="clr"></div>
						</div>
						<div class="place_row">
							<div class="place_row_l">
								<span class="pop_lab_fld">Your Address (flat, house no.,
									building, company, apartment)</span> <input type="text"
									class="input_place" autocomplete="off" id="txtDelvFlat"
									name="txtDelvFlat" value="${getFlatD}"
									placeholder="Flat, House no., Building, Company, Apartment" />

								<label class="form-label-hint-error" id="errorDelvFlat"
									style="display: none;">Please enter flat, house no.,
									building, company, apartment</label>
							</div>
							<div class="place_row_r">
								<span class="pop_lab_fld"><!-- Next to -->Your Area (From pin point location)</span><br> <input
									type="hidden" id="txtDelvLandmark" name="txtDelvLandmark"
									value="${sessionScope.landMark}" /> ${sessionScope.landMark}
							</div>
							<div class="clr"></div>
						</div>
						<div class="place_row">
							<div class="place_row_l">
								<%-- <span class="pop_lab_fld">Your Landmark</span>
								<input type="text" class="input_place" autocomplete="off"
									id="txtDelvLandmark" name="txtDelvLandmark"
									value="${getLandmark}" placeholder="Landmark" /> <label
									class="form-label-hint-error" id="errorDelvLandmark"
									style="display: none;">Please enter landmark</label>
 --%>
								<span class="pop_lab_fld"><!-- Your Area (From pin point
									location) -->Landmark (eg. Next to..., Opposite...)</span> <input type="text" class="input_place"
									autocomplete="off" id="txtDelvArea" name="txtDelvArea"
									value="${getAreaD}"
									placeholder="Area, Colony, Street, Sector, Village" /> <label
									class="form-label-hint-error" id="errorDelvArea"
									style="display: none;">Please enter area, colony,
									street, sector, village</label>
							</div>
							<div class="place_row_r">
								<span class="pop_lab_fld">Pin code</span> <input type="text"
									class="input_place" autocomplete="off" value="${getPinD}"
									id="txtDelvPincode" name="txtDelvPincode" maxlength="6"
									placeholder="Shipping Pincode" /> <label
									class="form-label-hint-error" id="errorDelvPincode"
									style="display: none;">Please enter pin code</label>
							</div>
							<div class="clr"></div>
						</div>

						<!-- BILLING ADDRESS -->

						<div class="place_row">
							<div class="place_row_l">
								<h3 class="payment_title">Recipient Address</h3>
								<input type="checkbox" id="chkbox" name="chkbox"
									onchange="setBillingDataByCheckbox()" class="payment_title"
									value="chkbox"> <label for="chkbox"> Same as
									delivery address</label>
							</div>
						</div>
						<!-- <div class="place_row">
							<div class="place_row_l">
								
							</div>
							<div class="clr"></div>
						</div> -->
						<div class="place_row">
							<div class="place_row_l">
								<span class="pop_lab_fld"><!-- Area -->Address (flat, house no., building, company, apartment)</span> <input type="text"
									class="input_place" autocomplete="off" id="txtBillingFlat"
									name="txtBillingFlat" value="${getFlat}"
									placeholder="Flat, House no., Building, Company, Apartment" />

								<label class="form-label-hint-error" id="errorBillingFlat"
									style="display: none;">Please enter flat, house no.,
									building, company, apartment</label>
							</div>
							<div class="place_row_r">
								<span class="pop_lab_fld"><!-- Colony -->Your Area</span> <input type="text"
									class="input_place" autocomplete="off" id="txtBillingArea"
									name="txtBillingArea" value="${getArea}"
									placeholder="Area, Colony, Street, Sector, Village" /> <label
									class="form-label-hint-error" id="errorBillingArea"
									style="display: none;">Please enter area, colony,
									street, sector, village</label>
							</div>
							<div class="clr"></div>
						</div>
						<div class="place_row">
							<div class="place_row_r" style="display: none">
								<span class="pop_lab_fld">Landmark</span> <input type="text"
									class="input_place" autocomplete="off" id="txtBillingLandmark"
									name="txtBillingLandmark" value="NA" placeholder="Landmark" />
								<label class="form-label-hint-error" id="errorBillingLandmark"
									style="display: none;">Please enter landmark</label>
							</div>
							<div class="place_row_l">
								<span class="pop_lab_fld">Pin code</span> <input type="text" maxlength="6"
									class="input_place" autocomplete="off" id="txtBillingPincode"
									name="txtBillingPincode" placeholder="Billing Pincode"
									value="${getPin}" /> <label class="form-label-hint-error"
									id="errorBillingPincode" style="display: none;">Please
									enter pin code</label>
							</div>
							<div class="clr"></div>
						</div>
						<!-- ------------------------ -->
						
						
						
						
						<div class="place_row">
							<input name="" type="button" value="Place Order"
								id="place_orderBtn" class="pop_place_btn" onclick="placeOrder()" />
						</div>
						<!-- </form> -->
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


	<!--date or time picker-->

	<script>
	$('.txtOnly').bind('keyup blur',function(){ 
	    var node = $(this);
	    node.val(node.val().replace(/[^a-zA-Z\s]/g,'') ); }
	);
	$('#personMobile').bind('keyup blur',function(){ 
	    var node = $(this);
	    node.val(node.val().replace(/[^0-9\s]/g,'') ); }
	);
		/*jslint browser:true*/
		/*global jQuery, document*/
		jQuery(document).ready(function() {
			'use strict';
			// 							jQuery(
			// 									'#delvrDateTime, #search-from-date, #search-to-date')
			// 									.datetimepicker();

			// SET CART DATA

			getItemList();

		});
	</script>
	<div class="a">
		<!--apply now pop up-->
		<div id="new_pop" class="well small">
			<div class="mongi_title">
				Delivery and Additional Charges Detail
				<div class="new_pop_close close_pop">
					<i class="fa fa-times" aria-hidden="true"></i>
				</div>
			</div>
			<div class="mongi_cont">
				<div class="small_cont">
					<div class="small_row_one">
						<div class="small_l">
							<span>Surcharge :</span> <b id="sfee"></b>
						</div>
						<div class="small_r">
							<span>Packing Charges :</span> <b id="pfee"></b>
						</div>
						<div class="clr"></div>
					</div>
					<div class="small_row_one">
						<div class="small_l">
							<span>Handling Charges :</span> <b id="hfee"></b>
						</div>
						<div class="small_r">
							<span>Extra Charges :</span> <b id="efee"></b>
						</div>
						<div class="clr"></div>
					</div>
					<div class="small_row_one">
						<div class="small_l">
							<span>RoundOff Amt :</span> <b id="rfee"></b>
						</div>
						<div class="small_r">
							<span>Delivery Charges:</span> <b id="kmfee"></b>
						</div>
						<div class="clr"></div>
					</div>
				</div>
			</div>
		</div>
	</div>



	<!-- new popup -->
	<div class="a">
		<!--apply now pop up-->
		<div id="table_pop" class="well small">
			<div class="mongi_title">
				Message on cake
				<div class="table_pop_close close_pop">
					<i class="fa fa-times" aria-hidden="true"></i>
				</div>
			</div>
			<div class="mongi_cont">
				<div class="small_cont">

					<div class="new_pop">
						<div class="new_pop_l">Message</div>
						<div class="new_pop_r">
							<input name="editMsgName" value="" type="text"
								class="input_place" id="editMsgName" maxlength="40" placeholder="Enter Message">
							<input name="editMsgItemUUID" type="hidden" id="editMsgItemUUID">
							<input name="editMsgItemId" type="hidden" id="editMsgItemId">

						</div>
						<div class="clr"></div>
					</div>
					<div class="a">
						<input name="" type="button" value="Ok" class="pop_place_btn"
							onclick="submitmsgname()">
					</div>
				</div>
			</div>
		</div>
	</div>



	<script>
		function getItemList() {

			//document.getElementById("loaderimg").style.display = "block";
			var fd = new FormData();

			$.ajax({
				url : '${pageContext.request.contextPath}/getAllFrWiseData',
				type : 'post',
				dataType : 'json',
				data : fd,
				contentType : false,
				processData : false,
				success : function(response) {
					//document.getElementById("loaderimg").style.display = "none";
					//alert(JSON.stringify(response.feProductHeadList))
					sessionStorage.setItem("allItemList", JSON
							.stringify(response.feProductHeadList));

					setCartData();

				},
			});

		}

		function setCartData() {

			document.getElementById("loaderimg").style.display = "block";
			if (sessionStorage.getItem("allItemList") == null) {
				var table = [];
				sessionStorage.setItem("allItemList", JSON.stringify(table));
			}

			if (sessionStorage.getItem("cartValue") == null) {
				var table = [];
				sessionStorage.setItem("cartValue", JSON.stringify(table));
			}

			var allItemList = sessionStorage.getItem("allItemList");
			var allItemArr = $.parseJSON(allItemList);

			var cartValue = sessionStorage.getItem("cartValue");
			var table = $.parseJSON(cartValue);
			$('#mobile_table-div').html('');

			$("#cartTable tbody").empty();
			var subtotal = 0;
			var taxtotal = 0;
			var finaltotal = 0;
			var discPer = 0;
			var discAmt = 0;
			var isVegItem = '';

			for (var j = 0; j < allItemArr.length; j++) {

				for (var i = 0; i < table.length; i++) {

					if (table[i].itemId == allItemArr[j].productId) {

						subtotal = (parseFloat(subtotal) + parseFloat(table[i].totalAmt))
								.toFixed(2);

						//alert(JSON.stringify(table[i].spInst));
						if (allItemArr[j].vegNonvegName == 'VEG') {
							isVegItem = '<img src="${pageContext.request.contextPath}/resources/images/icon_veg.png" alt="" class="veg_icn">';
						} else if (allItemArr[j].vegNonvegName == 'NON-VEG') {
							isVegItem = '<img src="${pageContext.request.contextPath}/resources/images/nonveg_icn.jpg" alt="" class="veg_icn">';
						} else {
							isVegItem = '<img src="${pageContext.request.contextPath}/resources/images/icon_veg.png" alt="" class="veg_icn">'
									+ '<img src="${pageContext.request.contextPath}/resources/images/nonveg_icn.jpg" alt="" class="veg_icn">'
						}
						//#table_pop
						var msgName = '<p  class="del_inst">Message on cake : <a   onclick="changeMsg('
								+ table[i].uniqueId
								+ ','
								+ table[i].itemId
								+ ',\''
								+ table[i].msgonCake
								+ '\')" class="initialism table_pop_open">NA</a></p>';
						if (table[i].msgonCake == "") {
							msgName = '<p  class="del_inst">Message on cake : <a onclick="changeMsg('
									+ table[i].uniqueId
									+ ','
									+ table[i].itemId
									+ ',\''
									+ table[i].msgonCake
									+ '\')" class="initialism table_pop_open">NA</a></p>';
						} else if (table[i].msgonCake == null) {
							msgName = '';
						} else {
							msgName = '<p  class="del_inst">Message on cake : <a onclick="changeMsg('
									+ table[i].uniqueId
									+ ','
									+ table[i].itemId
									+ ',\''
									+ table[i].msgonCake
									+ '\')" class="initialism table_pop_open">'
									+ table[i].msgonCake + '</a></p>';
						}
						var qtyBox = table[i].qty;
var photoDiv='<div  style="width: 60px;height: 60px; margin: 10px 0;"><img src="data:image/png;base64,'+table[i].imgFile+'" onerror="this.src=\'${pageContext.request.contextPath}/resources/images/no_img_folder/my-cart-nopic.jpg\'"></div>';
var wtFlav='<div class="cart_det"  id="detail'+table[i].itemId+'">Weight - '
+ table[i].weight
+ ' '
+ allItemArr[j].uomShowName
+ ''
+ table[i].veg
+ ' Cake Flavors - '
+ allItemArr[j].flavorNames
+ ' </div>';

						if (table[i].rateSettingType == 0) {
							qtyBox = '<button type="button" value="" field="quantity" class="qtyminus cart" id="btnMin'
									+ table[i].uniqueId
									+ '"  name="btnMin'
									+ table[i].itemId
									+ '" onclick="minusQty('
									+ table[i].uniqueId
									+ ','
									+ table[i].qty
									+ ')"> <i class="fa fa-minus" aria-hidden="true"></i> </button>'

									+ '<input type="text" readonly id="quantity'
									+ table[i].uniqueId
									+ '" name="quantity'
									+ table[i].itemId
									+ '" value="'
									+ table[i].qty
									+ '" class="qty cart" onblur="typeQty('
									+ table[i].uniqueId
									+ ')"> '

									+ '<button type="button" value="" field="quantity" class="qtyplus cart" id="btnPlus'
									+ table[i].uniqueId
									+ '"  name="btnPlus'
									+ table[i].itemId
									+ '" onclick="plusQty('
									+ table[i].uniqueId
									+ ','
									+ table[i].qty
									+ ')"> <i class="fa fa-plus" aria-hidden="true"></i> </button>'
									
									msgName = '';
							photoDiv='';
							wtFlav='';
						}
						var tbl_data = '<tr>'
								+ '<td><div class="cart_pic_row">'
								+ '<div class="cart_pic"><img src="${prodImgUrl}'+allItemArr[j].prodImagePrimary+'" alt="">'
								+ isVegItem
								+ '</div>'
								+ '<div class="cart_cont">'
								+ '<a href="${pageContext.request.contextPath}/showProductDetail/'+table[i].itemId+'"><h3 class="cart_cake">'
								+ table[i].exVar1
								+ '</h3></a>'
								+ '<h6 class="cart_det"> &#8377;'
								+ table[i].mrp
								+ ' / '
								+ allItemArr[j].uomShowName
								+ '</h6>'
								+ '<div class="cart_show" ><a style="display:none;" href="javascript:void(0)" onclick="showDetail('
								+ table[i].itemId
								+ ')" id="aTagShowDetail'
								+ table[i].itemId
								+ '"><i class="fa fa-eye" aria-hidden="true"></i>Show Details</a><div>'
								/* + '<div class="cart_det"  id="detail'+table[i].itemId+'">Weight - '
								+ table[i].weight
								+ ' '
								+ allItemArr[j].uomShowName
								+ ''
								+ table[i].veg
								+ ' Cake Flavors - '
								+ allItemArr[j].flavorNames
								+ ' </div>' */
								+wtFlav+'</div>'
								+ '</div>'
								+ msgName
								//+'<div  style="width: 60px;height: 60px; margin: 10px 0;"><img src="data:image/png;base64,'+table[i].imgFile+'" onerror="this.src=\'${pageContext.request.contextPath}/resources/images/no_img_folder/my-cart-nopic.jpg\'"></div> <span class="msg_on_cake">'
								+''+photoDiv+'<span class="msg_on_cake">'
								+ '</span>'
								+ ' </td>'
								+ '<td>'
								+ qtyBox
								+ '<span class="cart_remove"><a href="javascript:void(0)" onclick="removeQty('
								+ table[i].uniqueId
								+ ')">Remove</a></span>'
								+ '</td>'
								+

								'<td><div class="cart_prc_1"> &#8377; '
								+ table[i].totalAmt
								+ '</div></td>'
								+

								'<td><div class="cart_delete"><a href="javascript:void(0)" onclick="removeQty('
								+ table[i].uniqueId
								+ ')"><i class="fa fa-trash-o" aria-hidden="true"></i></a></div></td>'
								+

								'</tr>';

						var mobDiv = '<div class="row_1">'
								+ '<div class="mob_prod">'
								+ '<div class="mob_prod_title">Product Name</div>'
								+ '<div class="cart_pic_row mobile_width">'
								+ '<div class="cart_pic">'
								+ '<img src="${prodImgUrl}'+allItemArr[j].prodImagePrimary+'"'+
					'alt="">'
								+ '</div>'
								+ '<div class="cart_cont width_inc">'
								+ '<a href="${pageContext.request.contextPath}/showProductDetail/'+table[i].itemId+'"><h3 class="cart_cake">'
								+ table[i].exVar1
								+ '</h3></a>'
								+ '<h3 class="cart_prc">'
								+ table[i].mrp
								+ '/'
								+ allItemArr[j].uomShowName
								+ '</h3>'
								/* + '<div class="cart_det">'
								+ 'Weight - '
								+ table[i].weight
								+ ' '
								+ allItemArr[j].uomShowName
								+ ''
								+ table[i].veg
								+ '<br>Flavors '
								+ allItemArr[j].flavorNames
								+ ''
								+ '</div>' */
								+wtFlav+'</div>'
								+ '</div>'
								+ '</div>'
								+ '<div class="mob_quan">'
								+ '<div class="mob_quan_l">Quantity</div>'
								+ '<div class="mob_quan_r">'
								+ '<form id="myform" method="POST" action="#">'
								/* + '<button id="btnMin'
								+ table[i].uniqueId
								+ '" name="btnMin'
								+ table[i].uniqueId
								+ '" type="button" value="" onclick="minusQty('
								+ table[i].uniqueId
								+ ','
								+ table[i].qty
								+ ')" field="quantity"'
								+ 'class="qtyminus cart">'
								+ '<i class="fa fa-minus" aria-hidden="true"></i>'
								+ '</button>'
								+ '<input type="text" readonly id="quantity'+table[i].uniqueId+'" value="'+table[i].qty+'" class="qty cart">'
								+ '<button type="button" id="btnPlus'
								+ table[i].uniqueId
								+ '" value="" field="quantity"'
								+ 'class="qtyplus cart" onclick="plusQty('
								+ table[i].uniqueId
								+ ','
								+ table[i].qty
								+ ')">'
								+ '<i class="fa fa-plus" aria-hidden="true"></i>'
								+ '</button>' */
								+qtyBox+'</form>'
								+ '</div>'
								+ '<div class="clr"></div>'
								+ '</div>'
								+ '<div class="mob_quan">'
								+ '<div class="mob_quan_l">Delivery option</div>'
								+ '<div class="mob_quan_r">'
								+ '<div class="cart_option">'
							//	+ '<div  style="width: 60px;height: 60px; margin: 25px 0;"><img src="data:image/png;base64,'+table[i].imgFile+'" onerror="this.src=\'${pageContext.request.contextPath}/resources/images/no_img_folder/my-cart-nopic.jpg\'"></div><span>'
								+''+photoDiv+'<span class="msg_on_cake">'

								+ msgName
								+ '</span>'
								+ '</div>'
								+ '</div>'
								+ '<div class="clr"></div>'
								+ '</div>'
								+ '<div class="mob_quan">'
								+ '<div class="mob_quan_l">Sub Total</div>'
								+ '<div class="mob_quan_r">'
								+ table[i].totalAmt
								+ '</div>'
								+ '<div class="clr"></div>'
								+ '</div>'
								+ '<div class="mob_quan">'
								+ '<div class="mob_quan_l">Action</div>'
								+ '<div class="mob_quan_r">'
								+ '<div class="cart_delete">'
								+ '<a href="#"><i class="fa fa-trash-o"  onclick="removeQty('
								+ table[i].uniqueId
								+ ')" aria-hidden="true"></i></a>'
								+ '</div>'
								+ '</div>'
								+ '<div class="clr"></div>'
								+ '</div>' + '</div>'
						$('#mobile_table-div').append(mobDiv);
						$('#cartTable').append(tbl_data);

					}
				}
			}

			finaltotal = (parseFloat(finaltotal) + parseFloat(subtotal))
					.toFixed(2);

			document.getElementById("lbl_ItemTotal").innerHTML = subtotal;
			document.getElementById("lbl_FinalTotal").innerHTML = finaltotal;

			document.getElementById("cart_item_count").innerHTML = ""
					+ table.length;
			setOfferDiscAmt();
			checkValidOffer();
			document.getElementById("loaderimg").style.display = "none";
			applyOffer();
		}

		function minusQty(id, curQty) {
			var maxValue=document.getElementById("maxValue").value;
			//alert("sac"+maxValue)
			if(parseInt(curQty)>parseInt(maxValue)){
				
			}else
				{
			if (sessionStorage.getItem("cartValue") == null) {
				var table = [];
				sessionStorage.setItem("cartValue", JSON.stringify(table));
			}

			var cartValue = sessionStorage.getItem("cartValue");
			var table = $.parseJSON(cartValue);

			var newCartVal = [];

			if (curQty == 1) {

				for (var i = 0; i < table.length; i++) {
					if (id != table[i].uniqueId && curQty == 1) {
						newCartVal.push(table[i]);
					}
				}

			} else {

				for (var i = 0; i < table.length; i++) {
					var qty = curQty - 1;
					table[i].weight=qty
					if (id == table[i].uniqueId) {
						table[i].qty = qty;

						var taxableAmt = parseFloat(table[i].rate)
								* parseFloat(qty).toFixed(2);
						var cgstAmt = (parseFloat(table[i].rate)
								* parseFloat(qty) * parseFloat(table[i].cgstPer)) / 100;
						var sgstAmt = (parseFloat(table[i].rate)
								* parseFloat(qty) * parseFloat(table[i].sgstPer)) / 100;
						var igstAmt = (parseFloat(table[i].rate)
								* parseFloat(qty) * parseFloat(table[i].igstPer)) / 100;

						var taxAmt = (cgstAmt + sgstAmt + igstAmt).toFixed(2);
						var totalAmt = parseFloat(taxableAmt).toFixed(2);

						table[i].taxableAmt = taxableAmt;
						table[i].cgstAmt = cgstAmt;
						table[i].sgstAmt = sgstAmt;
						table[i].igstAmt = igstAmt;
						table[i].taxAmt = taxAmt;
						table[i].totalAmt = totalAmt;
					}

					newCartVal.push(table[i]);
				}

			}

			sessionStorage.setItem("cartValue", JSON.stringify(newCartVal));

			
			updateFirebase();
			appendCartData();
			setCartData();
				}
		}

		function plusQty(id, curQty) {
			var maxValue=document.getElementById("maxValue").value;
			//alert("sac"+maxValue)
			if(parseInt(curQty)>=parseInt(maxValue)){
				
			}else
				{
			if (sessionStorage.getItem("cartValue") == null) {
				var table = [];
				sessionStorage.setItem("cartValue", JSON.stringify(table));
			}

			var cartValue = sessionStorage.getItem("cartValue");
			var table = $.parseJSON(cartValue);

			var newCartVal = [];

			for (var i = 0; i < table.length; i++) {
				var qty = curQty + 1;

				if (id == table[i].uniqueId) {
					table[i].qty = qty;
					table[i].weight=qty;
					var taxableAmt = parseFloat(table[i].rate)
							* parseFloat(qty).toFixed(2);
					var cgstAmt = (parseFloat(table[i].rate) * parseFloat(qty) * parseFloat(table[i].cgstPer)) / 100;
					var sgstAmt = (parseFloat(table[i].rate) * parseFloat(qty) * parseFloat(table[i].sgstPer)) / 100;
					var igstAmt = (parseFloat(table[i].rate) * parseFloat(qty) * parseFloat(table[i].igstPer)) / 100;

					var taxAmt = (cgstAmt + sgstAmt + igstAmt).toFixed(2);
					var totalAmt = parseFloat(taxableAmt).toFixed(2);

					table[i].taxableAmt = taxableAmt;
					table[i].cgstAmt = cgstAmt;
					table[i].sgstAmt = sgstAmt;
					table[i].igstAmt = igstAmt;
					table[i].taxAmt = taxAmt;
					table[i].totalAmt = totalAmt;

				}

				newCartVal.push(table[i]);
			}

			sessionStorage.setItem("cartValue", JSON.stringify(newCartVal));
			updateFirebase();
			appendCartData();
			setCartData();
			
				}
		}

		function removeQty(id) {
			//alert("Ok")
			if (sessionStorage.getItem("cartValue") == null) {
				var table = [];
				sessionStorage.setItem("cartValue", JSON.stringify(table));
			}

			var cartValue = sessionStorage.getItem("cartValue");
			var table = $.parseJSON(cartValue);

			var newCartVal = [];

			for (var i = 0; i < table.length; i++) {
				if (id != table[i].uniqueId) {
					newCartVal.push(table[i]);
				}
			}

			sessionStorage.setItem("cartValue", JSON.stringify(newCartVal));
			updateFirebase();
			setCartData();
			appendCartData();
		}

		function changeMsg(id, itemId, msg) {
			$("#editMsgName").val(msg);
			$("#editMsgItemUUID").val(id);
			$("#editMsgItemId").val(itemId);
			//alert(msg)
		}
		function submitmsgname() {

			$('.close_pop').trigger('click');
			var msg = $("#editMsgName").val();
			var id = $("#editMsgItemUUID").val();
			var editMsgItemId = $("#editMsgItemId").val();

			if (sessionStorage.getItem("cartValue") == null) {
				var table = [];
				sessionStorage.setItem("cartValue", JSON.stringify(table));
			}
			var cartValue = sessionStorage.getItem("cartValue");
			var table = $.parseJSON(cartValue);

			var newCartVal = [];

			for (var i = 0; i < table.length; i++) {

				if (id == table[i].uniqueId) {

					table[i].msgonCake = msg;
					break;
				}

				//newCartVal.push(table[i]);
			}

			sessionStorage.setItem("cartValue", JSON.stringify(table));

			setCartData();
			//alert(msg)
		}

		function typeQty(id) {
			var qty = document.getElementById("quantity" + id).value;
			var maxValue=document.getElementById("maxValue").value;
			//alert("sac"+maxValue)
			if(parseInt(qty)>parseInt(maxValue)){
				
			}else
			if (qty > 0) {

				if (sessionStorage.getItem("cartValue") == null) {
					var table = [];
					sessionStorage.setItem("cartValue", JSON.stringify(table));
				}

				var cartValue = sessionStorage.getItem("cartValue");
				var table = $.parseJSON(cartValue);

				var newCartVal = [];

				for (var i = 0; i < table.length; i++) {

					if (id == table[i].uniqueId) {
						table[i].qty = qty;
						table[i].weight=qty
						var taxableAmt = parseFloat(table[i].rate)
								* parseFloat(qty).toFixed(2);
						var cgstAmt = (parseFloat(table[i].rate)
								* parseFloat(qty) * parseFloat(table[i].cgstPer)) / 100;
						var sgstAmt = (parseFloat(table[i].rate)
								* parseFloat(qty) * parseFloat(table[i].sgstPer)) / 100;
						var igstAmt = (parseFloat(table[i].rate)
								* parseFloat(qty) * parseFloat(table[i].igstPer)) / 100;

						var taxAmt = (cgstAmt + sgstAmt + igstAmt).toFixed(2);
						var totalAmt = parseFloat(taxableAmt).toFixed(2);

						table[i].taxableAmt = taxableAmt;
						table[i].cgstAmt = cgstAmt;
						table[i].sgstAmt = sgstAmt;
						table[i].igstAmt = igstAmt;
						table[i].taxAmt = taxAmt;
						table[i].totalAmt = totalAmt;

					}

					newCartVal.push(table[i]);
				}

				sessionStorage.setItem("cartValue", JSON.stringify(newCartVal));

				setCartData();

			}

		}

		function showDetail(id) {

			// $("aTagShowDetail"+id).hide();
			//$("detail"+id).show();exec
			document.getElementById("aTagShowDetail" + id).style.display = "none";
			document.getElementById("detail" + id).style.display = "block";

		}
	</script>
	<!--slick slider-->
	<script type="text/javascript">
		function validateForm() {

			var isError = true;

			var billName = true, mobile = true, email = true, dob = true, gst = true, delvFlat = true, delvArea = true, delvLand = true, delvPin = true, billFlat = true, billArea = true, billLand = true, billPin = true;

			if (!$("#txtBillName").val().trim()) {
				billName = false;
				$("#errorBillName").show();
			} else {
				$("#errorBillName").hide();
			}

			if (!$("#txtMobile").val().trim()) {
				mobile = false;
				$("#errorMobile").show();
			} else if ($("#txtMobile").val().trim().length != 10) {
				mobile = false;
				$("#errorMobile").hide();
				$("#errorMobileInvalid").show();
			} else {
				$("#errorMobile").hide();
				$("#errorMobileInvalid").hide();
			}

			if ($("#txtEmail").val() == null || $("#txtEmail").val() == "") {
				email = false;
				$("#errorEmail").show();
			} else if ($("#txtEmail").val().trim()) {
				//email = false;
				//$("#errorEmail").show();
				if (!ValidateEmail($("#txtEmail").val().trim())) {
					email = false;
					$("#errorEmailInvalid").show();
					$("#errorEmail").hide();
				} else {
					$("#errorEmailInvalid").hide();
					$("#errorEmail").hide();
				}
			} else {
				$("#errorEmailInvalid").hide();
				$("#errorEmail").hide();
			}

			if (!$("#txtDob").val().trim()) {
				dob = false;
				$("#errorDob").show();
			} else {
				$("#errorDob").hide();
			}

			if ($("#txtGst").val() == null || $("#txtGst").val() == "") {
				$("#errorGst").hide();
			} else if ($("#txtGst").val().trim()) {

				if (checkGST($("#txtGst").val().trim()) == false) {
					gst = false;
					$("#errorGst").show();
				} else {
					$("#errorGst").hide();
				}

			} else {
				$("#errorGst").hide();
			}

			if (!$("#txtDelvFlat").val().trim()) {
				delvFlat = false;
				$("#errorDelvFlat").show();
			} else {
				$("#errorDelvFlat").hide();
			}

			if (!$("#txtDelvArea").val().trim()) {
				delvArea = false;
				$("#errorDelvArea").show();
			} else {
				$("#errorDelvArea").hide();
			}

			if (!$("#txtDelvLandmark").val().trim()) {
				delvLand = false;
				$("#errorDelvLandmark").show();
			} else {
				$("#errorDelvLandmark").hide();
			}
			//alert("sdf")
			if (!$("#txtDelvPincode").val().trim()) {
				delvPin = false;
				$("#errorDelvPincode").show();
			} else {
				$("#errorDelvPincode").hide();
			}
			if ($("#txtDelvPincode").val().length<6) {
				delvPin = false;
				$("#errorDelvPincode").show();
			} else {
				$("#errorDelvPincode").hide();
			}
			//alert("sdf")
			if (!$("#txtBillingFlat").val().trim()) {
				billFlat = false;
				$("#errorBillingFlat").show();
			} else {
				$("#errorBillingFlat").hide();
			}
			//alert("sdf")
			if (!$("#txtBillingArea").val().trim()) {
				billArea = false;
				$("#errorBillingArea").show();
			} else {
				$("#errorBillingArea").hide();
			}
			//alert("sdf")
			if (!$("#txtBillingLandmark").val().trim()) {
				billLand = false;
				$("#errorBillingLandmark").show();
			} else {
				$("#errorBillingLandmark").hide();
			}
			//alert("sdf")
			if (!$("#txtBillingPincode").val().trim()) {
				billPin = false;
				$("#errorBillingPincode").show();
			} else {
				$("#errorBillingPincode").hide();
			}
			
			if ($("#txtBillingPincode").val().length<6) {
				billPin = false;
				$("#errorBillingPincode").show();
			} else {
				$("#errorBillingPincode").hide();
			}
			//alert("sdf")
			if (!billName || !mobile || !email || !dob || !gst || !delvFlat
					|| !delvArea || !delvLand || !delvPin || !billFlat
					|| !billArea || !billLand || !billPin) {
				isError = false;
			}

			$("#errorPersnName").hide();
			$("#errorPersonMobile").hide();
			if (document.getElementById("giftOrder").checked == true) {

				if (!$("#persnName").val()) {
					$("#errorPersnName").show();
					isError = false;
				}
				if (!$("#personMobile").val()) {
					$("#errorPersonMobile").show();
					isError = false;
				}

			} else {
				$("#persnName").val($("#txtBillName").val());
				$("#personMobile").val($("#txtMobile").val());
			}

			if (!$("#personMobile").val().trim()) {
				mobile = false;
				$("#errorPersonMobile").show();
			} else if ($("#personMobile").val().trim().length != 10) {
				mobile = false;
				//$("#errorPersonMobile").hide();
				$("#errorPersonMobile").show();
			} else {
				$("#errorPersonMobile").hide();
			}
			
			
			var selectedDt = $("#delvrDateTime").val();
			var dtsplit = selectedDt.split("-");

			var dt = new Date();
			dt.setFullYear(dtsplit[2]);
			dt.setMonth(parseInt(dtsplit[1]) - 1);
			dt.setDate(dtsplit[0]);

			var validDate = new Date();
			validDate.setHours(21);
			validDate.setMinutes(00);
			validDate.setSeconds(00);

			var currntDate = new Date();

			//alert(validDate + " " + currntDate)

			if (validDate.getTime() >= currntDate.getTime()) {

				//alert("in if")
				if (currntDate.getTime() > dt.getTime()) {
					isError = false;
					alert("Your cannot order on selected date")
				}
				//alert("cant order")
				//isError = false;
			} else {
				//alert("in else")
				currntDate.setTime(currntDate.getTime()
						+ ((24 * 60 * 60 * 1000)));

				//alert(dt + " " + currntDate)
				if (dt.getTime() <= currntDate.getTime()) {
					isError = false;
					alert("Time up !! Now you cannot order on selected date. select next day.")
				}

				//isError = false;
			}

			return isError;

		}

		function ValidateEmail(email) {
			var eml = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
			if (eml.test($.trim(email)) == false) {
				return false;
			}
			return true;
		}

		function checkGST(g) {

			var gstinformat = new RegExp(
					'^[0-9]{2}[A-Z]{5}[0-9]{4}[A-Z]{1}[1-9A-Z]{1}Z[0-9A-Z]{1}$');
			if (gstinformat.test(g)) {
				return true;
			} else {
				return false;
			}
		}

		function setBillingDataByCheckbox() {
			 		//alert("Hi")	    
			    $("#txtBillingFlat").removeAttr("readonly");
			    $("#txtBillingArea").removeAttr("readonly");
			    $("#txtBillingLandmark").removeAttr("readonly");
			    $("#txtBillingPincode").removeAttr("readonly");
			    
			if (document.getElementById("chkbox").checked == true) {

				$("#txtBillingFlat").val($("#txtDelvFlat").val());
				$("#txtBillingArea").val($("#txtDelvArea").val());
				$("#txtBillingLandmark").val($("#txtDelvLandmark").val());
				$("#txtBillingPincode").val($("#txtDelvPincode").val());
				
			    $("#txtBillingFlat").attr('readonly','true');
			    $("#txtBillingArea").attr('readonly','true');
			    $("#txtBillingLandmark").attr('readonly','true');
			    $("#txtBillingPincode").attr('readonly','true');


			  /*   $("#txtDelvFlat").attr('readonly','true');
			    $("#txtDelvLandmark").attr('readonly','true');
			    $("#txtBillingLandmark").attr('readonly','true');
			    $("#txtBillingPincode").attr('readonly','true'); */

			    

			} else {

				$("#txtBillingFlat").val("");
				$("#txtBillingArea").val("");
				$("#txtBillingLandmark").val("");
				$("#txtBillingPincode").val("");
				
				 
				   
			}

		}//end of function
		$("#txtDelvFlat").change(function(){   
			if (document.getElementById("chkbox").checked == true) {
				$('input[type=checkbox]').prop('checked',false); 
				setBillingDataByCheckbox();
			}
		});
		$("#txtDelvArea").change(function(){   
			if (document.getElementById("chkbox").checked == true) {
				$('input[type=checkbox]').prop('checked',false); 
				setBillingDataByCheckbox();
			}
		});
		$("#txtDelvPincode").change(function(){   
			if (document.getElementById("chkbox").checked == true) {
				$('input[type=checkbox]').prop('checked',false); 
				setBillingDataByCheckbox();
			}
		});

		var d = new Date();
		d.setFullYear(d.getFullYear() - 20);

		$('#txtDob').datetimepicker({
			//yearOffset:222,
			maxDate : 0, //cant select tomorrow date
			lang : 'en',
			timepicker : false,
			format : 'd-m-Y',
			formatDate : 'Y-m-d',
			defaultDate : d,
		});
		
		jQuery(document).ready(function() {

			var dt = new Date();
			var x = 1;
			var mydate = new Date();
			mydate.setFullYear(dt.getFullYear());
			mydate.setMonth(dt.getMonth());
			mydate.setDate(dt.getDate());
			mydate.setHours(21);
			mydate.setMinutes(00);
			mydate.setSeconds(00);
			//	alert(dt.getTime() + " " + mydate.getTime());

			if (dt.getTime() > mydate.getTime()) {
				x = 2;
			}

			dt.setTime(dt.getTime() + ((24 * 60 * 60 * 1000) * x));

			$('#delvrDateTime').datetimepicker({
				minDate : dt,
				lang : 'en',
				timepicker : false,
				format : 'd-m-Y',
				formatDate : 'Y-m-d',
			});
		});
	</script>

	<script type="text/javascript">
		function setLike(id, isLike) {

			$
					.getJSON(
							'${setLikeOrDislike}',
							{
								prodId : id,
								ajax : 'true'
							},
							function(data) {
								//alert(JSON.stringify(data));
								try {
									if (data.msg == 1) {
										document.getElementById("like" + id).src = "${pageContext.request.contextPath}/resources/images/heart.svg";

									} else {
										document.getElementById("like" + id).src = "${pageContext.request.contextPath}/resources/images/heart-1.svg";

									}
								} catch (e) {
									console.log("setLikeOrDislike error", e)
								}
								setLikeCount(data.statusText);
							});

		}
	</script>

	<!------------------------------------------------------- Place Order--------------------------------------------------- -->
	<script type="text/javascript">
		function placeOrder() {
			var cartValue = sessionStorage.getItem("cartValue");
			var table = $.parseJSON(cartValue);
			//document.getElementById("loaderimg2").hide()
			var imgCartValue = sessionStorage.getItem("prodImageList");
			var imgTable = $.parseJSON(imgCartValue);

			checkValidOffer();
			var isError = validateForm();
			if (isError)
				var r = confirm("Are you sure you want to submit?");
			if (r == true) {
			    //document.getElementById("close_btn").click();
				//$("#place").hide();
								//document.getElementById("loaderimg2").show();
								document.getElementById("place").style = "display:none";
								//document.getElementById("loaderimg").style.display = "block";
				document.getElementById("place_orderBtn").disabled = true;
				//$("#place").hide();
				var fd = new FormData();
				var itemTotal = document.getElementById("lbl_ItemTotal").innerHTML;

				fd.append('itemTotal', itemTotal);
				fd.append('discAmt',
						document.getElementById("discAmt").innerHTML);
				fd.append('addCharge',
						document.getElementById("del_adc_rs").innerHTML);

				//fd.append('itemtotal', document.getElementById("lbl_ItemTotal").innerHTML;);

				fd.append('imageData', JSON.stringify(imgTable));
				fd.append('itemData', JSON.stringify(table));

				//fd.append('promoCode', $("#promoCode").val());
				fd.append('promoCode', $("#offerCoupon").val());
				fd.append('offerId', $("#offer").val());
				fd.append('paymentMode', $("#paymentMode").val());
				fd.append('delvrInst', $("#delvrInst").val());
				fd.append('delvrDateTime', $("#delvrDateTime").val());
				fd.append('del_time_slot', $("#del_time_slot").val());

				fd.append('txtCity', $("#txtCity").val());
				fd.append('txtBillName', $("#txtBillName").val());
				fd.append('txtMobile', $("#txtMobile").val());
				fd.append('txtEmail', $("#txtEmail").val());
				fd.append('gender', $("input[name='gender']:checked").val());
				fd.append('txtDob', $("#txtDob").val());
				fd.append('txtGst', $("#txtGst").val());

				fd.append('txtDelvFlat', $("#txtDelvFlat").val());
				fd.append('txtDelvArea', $("#txtDelvArea").val());
				fd.append('txtDelvLandmark', $("#txtDelvLandmark").val())
				fd.append('txtDelvPincode', $("#txtDelvPincode").val());

				fd.append('txtBillingFlat', $("#txtBillingFlat").val());
				fd.append('txtBillingArea', $("#txtBillingArea").val());
				fd.append('txtBillingLandmark', $("#txtBillingLandmark").val());
				fd.append('txtBillingPincode', $("#txtBillingPincode").val());
				fd.append('persnName', $("#persnName").val());
				fd.append('personMobile', $("#personMobile").val());
				
				
				try{
					fd.append('myCityId', sessionStorage.getItem("myCityId"));
					fd.append('myLat', sessionStorage.getItem("myLat"));
					fd.append('myLong', sessionStorage.getItem("myLong"));
				}catch (e) {
					// TODO: handle exception
				}
				
				$
						.ajax({
							url : '${pageContext.request.contextPath}/placeOrder',
							type : 'POST',
							data : fd,
							dataType : 'json',
							processData : false,
							contentType : false,
							async : true,
							success : function(resData, textStatus, jqXHR) {
								//alert(JSON.stringify(resData));
								var table = [];
								//un comment it-Sachin
							//	sessionStorage.setItem("cartValue", JSON
										//.stringify(table));
							//	sessionStorage.setItem("prodImageList", JSON
										//.stringify(table));
								$("#place").hide();
								if (resData.msg == 'epay') {
									var url = '${pageContext.request.contextPath}/goToPay';
									window.location = url;
								} else {
									var url = '${pageContext.request.contextPath}/orderConfirmation';
									//var url = '${pageContext.request.contextPath}/orderConfirmation';
sessionStorage.setItem("cartValue", JSON
										.stringify(table));
								sessionStorage.setItem("prodImageList", JSON
										.stringify(table));
								updateFirebase();
									window.location = url;
									
								}

							},
							error : function(jqXHR, textStatus, errorThrown) {
								console.log('ERRORS: ' + textStatus);
							}
						});
				/* var table = [];
				
				sessionStorage.setItem("cartValue", JSON
						.stringify(table));
				sessionStorage.setItem("prodImageList", JSON
						.stringify(table));
				$("#place").hide();
				var url = '${pageContext.request.contextPath}/home';
				window.location = url; */
			}
		}

		$('#txtDelvPincode').on(
				'input',
				function() {
					this.value = this.value.replace(/[^0-9]/g, '').replace(
							/(\..*)\./g, '$1');
				});

		$('#txtBillingPincode').on(
				'input',
				function() {
					this.value = this.value.replace(/[^0-9]/g, '').replace(
							/(\..*)\./g, '$1');
				});
		$("#respMsg").show().delay(5000).fadeOut();
		$("#successMsg").show().delay(5000).fadeOut();
	</script>
	<!-- Mohsin 30-12-2020  -->
	<script type="text/javascript">
		$(document).ready(function() {
			$('#new_pop').popup();
			 /*  try{
				var isPaid=${payStatus}
				//alert("isPaid " +isPaid);
				if(parseInt(isPaid)==2){ 
					var table = [];
				sessionStorage.setItem("cartValue", JSON
						.stringify(table));
				sessionStorage.setItem("prodImageList", JSON
						.stringify(table));
				location.reload();
				}
			}catch (e) {
				alert(e)
			}   */
			 
		});
	</script>
	
	<script type="text/javascript">
		$(window).load(function() {
			  try{
				var isPaid=${payStatus}
			//alert("isPaid " +isPaid);
				if(parseInt(isPaid)==2){ 
					var table = [];
				sessionStorage.setItem("cartValue", JSON
						.stringify(table));
				sessionStorage.setItem("prodImageList", JSON
						.stringify(table));
				//location.reload();
				}else{
					//location.reload();
				}
			}catch (e) {
				alert(e)
			}  
		});
	</script>

	<script type="text/javascript">
		$(document).ready(function() {
			$('#table_pop').popup();
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
		function openGiftDiv(value) {

			if (value == 1) {
				$("#giftOrderDiv").hide();
			} else {

				$("#persnName").val('');
				$("#personMobile").val('');
				$("#giftOrderDiv").show();
			}

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

<jsp:include page="/WEB-INF/views/include/qty_validation.jsp"></jsp:include>

</body>

</html>
