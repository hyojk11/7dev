<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제품생산계획</title>
</head>
<body>
	<h2>제품생산계획</h2>
	<table border="1">
		<tr>
			<td colspan ="7">
			<form action="${contextPath}/prd_planning/list" method="get">
				<select id="searchType" name="searchType" onchange="changeInputType()">
					<option value="prpl_code" ${param.searchType == 'prpl_code' ? 'selected' : ''}>생산계획번호</option>
					<option value="product_code" ${param.searchType == 'product_code' ? 'selected' : ''}>제품번호</option>
					<option value="product_name" ${param.searchType == 'product_name' ? 'selected' : ''}>제품명</option>
					<option value="prpl_plant" ${param.searchType == 'prpl_plant' ? 'selected' : ''}>생산공장</option>
					<option value="prpl_line" ${param.searchType == 'prpl_line' ? 'selected' : ''}>생산라인</option>
					<option value="product_cnt" ${param.searchType == 'product_cnt' ? 'selected' : ''}>생산계획수량</option>
					<option value="prpl_due_date" ${param.searchType == 'prpl_due_date' ? 'selected' : ''}>생산 납기일</option>
					<option value="emp_name" ${param.searchType == 'emp_name' ? 'selected' : ''}>담당자</option>
				</select>
				<span id="inputType">
					<input type="text" name="keyword" value="${param.keyword}" placeholder="검색어">
				</span>
				<button>검색</button>
			</form>
			</td>
			<td colspan="1">
				<form action="${contextPath}/prd_planning/listExcel" method="get">
				<input type="hidden" name="searchType" value="${param.searchType}">
				<input type="hidden" name="keyword" value="${param.keyword}">
				<button>EXCEL 다운</button>
				</form>
			</td>
			<td colspan="1">
				<button type="button" onclick="location.href='${contextPath}/prd_planning/selectProduct'">신규등록</button>
			</td>
		</tr>
		<tr>
			<th colspan="9">제품생산계획 목록</th>
		</tr>
		<tr>
			<th>생산계획번호</th>
			<th>제품번호</th>
			<th>제품명</th>
			<th>생산공장</th>
			<th>생산라인</th>
			<th>생산계획수량</th>
			<th>생산 납기일</th>
			<th>담당자</th>
			<th>상세보기</th>
		</tr>
		<c:forEach var="data" items="${list}" varStatus="i">
		<tr>
			<td>${data.prpl_code}</td>
			<td>${data.product_code}</td>
			<td>${data.product_name}</td>
			<td>${data.prpl_plant}</td>
			<td>${data.prpl_line}</td>
			<td>${data.product_cnt}</td>
			<td>${data.prpl_due_date}</td>
			<td>${data.emp_name}</td>
			<td><button type="button" onclick="location.href='${contextPath}/prd_planning/detail?prpl_no=${data.prpl_no}'">보기</button></td>
		</tr>
		</c:forEach>
	</table>
	<div>
		<c:if test="${startPage > 1}">
			<a href="?page=${startPage - 1}&searchType=${searchType}&keyword=${keyword}">◀</a>
		</c:if>
		
		<c:forEach begin="${startPage}" end="${endPage}" var="i">
			<a href="?page=${i}&searchType=${searchType}&keyword=${keyword}">${i}</a>
		</c:forEach>
		
		<c:if test="${endPage < totalPage}">
			<a href="?page=${endPage + 1}&searchType=${searchType}&keyword=${keyword}">▶</a>
		</c:if>
	</div>
	
	<!-- *** 자바스크립트 함수들 *** -->
	
	<!-- 검색창 동적변환 -->
	<script>
		function changeInputType() {
			const searchType = document.getElementById("searchType").value;
			const inputType = document.getElementById("inputType");
			
			if(searchType === "prpl_due_date") {
				inputType.innerHTML = `<input type="date" value="${param.keyword}" name="keyword">`;
			} else if(searchType === "prpl_plant") {
				inputType.innerHTML = `
					<select name="keyword">
						<option value="KR" ${param.keyword == 'KR' ? 'selected' : ''}>KR</option>
						<option value="CN" ${param.keyword == 'CN' ? 'selected' : ''}>CN</option>
					</select>
				`;
			} else if(searchType === "prpl_line") {
				inputType.innerHTML = `
					<select name="keyword">
						<option value="K01" ${param.keyword == 'K01' ? 'selected' : ''}>K01</option>
						<option value="K02" ${param.keyword == 'K02' ? 'selected' : ''}>K02</option>
						<option value="C01" ${param.keyword == 'C01' ? 'selected' : ''}>C01</option>
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