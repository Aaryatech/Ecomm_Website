<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>


<!--mongi help-popup-->
<div class="mongi_help">
	<a href="javascript:void(0)" class="initialism mongi_open"><img
		src="${pageContext.request.contextPath}/resources/images/mongi_help.png"
		alt=""></a>
</div>

<!--apply now pop up-->
<div id="mongi" class="well">
	<div class="mongi_title">
		<span><a href="javascript:void(0)" onclick="resetAllTags()">
				Clear</a></span> Select Our Best Filter
		<div class="mongi_close close_pop" id="divClose">
			<i class="fa fa-times" aria-hidden="true"></i>
		</div>
	</div>

	<div id="tagListDiv" style="display: none;">${tagsJson}</div>

	<div class="mongi_cont">
		<ul class="ks-cboxtags" id="tagUl">

		</ul>
	</div>

	<div class="proceend_bnt">
		<a href="javascript:void(0)" onclick="searchByTags()"
			class="proceed_btn">Proceed</a>
	</div>

</div>

<script type="text/javascript">
	$(document)
			.ready(
					function() {

						sessionStorage.setItem("allTagList", document
								.getElementById("tagListDiv").innerHTML);

						if (sessionStorage.getItem("selTags") == null) {
							var table = [];
							sessionStorage.setItem("selTags", JSON.stringify(table));
						}

						if (sessionStorage.getItem("allTagList") == null) {
							var table = [];
							sessionStorage.setItem("allTagList", JSON.stringify(table));
						}

						var allTagList = null;
						try{
						allTagList = sessionStorage.getItem("allTagList");
						}catch (e) {
							
						}
						var allTags = $.parseJSON(allTagList);

						var tags = sessionStorage.getItem("selTags");
						var selTags = $.parseJSON(tags);

						var str = "";

						if (selTags.length > 0) {

							for (var i = 0; i < allTags.length; i++) {
								for (var j = 0; j < selTags.length; j++) {
									if (allTags[i].adminName === selTags[j]) {
										allTags[i].isChecked = 1;
									}
								}
							}

							for (var i = 0; i < allTags.length; i++) {
								if (allTags[i].isChecked == 1) {

									str = str
											+ '<li><input type="checkbox" checked id="chkTag'+allTags[i].filterId+'" value="'+allTags[i].adminName+'" class="resetTags"><label for="chkTag'+allTags[i].filterId+'">'
											+ allTags[i].adminName
											+ '</label></li>';

								} else {

									str = str
											+ '<li><input type="checkbox" id="chkTag'+allTags[i].filterId+'" value="'+allTags[i].adminName+'" class="resetTags"><label for="chkTag'+allTags[i].filterId+'">'
											+ allTags[i].adminName
											+ '</label></li>';
								}
							}

						} else {

							for (var i = 0; i < allTags.length; i++) {
								str = str
										+ '<li><input type="checkbox" id="chkTag'+allTags[i].filterId+'" value="'+allTags[i].adminName+'" class="resetTags"><label for="chkTag'+allTags[i].filterId+'">'
										+ allTags[i].adminName
										+ '</label></li>';
							}

						}

						document.getElementById("tagUl").innerHTML = str;

						$('#mongi').popup();
					});

	function resetAllTags() {

		$(".resetTags")
				.each(
						function(counter) {
							document.getElementsByClassName("resetTags")[counter].checked = false;
						});

	}

	function searchByTags() {

		//itemListUl

		//alert("hi")

		var list = [];

		$(".resetTags").each(function(counter) {
			if (document.getElementsByClassName("resetTags")[counter].checked) {

				list.push($(this).val());
			}
		});

		sessionStorage.setItem("selTags", JSON.stringify(list));
		//itemSearchByTagFilter();

		window.open('${pageContext.request.contextPath}/products/0', '_self');

	}
</script>

