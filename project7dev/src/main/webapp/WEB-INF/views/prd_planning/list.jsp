<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />

<!DOCTYPE html>
<html lang="ko">
<%@ include file="../include/header.jsp" %>

<body>
	<div class="container-fluid">
		<div class="row">
			<%@ include file="../include/left_column.jsp"%>

			<!-- 오른쪽 메인 화면 -->
			<div class="col-10 main p-4">
				<h3 class="fw-bold mb-4">제품생산계획</h3>
				<!-- 검색 폼 -->
				<div class="mb-4 d-flex justify-content-between">
					<form action="${contextPath}/prd_planning/list" method="get" class="d-flex gap-2 align-items-center">
						<select id="searchType" name="searchType" class="form-select w-auto" onchange="changeInputType()">
							<option value="prpl_code" ${param.searchType == 'prpl_code' ? 'selected' : ''}>생산계획번호</option>
							<option value="product_code" ${param.searchType == 'product_code' ? 'selected' : ''}>제품번호</option>
							<option value="product_name" ${param.searchType == 'product_name' ? 'selected' : ''}>제품명</option>
							<option value="prpl_plant" ${param.searchType == 'prpl_plant' ? 'selected' : ''}>생산공장</option>
							<option value="prpl_line" ${param.searchType == 'prpl_line' ? 'selected' : ''}>생산라인</option>
							<option value="product_cnt" ${param.searchType == 'product_cnt' ? 'selected' : ''}>생산계획수량</option>
							<option value="prpl_due_date" ${param.searchType == 'prpl_due_date' ? 'selected' : ''}>생산 납기일</option>
							<option value="emp_name" ${param.searchType == 'emp_name' ? 'selected' : ''}>담당자</option>
						</select>
							<input type="text" name="keyword" value="${param.keyword}" placeholder="검색어" class="form-control w-auto">
						<button class="btn btn-primary">검색</button>
					</form>
					
					<div class="d-flex gap-2">
						<form action="${contextPath}/prd_planning/listExcel" method="get">
							<input type="hidden" name="searchType" value="${param.searchType}">
							<input type="hidden" name="keyword" value="${param.keyword}">
							<button class="btn btn-secondary">EXCEL 다운</button>
						</form>
						<button class="btn btn-success" onclick="location.href='${contextPath}/prd_planning/selectProduct'">신규등록</button>
					</div>
				</div>

				<!-- 테이블 -->
				<table class="table table-bordered text-center align-middle table-light">
					<thead class="table-light">
						<tr>
							<th colspan="9" class="bg-white">제품생산계획 목록</th>
						</tr>
						<tr>
							<th style="background-color: #EDFFF4;">생산계획번호</th>
							<th style="background-color: #EDFFF4;">제품번호</th>
							<th style="background-color: #EDFFF4;">제품명</th>
							<th style="background-color: #EDFFF4;">생산공장</th>
							<th style="background-color: #EDFFF4;">생산라인</th>
							<th style="background-color: #EDFFF4;">생산계획수량</th>
							<th style="background-color: #EDFFF4;">생산 납기일</th>
							<th style="background-color: #EDFFF4;">담당자</th>
							<th style="background-color: #EDFFF4;">상세보기</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="data" items="${list}" varStatus="i">
							<tr>
								<td style="background-color: #FFFFFF;">${data.prpl_code}</td>
								<td style="background-color: #FFFFFF;">${data.product_code}</td>
								<td style="background-color: #FFFFFF;">${data.product_name}</td>
								<td style="background-color: #FFFFFF;">${data.prpl_plant}</td>
								<td style="background-color: #FFFFFF;">${data.prpl_line}</td>
								<td style="background-color: #FFFFFF;">${data.product_cnt}</td>
								<td style="background-color: #FFFFFF;">${data.prpl_due_date}</td>
								<td style="background-color: #FFFFFF;">${data.emp_name}</td>
								<td style="background-color: #FFFFFF;">
									<button class="btn btn-success" type="button" onclick="location.href='${contextPath}/prd_planning/detail?prpl_no=${data.prpl_no}'">
										보기
									</button>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>

				<!-- 페이지 네비게이션 -->
<div class="pagination-container d-flex justify-content-center my-4">
	<c:if test="${startPage > 1}">
		<a class="btn btn-outline-secondary mx-1" href="?page=${startPage - 1}&searchType=${searchType}&keyword=${keyword}">◀</a>
	</c:if>

	<c:forEach begin="${startPage}" end="${endPage}" var="i">
		<a class="btn btn-outline-secondary mx-1" href="?page=${i}&searchType=${searchType}&keyword=${keyword}">${i}</a>
	</c:forEach>

	<c:if test="${endPage < totalPage}">
		<a class="btn btn-outline-secondary mx-1" href="?page=${endPage + 1}&searchType=${searchType}&keyword=${keyword}">▶</a>
	</c:if>
</div>

			</div>
		</div>
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
	
<%@ include file="../include/footer.jsp" %>
</body>
</html>