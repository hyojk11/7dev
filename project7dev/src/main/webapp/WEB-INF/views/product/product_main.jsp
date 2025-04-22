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
      <h3 class="fw-bold mb-4">제품정보</h3>

      <div class="scroll-container" style="max-height: 600px; overflow-y: auto; border: 1px solid #ccc; padding: 10px; background-color: #fff;">
        <table class="table table-bordered text-center align-middle scroll-table" style="width: 100%; table-layout: fixed;">
          <thead class="sticky-row">
            <!-- 검색 영역 -->
            <tr style="position: sticky; top: 0; background-color: #fff; z-index: 3;">
              <th colspan="4">
                <form action="${contextPath}/product/product_main" method="get" class="d-flex justify-content-center align-items-center gap-2">
                  <select name="searchType" id="selectField" class="form-select w-auto">
                    <option value="productCode" selected>품목코드</option>
                    <option value="productName">품목명</option>
                  </select>
                  <input type="text" name="searchValue" id="inputCode" class="form-control w-25">
                  <input type="submit" value="검색" class="btn btn-primary">
                </form>
              </th>
            </tr>

            <!-- 목록 헤더 -->
            <tr style="position: sticky; top: 56px; background-color: #fff; z-index: 2;">
              <th colspan="3">제품 목록</th>
              <th>
                <button type="button" class="btn btn-success btn-sm" onclick="openModal()">품목추가</button>
              </th>
            </tr>

            <!-- 실제 테이블 컬럼 헤더 -->
            <tr style="position: sticky; top: 96px; background-color: #fff; z-index: 1;">
              <thead style="background-color: #EDFFF4;">
              <th style="background-color: #EDFFF4;">품목코드</th>
              <th style="background-color: #EDFFF4;">품목명</th>
              <th style="background-color: #EDFFF4;">판매여부</th>
              <th style="background-color: #EDFFF4;">BOM</th>
            </tr>
          </thead>

          <tbody>
            <c:forEach var="product" items="${productList}">
              <c:if test="${product.productNo >= 1}">
                <tr>
                  <td>${product.productCode}</td>
                  <td>${product.productName}</td>
                  <td>
                    <c:choose>
                      <c:when test="${product.eop == 0}">판매예정</c:when>
                      <c:when test="${product.eop == 1}">판매중</c:when>
                      <c:when test="${product.eop == 2}">단종</c:when>
                      <c:otherwise>알 수 없음</c:otherwise>
                    </c:choose>
                  </td>
                  <td>
                      <button type="button" class="btn btn-primary btn-sm px-3 py-1" onclick="location.href='${contextPath}/product/product_bom?productNo=${product.productNo}'">보기</button>


                    
                  </td>
                </tr>
              </c:if>
            </c:forEach>
          </tbody>
        </table>
      </div>
    </div>
  </div>
</div>

<!-- 품목추가 모달 -->
<div id="productModal" class="modal" tabindex="-1" role="dialog" aria-labelledby="productModalLabel" aria-hidden="true" style="display: none;">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="productModalLabel">품목 추가</h5>
        <button type="button" class="close" onclick="closeModal()">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form action="${contextPath}/product/createProduct" method="post">
          <div class="form-group">
            <label for="productCode">품목코드</label>
            <input type="text" name="productCode" id="productCode" class="form-control" required>
          </div>
          <div class="form-group">
            <label for="productName">품목명</label>
            <input type="text" name="productName" id="productName" class="form-control" required>
          </div>
          <div class="form-group">
            <label for="eop">판매여부</label>
            <select name="eop" id="eop" class="form-control">
              <option value="0">판매예정</option>
              <option value="1">판매중</option>
              <option value="2">단종</option>
            </select>
          </div>
          <div class="form-group mt-4">
            <button type="submit" class="btn btn-success">저장</button>
            <button type="button" class="btn btn-secondary" onclick="closeModal()">닫기</button>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>

<%@ include file="../include/footer.jsp" %>

<script>
  function openModal() {
    document.getElementById("productModal").style.display = "block";
  }

  function closeModal() {
    document.getElementById("productModal").style.display = "none";
  }
</script>
</body>
</html>
