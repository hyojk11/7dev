<%@ page contentType="text/html;charset=UTF-8" language="java"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<%@ include file="../include/header.jsp"%>
<body>
	<div class="container-fluid">
		<div class="row">
			<%@ include file="../include/left_column.jsp"%>

			<!-- 메인 콘텐츠 영역 -->
			<div class="col-10 main" style="padding: 20px;">
				<h3 class="fw-bold mb-4">진척검수 목록</h3>

				<!-- 검색 영역 -->
				<div class="d-flex gap-3 mb-4">
					<form action="${contextPath}/pro_monitoring/list" method="get"
						class="d-flex justify-content-between align-items-center">
						<div class="d-flex gap-3">
							<select id="searchType" name="searchType"
								class="form-select w-auto" onchange="changeInputType()">
								<option value="purc_order_code"
									${param.searchType == 'purc_order_code' ? 'selected' : ''}>발주번호</option>
								<option value="sup_name"
									${param.searchType == 'sup_name' ? 'selected' : ''}>거래처명</option>
								<option value="purc_order_reg_date"
									${param.searchType == 'purc_order_reg_date' ? 'selected' : ''}>발주일</option>
								<option value="next_progress_date"
									${param.searchType == 'next_progress_date' ? 'selected' : ''}>다음
									진척검수일</option>
								<option value="mrp_due_date"
									${param.searchType == 'mrp_due_date' ? 'selected' : ''}>납기일</option>
								<option value="emp_name"
									${param.searchType == 'emp_name' ? 'selected' : ''}>담당자</option>
								<option value="total_progress_rate"
									${param.searchType == 'total_progress_rate' ? 'selected' : ''}>진척률</option>
								<option value="progress_eval"
									${param.searchType == 'progress_eval' ? 'selected' : ''}>평가</option>
							</select> <input type="text" name="keyword" value="${param.keyword}"
								placeholder="검색어" class="form-control w-auto">
							<button class="btn btn-primary">검색</button>
						</div>
					</form>
					<!-- Excel 다운로드 버튼 -->
					<div class="d-flex gap-2">
						<form action="${contextPath}/pro_monitoring/listExcel"
							method="get">
							<input type="hidden" name="searchType"
								value="${param.searchType}"> <input type="hidden"
								name="keyword" value="${param.keyword}">
							<button type="submit" class="btn btn-success">EXCEL 다운로드</button>
						</form>
					</div>
				</div>

				<!-- 진척검수 테이블 -->
				<div class="table-responsive">
					<table class="table table-bordered text-center">
						<thead class="sticky-row" style="background-color: #EDFFF4;">
							<tr>
								<th style="background-color: #EDFFF4;">NO.</th>
								<th style="background-color: #EDFFF4;">구매발주 번호</th>
								<th style="background-color: #EDFFF4;">거래처명</th>
								<th style="background-color: #EDFFF4;">구매발주일</th>
								<th style="background-color: #EDFFF4;">다음 진척검수일</th>
								<th style="background-color: #EDFFF4;">납기일</th>
								<th style="background-color: #EDFFF4;">담당자</th>
								<th style="background-color: #EDFFF4;">진척률</th>
								<th style="background-color: #EDFFF4;">평가</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="data" items="${list}" varStatus="i">
								<tr>
									<td>${i.index + 1}</td>
									<td><a
										href="${contextPath}/pro_monitoring/detail?purc_order_code=${data.purc_order_code}">${data.purc_order_code}</a>
									</td>
									<td>${data.sup_name}</td>
									<td>${data.purc_order_reg_date}</td>
									<td>${data.next_progress_date}</td>
									<td>${data.mrp_due_date}</td>
									<td>${data.emp_name}</td>
									<td><c:if test="${data.total_progress_rate == 0}">
											<span class="text-danger">검수예정</span>
										</c:if> <c:if test="${data.total_progress_rate != 0}">
											<span class="text-primary">${data.total_progress_rate}%</span>
										</c:if></td>
									<td><c:choose>
											<c:when test="${data.progress_eval == 'done'}">
												<span class="font-weight-bold">발주마감</span>
											</c:when>
											<c:when test="${data.progress_eval == 'R0'}">
												<span class="text-primary">정상(RO)</span>
											</c:when>
											<c:when test="${data.progress_eval == 'R1'}">
												<span class="text-success">주의(R1)</span>
											</c:when>
											<c:when test="${data.progress_eval == 'R2'}">
												<span class="text-warning">지연(R2)</span>
											</c:when>
											<c:when test="${data.progress_eval == 'R3'}">
												<span class="text-danger">위험(R3)</span>
											</c:when>
										</c:choose></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>

				<!-- 페이지 네비게이션 -->
				<div class="d-flex justify-content-center mt-4">
					<c:if test="${startPage > 1}">
						<a
							href="?page=${startPage - 1}&searchType=${searchType}&keyword=${keyword}"
							class="btn btn-link">◀</a>
					</c:if>

					<c:forEach begin="${startPage}" end="${endPage}" var="i">
						<a href="?page=${i}&searchType=${searchType}&keyword=${keyword}"
							class="btn btn-link">${i}</a>
					</c:forEach>

					<c:if test="${endPage < totalPage}">
						<a
							href="?page=${endPage + 1}&searchType=${searchType}&keyword=${keyword}"
							class="btn btn-link">▶</a>
					</c:if>
				</div>
			</div>
		</div>
	</div>

	<%@ include file="../include/footer.jsp"%>

	<script>
  function changeInputType() {
    const searchType = document.getElementById("searchType").value;
    const inputType = document.getElementById("inputType");
    
    if (searchType === "purc_order_reg_date" || searchType === "next_progress_date" || searchType === "mrp_due_date") {
      inputType.innerHTML = `<input type="date" name="keyword" value="${param.keyword}" class="form-control">`;
    } else if (searchType === "total_progress_rate") {
      inputType.innerHTML = `
        <select name="keyword" class="form-select">
          <option value="ready" ${param.keyword == 'ready' ? 'selected' : ''}>검수예정</option>
          <option value="in_progress" ${param.keyword == 'in_progress' ? 'selected' : ''}>검수진행중</option>
          <option value="complete" ${param.keyword == 'complete' ? 'selected' : ''}>검수완료</option>
        </select>
      `;
    } else if (searchType === "progress_eval") {
      inputType.innerHTML = `
        <select name="keyword" class="form-select">
          <option value="done" ${param.keyword == 'done' ? 'selected' : ''}>발주마감</option>
          <option value="R0" ${param.keyword == 'R0' ? 'selected' : ''}>정상</option>
          <option value="R1" ${param.keyword == 'R1' ? 'selected' : ''}>주의</option>
          <option value="R2" ${param.keyword == 'R2' ? 'selected' : ''}>지연</option>
          <option value="R3" ${param.keyword == 'R3' ? 'selected' : ''}>위험</option>
        </select>
      `;
    } else {
      inputType.innerHTML = `<input type="text" name="keyword" value="${param.keyword}" class="form-control" placeholder="검색어">`;
    }
  }
  window.addEventListener("DOMContentLoaded", changeInputType);
</script>

</body>
</html>
