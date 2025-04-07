<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구매발주목록</title>
</head>
<body>
	<h2>구매발주</h2>
	<table border="1">
		<tr>
			<td colspan ="8">
			<form action="${contextPath}/purc_order/list_search" method="get">
				<select id="searchType" name="searchType" onchange="changeInputType()">
					<option value="purc_order_code" ${param.searchType == 'purc_order_code' ? 'selected' : ''}>발주번호</option>
					<option value="purc_order_reg_date" ${param.searchType == 'purc_order_reg_date' ? 'selected' : ''}>발주일</option>
					<option value="sup_name" ${param.searchType == 'sup_name' ? 'selected' : ''}>거래처명</option>
					<option value="mrp_due_date" ${param.searchType == 'mrp_due_date' ? 'selected' : ''}>납기일</option>
					<option value="emp_name" ${param.searchType == 'emp_name' ? 'selected' : ''}>담당자</option>
					<option value="purc_order_status" ${param.searchType == 'purc_order_status' ? 'selected' : ''}>상태</option>
				</select>
				<span id="inputType">
					<input type="text" name="keyword" value="${param.keyword}" placeholder="검색어">
				</span>
				<button>검색</button>
			</form>
			</td>
			<td colspan="2">
				<button>EXCEL 다운</button>
			</td>
		</tr>
		<tr>
			<th colspan="10">구매발주목록</th>
		</tr>
		<tr>
			<th>NO.</th>
			<th>발주번호</th>
			<th>발주일</th>
			<th>거래처명</th>
			<th>총 수량</th>
			<th>총 금액</th>
			<th>화폐단위</th>
			<th>납기일</th>
			<th>담당자</th>
			<th>상태</th>
		</tr>
		<c:forEach var="data" items="${list}" varStatus="status">
		<tr>
			<td>${status.index+1}</td>
			<td>
				<a href="${contextPath}/purc_order/detail?purc_order_code=${data.purc_order_code}">${data.purc_order_code}</a>
			</td>
			<td>${data.purc_order_reg_date}</td>
			<td>${data.sup_name}</td>
			<td>${data.cont_material_cnt}</td>
			<td>${data.total_price}</td>
			<td>${data.mprice_currency}</td>
			<td>${data.mrp_due_date}</td>
			<td>${data.emp_name}</td>
			<td>
				<c:choose>
					<c:when test="${data.purc_order_status == 0}">
						<span style="color:red;">마감 전</span>
					</c:when>
					<c:when test="${data.purc_order_status == 1}">
						<span style="color:blue;">마감완료</span>
					</c:when>
					<c:otherwise>
						-
					</c:otherwise>
				</c:choose>
			</td>
		</tr>
		</c:forEach>
	</table>
	<!-- ********************페이징처리 아직 안 함******************** -->
	
	<!-- *** 자바스크립트 함수들 *** -->
	
	<!-- 검색창 동적변환 -->
	<script>
		function changeInputType() {
			const searchType = document.getElementById("searchType").value;
			const inputType = document.getElementById("inputType");
			
			if(searchType === "purc_order_reg_date" || searchType === "mrp_due_date") {
				inputType.innerHTML = `<input type="date" value="${param.keyword}" name="keyword">`;
			} else if(searchType === "purc_order_status") {
				inputType.innerHTML = `
					<select name="keyword">
						<option value="0" ${param.keyword == '0' ? 'selected' : ''}>마감 전</option>
						<option value="1" ${param.keyword == '1' ? 'selected' : ''}>마감완료</option>
					</select>
				`;
			} else {
				inputType.innerHTML = `<input type="text" name="keyword" value="${param.keyword}" placeholder="검색어">`;
			}
			
		}
		window.addEventListener("DOMContentLoaded", changeInputType);
	</script>
	
	
</body>
</html>