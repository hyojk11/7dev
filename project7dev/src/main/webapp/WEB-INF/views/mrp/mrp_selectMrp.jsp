<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page session="true"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<%@ include file="../include/header.jsp" %>
<body>
<div class="container-fluid">
  <div class="row">
    <%@ include file="../include/left_column.jsp" %>

    <div class="col-10 main" style="padding: 20px;">
      <h3 class="fw-bold mb-4">자재소요계획 등록</h3>

      <table class="table table-bordered align-middle">
        <tbody>
          <tr>
            <th style="width: 15%; background-color: #EDFFF4;" class="table-success">제품명</th>
            <td style="width: 35%;">${mrp.productName}</td>
            <th style="width: 15%; background-color: #EDFFF4;" class="table-success">제품코드</th>
            <td style="width: 35%;">${mrp.productCode}</td>
          </tr>
          <tr>
            <input type="hidden" name="mrpDueDate" value="${mrp.mrpDueDate}"/>
            <th class="table-success" style="background-color: #EDFFF4;">자재납기일</th>
            <td colspan="3">${mrp.mrpDueDate}</td>
          </tr>
        </tbody>
      </table>

      <div class="border rounded p-2 mb-3" style="max-height: 400px; overflow-y: auto;">
        <table class="table table-bordered text-center mb-0">
          <thead class="table-light position-sticky top-0">
            <tr>
              <th colspan="6" class="table-success" style="background-color: #FFFFFF;">소요자재 목록</th>
            </tr>
            <tr>
              <th style="background-color: #EDFFF4;">자재명</th>
              <th style="background-color: #EDFFF4;">자재코드</th>
              <th style="background-color: #EDFFF4;">자재창고</th>
              <th style="background-color: #EDFFF4;">순소요량</th>
              <th style="background-color: #EDFFF4;">포장단위</th>
              <th style="background-color: #EDFFF4;">리드타임(일)</th>
            </tr>
          </thead>
          <tbody>
            <c:forEach var="mrpList" items="${mrpList}">
              <tr>
                <td>${mrpList.materialName}</td>
                <td>${mrpList.materialCode}</td>
                <td>${mrpList.mstorageCode}</td>
                <td>${mrpList.mrpQuantity}</td>
                <td>${mrpList.mrpSku}</td>
                <td>${mrpList.mrpLeadtime}</td>
              </tr>
            </c:forEach>
          </tbody>
        </table>
      </div>

      <table class="table table-bordered align-middle">
        <tbody>
          <tr>
            <th class="table-success" style="width: 15%; background-color: #EDFFF4;">사원번호</th>
            <td style="width: 35%;">${mrp.empNo}</td>
            <th class="table-success" style="width: 15%; background-color: #EDFFF4;">담당자명</th>
            <td style="width: 35%;">${mrp.empName}</td>
          </tr>
          <tr>
            <th class="table-success" style="background-color: #EDFFF4;">담당자 연락처</th>
            <td>${mrp.empPhone}</td>
            <th class="table-success" style="background-color: #EDFFF4;">담당자 메일</th>
            <td>${mrp.empEmail}</td>
          </tr>
          <tr>
            <th class="table-success" style="background-color: #EDFFF4;">기타사항</th>
            <td colspan="3">${mrp.mrpEtc}</td>
          </tr>
        </tbody>
      </table>

      <div class="d-flex justify-content-center gap-2 mt-3">
        <button type="button" class="btn btn-secondary" onclick="history.back()">닫기</button>
      </div>
    </div>
  </div>
</div>

<%@ include file="../include/footer.jsp" %>
</body>
</html>
