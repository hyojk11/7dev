<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page session="true" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">

<%@ include file="../include/header.jsp" %> <!-- 헤더 포함 -->

<body>
  <div class="container-fluid">
    <div class="row">
      <%@ include file="../include/left_column.jsp" %> <!-- 좌측 메뉴 포함 -->

      <!-- 메인 콘텐츠 영역 -->
      <div class="col-10 main" style="padding: 20px;">
        <h3 class="fw-bold mb-4">계약 상세보기</h3>

        <div id="printArea">
          <table class="table table-bordered text-center align-middle">
            <tr>
              <td class="table-success" style="width:15%; background-color: #EDFFF4;">사업자등록번호</td>
              <td style="width:35%;">${contract.supRegNo}</td>
              <td class="table-success" style="width:15%; background-color: #EDFFF4;">회사명</td>
              <td style="width:35%;">${contract.supName}</td>
            </tr>
            <tr>
              <td class="table-success" style="background-color: #EDFFF4;">계약일</td>
              <td>${contract.contDate}</td>
              <td class="table-success" style="background-color: #EDFFF4;">계약기간(년)</td>
              <td>${contract.contPeriod}</td>
            </tr>
            <tr>
              <td class="table-success" style="background-color: #EDFFF4;">담당자(거래처)</td>
              <td>${contract.supCip}</td>
              <td class="table-success" style="background-color: #EDFFF4;">담당자(당사)</td>
              <td>${contract.empName}</td>
            </tr>
            <tr><td colspan="4"></td></tr>
            <tr>
              <td class="table-success" style="background-color: #EDFFF4;">부품코드</td>
              <td>${contract.materialCode}</td>
              <td class="table-success" style="background-color: #EDFFF4;">부품명</td>
              <td>${contract.materialName}</td>
            </tr>
            <tr>
              <td class="table-success" style="background-color: #EDFFF4;">소재</td>
              <td>${contract.materialRawMaterial}</td>
              <td class="table-success" style="background-color: #EDFFF4;">규격</td>
              <td>${contract.materialDescription} (${contract.materialUnit})</td>
            </tr>
            <tr><td colspan="4"></td></tr>
            <tr>
              <td class="table-success" style="background-color: #EDFFF4;">부품단가</td>
              <td>${contract.contMprice} ${contract.mpriceCurrency}</td>
              <td class="table-success" style="background-color: #EDFFF4;">수량</td>
              <td>${contract.contMaterialCnt} ${contract.contMaterialSku}</td>
            </tr>
            <tr>
              <td class="table-success" style="background-color: #EDFFF4;">총 금액</td>
              <td>${contract.contMprice * contract.contMaterialCnt} ${contract.mpriceCurrency}</td>
              <td class="table-success" style="background-color: #EDFFF4;">최소주문수량</td>
              <td>${contract.contMaterialCnt}</td>
            </tr>
            <tr>
              <td class="table-success" style="background-color: #EDFFF4;">포장단위</td>
              <td>${contract.contMaterialSku}</td>
              <td class="table-success" style="background-color: #EDFFF4;">포장단위당 수량</td>
              <td>1</td>
            </tr>
            <tr><td colspan="4"></td></tr>
            <tr>
              <td class="table-success" style="background-color: #EDFFF4;">인도조건</td>
              <td>${contract.contDterms}</td>
              <td class="table-success" style="background-color: #EDFFF4;">리드타임(일)</td>
              <td>${contract.contLeadtime}</td>
            </tr>
            <tr>
              <td class="table-success" style="background-color: #EDFFF4;">결제방법</td>
              <td>${paymentMethod}</td>
              <td class="table-success" style="background-color: #EDFFF4;">결제시기</td>
              <td>${paymentTiming}</td>
            </tr>
            <tr><td colspan="4"></td></tr>
            <tr>
              <td class="table-success" style="background-color: #EDFFF4;">계약서</td>
              <td colspan="3"><a href="${contextPath}/resources/file/${contract.contFile}" target="_blank">${contract.contFile}</a></td>
            </tr>
          </table>
        </div>

        <div class="d-flex justify-content-between mt-4">
          <button class="btn btn-secondary" onclick="history.back()">이전으로</button>
          <div>
            <button class="btn btn-primary" onclick="window.print()">인쇄</button>
          </div>
        </div>
      </div>
    </div>
  </div>

  <%@ include file="../include/footer.jsp" %> <!-- 푸터 포함 -->
</body>
</html>
