<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%@ page session="true" %>

<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8">
    <title>견적 관리</title>
    <link rel="stylesheet" href="${contextPath}/css/styles.css"> <!-- 공통 스타일 시트 포함 -->
    <style>
      .highlight-header {
        background-color: #EDFFF4 !important; /* 강제로 색상 적용 */
      }
    </style>
  </head>
  <body>
    <%@ include file="../include/header.jsp" %> <!-- 헤더 포함 -->

    <div class="container-fluid">
      <div class="row">
        <%@ include file="../include/left_column.jsp" %> <!-- 좌측 메뉴 포함 -->

        <!-- 메인 콘텐츠 영역 -->
        <div class="col-10 main" style="padding: 20px;">
          <h3 class="fw-bold mb-4">견적 관리</h3>

          <div class="scroll-container">
            <table class="table table-bordered text-center align-middle scroll-table">
              <thead class="sticky-row">
                <!-- 검색 영역 -->
                <tr style="position: sticky; top: 0; background-color: #fff; z-index: 3;">
                  <th colspan="7">
                    <form action="${contextPath}/quotation/quotation_main" method="get" class="d-flex justify-content-center align-items-center gap-2">
                      <select name="searchType" id="selectField" class="form-select w-auto">
                        <option value="quotCode" selected>견적코드</option>
                        <option value="materialCode">부품코드</option>
                        <option value="supName">거래처명</option>
                      </select>
                      <input type="text" name="searchValue" id="inputCode" class="form-control w-25">
                      <input type="submit" value="검색" class="btn btn-primary">
                    </form>
                  </th>
                </tr>

                <!-- 목록 헤더 -->
                <tr style="position: sticky; top: 56px; background-color: #fff; z-index: 2;">
                  <th colspan="4">견적 목록</th>
                  <th>
                    <form action="${contextPath}/quotation/selectMaterial">
                      <button type="submit" class="btn btn-success btn-sm">신규등록</button>
                    </form>
                  </th>
                </tr>

                <!-- 실제 테이블 컬럼 헤더 -->
                <tr style="position: sticky; top: 96px; background-color: #fff; z-index: 1;">
                  <th class="highlight-header">견적코드</th>
                  <th class="highlight-header">부품코드</th>
                  <th class="highlight-header">부품명</th>
                  <th class="highlight-header">회사명</th>
                  <th class="highlight-header">상세보기</th>
                </tr>
              </thead>

              <tbody>
                <c:forEach var="quotation" items="${quotationList}">
                  <tr>
                    <td>${quotation.quotCode}</td>
                    <td>${quotation.materialCode}</td>
                    <td>${quotation.materialName}</td>
                    <td>${quotation.supName}</td>
                    <td>
                      <form action="${contextPath}/quotation/selectQuotation" method="get">
                        <input type="hidden" name="quotNo" value="${quotation.quotNo}" />
                        <button type="submit" class="btn btn-primary btn-sm">보기</button>
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

    <%@ include file="../include/footer.jsp" %> <!-- 푸터 포함 -->
  </body>
</html>
