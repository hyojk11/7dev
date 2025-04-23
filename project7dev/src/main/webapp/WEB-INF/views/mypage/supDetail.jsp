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
      <h3 class="fw-bold mb-4">마이페이지 - 상세정보</h3>
      <h5>정보 변경은 담당자에게 문의해 주시기 바랍니다</h5>

      <table class="table table-bordered text-center align-middle mt-4">
        <tbody>
        <thead style="background-color: #EDFFF4;">
          <tr>
            <th style="background-color: #EDFFF4;">회사명</th>
            <td colspan="2">${dto.sup_name}</td>
          </tr>
          <tr>
            <th style="background-color: #EDFFF4;">사업자 등록번호</th>
            <td colspan="2">${dto.sup_reg_no}</td>
          </tr>
          <tr>
            <th style="background-color: #EDFFF4;">대표명</th>
            <td colspan="2">${dto.sup_ceo_name}</td>
          </tr>
          <tr>
            <th style="background-color: #EDFFF4;">회사 연락처</th>
            <td colspan="2">${dto.sup_phone}</td>
          </tr>
          <tr>
            <th style="background-color: #EDFFF4;">회사 메일</th>
            <td colspan="2">${dto.sup_email}</td>
          </tr>
          <tr>
            <th style="background-color: #EDFFF4;">회사 주소</th>
            <td colspan="2">${dto.sup_total_addr}</td>
          </tr>
          <tr><td colspan="2"><br></td></tr>
          <tr>
            <th style="background-color: #EDFFF4;">담당자명</th>
            <td colspan="2">${dto.sup_cip}</td>
          </tr>
          <tr>
            <th style="background-color: #EDFFF4;">담당자 연락처</th>
            <td colspan="2">${dto.sup_cip_phone}</td>
          </tr>
          <tr>
            <th style="background-color: #EDFFF4;">담당자 이메일</th>
            <td colspan="2">${dto.sup_cip_email}</td>
          </tr>
        </tbody>
      </table>

      <div class="mt-4">
        <button type="button" class="btn btn-primary" onclick="location.href='${contextPath}/sup_main'">메인으로</button>
      </div>
    </div>
  </div>
</div>

<%@ include file="../include/footer.jsp" %>
</body>
</html>
