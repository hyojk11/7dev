<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<%@ include file="../include/header.jsp" %>
<body>
  <div class="container-fluid">
    <div class="row">
      <%@ include file="../include/left_column.jsp" %>

      <!-- 메인 콘텐츠 영역 -->
      <div class="col-10 main" style="padding: 20px;">
        <h3 class="fw-bold mb-4">구매발주 목록</h3>

        <!-- 검색 및 엑셀 다운로드 영역 -->
        <div class="d-flex justify-content-between mb-4">
          <form action="${contextPath}/purc_order/list" method="get" class="d-flex gap-2">
            <select id="searchType" name="searchType" class="form-select">
              <option value="purc_order_code" ${param.searchType == 'purc_order_code' ? 'selected' : ''}>발주번호</option>
              <option value="purc_order_reg_date" ${param.searchType == 'purc_order_reg_date' ? 'selected' : ''}>발주일</option>
              <option value="sup_name" ${param.searchType == 'sup_name' ? 'selected' : ''}>거래처명</option>
              <option value="mrp_due_date" ${param.searchType == 'mrp_due_date' ? 'selected' : ''}>납기일</option>
              <option value="emp_name" ${param.searchType == 'emp_name' ? 'selected' : ''}>담당자</option>
              <option value="purc_order_status" ${param.searchType == 'purc_order_status' ? 'selected' : ''}>상태</option>
            </select>
            <span id="inputType">
              <input type="text" name="keyword" value="${param.keyword}" class="form-control w-25" placeholder="검색어">
            </span>
            <button type="submit" class="btn btn-primary">검색</button>
            <input type="hidden" name="page" value="1">
          </form>

          <form action="${contextPath}/purc_order/excel" method="get">
            <input type="hidden" name="searchType" value="${param.searchType}">
            <input type="hidden" name="keyword" value="${param.keyword}">
            <button type="submit" class="btn btn-secondary">EXCEL 다운</button>
          </form>
        </div>

        <!-- 구매발주 목록 테이블 -->
        <div class="table-responsive">
          <table class="table table-bordered text-center">
            <thead style="background-color: #f0f0f0;">
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
        <div class="d-flex justify-content-center mt-4">
          <c:if test="${startPage > 1}">
            <a href="?page=${startPage - 1}&searchType=${searchType}&keyword=${keyword}" class="btn btn-light">◀</a>
          </c:if>

          <c:forEach begin="${startPage}" end="${endPage}" var="i">
            <a href="?page=${i}&searchType=${searchType}&keyword=${keyword}" class="btn btn-light mx-1">${i}</a>
          </c:forEach>

          <c:if test="${endPage < totalPage}">
            <a href="?page=${endPage + 1}&searchType=${searchType}&keyword=${keyword}" class="btn btn-light">▶</a>
          </c:if>
        </div>
      </div>
    </div>
  </div>

  <%@ include file="../include/footer.jsp" %>

  <!-- 검색창 동적 변환 스크립트 -->
  <script>
    function changeInputType() {
      const searchType = document.getElementById("searchType").value;
      const inputType = document.getElementById("inputType");
      
      if (searchType === "purc_order_reg_date" || searchType === "mrp_due_date") {
        inputType.innerHTML = `<input type="date" name="keyword" value="${param.keyword}" class="form-control w-25">`;
      } else if (searchType === "purc_order_status") {
        inputType.innerHTML = `
          <select name="keyword" class="form-select w-auto">
            <option value="0" ${param.keyword == 0 ? 'selected' : ''}>마감 전</option>
            <option value="1" ${param.keyword == 1 ? 'selected' : ''}>마감완료</option>
          </select>
        `;
      } else {
        inputType.innerHTML = `<input type="text" name="keyword" value="${param.keyword}" class="form-control w-25" placeholder="검색어">`;
      }
    }
    window.addEventListener("DOMContentLoaded", changeInputType);
  </script>

</body>
</html>
