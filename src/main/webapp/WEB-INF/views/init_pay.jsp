<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Payment Info</title>
</head>
<body >
<button id="rzp-button1" style="display: none;">Pay</button>
<script src="https://checkout.razorpay.com/v1/checkout.js"></script>
<script>
var options = {
    "key": "rzp_test_1eXaKykckwM8kP", // Enter the Key ID generated from the Dashboard
    "amount": "100", // Amount is in currency subunits. Default currency is INR. Hence, 50000 refers to 50000 paise
    "currency": "INR",
    "name": "Akhilesh",
    "description": "Test Transaction",
    "image": "${pageContext.request.contextPath}/resources/images/logo_monginis-trasPng.png",
    "order_id": "${orderId}",
    "callback_url": "http://localhost:8989/ecommerce/payResponse",
    "prefill": {
        "name": "Akhilesh",
        "email": "akshaykasar72@gmail.com",
        "contact": "9028290286"
    },
    "notes": {
        "address": "Razorpay Corporate Office"
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
</script>
</body>
</html>