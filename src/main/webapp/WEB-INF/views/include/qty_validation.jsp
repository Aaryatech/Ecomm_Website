<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.ats.ecommerce.common.Constants"
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<input type="hidden" id="defValue" value="${Constants.defaultValue}">
<c:set value="${Constants.maxValue}" var="maxQty"></c:set>

<input type="hidden" id="maxValue" value="${maxQty}">
<script>
$('.qty11').on('input', function() {
	
	var maxValue=document.getElementById("maxValue").value;
	if(type==0){
		var newWt=wt+1;
		if(parseInt(wt)>1 && wt<=parseInt(maxValue)){
			wt=parseInt(wt)-1;
		}
	}
	else if(type==1){
		if(parseInt(wt)>=1 && parseInt(wt)<parseInt(maxValue)){
			wt=parseInt(wt)+1;
		}
	}

	document.getElementById("newPrice"+id).innerHTML="<i class='fa fa-inr' aria-hidden='true'></i>"+rate.toFixed(1);

	
	 var defValue=document.getElementById("defValue").value;
	 var maxValue=document.getElementById("maxValue").value;
			if(isNaN(this.value)){
				
	            var matches = this.value.match(/(\d+)/);
	            if (matches) {
	            	if(matches[0]==null || matches[0]==""){
	            		this.value = 1;
	            	}else{
	            		this.value = matches[0];
	            	}
	            }else{
	            	this.value = 1;
	            }
			}else if(parseInt(this.value)>maxValue){
				this.value = maxValue;
			}
			 this.value = this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1');
			});
			
$(document).ready(function()
		{
		    $(".qty").attr('maxlength','3');
		    $(".qty").attr('readonly','true');
		});
</script>
</html>