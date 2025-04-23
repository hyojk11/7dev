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

    <div class="col-10 main" style="padding: 20px;">
      <h3 class="fw-bold mb-3">견적 신규등록</h3>
      <p class="text-muted">*표시는 필수입력입니다.</p>

      <form action="${contextPath}/quotation/createQuotation" method="post" enctype="multipart/form-data">
      <input type="hidden" name="supNo" class="form-control" required value="${sessionScope.supNo}"/>
        <table class="table table-bordered text-center align-middle" style="table-layout: fixed;">
          <tbody>
            <tr>
              <th style="width: 20%; background-color: #EDFFF4;">*사업자등록번호</th>
              <td style="width: 30%;"><input type="text" name="supRegNo" class="form-control" required value="${sessionScope.supRegNo}" readonly></td>
              <th style="width: 20%; background-color: #EDFFF4;">*회사명</th>
              <td style="width: 30%;"><input type="text" name="supName" class="form-control" required value="${sessionScope.supName}" readonly></td>
            </tr>

            <tr>
              <th style="width: 20%; background-color: #EDFFF4;">견적서</th>
              <td style="width: 30%;"><input type="file" name="file" class="form-control"></td>
              <th style="width: 20%; background-color: #EDFFF4;">*인도조건</th>
              <td style="width: 30%;">
                <div class="form-check form-check-inline"><input class="form-check-input" type="radio" name="quotDterms" value="EXW" checked> EXW</div>
                <div class="form-check form-check-inline"><input class="form-check-input" type="radio" name="quotDterms" value="FCA"> FCA</div>
                <div class="form-check form-check-inline"><input class="form-check-input" type="radio" name="quotDterms" value="D2D"> D2D</div>
              </td>
            </tr>

            <tr>
              <th style="background-color: #EDFFF4;">*결제방법</th>
              <td>
                <div class="form-check form-check-inline"><input class="form-check-input" type="radio" name="paymentMethod" value="T/T" checked> T/T</div>
                <div class="form-check form-check-inline"><input class="form-check-input" type="radio" name="paymentMethod" value="L/C"> L/C</div>
                <div class="form-check form-check-inline"><input class="form-check-input" type="radio" name="paymentMethod" value="D/A"> D/A</div>
                <div class="form-check form-check-inline"><input class="form-check-input" type="radio" name="paymentMethod" value="현금"> 현금</div>
              </td>
              <th style="background-color: #EDFFF4;">*결제시기</th>
              <td>
                <div class="form-check"><input type="radio" name="paymentTiming" value="atSight" onclick="toggleDaysInput(false)" checked> at sight</div>
                <div class="form-check"><input type="radio" name="paymentTiming" value="inAdvance" onclick="toggleDaysInput(false)"> in advance</div>
                <div class="form-check d-flex align-items-center">
                  <input type="radio" name="paymentTiming" value="fewDaysAfterAcceptance" onclick="toggleDaysInput(true)">
                  <input type="number" id="daysInput" class="form-control ms-2" style="width: 60px;" disabled> days after acceptance
                </div>
                <input type="hidden" name="quotPterms" id="quotPterms">
              </td>
            </tr>

            <tr>
              <input type="hidden" name="materialNo" value="${material.materialNo}" />
              <th style="background-color: #EDFFF4;">*부품코드</th>
              <td><input type="text" class="form-control" name="materialCode" value="${material.materialCode}" readonly></td>
              <th style="background-color: #EDFFF4;">*부품명</th>
              <td><input type="text" class="form-control" name="materialName" value="${material.materialName}" readonly></td>
            </tr>

            <tr>
              <th style="background-color: #EDFFF4;">*소재</th>
              <td><input type="text" class="form-control" name="materialRawMaterial" value="${material.materialRawMaterial}" readonly></td>
              <th style="background-color: #EDFFF4;">*규격</th>
              <td>
                <div class="d-flex gap-2">
                  <input type="text" class="form-control" name="materialDescription" value="${material.materialDescription}" readonly>
                  <input type="text" class="form-control" style="width: 60px;" name="materialUnit" value="${material.materialUnit}" readonly>
                </div>
              </td>
            </tr>

            <tr>
              <th style="background-color: #EDFFF4;">*견적단가</th>
              <td>
                <div class="d-flex gap-2">
                  <input type="text" class="form-control" name="quotPrice" required>
                  <select name="quotPriceCurrency" class="form-select w-auto">
                    <option value="KRW" selected>KRW</option>
                    <option value="USD">USD</option>
                    <option value="CNY">CNY</option>
                    <option value="JPY">JPY</option>
                    <option value="EUR">EUR</option>
                  </select>
                </div>
              </td>
              <th style="background-color: #EDFFF4;">*수량</th>
              <td>
                <div class="d-flex gap-2">
                  <input type="text" class="form-control" name="quotMaterialCnt" required>
                  <select name="quotMaterialSku" class="form-select w-auto">
                    <option value="EA" selected>EA</option>
                    <option value="BOX">BOX</option>
                    <option value="PCS">PCS</option>
                    <option value="PK">PK</option>
                    <option value="SET">SET</option>
                  </select>
                </div>
              </td>
            </tr>

            <tr>
              <th style="background-color: #EDFFF4;">총 금액</th>
              <td colspan="1"><input type="text" class="form-control" disabled></td>
              <th style="background-color: #EDFFF4;">*납기일</th>
              <td><input type="date" class="form-control" name="quotDueDate"></td>
            </tr>

            <tr>
              <th style="background-color: #EDFFF4;">기타사항</th>
              <td colspan="3"><textarea name="supEtc" class="form-control" rows="3"></textarea></td>
            </tr>
          </tbody>
        </table>

        <div class="text-center mt-4">
          <button type="submit" class="btn btn-primary px-4">등록</button>
          <button type="button" class="btn btn-secondary px-4" onclick="history.back()">닫기</button>
        </div>
      </form>
    </div>
  </div>
</div>

<%@ include file="../include/footer.jsp" %>

<script>
  function toggleDaysInput(enabled) {
    const daysInput = document.getElementById('daysInput');
    daysInput.disabled = !enabled;
    if (!enabled) daysInput.value = '';
  }

  document.querySelector('form').addEventListener('submit', function (e) {
    const method = document.querySelector('input[name="paymentMethod"]:checked').value;
    const timingRadio = document.querySelector('input[name="paymentTiming"]:checked');
    let timing = timingRadio.value;

    if (timing === 'fewDaysAfterAcceptance') {
      const days = document.getElementById('daysInput').value;
      if (!days) {
        alert("날짜를 입력해주세요.");
        e.preventDefault();
        return;
      }
      timing = days + "days after acceptance";
    }

    document.getElementById('quotPterms').value = method + ", " + timing;
  });
</script>
</body>
</html>
