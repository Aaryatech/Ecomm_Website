<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="com.google.gson.Gson"%>
<%@ page import="com.ats.ecommerce.model.FEDataTraveller"%>
<%@ page import="com.ats.ecommerce.model.GetFlavorTagStatusList"%>
<%@ page import="com.ats.ecommerce.common.Constants"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.fasterxml.jackson.databind.ObjectMapper"%>
<%@ page import="com.ats.ecommerce.model.CateFilterConfig"%>
<%@ page import="java.util.stream.Stream"%>
<%@ page import="java.util.stream.Collectors"%>
<%@ page import="com.ats.ecommerce.model.MFilter"%>
<%@ page import="org.springframework.util.LinkedMultiValueMap"%>
<%@ page import="org.springframework.util.MultiValueMap"%>
<%@ page import="java.util.Arrays"%>
<%@ page import="com.ats.ecommerce.model.FilterTypes"%>
<%
	Gson gson = new Gson();
	FEDataTraveller data = gson.fromJson(session.getAttribute("allDataJson").toString(), FEDataTraveller.class);

	//System.err.println("SESSION ------------ " + data);

	// data =
	// mapper.readValue(session.getAttribute("allDataJson"),FEDataTraveller.class);
	pageContext.setAttribute("prodImgUrl", Constants.PROD_IMG_VIEW_URL);
	pageContext.setAttribute("prodHeaderList", data.getFeProductHeadList());
	pageContext.setAttribute("flavTagStatusList", data.getFlavorTagStatusList());

	List<GetFlavorTagStatusList> tagList = new ArrayList<>();

	try {
		for (GetFlavorTagStatusList tag : data.getFlavorTagStatusList()) {
			if (tag.getFilterTypeId() == 7) {
				tagList.add(tag);
			}
		}
	} catch (Exception e) {

	}

	ObjectMapper Obj = new ObjectMapper();
	String jsonStr = "";
	try {
		jsonStr = Obj.writeValueAsString(tagList);
	} catch (Exception e) {
	}

	// ALL MENU CATEGORY LIST
	try {

		List<CateFilterConfig> catMenuList = new ArrayList<>();

		for (CateFilterConfig cat : data.getCatFilterConfig()) {

			/* List<Integer> typeIdList = Stream.of(cat.getFilterIds().split(",")).map(Integer::parseInt)
					.collect(Collectors.toList()); */
			List<Integer> typeIdList = new ArrayList<Integer>();

			try {

				String[] arr = cat.getFilterIds().split(",");

				for (int i = 0; i < arr.length; i++) {
					typeIdList.add(Integer.parseInt(arr[i]));
				}

			} catch (Exception e) {

			}

			// List<Integer> typeIdList = new ArrayList<>();
			// typeIdList.add(4);
			// typeIdList.add(12);

			cat.setTypeIdList(typeIdList);
			cat.setExInt2(typeIdList.size() + 1);
			catMenuList.add(cat);
		}

		data.setCatFilterConfig(catMenuList);

	} catch (Exception e) {
	}

	// ALL FILTER LIST
	List<MFilter> allFilterList = new ArrayList<>();
	try {

		int compId = (Integer) session.getAttribute("companyId");

		MultiValueMap<String, Object> map = new LinkedMultiValueMap<>();
		map.add("compId", compId);

		MFilter[] filterArr = Constants.getRestTemplate().postForObject(Constants.url + "getAllFilter", map,
				MFilter[].class);
		allFilterList = new ArrayList<MFilter>(Arrays.asList(filterArr));

	} catch (Exception e) {
	}

	// ALL FILTER TYPE LIST
	List<FilterTypes> allFilterTypeList = new ArrayList<>();
	try {

		int compId = (Integer) session.getAttribute("companyId");

		MultiValueMap<String, Object> map = new LinkedMultiValueMap<>();
		map.add("compId", compId);

		FilterTypes[] filterArr = Constants.getRestTemplate()
				.postForObject(Constants.url + "getActiveFilterTypes", map, FilterTypes[].class);
		allFilterTypeList = new ArrayList<FilterTypes>(Arrays.asList(filterArr));

	} catch (Exception e) {
	}
	pageContext.setAttribute("tagsJson", jsonStr);
	pageContext.setAttribute("allListFilter", 1);
	pageContext.setAttribute("allData", data);
	pageContext.setAttribute("allFilterList", allFilterList);
	pageContext.setAttribute("allFilterTypeList", allFilterTypeList);
