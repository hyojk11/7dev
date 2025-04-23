<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="ko">
<%@ include file="../include/header.jsp" %>

<body>
<div class="container-fluid">
  <div class="row">
    <%@ include file="../include/left_column.jsp" %>

    <!-- 메인 콘텐츠 영역 -->
    <div class="col-10 main" style="padding: 20px;">
      <h3 class="fw-bold mb-4">계약 신규등록</h3>
      <h6>*모든 항목 필수입력</h6>
      <form action="${contextPath}/contract/createContract" method="post" enctype="multipart/form-data">
        <table class="table table-bordered text-center align-middle" style="width: 100%; table-layout: fixed;">
          <tbody>
            <input type="hidden" name="quotNo" value="${quotation.quotNo}">
            <tr>
              <input type="hidden" name="supNo" value="${quotation.supNo}" />
              <td class="label-cell" style="width: 15%; background-color: #EDFFF4;">사업자등록번호</td>
              <td style="width: 35%;"><input type="text" name="supRegNo" style="width: 90%;" value="${quotation.supRegNo}" readonly></td>
              <td class="label-cell" style="width: 15%; background-color: #EDFFF4;">회사명</td>
              <td style="width: 35%;"><input type="text" name="supName" style="width: 90%;" value="${quotation.supName}" readonly></td>
            </tr>
            <tr>
              <td class="label-cell" style="width: 15%; background-color: #EDFFF4;">계약일</td>
              <td style="width: 35%;"><input type="date" name="contDate" id="contDate" style="width: 80%; box-sizing: border-box;"></td>
              <td class="label-cell" style="width: 15%; background-color: #EDFFF4;">계약기간(년)</td>
              <td style="width: 35%;"><input type="number" name="contPeriod" id="contPeriod" style="width: 90%; box-sizing: border-box;" required></td>
            </tr>
            <tr>
              <td class="label-cell" style="width: 15%; background-color: #EDFFF4;">담당자(거래처)</td>
              <td style="width: 35%;"><input type="text" name="supCip" style="width: 90%;" value="${supplier.supCip}" readonly></td>
              <td class="label-cell" style="width: 15%; background-color: #EDFFF4;">담당자(당사)</td>
              <td style="width: 35%;">허재연</td>
              <input type="hidden" name="empNo" value="2">
            </tr>
            <tr>
              <td colspan="4"></td>
            </tr>
            <tr>
              <td class="label-cell" style="width: 15%; background-color: #EDFFF4;">견적서</td>
              <td style="width: 35%;">${quotation.quotFile}</td>
            </tr>
            <tr>
              <td colspan="4"></td>
            </tr>
            <tr>
              <input type="hidden" name="materialNo" value="${quotation.materialNo}">
              <td class="label-cell" style="width: 15%; background-color: #EDFFF4;">부품코드</td>
              <td style="width: 35%;"><input type="text" name="materialCode" style="width: 90%;" value="${quotation.materialCode}" readonly></td>
              <td class="label-cell" style="width: 15%; background-color: #EDFFF4;">부품명</td>
              <td style="width: 35%;"><input type="text" name="materialName" style="width: 90%;" value="${quotation.materialName}" readonly></td>
            </tr>
            <tr>
              <td class="label-cell" style="width: 15%; background-color: #EDFFF4;">소재</td>
              <td style="width: 35%;"><input type="text" name="materialRawMaterial" style="width: 90%;" value="${quotation.materialRawMaterial}" readonly></td>
              <td class="label-cell" style="width: 15%; background-color: #EDFFF4;">규격</td>
              <td style="width: 35%;"><input type="text" name="materialDescription" value="${quotation.materialDescription}" readonly><input type="text" name="materialUnit" size="1" value="${quotation.materialUnit}" readonly></td>
            </tr>
            <tr>
              <td colspan="4"></td>
            </tr>
            <tr>
              <td class="label-cell" style="width: 15%; background-color: #EDFFF4;">부품단가</td>
              <td style="width: 35%;"><label><input type="text" name="contMprice" value="${quotation.quotPrice}" required></label>
                <select name="mpriceCurrency" id="selectField">
                  <option value="KRW" <c:if test="${quotation.quotPriceCurrency == 'KRW'}">selected</c:if>>KRW</option>
                  <option value="USD" <c:if test="${quotation.quotPriceCurrency == 'USD'}">selected</c:if>>USD</option>
                  <option value="CNY" <c:if test="${quotation.quotPriceCurrency == 'CNY'}">selected</c:if>>CNY</option>
                  <option value="JPY" <c:if test="${quotation.quotPriceCurrency == 'JPY'}">selected</c:if>>JPY</option>
                  <option value="EUR" <c:if test="${quotation.quotPriceCurrency == 'EUR'}">selected</c:if>>EUR</option>
                </select>
              </td>
              <td class="label-cell" style="width: 15%; background-color: #EDFFF4;">수량</td>
              <td style="width: 35%;"><label><input type="text" name="contMaterialCnt" value="${quotation.quotMaterialCnt}" required></label>
                <select name="contMaterialSku" id="selectField">
                  <option value="EA" <c:if test="${quotation.quotMaterialSku == 'EA'}">selected</c:if>>EA</option>
                  <option value="BOX" <c:if test="${quotation.quotMaterialSku == 'BOX'}">selected</c:if>>BOX</option>
                  <option value="PCS" <c:if test="${quotation.quotMaterialSku == 'PCS'}">selected</c:if>>PCS</option>
                  <option value="PK" <c:if test="${quotation.quotMaterialSku == 'PK'}">selected</c:if>>PK</option>
                  <option value="SET" <c:if test="${quotation.quotMaterialSku == 'SET'}">selected</c:if>>SET</option>
                </select>
              </td>
            </tr>
            <tr>
              <td class="label-cell" style="width: 15%; background-color: #EDFFF4;">총 금액</td>
              <td style="width: 35%;"><input type="text" id="totalPrice" value="${quotation.quotPrice * quotation.quotMaterialCnt}" disabled>
                <input type="text" size="1" id="currencyDisplay" value="${quotation.quotPriceCurrency}" disabled></td>
              <td class="label-cell" style="width: 15%; background-color: #EDFFF4;">최소주문수량</td>
              <td style="width: 35%;">${quotation.quotMaterialCnt}</td>
            </tr>
            <tr>
              <td class="label-cell" style="width: 15%; background-color: #EDFFF4;">포장단위</td>
              <td style="width: 35%;">${quotation.quotMaterialSku}</td>
              <td class="label-cell" style="width: 15%; background-color: #EDFFF4;">포장단위당 수량</td>
              <td style="width: 35%;">1</td>
            </tr>
            <tr>
              <td colspan="4"></td>
            </tr>
            <tr>
              <td class="label-cell" style="width: 15%; background-color: #EDFFF4;">인도조건</td>
              <td style="width: 35%;">${quotation.quotDterms}</td>
              <input type="hidden" name="contDterms" value="${quotation.quotDterms}">
              <td class="label-cell" style="width: 15%; background-color: #EDFFF4;">리드타임(일)</td>
              <td style="width: 35%;"><input type="number" name="contLeadtime" id="contLeadtime" style="width: 90%; box-sizing: border-box;" required></td>
            </tr>
            <tr>
              <td class="label-cell" style="width: 15%; background-color: #EDFFF4;">결제방법</td>
              <td style="width: 35%;">${paymentMethod}</td>
              <td class="label-cell" style="width: 15%; background-color: #EDFFF4;">결제시기</td>
              <td style="width: 35%;">${paymentTiming}</td>
              <input type="hidden" name="contPterms" id="contPterms">
            </tr>
            <tr>
              <td colspan="4"></td>
            </tr>
            <tr>
              <td class="label-cell" style="width: 15%; background-color: #EDFFF4;">계약서</td>
              <td style="width: 35%;"><input type="file" name="file" style="width: 90%; box-sizing: border-box;"></td>
            </tr>
          </tbody>
        </table>

        <div style="text-align: center; margin-top: 20px;">
          <button type="submit" class="btn btn-success">등록</button>
          <button type="button" class="btn btn-secondary" onclick="history.back()">닫기</button>
        </div>
      </form>
    </div>
  </div>
</div>

<%@ include file="../include/footer.jsp" %>

<script>
