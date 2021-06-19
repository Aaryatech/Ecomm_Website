<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Payment Info</title>
</head>
<body >
<button id="rzp-button1" style="display:none;">Pay ${sessionScope.userName}</button>

<a href="${pageContext.request.contextPath}/checkout/0">Go Back</a> &nbsp;&nbsp;
<a href="#" onclick="openPayBox()">Make Payment</a>

<script src="https://checkout.razorpay.com/v1/checkout.js"></script>
<script>
var options = {
    "key": "rzp_live_1xwIfbV7BUaBxt", // Enter the Key ID generated from the Dashboard
   "amount": "${amount}", // Amount is in currency subunits. Default currency is INR. Hence, 50000 refers to 50000 paise
 //"amount": "100", // Amount is in currency subunits. Default currency is INR. Hence, 50000 refers to 50000 paise

    "currency": "INR",
    "name": "Pay To Monginis",
    "description": "Order Value from  ${sessionScope.userName}",
    "image": "${pageContext.request.contextPath}/resources/images/logo_monginis-trasPng.png",
    "order_id": "${orderId}",
    "callback_url": "https://pecom.monginis.net/ecom/payResponse",
  // "callback_url": "http://localhost:8080/ecommerce/payResponse",
    "prefill": {
        "name": "${sessionScope.userName}",
        "email": "${sessionScope.userEmail}",
        "contact": "${sessionScope.userMobile}",
    },
    "notes": {
        "address": "${sessionScope.landMark}"
    },
    "theme": {
       "color": "#ec268f"
    	// "color": "orange"
    }
};

var rzp1 = new Razorpay(options);
document.getElementById('rzp-button1').onclick = function(e){
    rzp1.open();
    e.preventDefault();
}
document.getElementById('rzp-button1').onclick();
function openPayBox(){
	document.getElementById('rzp-button1').onclick();

}
</script>
</body>
</html>