%>
<div class="mega_menu_row">

	<div class="wrapper">

		<div id="menuzord" class="menuzord red menuzord-responsive">
			<ul
				class="menuzord-menu me#menusnuzord-right menuzord-indented scrollable">


				<li><a href="javascript:void(0)" class="same_day">Same Day
						Delivery</a></li>

				<c:forEach items="${allData.catFilterConfig}" var="menuCat">

					<li><a href="#">${menuCat.exVar2} <span><i
								class="fa fa-angle-down" aria-hidden="true"></i></span></a> <!--cake dropdown-->

						<c:if test="${menuCat.exInt2==1}">
							<c:set value="dropdown" var="row_class"></c:set>
						</c:if> <c:if test="${menuCat.exInt2==2}">
							<c:set value="megamenu two-row" var="row_class"></c:set>
						</c:if> <c:if test="${menuCat.exInt2==3}">
							<c:set value="megamenu three-row" var="row_class"></c:set>

						</c:if> <c:if test="${menuCat.exInt2==4}">
							<c:set value="megamenu four-row" var="row_class"></c:set>
						</c:if> <c:if test="${menuCat.exInt2>4}">
							<c:set value="megamenu full-row" var="row_class"></c:set>
						</c:if>
						<ul class="${row_class}">
							<div class="four_row_dropdown">
								<!--row-1-->



								<%-- <div class="row_one">
										<ul class="drop_mainmenu">

											<li>By Price</li>

											<li><label class="radio_menu">Under 499 <input
													type="radio" id="radioPrice" value="0-499"
													name="radioPrice" class="menuPrice"
													onclick="checkPriceFilter(${menuCat.cateId})"> <span
													class="checkmark"></span>
											</label></li>

											<li><label class="radio_menu">500 to 599 <input
													type="radio" id="radioPrice" value="500-599"
													name="radioPrice" class="menuPrice" onclick="checkPriceFilter(${menuCat.cateId})"> <span
													class="checkmark"></span>
											</label></li>

											<li><label class="radio_menu">600 to 999 <input
													type="radio" id="radioPrice" value="600-999"
													name="radioPrice" class="menuPrice" onclick="checkPriceFilter(${menuCat.cateId})"> <span
													class="checkmark"></span>
											</label></li>

											<li><label class="radio_menu">1000 to 1999 <input
													type="radio" id="radioPrice" value="1000-1999"
													name="radioPrice" class="menuPrice" onclick="checkPriceFilter(${menuCat.cateId})"> <span
													class="checkmark"></span>
											</label></li>

											<li><label class="radio_menu">Above 2000 <input
													type="radio" id="radioPrice" value="2000-10000"
													name="radioPrice" class="menuPrice" onclick="checkPriceFilter(${menuCat.cateId})"> <span
													class="checkmark"></span>
											</label></li>

										</ul>
									</div> --%>

								<%-- ${menuCat.typeIdList} --%>
								<%-- ${allFilterTypeList} --%>

								<c:forEach items="${menuCat.typeIdList}" var="menuTypeList">

									<c:forEach items="${allFilterTypeList}" var="filterType">

										<c:choose>


											<c:when
												test="${menuTypeList == filterType.filterTypeId and menuTypeList==16}">

												<div class="row_one">
													<ul class="drop_mainmenu">
														<li>${filterType.filterTypeName}</li>

														<c:forEach items="${allFilterList}" var="filter">

															<c:choose>

																<c:when
																	test="${filterType.filterTypeId == filter.filterTypeId}">

																	<li><label class="radio_menu">
																			${filter.adminName} <input type="radio"
																			id="radioPrice" value=" ${filter.filterDesc}"
																			name="radioPrice" class="menuPrice"> <span
																			class="checkmark"></span>
																	</label></li>

																</c:when>

															</c:choose>

														</c:forEach>

													</ul>
												</div>

											</c:when>

											<c:when
												test="${menuTypeList == filterType.filterTypeId and menuTypeList != 16}">

												<div class="row_one">
													<ul class="drop_mainmenu">
														<li>${filterType.filterTypeName}</li>

														<c:forEach items="${allFilterList}" var="filter">

															<c:choose>

																<c:when
																	test="${filterType.filterTypeId == filter.filterTypeId}">

																	<li><label class="check_menu"> <input
																			type="checkbox" id="menuFilter${filter.filterId}"
																			value="${filter.adminName}~${filter.filterTypeId}"
																			class="menuFilter"
																			onclick="checkFilter(${menuCat.cateId},${filter.filterId})">
																			<span class="checkmark_check"></span>
																			${filter.adminName}
																	</label></li>

																</c:when>

															</c:choose>

														</c:forEach>


													</ul>
												</div>

											</c:when>

										</c:choose>

									</c:forEach>

								</c:forEach>

								<!-- proceed_btn -->
								<a href="javascript:void(0)" class="drop_search"
									onclick="searchMenu(${menuCat.cateId})">Search</a>

							</div>
						</ul></li>

				</c:forEach>

			</ul>
		</div>

	</div>


	<div class="arrow_right" id="sort_arrow" style="display: none;">
		<ul>
			<li><a href="javascript:void(0)" onclick="priceSort(1)"><i
					class="fa fa-arrow-up" aria-hidden="true"></i></a></li>
			<li><a href="javascript:void(0)" onclick="priceSort(0)"><i
					class="fa fa-arrow-down" aria-hidden="true"></i></a></li>
		</ul>
	</div>
