<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<jsp:include page="/WEB-INF/views/include/metacssjs.jsp"></jsp:include>


<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/bootstrap-table-expandable.css">
<script
	src="${pageContext.request.contextPath}/resources/js/bootstrap-table-expandable.js"></script>

<body>
	<jsp:include page="/WEB-INF/views/include/tags.jsp"></jsp:include>

	<!--mongi help-popup-->
<%-- 	<div class="mongi_help">
		<a href="#mongi" class="initialism mongi_open"><img
			src="${pageContext.request.contextPath}/resources/images/mongi_help.png"
			alt=""></a>
	</div> --%>

	<!--apply now pop up-->
<!-- 	<div id="mongi" class="well">
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

	</div> -->
	<script type="text/javascript">
		$(document).ready(function() {
			//$('#mongi').popup();
		});
	</script>


	<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
	
<%
					request.getSession().removeAttribute("successMsg");
				%>

	<div class="head_marg">
		<!--product listing-->
		<div class="find_store">
			<div class="wrapper">
				<!-- desktop table -->
				<div class="cart_able_bx drop_tab">
					<div class="table_bx">
						<table
							class="table cart two table-hover table-expandable table-striped">
							<thead>
								<tr>
									<th>Sr. No.</th>
									<th>Order Number</th>
										<th>Contact Info</th>
									<th>Order-Delivery</th>
										<th>Delivery Charges</th>
											<th>Order Total</th>
									<th>Total Amt.</th>
									<th>Payment Mode</th>
									<th>Status</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${orders}" var="orders" varStatus="count">
									<tr>
										<td>${count.index+1}</td>
										<td>${orders.orderNo}</td>
										<td>${orders.frContactNo}</td>
										<td>${orders.orderDateDisplay} / ${orders.deliveryDateDisplay}</td>
											<td class="prc_amt">Rs. ${orders.deliveryCharges}</td>
												<td class="prc_amt">Rs. ${orders.exFloat1}</td>
										<td class="prc_amt">Rs. ${orders.totalAmt}</td>

										<!-- Payment Mode -->
										<c:choose>
											<c:when test="${orders.paymentMethod==1}">
												<td><span class="paid">Cash</span></td>
											</c:when>
											<c:when test="${orders.paymentMethod==2}">
												<td><span class="paid">Card</span></td>
											</c:when>
											<c:otherwise>
												<td><span class="paid">E-Pay</span></td>
											</c:otherwise>
										</c:choose>


										<!-- Order Status -->
										<c:choose>
											<c:when test="${orders.orderStatus==0}">
												<td><span class="deliverd" title="Park Order">Park Order</span></td>
											</c:when>
											<c:when test="${orders.orderStatus==1}">
												<td><span class="deliverd" title="Shop Confirmation
														Pending">Shop Confirmation
														Pending</span></td>
											</c:when>
											<c:when test="${orders.orderStatus==2}">
												<td><span class="deliverd" title="Accept">Accept</span></td>
											</c:when>
											<c:when test="${orders.orderStatus==3}">
												<td><span class="deliverd" title="Processing">Processing</span></td>
											</c:when>
											<c:when test="${orders.orderStatus==4}">
												<td><span class="deliverd" title="Delivery Pending">Delivery Pending</span></td>
											</c:when>
											<c:when test="${orders.orderStatus==5}">
												<td><span class="deliverd" title="Delivered">Delivered</span></td>
											</c:when>
											<c:when test="${orders.orderStatus==6}">
												<td><span class="deliverd" title="Rejected by Shop">Rejected by Shop</span></td>
											</c:when>
											<c:when test="${orders.orderStatus==7}">
												<td><span class="deliverd" title="Return Order">Return Order</span></td>
											</c:when>
											<c:when test="${orders.orderStatus==8}">
												<td><span class="deliverd" title="Cancelled Order">Cancelled Order</span></td>
											</c:when>
											<c:otherwise>
												<td><span class="deliverd" title="Online Payment
														Pending">Online Payment
														Pending</span></td>
											</c:otherwise>
										</c:choose>
									</tr>



									<tr>
										<td colspan="6"><c:forEach
												items="${orders.orderDetailList}" var="orderDetail">
												<c:if test="${orderDetail.orderId==orders.orderId}">
													<div class="table_detail">

														<div class="table_detail_l">
															<img src="${imgPath}${orderDetail.itemPic}" onerror="this.src='${pageContext.request.contextPath}/resources/images/no_img_folder/product-filter-noimg.jpg'">
															<%-- ${pageContext.request.contextPath}/resources/images/cake_open.jpg --%>
														</div>
														<div class="table_detail_r">
															<div class="detail_one">
																Product name <span> ${orderDetail.itemName}</span>
															</div>
															<div class="detail_one">
																Product Amount <span class="tab_prx">Rs.
																	${orderDetail.mrp}</span>
															</div>
															<%-- <div class="detail_one">
																Product Quantity <span class="tab_kg">
																	${orderDetail.qty} ${orderDetail.itemUom}</span>
															</div> --%>
															<div class="detail_one">
																Product Quantity <span class="tab_kg">
																	${orderDetail.exFloat3} ${orderDetail.itemUom}</span>
															</div>
															<div class="detail_one">
																Total <span class="tab_amt">
																	Rs.${orderDetail.rate*orderDetail.qty}</span>
															</div>


														</div>
														<div class="clr"></div>

													</div>
												</c:if>

											</c:forEach> <!--table-->
											<c:forEach items="${orders.orderTrailList}"
															var="orderTrail">
															<c:if test="${orderTrail.orderId==orders.orderId}">
											<div class="cart_able_bx drop_tab">
												<div class="table_title_one">Order Log</div>
												<div class="table_bx">
													<table class="cart inner">
														<tr>
															<th>Status</th>
															<th>Action By</th>
															<th>Date Time</th>
															<th>Remark</th>
														</tr>
														<!--cart-row-1-->
														
																<tr>
																	<!-- Order Log Status -->
																	<c:choose>
																		<c:when test="${orderTrail.status==0}">
																			<td><span class="deliverd" title="Park Order">Park Order</span></td>
																		</c:when>
																		<c:when test="${orderTrail.status==1}">
																			<td><span class="deliverd" title="Shop
																					Confirmation Pending">Shop
																					Confirmation Pending</span></td>
																		</c:when>
																		<c:when test="${orderTrail.status==2}">
																			<td><span class="deliverd" title="Accept">Accept</span></td>
																		</c:when>
																		<c:when test="${orderTrail.status==3}">
																			<td><span class="deliverd" title="Processing">Processing</span></td>
																		</c:when>
																		<c:when test="${orderTrail.status==4}">
																			<td><span class="deliverd" title="Delivery
																					Pending">Delivery
																					Pending</span></td>
																		</c:when>
																		<c:when test="${orderTrail.status==5}">
																			<td><span class="deliverd" title="Delivered">Delivered</span></td>
																		</c:when>
																		<c:when test="${orderTrail.status==6}">
																			<td><span class="deliverd" title="Rejected by
																					Shop">Rejected by
																					Shop</span></td>
																		</c:when>
																		<c:when test="${orderTrail.status==7}">
																			<td><span class="deliverd" title="Return Order">Return Order</span></td>
																		</c:when>
																		<c:when test="${orderTrail.status==8}">
																			<td><span class="deliverd" title="Cancelled Order">Cancelled
																					Order</span></td>
																		</c:when>
																		<c:otherwise>
																			<td><span class="deliverd" title="Online Payment
																					Pending">Online Payment
																					Pending</span></td>
																		</c:otherwise>
																	</c:choose>
																	<td>${orderTrail.userName}</td>
																	<td>${orderTrail.trailDate}</td>
																	<td>${orderTrail.exVar1}</td>
																</tr>
															
													</table>
												</div>
											</div>
											</c:if>
														</c:forEach>
											<!--  -->
											</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>



				<!--mobile-table-->
				<div class="mobile_table">
					<!--1-->
					<!-- MobView Order Header -->
					<c:forEach items="${orders}" var="orders" varStatus="count">
					<c:set value="0" var="orderHeadId "/>
						<div class="row_1">
						<c:set value="${count.index+1}" var="orderHeadId"/>
						<div onclick="showOrderDtl(${count.index+1})">
							<div class="mob_quan">
								<div class="mob_quan_l history">Order Number</div>
								<div class="mob_quan_r font"><b>${orders.orderNo}</b></div>
								<div class="clr"></div>
							</div>
							
							<div class="mob_quan">
								<div class="mob_quan_l history">Contact Info</div>
								<div class="mob_quan_r font">${orders.frContactNo}</div>
								<div class="clr"></div>
							</div>
							<div class="mob_quan">
								<div class="mob_quan_l history">Order-Delivery</div>
								<div class="mob_quan_r font">${orders.orderDateDisplay}-<br>${orders.deliveryDateDisplay}</div>
								<div class="clr"></div>
							</div>
							<div class="mob_quan">
								<div class="mob_quan_l history">Total Rupees</div>
								<div class="mob_quan_r font">
									<div class="prc_amt">Rs. ${orders.totalAmt}</div>
								</div>
								<div class="clr"></div>
							</div>
							<div class="mob_quan">
								<c:set value="E-Pay" var="paymentMethod" />
								<c:choose>
									<c:when test="${orders.paymentMethod==1}">
										<c:set value="Cash" var="paymentMethod" />
									</c:when>
									<c:when test="${orders.paymentMethod==2}">
										<c:set value="Card" var="paymentMethod" />
									</c:when>
									<c:otherwise>
										<c:set value="E-Pay" var="paymentMethod" />
									</c:otherwise>
								</c:choose>
								<div class="mob_quan_l history">Payment Mode</div>
								<div class="mob_quan_r font">
									<div class="paid mobile">${paymentMethod}</div>
								</div>
								<div class="clr"></div>
							</div>


							<div class="mob_quan">
								<div class="mob_quan_l history">Status</div>
								<c:choose>
									<c:when test="${orders.orderStatus==0}">
										<div class="mob_quan_r font">
											<span class="deliverd">Park Order</span>
										</div>
									</c:when>
									<c:when test="${orders.orderStatus==1}">
										<div class="mob_quan_r font">
											<span class="deliverd">Shop Confirmation Pending</span>
										</div>
									</c:when>
									<c:when test="${orders.orderStatus==2}">
										<div class="mob_quan_r font">
											<span class="deliverd">Accept</span>
										</div>
									</c:when>
									<c:when test="${orders.orderStatus==3}">
										<div class="mob_quan_r font">
											<span class="deliverd">Processing</span>
										</div>
									</c:when>
									<c:when test="${orders.orderStatus==4}">
										<div class="mob_quan_r font">
											<span class="deliverd">Delivery Pending</span>
										</div>
									</c:when>
									<c:when test="${orders.orderStatus==5}">
										<div class="mob_quan_r font">
											<span class="deliverd">Delivered</span>
										</div>
									</c:when>
									<c:when test="${orders.orderStatus==6}">
										<div class="mob_quan_r font">
											<span class="deliverd">Rejected by Shop</span>
										</div>
									</c:when>
									<c:when test="${orders.orderStatus==7}">
										<div class="mob_quan_r font">
											<span class="deliverd">Return Order</span>
										</div>
									</c:when>
									<c:when test="${orders.orderStatus==8}">
										<div class="mob_quan_r font">
											<span class="deliverd">Cancelled Order</span>
										</div>
									</c:when>
									<c:otherwise>
										<div class="mob_quan_r font">
											<span class="deliverd">Online Payment Pending</span>
										</div>
									</c:otherwise>
								</c:choose>
								<div class="clr"></div>
							</div>
							</div>
							<br>

							<!--MobView Order Detail -->
							
							<c:forEach items="${orders.orderDetailList}" var="orderDetail" varStatus="cnt">
								<c:if test="${orderDetail.orderId==orders.orderId}">
								<div style="display: none;" class="order_dtl${orderHeadId}">
									<div class="click_open">
										<div class="mob_quan">
											<div class="click_opn_l">Product Pic</div>
											<div class="click_opn_r">
												<img src="${imgPath}${orderDetail.itemPic}" alt="cake_open">
											</div>
											<div class="clr"></div>
										</div>

										<div class="mob_quan">
											<div class="click_opn_l">Product name</div>
											<div class="click_opn_r">${orderDetail.itemName}</div>
											<div class="clr"></div>
										</div>
										<div class="mob_quan">
											<div class="click_opn_l">Product Amount</div>
											<div class="click_opn_r">
												<div class="prc_amt">Rs. ${orderDetail.mrp}</div>
											</div>
											<div class="clr"></div>
										</div>
										<div class="mob_quan">
											<div class="click_opn_l">Product Quantity</div>
											<div class="click_opn_r">
												<div class="prc_kg">${orderDetail.qty}
													${orderDetail.itemUom}</div>
											</div>
											<div class="clr"></div>
										</div>
										<div class="mob_quan">
											<div class="click_opn_l">Total</div>
											<div class="click_opn_r">
												<div class="paid mobile">Rs.${orderDetail.totalAmt}</div>
											</div>
											<div class="clr"></div>
										</div>
									</div>
									</div>
								</c:if>
							</c:forEach>


							<!-- MobView Order Log -->
							<div style="display: none;" class="order_log${orderHeadId}">
							<c:forEach items="${orders.orderTrailList}" var="orderTrail" varStatus="count">
								<c:if test="${orderTrail.orderId==orders.orderId}">
									<div class="mob_order_log">
										<h3 class="mobile_order">Order Log ${count.index+1}</h3>
										<div class="order_row_1">
											<div class="mob_log_one">
												<h4 class="mob_status">Status</h4>
												<c:choose>
													<c:when test="${orderTrail.status==0}">
														<p>Park Order</p>
													</c:when>
													<c:when test="${orderTrail.status==1}">
														<p>Shop Confirmation Pending</p>
													</c:when>
													<c:when test="${orderTrail.status==2}">
														<p>Accept</p>
													</c:when>
													<c:when test="${orderTrail.status==3}">
														<p>Processing</p>
													</c:when>
													<c:when test="${orderTrail.status==4}">
														<p>Delivery Pending</p>
													</c:when>
													<c:when test="${orderTrail.status==5}">
														<p>Delivered</p>
													</c:when>
													<c:when test="${orderTrail.status==6}">
														<p>Rejected by Shop</p>
													</c:when>
													<c:when test="${orderTrail.status==7}">
														<p>Return Order</p>
													</c:when>
													<c:when test="${orderTrail.status==8}">
														<p>Cancelled Order</p>
													</c:when>
													<c:otherwise>
														<p>Online Payment Pending</p>
													</c:otherwise>
												</c:choose>
											</div>
											<div class="mob_log_one">
												<h4 class="mob_status">Action By</h4>
												<p>${orderTrail.userName}</p>
											</div>
											<div class="mob_log_one">
												<h4 class="mob_status">Date Time</h4>
												<p>${orderTrail.trailDate}</p>
											</div>
											<div class="mob_log_one">
												<h4 class="mob_status">Remark</h4>
												<p>${orderTrail.exVar1}</p>
											</div>
										</div>

									</div>
								</c:if>
							</c:forEach>
							</div>
						</div>
					</c:forEach>
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
	function showOrderDtl(val){
		$('.order_dtl'+val).toggle("slide");
		$('.order_log'+val).toggle("slide");
	}
	
	/* $('#orderHead').click(function() {
	      $('#order_dtl').toggle("slide");
	    }); */
	
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