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
      <%@ include file="../include/left_column.jsp" %>

      <!-- 메인 콘텐츠 영역 -->
      <div class="col-10 main" style="padding: 20px;">
        <h3 class="fw-bold mb-4">품목정보</h3>

        <div class="scroll-container" style="max-height: 600px; overflow-y: auto; border: 1px solid #ccc; padding: 10px; background-color: #fff;">
          <table class="table table-bordered text-center align-middle scroll-table" style="width: 100%; table-layout: fixed;">
            <thead class="sticky-row">
              <!-- 검색 영역 -->
              <tr style="position: sticky; top: 0; background-color: #fff; z-index: 3;">
                <th colspan="4">
                  <form action="${contextPath}/prd_planning/searchProduct" method="get" class="d-flex justify-content-center align-items-center gap-2">
                    <select name="searchType" id="selectField" class="form-select w-auto">
                      <option value="product_code" selected>품목코드</option>
                      <option value="product_name">품목명</option>
                    </select>
                    <input type="text" name="keyword" id="inputCode" class="form-control w-25">
                    <input type="submit" value="검색" class="btn btn-primary">
                  </form>
                </th>
              </tr>

              <!-- 목록 헤더 -->
              <tr style="position: sticky; top: 56px; background-color: #fff; z-index: 2;">
                <th style="background-color: #EDFFF4;">품목코드</th>
                <th style="background-color: #EDFFF4;">품목명</th>
                <th style="background-color: #EDFFF4;">판매여부</th>
                <th style="background-color: #EDFFF4;">생산계획</th>
              </tr>
            </thead>

            <tbody>
              <c:forEach var="product" items="${list}">
                <c:if test="${product.product_no >= 1}">
                  <tr>
                    <td>${product.product_code}</td>
                    <td>${product.product_name}</td>
                    <td>
                      <c:choose>
                        <c:when test="${product.eop == 0}">판매예정</c:when>
                        <c:when test="${product.eop == 1}">판매중</c:when>
                        <c:when test="${product.eop == 2}">단종</c:when>
                        <c:otherwise>알 수 없음</c:otherwise>
                      </c:choose>
                    </td>
                    <td>
                      <form action="${contextPath}/prd_planning/register" method="get">
                        <input type="hidden" name="product_no" value="${product.product_no}" />
                        <input type="hidden" name="product_name" value="${product.product_name}" />
                        <input type="hidden" name="product_code" value="${product.product_code}" />
                        <button type="submit" class="btn btn-success btn-sm">등록</button>
                      </form>
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

  <!-- 모달 창 -->
  <div id="productModal" style="display:none; position:fixed; top:30%; left:40%; background:#fff; border:1px solid #000; padding:20px;">
    <form action="${contextPath}/prd_planning/registerSend" method="post">
      <label>품목코드: <input type="text" name="product_code" required></label><br>
      <label>품목명: <input type="text" name="product_name" required></label><br>
      <label>판매여부:
        <select name="eop">
          <option value="0">판매예정</option>
          <option value="1">판매중</option>
          <option value="2">단종</option>
        </select>
      </label><br>
      <button type="submit" class="btn btn-primary">저장</button>
      <button type="button" class="btn btn-secondary" onclick="closeModal()">닫기</button>
    </form>
  </div>

  <script>
    function openModal() {
      document.getElementById("productModal").style.display = "block";
    }

    function closeModal() {
      document.getElementById("productModal").style.display = "none";
    }
  </script>

<%@ include file="../include/footer.jsp" %>
</body>
</html>
