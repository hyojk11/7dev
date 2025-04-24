<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<%@ include file="../include/header.jsp" %>
<head>
  <style>
    html, body {
      height: 100%;
    }

    .container-fluid {
      min-height: 100%;
      display: flex;
      flex-direction: column;
    }

    .main {
      flex: 1;
    }
  </style>
</head>
<body>
  <div class="container-fluid">
    <div class="row flex-grow-1">
      <%@ include file="../include/left_column.jsp" %>

      <!-- 메인 콘텐츠 영역 -->
      <div class="col-10 main" style="padding: 20px;">
        <h3 class="fw-bold mb-4">구매발주 목록</h3>

        <!-- 검색 및 엑셀 다운로드 영역 -->
        <div class="mb-4 d-flex justify-content-between">
          <form action="${contextPath}/purc_order/list" method="get" class="d-flex gap-2 align-items-center">
            <select id="searchType" name="searchType" class="form-select w-auto" onchange="changeInputType()">
              <option value="purc_order_code" ${param.searchType == 'purc_order_code' ? 'selected' : ''}>발주번호</option>
              <option value="purc_order_reg_date" ${param.searchType == 'purc_order_reg_date' ? 'selected' : ''}>발주일</option>
              <option value="sup_name" ${param.searchType == 'sup_name' ? 'selected' : ''}>거래처명</option>
              <option value="mrp_due_date" ${param.searchType == 'mrp_due_date' ? 'selected' : ''}>납기일</option>
              <option value="emp_name" ${param.searchType == 'emp_name' ? 'selected' : ''}>담당자</option>
              <option value="purc_order_status" ${param.searchType == 'purc_order_status' ? 'selected' : ''}>상태</option>
            </select>

            <!-- 검색 input + 버튼 정렬 -->
            <div class="d-flex gap-2 align-items-center" id="inputType">
              <input type="text" name="keyword" value="${param.keyword}" class="form-control w-auto" placeholder="검색어">
              <button type="submit" class="btn btn-primary">검색</button>
            </div>

            <input type="hidden" name="page" value="1">
          </form>

          <form action="${contextPath}/purc_order/excel" method="get">
            <input type="hidden" name="searchType" value="${param.searchType}">
            <input type="hidden" name="keyword" value="${param.keyword}">
            <button type="submit" class="btn btn-success">EXCEL 다운</button>
          </form>
        </div>

        <!-- 구매발주 목록 테이블 -->
        <div class="table-responsive">
          <table class="table table-bordered text-center">
            <thead style="background-color: #f0f0f0;">
              <tr>
                <th style="background-color: #EDFFF4;">NO.</th>
                <th style="background-color: #EDFFF4;">발주번호</th>
                <th style="background-color: #EDFFF4;">발주일</th>
                <th style="background-color: #EDFFF4;">거래처명</th>
                <th style="background-color: #EDFFF4;">총 수량</th>
                <th style="background-color: #EDFFF4;">총 금액</th>
                <th style="background-color: #EDFFF4;">화폐단위</th>
                <th style="background-color: #EDFFF4;">납기일</th>
                <th style="background-color: #EDFFF4;">담당자</th>
                <th style="background-color: #EDFFF4;">상태</th>
              </tr>
            </thead>
            <tbody>
              <c:forEach var="data" items="${list}" varStatus="i">
                <tr>
                  <td>${i.index + 1}</td>
                  <td>
                    <a href="${contextPath}/purc_order/detail?purc_order_code=${data.purc_order_code}" class="text-decoration-none">${data.purc_order_code}</a>
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
                      <c:otherwise>-</c:otherwise>
                    </c:choose>
                  </td>
                </tr>
              </c:forEach>
            </tbody>
          </table>
        </div>

        <!-- 페이지 네비게이션 -->
        <div class="pagination-container d-flex justify-content-center my-4">
          <c:if test="${startPage > 1}">
            <a href="?page=${startPage - 1}&searchType=${searchType}&keyword=${keyword}" class="btn btn-outline-secondary mx-1">◀</a>
          </c:if>

          <c:forEach begin="${startPage}" end="${endPage}" var="i">
            <a href="?page=${i}&searchType=${searchType}&keyword=${keyword}" class="btn btn-outline-secondary mx-1">${i}</a>
          </c:forEach>

          <c:if test="${endPage < totalPage}">
            <a href="?page=${endPage + 1}&searchType=${searchType}&keyword=${keyword}" class="btn btn-outline-secondary mx-1">▶</a>
          </c:if>
        </div>
      </div>
    </div>

    <%@ include file="../include/footer.jsp" %>
  </div>

  <!-- 검색창 동적 변환 스크립트 -->
  <script>
    function changeInputType() {
      const searchType = document.getElementById("searchType").value;
      const inputType = document.getElementById("inputType");

      if (searchType === "purc_order_reg_date" || searchType === "mrp_due_date") {
        inputType.innerHTML = `
          <div class="d-flex gap-2 align-items-center">
            <input type="date" name="keyword" value="${param.keyword}" class="form-control w-auto">
            <button type="submit" class="btn btn-primary">검색</button>
          </div>`;
      } else if (searchType === "purc_order_status") {
        inputType.innerHTML = `
          <div class="d-flex gap-2 align-items-center">
            <select name="keyword" class="form-select w-auto">
              <option value="0" ${param.keyword == 0 ? 'selected' : ''}>마감 전</option>
              <option value="1" ${param.keyword == 1 ? 'selected' : ''}>마감완료</option>
            </select>
            <button type="submit" class="btn btn-primary">검색</button>
          </div>`;
      } else {
        inputType.innerHTML = `
          <div class="d-flex gap-2 align-items-center">
            <input type="text" name="keyword" value="${param.keyword}" class="form-control w-auto" placeholder="검색어">
            <button type="submit" class="btn btn-primary">검색</button>
          </div>`;
      }
    }
    window.addEventListener("DOMContentLoaded", changeInputType);
  </script>
</body>
</html>
