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
      <h3 class="fw-bold mb-4">견적 수정</h3>

      <div class="scroll-container" style="max-height: 600px; overflow-y: auto; border: 1px solid #ccc; padding: 20px; background-color: #fff;">
        <form action="${contextPath}/quotation/updateQuotation" method="post" enctype="multipart/form-data">
          <input type="hidden" name="quotNo" value="${quotation.quotNo}"/>
          <table class="table table-bordered align-middle text-center" style="table-layout: fixed;">
            <tbody>
              <tr>
                <th style="width: 20%; background-color: #EDFFF4;">견적코드</th>
                <td style="width: 30%;"><input type="text" class="form-control" name="quotCode" value="${quotation.quotCode}" readonly></td>
                <th style="width: 20%; background-color: #EDFFF4;">계약확정여부</th>
                <td style="width: 30%;">
                  <c:choose>
                    <c:when test="${quotation.quotState == '0'}">미확정</c:when>
                    <c:when test="${quotation.quotState == '1'}">확정</c:when>
                  </c:choose>
                </td>
              </tr>

              <tr>
              <thead style="background-color: #EDFFF4;">
                <th style="background-color: #EDFFF4;">사업자등록번호</th>
                <td><input type="text" class="form-control" name="supRegNo" value="${quotation.supRegNo}" /></td>
                <th style="background-color: #EDFFF4;">회사명</th>
                <td><input type="text" class="form-control" name="supName" value="${quotation.supName}" /></td>
              </thead>
              </tr>
              <tr>
                <th style="background-color: #EDFFF4;">견적서</th>
                <td>
                  <input type="file" name="file" class="form-control"/>
                  <c:if test="${not empty quotation.quotFile}">
                    <a href="${contextPath}/resources/file/${quotation.quotFile}" target="_blank" class="d-block mt-2">${quotation.quotFile}</a>
                  </c:if>
                  <input type="hidden" name="existingFile" value="${quotation.quotFile}" />
                </td>
                <th style="background-color: #EDFFF4;">인도조건</th>
                <td>
                  <div class="form-check form-check-inline">
                    <input type="radio" name="quotDterms" value="EXW" class="form-check-input" <c:if test="${quotation.quotDterms == 'EXW'}">checked</c:if> required> EXW
                  </div>
                  <div class="form-check form-check-inline">
                    <input type="radio" name="quotDterms" value="FCA" class="form-check-input" <c:if test="${quotation.quotDterms == 'FCA'}">checked</c:if>> FCA
                  </div>
                  <div class="form-check form-check-inline">
                    <input type="radio" name="quotDterms" value="D2D" class="form-check-input" <c:if test="${quotation.quotDterms == 'D2D'}">checked</c:if>> D2D
                  </div>
                </td>
              </tr>

              <tr>
                <th style="background-color: #EDFFF4;">결제방법</th>
                <td colspan="3">
                  <div class="form-check form-check-inline">
                    <input type="radio" name="paymentMethod" value="T/T" class="form-check-input" <c:if test="${paymentMethod == 'T/T'}">checked</c:if> required> T/T
                  </div>
                  <div class="form-check form-check-inline">
                    <input type="radio" name="paymentMethod" value="L/C" class="form-check-input" <c:if test="${paymentMethod == 'L/C'}">checked</c:if>> L/C
                  </div>
                  <div class="form-check form-check-inline">
                    <input type="radio" name="paymentMethod" value="D/A" class="form-check-input" <c:if test="${paymentMethod == 'D/A'}">checked</c:if>> D/A
                  </div>
                  <div class="form-check form-check-inline">
                    <input type="radio" name="paymentMethod" value="현금" class="form-check-input" <c:if test="${paymentMethod == '현금'}">checked</c:if>> 현금
                  </div>
                </td>
              </tr>

              <tr>
                <th style="background-color: #EDFFF4;">결제시기</th>
                <td colspan="3">
                  <div class="form-check form-check-inline">
                    <input type="radio" name="paymentTiming" value="atSight" class="form-check-input" <c:if test="${paymentTiming == 'atSight'}">checked</c:if> onclick="toggleDaysInput(false)"> at sight
                  </div>
                  <div class="form-check form-check-inline">
                    <input type="radio" name="paymentTiming" value="inAdvance" class="form-check-input" <c:if test="${paymentTiming == 'inAdvance'}">checked</c:if> onclick="toggleDaysInput(false)"> in advance
                  </div>
                  <div class="form-check form-check-inline">
                    <input type="radio" name="paymentTiming" value="fewDaysAfterAcceptance" class="form-check-input" <c:if test="${paymentTiming == 'fewDaysAfterAcceptance'}">checked</c:if> onclick="toggleDaysInput(true)">
                    <input type="number" id="daysInput" name="days" style="width: 60px;" value="${days}" <c:if test="${paymentTiming != 'fewDaysAfterAcceptance'}">disabled</c:if>> days after acceptance
                  </div>
                  <input type="hidden" name="quotPterms" id="quotPterms">
                </td>
              </tr>

              <tr>
                <input type="hidden" name="materialNo" value="${quotation.materialNo}" />
                <th style="background-color: #EDFFF4;">부품코드</th>
                <td>${quotation.materialCode}</td>
                <th style="background-color: #EDFFF4;">부품명</th>
                <td>${quotation.materialName}</td>
              </tr>

              <tr>
                <th style="background-color: #EDFFF4;">소재</th>
                <td>${quotation.materialRawMaterial}</td>
                <th style="background-color: #EDFFF4;">규격</th>
                <td>${quotation.materialDescription}${quotation.materialUnit}</td>
              </tr>

              <tr>
                <th style="background-color: #EDFFF4;">견적단가</th>
                <td>
                  <input type="text" name="quotPrice" class="form-control" value="${quotation.quotPrice}" required>
                  <select name="quotPriceCurrency" class="form-select mt-2">
                    <option value="KRW" <c:if test="${quotation.quotPriceCurrency == 'KRW'}">selected</c:if>>KRW</option>
                    <option value="USD" <c:if test="${quotation.quotPriceCurrency == 'USD'}">selected</c:if>>USD</option>
                    <option value="CNY" <c:if test="${quotation.quotPriceCurrency == 'CNY'}">selected</c:if>>CNY</option>
                    <option value="JPY" <c:if test="${quotation.quotPriceCurrency == 'JPY'}">selected</c:if>>JPY</option>
                    <option value="EUR" <c:if test="${quotation.quotPriceCurrency == 'EUR'}">selected</c:if>>EUR</option>
                  </select>
                </td>
                <th style="background-color: #EDFFF4;">수량</th>
                <td>
                  <input type="text" name="quotMaterialCnt" class="form-control" value="${quotation.quotMaterialCnt}" required>
                  <select name="quotMaterialSku" class="form-select mt-2">
                    <option value="EA" <c:if test="${quotMaterialSku == 'EA'}">selected</c:if>>EA</option>
                    <option value="BOX" <c:if test="${quotMaterialSku == 'BOX'}">selected</c:if>>BOX</option>
                    <option value="PCS" <c:if test="${quotMaterialSku == 'PCS'}">selected</c:if>>PCS</option>
                    <option value="PK" <c:if test="${quotMaterialSku == 'PK'}">selected</c:if>>PK</option>
                    <option value="SET" <c:if test="${quotMaterialSku == 'SET'}">selected</c:if>>SET</option>
                  </select>
                </td>
              </tr>

              <tr>
                <th style="background-color: #EDFFF4;">총 금액</th>
                <td>
                  <input type="text" id="totalPrice" class="form-control d-inline-block w-75" value="${quotation.quotPrice * quotation.quotMaterialCnt}" disabled>
                  <input type="text" size="1" id="currencyDisplay" value="${quotation.quotPriceCurrency}" class="form-control d-inline-block w-25" disabled>
                </td>
                <th style="background-color: #EDFFF4;">납기일</th>
                <td><input type="date" name="quotDueDate" class="form-control" value="${quotation.quotDueDate.substring(0, 10)}" required></td>
              </tr>

              <tr>
                <th style="background-color: #EDFFF4;">기타사항</th>
                <td colspan="3"><textarea name="quotEtc" class="form-control" rows="3">${quotation.quotEtc}</textarea></td>
              </tr>

              <tr>
                <td colspan="4">
                  <button type="submit" class="btn btn-primary">저장</button>
                  <a href="${contextPath}/quotation/quotation_main" class="btn btn-secondary">취소</a>
                </td>
              </tr>
            </tbody>
          </table>
        </form>
      </div>
    </div>
  </div>
</div>

<%@ include file="../include/footer.jsp" %>

<script>
  function toggleDaysInput(enabled) {
    const input = document.getElementById('daysInput');
    input.disabled = !enabled;
    if (!enabled) input.value = '';
  }
</script>
</body>
</html>
