<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8">
    <title>견적 상세보기</title>
    <link rel="stylesheet" href="${contextPath}/css/styles.css"> <!-- 공통 스타일 시트 포함 -->
  </head>

  <body>
    <%@ include file="../include/header.jsp" %> <!-- 헤더 포함 -->

    <div class="container-fluid">
      <div class="row">
        <%@ include file="../include/left_column.jsp" %> <!-- 사이드바 포함 -->

        <!-- 메인 콘텐츠 영역 -->
        <div class="col-10 main" style="padding: 20px;">
          <h3 class="fw-bold mb-4">견적 상세보기</h3>

          <form action="${contextPath}/quotation/getUpdateQuotation" method="get">
            <input type="hidden" name="quotNo" value="${quotation.quotNo}" />
            <table class="table table-bordered table-striped text-center align-middle">
              <tbody>
                <tr>
                <thead style="background-color: #EDFFF4;">
                  <td class="label-cell" style="background-color: #EDFFF4;">견적코드</td>
                  <td>${quotation.quotCode}</td>
                  <td class="label-cell" style="background-color: #EDFFF4;">계약확정여부</td>
                  <td>
                    <c:if test="${quotation.quotState == '0'}">미확정</c:if>
                    <c:if test="${quotation.quotState == '1'}">확정</c:if>
                  </td>
                </tr>
                <tr>
                <thead style="background-color: #EDFFF4;">
                  <td class="label-cell" style="background-color: #EDFFF4;">사업자등록번호</td>
                  <td>${quotation.supRegNo}</td>
                  <td class="label-cell" style="background-color: #EDFFF4;">회사명</td>
                  <td>${quotation.supName}</td>
                </tr>
                <tr>
                <thead style="background-color: #EDFFF4;">
                  <td class="label-cell" style="background-color: #EDFFF4;">견적서</td>
                  <td><a href="${contextPath}/resources/file/${quotation.quotFile}" target="_blank">${quotation.quotFile}</a></td>
                  <td class="label-cell" style="background-color: #EDFFF4;">인도조건</td>
                  <td>${quotation.quotDterms}</td>
                </tr>
                <tr>
                <thead style="background-color: #EDFFF4;">
                  <td class="label-cell" style="background-color: #EDFFF4;">결제방법</td>
                  <td>${paymentMethod}</td>
                  <td class="label-cell" style="background-color: #EDFFF4;">결제시기</td>
                  <td>${paymentTiming}</td>
                </tr>
                <tr>
                  <td class="label-cell" style="background-color: #EDFFF4;">부품코드</td>
                  <td>${quotation.materialCode}</td>
                  <td class="label-cell" style="background-color: #EDFFF4;">부품명</td>
                  <td>${quotation.materialName}</td>
                </tr>
                <tr>
                  <td class="label-cell" style="background-color: #EDFFF4;">소재</td>
                  <td>${quotation.materialRawMaterial}</td>
                  <td class="label-cell" style="background-color: #EDFFF4;">규격</td>
                  <td>${quotation.materialDescription}${quotation.materialUnit}</td>
                </tr>
                <tr>
                  <td class="label-cell" style="background-color: #EDFFF4;">견적단가</td>
                  <td>${quotation.quotPrice}${quotation.quotPriceCurrency}</td>
                  <td class="label-cell" style="background-color: #EDFFF4;">수량</td>
                  <td>${quotation.quotMaterialCnt}${quotation.quotMaterialSku}</td>
                </tr>
                <tr>
                  <td class="label-cell" style="background-color: #EDFFF4;">총 금액</td>
                  <td>${quotation.quotPrice * quotation.quotMaterialCnt}${quotation.quotPriceCurrency}</td>
                  <td class="label-cell" style="background-color: #EDFFF4;">납기일</td>
                  <td><c:out value="${quotation.quotDueDate.substring(0, 10)}" /></td>
                </tr>
                <tr>
                  <td class="label-cell" style="background-color: #EDFFF4;">기타사항</td>
                  <td colspan="3">${quotation.quotEtc}</td>
                </tr>
              </tbody>
            </table>

            <div class="text-center mt-4">
              <button type="submit" class="btn btn-success">수정</button>
              <button type="button" class="btn btn-secondary" onclick="history.back()">닫기</button>
            </div>
          </form>
        </div>
      </div>
    </div>

    <%@ include file="../include/footer.jsp" %> <!-- 푸터 포함 -->
  </body>
</html>
