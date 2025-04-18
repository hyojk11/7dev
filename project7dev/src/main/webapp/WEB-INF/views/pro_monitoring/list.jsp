<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>진척검수목록</title>
</head>
<body>
	<h2>진척검수</h2>
	<table border="1">
		<tr>
			<td colspan ="8">
			<form action="${contextPath}/pro_monitoring/list" method="get">
				<select id="searchType" name="searchType" onchange="changeInputType()">
					<option value="purc_order_code" ${param.searchType == 'purc_order_code' ? 'selected' : ''}>발주번호</option>
					<option value="sup_name" ${param.searchType == 'sup_name' ? 'selected' : ''}>거래처명</option>
					<option value="purc_order_reg_date" ${param.searchType == 'purc_order_reg_date' ? 'selected' : ''}>발주일</option>
					<option value="next_progress_date" ${param.searchType == 'next_progress_date' ? 'selected' : ''}>다음 진척검수일</option>
					<option value="mrp_due_date" ${param.searchType == 'mrp_due_date' ? 'selected' : ''}>납기일</option>
					<option value="emp_name" ${param.searchType == 'emp_name' ? 'selected' : ''}>담당자</option>
					<option value="total_progress_rate" ${param.searchType == 'total_progress_rate' ? 'selected' : ''}>진척률</option>
					<option value="progress_eval" ${param.searchType == 'progress_eval' ? 'selected' : ''}>평가</option>
				</select>
				<span id="inputType">
					<input type="text" name="keyword" value="${param.keyword}" placeholder="검색어">
				</span>
				<button>검색</button>
			</form>
			</td>
			<td colspan="1">
				<form action="${contextPath}/pro_monitoring/listExcel" method="get">
				<input type="hidden" name="searchType" value="${param.searchType}">
				<input type="hidden" name="keyword" value="${param.keyword}">
				<button>EXCEL 다운</button>
				</form>
			</td>
		</tr>
		<tr>
			<th colspan="9">진척검수 목록</th>
		</tr>
		<tr>
			<th>NO.</th>
			<th>구매발주 번호</th>
			<th>거래처명</th>
			<th>구매발주일</th>
			<th>다음 진척검수일</th>
			<th>납기일</th>
			<th>담당자</th>
			<th>진척률</th>
			<th>평가</th>
		</tr>
		<c:forEach var="data" items="${list}" varStatus="i">
		<tr>
			<td>${i.index+1}</td>
			<td>
				<a href="${contextPath}/pro_monitoring/detail?purc_order_code=${data.purc_order_code}">${data.purc_order_code}</a>
			</td>
			<td>${data.sup_name}</td>
			<td>${data.purc_order_reg_date}</td>
			<td>${data.next_progress_date}</td>
			<td>${data.mrp_due_date}</td>
			<td>${data.emp_name}</td>
			<td>
				<c:if test="${data.total_progress_rate == 0}">
					<span style="color:red;">검수예정</span>
				</c:if>
				<c:if test="${data.total_progress_rate != 0}">
					<span style="color:blue;">${data.total_progress_rate}%</span>
				</c:if>
			</td>
			<td>
				<c:if test="${data.progress_eval == 'done'}">
					<span style="color:black; font-weight:bold;">발주마감</span>
				</c:if>
				<c:if test="${data.progress_eval == 'R0'}">
					<span style="color:blue;">정상(RO)</span>
				</c:if>
				<c:if test="${data.progress_eval == 'R1'}">
					<span style="color:green;">주의(R1)</span>
				</c:if>
				<c:if test="${data.progress_eval == 'R2'}">
					<span style="color:orange;">지연(R2)</span>
				</c:if>
				<c:if test="${data.progress_eval == 'R3'}">
					<span style="color:red;">위험(R3)</span>
				</c:if>
				
			</td>
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
			
			if(searchType === "purc_order_reg_date" || searchType === "next_progress_date" || searchType === "mrp_due_date") {
				inputType.innerHTML = `<input type="date" value="${param.keyword}" name="keyword">`;
			} else if(searchType === "total_progress_rate") {
				inputType.innerHTML = `
					<select name="keyword">
						<option value="ready" ${param.keyword == 'ready' ? 'selected' : ''}>검수예정</option>
						<option value="in_progress" ${param.keyword == 'in_progress' ? 'selected' : ''}>검수진행중</option>
						<option value="complete" ${param.keyword == 'complete' ? 'selected' : ''}>검수완료</option>
					</select>
				`;
			} else if(searchType === "progress_eval") {
				inputType.innerHTML = `
					<select name="keyword">
						<option value="done" ${param.keyword == 'done' ? 'selected' : ''}>발주마감</option>
						<option value="R0" ${param.keyword == 'R0' ? 'selected' : ''}>정상</option>
						<option value="R1" ${param.keyword == 'R1' ? 'selected' : ''}>주의</option>
						<option value="R2" ${param.keyword == 'R2' ? 'selected' : ''}>지연</option>
						<option value="R3" ${param.keyword == 'R3' ? 'selected' : ''}>위험</option>
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