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
      <h3 class="fw-bold mb-4">거래처 정보 수정</h3>

      <div class="scroll-container" style="max-height: 600px; overflow-y: auto; border: 1px solid #ccc; padding: 10px; background-color: #fff;">
        <form action="${contextPath}/supplier/updateSupplier" method="post">
          <input type="hidden" name="supNo" value="${supplierDTO.supNo}" />
          <table class="table table-bordered text-center align-middle scroll-table" style="width: 100%; table-layout: fixed;">
            <tbody>
              <tr>
                <td class="label-cell" style="background-color: #EDFFF4;">*회사명</td>
                <td><input type="text" name="supName" class="form-control" value="${supplierDTO.supName}" required></td>
                <td class="label-cell" style="background-color: #EDFFF4;">*사업자등록번호</td>
                <input type="hidden" name="supRegNo" value="${supplierDTO.supRegNo}" />
                <td class="align-middle">${supplierDTO.supRegNo}</td>
              </tr>
              <tr><td colspan="4"></td></tr>
              <tr>
                <td class="label-cell" style="background-color: #EDFFF4;">*분류</td>
                <td><input type="text" name="supCategory" class="form-control" value="${supplierDTO.supCategory}" required></td>
                <td class="label-cell" style="background-color: #EDFFF4;">*대표명</td>
                <td><input type="text" name="supCeoName" class="form-control" value="${supplierDTO.supCeoName}" required></td>
              </tr>
              <tr>
                <td class="label-cell" style="background-color: #EDFFF4;">*회사 연락처</td>
                <td><input type="text" name="supPhone" class="form-control" value="${supplierDTO.supPhone}" required></td>
                <td class="label-cell" style="background-color: #EDFFF4;">*회사 메일</td>
                <td><input type="email" name="supEmail" class="form-control" value="${supplierDTO.supEmail}" required></td>
              </tr>
              <tr>
                <td class="label-cell" style="background-color: #EDFFF4;">*회사 주소</td>
                <td><input type="text" name="supAddr1" class="form-control" value="${supplierDTO.supAddr1}" required></td>
                <td class="label-cell">상세주소</td>
                <td><input type="text" name="supAddr2" class="form-control" value="${supplierDTO.supAddr2}"></td>
              </tr>
              <tr><td colspan="4"></td></tr>
              <tr>
                <td class="label-cell" style="background-color: #EDFFF4;">*담당자명</td>
                <td><input type="text" name="supCip" class="form-control" value="${supplierDTO.supCip}" required></td>
              </tr>
              <tr>
                <td class="label-cell" style="background-color: #EDFFF4;">*담당자 연락처</td>
                <td><input type="text" name="supCipPhone" class="form-control" value="${supplierDTO.supCipPhone}" required></td>
                <td class="label-cell" style="background-color: #EDFFF4;">*담당자 이메일</td>
                <td><input type="email" name="supCipEmail" class="form-control" value="${supplierDTO.supCipEmail}" required></td>
              </tr>
              <tr><td colspan="4"></td></tr>
              <tr>
                <td class="label-cell">거래처 아이디</td>
                <td><input type="text" name="supId" class="form-control" value="${supplierDTO.supId}" required></td>
                <td class="label-cell">거래처 비밀번호</td>
                <td><input type="text" name="supPassword" class="form-control" value="${supplierDTO.supPassword}" required></td>
              </tr>
              <tr><td colspan="4"></td></tr>
              <tr>
                <td class="label-cell">기타사항</td>
                <td colspan="3"><textarea name="supEtc" class="form-control">${supplierDTO.supEtc}</textarea></td>
              </tr>
            </tbody>
          </table>

          <div class="d-flex justify-content-center gap-3 mt-4">
            <button type="submit" class="btn btn-success">변경사항 등록</button>
            <button type="button" class="btn btn-secondary" onclick="history.back()">취소</button>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>

<%@ include file="../include/footer.jsp" %>
</body>
</html>