</div>
<script type="text/javascript">
function searchMenu(catId) {
	
	//alert(catId)
	
	var table = [];
	sessionStorage.setItem("selTags", JSON.stringify(table));
	
	sessionStorage.setItem("findCatId", catId);
	sessionStorage.setItem("filterMenu", 1);

	var priceListTemp = [];

	$(".menuPrice")
			.each(
					function(counter) {
						if (document
								.getElementsByClassName("menuPrice")[counter].checked) {

							priceListTemp
									.push(document
											.getElementsByClassName("menuPrice")[counter].value);
						}
					});

	if (priceListTemp.length > 0) {

		for (var i = 0; i < priceListTemp.length; i++) {
			//alert()
			var temp = priceListTemp[i].split("-");
			if (temp.length > 0) {
				sessionStorage.setItem("priceFilterMin", temp[0]);
				sessionStorage.setItem("priceFilterMax", temp[1]);
			}
		}

	} else {
		sessionStorage.setItem("priceFilterMin", "0");
		sessionStorage.setItem("priceFilterMax", "0");
	}

	var nameFilter = [];

	$(".menuFilter")
			.each(
					function(counter) {
						if (document
								.getElementsByClassName("menuFilter")[counter].checked) {

							nameFilter
									.push(document
											.getElementsByClassName("menuFilter")[counter].value);
						}
					});

	/* alert(JSON.stringify(nameFilter)); */
	
	sessionStorage.setItem("menuFilterName", nameFilter);

	window.open('${pageContext.request.contextPath}/products/0',
			'_self');

}

function checkFilter(catId,id) {
	
	//alert(catId)
	
	var cId=sessionStorage.getItem("tempCatId");
	sessionStorage.setItem("tempCatId", catId);
	
	if(catId!=cId){
		
		resetPriceRadio();
		resetFilterCheckbox();
		
		//document.getElementsById("menuFilter"+id).checked=true;

	}
	
}
</script>



