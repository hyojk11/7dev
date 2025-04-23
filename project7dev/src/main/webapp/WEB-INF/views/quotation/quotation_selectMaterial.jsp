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
      <h3 class="fw-bold mb-4">부품 선택</h3>

      <div class="scroll-container" style="max-height: 600px; overflow-y: auto; border: 1px solid #ccc; padding: 10px; background-color: #fff;">
        <table class="table table-bordered text-center align-middle scroll-table" style="width: 100%; table-layout: fixed;">
          <thead class="sticky-row">
            <!-- 검색 영역 -->
            <tr style="position: sticky; top: 0; background-color: #fff; z-index: 3;">
              <th colspan="4">
                <form action="${contextPath}/quotation/selectMaterial" method="get" class="d-flex justify-content-center align-items-center gap-2">
                  <select name="searchType" id="selectField" class="form-select w-auto">
                    <option value="materialCode" selected>부품코드</option>
                    <option value="materialName">부품명</option>
                  </select>
                  <input type="text" name="searchValue" id="inputCode" class="form-control w-25">
                  <input type="submit" value="검색" class="btn btn-primary">
                </form>
              </th>
            </tr>

            <!-- 목록 헤더 -->
            <tr style="position: sticky; top: 56px; background-color: #fff; z-index: 2;">
              <th colspan="4">부품 목록</th>
            </tr>

            <!-- 실제 테이블 컬럼 헤더 -->
            <tr style="position: sticky; top: 96px; background-color: #EDFFF4; z-index: 1;">
              <th style="background-color: #EDFFF4;">부품코드</th>
              <th style="background-color: #EDFFF4;">부품명</th>
              <th style="background-color: #EDFFF4;">상세보기</th>
              <th style="background-color: #EDFFF4;">등록하기</th>
            </tr>
          </thead>

          <tbody>
            <c:forEach var="material" items="${materialList}">
              <tr>
                <td>${material.materialCode}</td>
                <td>${material.materialName}</td>
                <td>
                  <form action="#" method="get">
                    <input type="hidden" name="materialNo" value="${material.materialNo}" />
                    <button type="submit" class="btn btn-info btn-sm">보기</button>
                  </form>
                </td>
                <td>
                  <form action="${contextPath}/quotation/getCreateQuotation" method="get">
                    <input type="hidden" name="materialNo" value="${material.materialNo}" />
                    <button type="submit" class="btn btn-success btn-sm">선택</button>
                  </form>
                </td>
              </tr>
            </c:forEach>
          </tbody>
        </table>
      </div>
    </div>
  </div>
</div>

<%@ include file="../include/footer.jsp" %>
</body>
</html>
