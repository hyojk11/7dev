<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%@ include file="../include/header.jsp" %>
<body>
<div class="container-fluid">
  <div class="row">
    <%@ include file="../include/left_column.jsp" %>

    <!-- 메인 콘텐츠 영역 -->
    <div class="col-10 main" style="padding: 20px;">
      <h3 class="fw-bold mb-4">거래처 관리</h3>

      <div class="scroll-container" style="max-height: 600px; overflow-y: auto; border: 1px solid #ccc; padding: 10px; background-color: #fff;">
        <table class="table table-bordered text-center align-middle scroll-table" style="width: 100%; table-layout: fixed;">
          <tbody>
            <tr>
              <td class="label-cell" style="background-color: #EDFFF4;">*회사명</td>
              <td>${supplierDTO.supName}</td>
              <td class="label-cell" style="background-color: #EDFFF4;">*사업자등록번호</td>
              <td>${supplierDTO.supRegNo}</td>
            </tr>
            <tr>
              <td colspan="4"></td>
            </tr>
            <tr>
              <td class="label-cell" style="background-color: #EDFFF4;">*분류</td>
              <td>${supplierDTO.supCategory}</td>
              <td class="label-cell" style="background-color: #EDFFF4;">*대표명</td>
              <td>${supplierDTO.supCeoName}</td>
            </tr>
            <tr>
              <td class="label-cell" style="background-color: #EDFFF4;">*회사 연락처</td>
              <td>${supplierDTO.supPhone}</td>
              <td class="label-cell" style="background-color: #EDFFF4;">*회사 메일</td>
              <td>${supplierDTO.supEmail}</td>
            </tr>
            <tr>
              <td class="label-cell" style="background-color: #EDFFF4;">*회사 주소</td>
              <td>${supplierDTO.supAddr1}</td>
              <td class="label-cell" style="background-color: #EDFFF4;">상세주소</td>
              <td>${supplierDTO.supAddr2}</td>
            </tr>
            <tr>
              <td colspan="4"></td>
            </tr>
            <tr>
              <td class="label-cell" style="background-color: #EDFFF4;">*담당자명</td>
              <td>${supplierDTO.supCip}</td>
            </tr>
            <tr>
              <td class="label-cell" style="background-color: #EDFFF4;">*담당자 연락처</td>
              <td>${supplierDTO.supCipPhone}</td>
              <td class="label-cell" style="background-color: #EDFFF4;">*담당자 이메일</td>
              <td>${supplierDTO.supCipEmail}</td>
            </tr>
            <tr>
              <td colspan="4"></td>
            </tr>
            <tr>
              <td class="label-cell">거래처 아이디</td>
              <td>${supplierDTO.supId}</td>
              <td class="label-cell">거래처 비밀번호</td>
              <td>${supplierDTO.supPassword}</td>
            </tr>
            <tr>
              <td colspan="4"></td>
            </tr>
            <tr>
              <td class="label-cell">기타사항</td>
              <td colspan="3">${supplierDTO.supEtc}</td>
            </tr>
          </tbody>
        </table>

        <div class="d-flex justify-content-center gap-3 mt-4">
          <form action="${contextPath}/supplier/getUpdateSupplier">
            <input type="hidden" name="supNo" value="${supplierDTO.supNo}" />
            <button type="submit" class="btn btn-warning">수정</button>
          </form>
          <form action="${contextPath}/supplier/deleteSupplier" method="post">
            <input type="hidden" name="supNo" value="${supplierDTO.supNo}" />
            <button type="submit" class="btn btn-danger">삭제</button>
          </form>
          <form action="${contextPath}/supplier/supplier_main">
            <button type="submit" class="btn btn-secondary">뒤로</button>
          </form>
        </div>
      </div>
    </div>
  </div>
</div>

<%@ include file="../include/footer.jsp" %>

</body>
</html>
