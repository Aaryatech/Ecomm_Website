<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<head>
<meta charset="utf-8" />
<title>Monginis Order Confirmation</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta name="viewport"
	content="width=device-width; initial-scale=1.0; maximum-scale=1.0" />
<meta name="keywords" content="" />
<meta name="description" content="" />
<meta name="author" content="">

<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Rubik:wght@400;500;600;700&display=swap"
	rel="stylesheet">
<!--font-family: 'Rubik', sans-serif;-->

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/stylesheet.css"
	type="text/css" />

<!--jquery-min-->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/jquery-1.10.2.min.js"></script>
<!--jquery-min-->






</head>
<body>

	<div class="page_div">
		<div class="wrapper">
			<div class="order_bx">



				<!--page title box-->
				<div class="title_area">
					<img
						src="${pageContext.request.contextPath}/resources/images/logo.jpg"
						alt="">
					<h2 class="thanks_msg">Thank you for your order</h2>

					<!-- <h2 class="thanks_msg error ">Error Message Put here</h2> -->

					<div class="back_button">
						<a href="${pageContext.request.contextPath}/orderhistory"
							class="profile_back"><i class="fa fa-chevron-left"
							aria-hidden="true"></i> Back to profile</a>
					</div>

					<h6 class="thanks_no">Hi ${orderSaveData.custName}, we
						received your order and are working on it now. We'll email you an
						update as soos as your order is proceed.</h6>
				</div>

				<!--delivery address box-->
				<div class="delivery_add">
					<div class="delivery_dt">

						<div class="delivery_one extra_marg">
							Delivery date : <span>${orderSaveData.deliveryDate}</span>
						</div>

						<!-- <div class="delivery_one">
							Your Shipping Speed: <span>Standard Shipping.</span>
						</div> -->

					</div>
					<div class="delivery_dt">
						<div class="delivery_one">
							Your order will be sent to: <span>${orderSaveData.address}</span>
						</div>
					</div>
					<div class="clr"></div>
				</div>

				<!-- Item Order box -->
				<div class="order_det_bx">
					<div class="order_head">Order Details</div>

					<c:forEach items="${orderSaveData.detailList}" var="detailList">
						<div class="order_one">
							<!-- <div class="order_pic">
								<img src="images/cake_pic.jpg" alt="" width="140">
							</div> -->
							<div class="order_cont">
								<h3 class="cake_nm">${detailList.itemName}
									<c:if test="${detailList.exInt1!=0}">
												, ${detailList.filterName} 
											</c:if>
								</h3>
								<c:choose>
									<c:when test="${ detailList.exVar2 == null}">

									</c:when>
									<c:otherwise>
										<h4 class="item_no">
											Message on Cake : <span>${detailList.exVar2}</span>
										</h4>
									</c:otherwise>
								</c:choose>
								<div class="table_list">
									<ul>
										<li>Item Price : <span><fmt:formatNumber
													type="number" groupingUsed="false"
													value="${detailList.mrp}" maxFractionDigits="0"
													minFractionDigits="0" /></span></li>
										<c:choose>
											<c:when test="${detailList.exInt1==0}">
												<li>Qty : <span><fmt:formatNumber type="number"
															groupingUsed="false" value="${detailList.qty}"
															maxFractionDigits="0" minFractionDigits="0" /></span></li>
											</c:when>
											<c:otherwise>
												<li>Qty : <span>${detailList.exFloat3}</span></li>
											</c:otherwise>
										</c:choose>

										<li>Total : <span><fmt:formatNumber type="number"
													groupingUsed="false" value="${detailList.totalAmt}"
													maxFractionDigits="0" minFractionDigits="0" /></span></li>
									</ul>
								</div>
							</div>
							<!-- <div class="order_pic_r">
								<img src="images/cake_pic.jpg" alt="" width="100">
							</div> -->
							<div class="clr"></div>
						</div>
					</c:forEach>
					<!--product-row-1-->


					<!--product-row-2-->
					<!-- <div class="order_one">
						<div class="order_pic">
							<img src="images/cake_pic.jpg" alt="" width="140">
						</div>
						<div class="order_cont">
							<h3 class="cake_nm">Classic Red Velvet Cake</h3>
							<h4 class="item_no">
								Message on Cake : <span>Happy Birthday Sachin</span>
							</h4>
							<div class="table_list">
								<ul>
									<li>Item Price : <span>250.00</span></li>
									<li>Qty : <span>02</span></li>
									<li>Total : <span>500.00</span></li>
								</ul>
							</div>
						</div>
						<div class="order_pic_r">
							<img src="images/cake_pic.jpg" alt="" width="100">
						</div>
						<div class="clr"></div>
					</div> -->


					<div class="order_total">
						<div class="order_blnk">&nbsp;</div>
						<div class="order_prc">
							<h2 class="purchase_info">Purchase Information</h2>
							<!-- <div class="purchase_count">
								<div class="purchase_one">
									Subtotal <span>Rs. 423.19</span>
								</div>
								<div class="purchase_one">
									Shipping <span>Rs. 00.00</span>
								</div>
								<div class="purchase_one">
									Payment Information <span>123456</span>
								</div>
								<div class="purchase_one">
									Estimated Sales Tax <span>Rs. 35.19</span>
								</div>

							</div> -->
							<div class="purchase_total">
								Order Total <span>Rs. <fmt:formatNumber type="number"
										groupingUsed="false" value="${orderSaveData.totalAmt}"
										maxFractionDigits="0" minFractionDigits="0" /></span>
							</div>
						</div>
						<div class="clr"></div>
					</div>

				</div>

			</div>
		</div>
	</div>

</body>
</html>