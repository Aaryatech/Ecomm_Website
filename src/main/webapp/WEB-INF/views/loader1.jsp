
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>

<style type="text/css">
	body {
    margin: 0;
    height: 100vh;
    display: flex;
    align-items: center;
    justify-content: center;
    background-color: #000;
    overflow: hidden;
}

.loader {
    width: 10em;
    height: 10em;
    font-size: 25px;
    box-sizing: border-box;
    border-top: 0.3em solid #ec268f ;/*hotpink*/
    border-radius: 50%;
    position: relative;
    animation: rotating 250s ease-in-out infinite;
    --direction: 1;
}

.loader::before,
.loader::after {
    content: '';
    position: absolute;
    width: inherit;
    height: inherit;
    border-radius: 50%;
    box-sizing: border-box;
    top: -0.2em;
}

.loader::before {
    border-top: 0.3em solid #383a92 ;/*dodgerblue*/
    transform: rotate(120deg);
}

.loader::after {
    border-top: 0.3em solid #ec26dc /*gold*/;
    transform: rotate(240deg);
}

.loader span {
    position: absolute;
    
    width: inherit;
    height: inherit;
    text-align: center;
    line-height: 10em;
	animation:none;
	transform:none;
    /*font-family: sans-serif;
    animation: rotating 2s linear infinite;
	color: white;
    --direction: -1;*/
}
.aaa{position:absolute;}

@keyframes rotating {
   from { transform: rotate(0deg);}
	to   { transform: rotate(50000deg);}
}

</style>

</head>

<body>
<div class="loader-Parent" id="loadingDiv">
<div class="loader"><!--<span>Loading...</span>--></div>
<span class="aaa"><img src="${pageContext.request.contextPath}/resources/images/loading_logo.png" alt="" /></span>
</div>
</body>
</html>
