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
      <h3 class="fw-bold mb-4">부품조달계획 목록</h3>

      <div class="scroll-container" style="max-height: 600px; overflow-y: auto; border: 1px solid #ccc; padding: 10px; background-color: #fff;">
        <table class="table table-bordered text-center align-middle scroll-table" style="width: 100%; table-layout: fixed;">
          <thead class="sticky-row">
            <!-- 검색 영역 -->
            <tr style="position: sticky; top: 0; background-color: #fff; z-index: 3;">
              <th colspan="7">
                <form action="${contextPath}/mpp/mpp_main" method="get" class="d-flex justify-content-center align-items-center gap-2">
                  <select name="searchType" id="selectField" class="form-select w-auto">
                    <option value="mppCode" selected>조달계획코드</option>
                    <option value="productCode">제품코드</option>
                  </select>
                  <input type="text" name="searchValue" id="inputCode" class="form-control w-25">
                  <input type="submit" value="검색" class="btn btn-primary">
                </form>
              </th>
            </tr>

            <!-- 목록 헤더 -->
            <tr style="position: sticky; top: 56px; background-color: #fff; z-index: 2;">
              <th colspan="6">조달계획 목록</th>
              <th>
                <form action="${contextPath}/mpp/mpp_selectMrp" method="get">
                  <button type="submit" class="btn btn-success btn-sm">신규등록</button>
                </form>
              </th>
            </tr>

            <!-- 실제 테이블 컬럼 헤더 -->
            <tr style="position: sticky; top: 96px; background-color: #fff; z-index: 1;">
              <th style="background-color: #EDFFF4;">조달계획코드</th>
              <th style="background-color: #EDFFF4;">차수</th>
              <th style="background-color: #EDFFF4;">제품코드</th>
              <th style="background-color: #EDFFF4;">제품명</th>
              <th style="background-color: #EDFFF4;">조달요구수량</th>
              <th style="background-color: #EDFFF4;">조달계획 수립일</th>
              <th style="background-color: #EDFFF4;">발주상태</th>
            </tr>
          </thead>

          <tbody>
            <c:if test="${not empty mpp}">
              <c:forEach var="mpp" items="${mpp}">
                <tr>
                  <td>
                    <input type="hidden" name="mppNo" value="${mpp.mppNo}">
                    <a href="${contextPath}/mpp/mpp_selectMpp?mppNo=${mpp.mppNo}">${mpp.mppCode}</a>
                  </td>
                  <td>${mpp.mppVer}</td>
                  <td>${mpp.productCode}</td>
                  <td>${mpp.productName}</td>
                  <td>${mpp.productCnt}</td>
                  <td>${mpp.mppRegDate}</td>
                  <td>발주상태표시</td>
                </tr>
              </c:forEach>
            </c:if>
          </tbody>
        </table>
      </div>
    </div>
  </div>
</div>
<%@ include file="../include/footer.jsp" %>
</body>
</html>
