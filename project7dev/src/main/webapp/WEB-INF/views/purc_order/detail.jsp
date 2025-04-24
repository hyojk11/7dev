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
        <h3 class="fw-bold mb-4">구매발주서</h3>

        <div id="printArea">
          <table class="table table-bordered text-center">
          
            <tr>
              <td colspan="4">
                작성일 :
                <fmt:parseDate value="${dto.purc_order_reg_date}" pattern="yyyy-MM-dd HH:mm:ss" var="regDate" />
                <fmt:formatDate value="${regDate}" pattern="yyyy년 MM월 dd일 E요일" />
              </td>
              <td colspan="3">
                납기일 : ${dto.mrp_due_date}
              </td>
              <td colspan="3">
                발주번호 : ${dto.purc_order_code}
              </td>
            </tr>
            <tr>
              <th colspan="5" style="background-color: #EDFFF4;">공급자</td>
              <th colspan="5" style="background-color: #EDFFF4;">공급받는자</td>
            </tr>
            <tr>
            
              <th colspan="2" style="background-color: #EDFFF4;">등록번호</td>
              <td colspan="3">${dto.sup_reg_no}</td>
              <th colspan="2" style="background-color: #EDFFF4;">등록번호</td>
              <td colspan="3">${dto.comp_reg_no}</td>
            </tr>
            <tr>
              <th style="background-color: #EDFFF4;">상 호</th>
              <td>${dto.sup_name}</td>
              <th style="background-color: #EDFFF4;">성 명</th>
              <td colspan="2">${dto.sup_ceo_name}</td>
              <th style="background-color: #EDFFF4;">상 호</th>
              <td>${dto.comp_name}</td>
              <th style="background-color: #EDFFF4;">성 명</th>
              <td colspan="2">${dto.comp_ceo_name}</td>
            </tr>
            <tr>
            <span style="background-color: #EDFFF4;">
              <th style="background-color: #EDFFF4;">주 소</th>
              <td colspan="4">${dto.sup_total_addr}</td>
              <th style="background-color: #EDFFF4;">주 소</th>
              <td colspan="4">${dto.comp_total_addr}</td>
            </span>  
            </tr>
            <tr>
              <th style="background-color: #EDFFF4;">담당자</th>
              <td>${dto.sup_cip}</td>
              <th style="background-color: #EDFFF4;">담당자 이메일</th>
              <td colspan="2">${dto.sup_cip_email}</td>
              <th style="background-color: #EDFFF4;">담당자</th>
              <td>${dto.emp_name}</td>
              <th style="background-color: #EDFFF4;">담당자 이메일</th>
              <td colspan="2">${dto.emp_email}</td>
            </tr>
            <tr>
              <td colspan="10"><br></td>
            </tr>
            <tr>
            <div style="background-color: #EDFFF4;">
              <th style="background-color: #EDFFF4;">NO</th>
              <th style="background-color: #EDFFF4;">품목</th>
              <th style="background-color: #EDFFF4;">품목번호</th>
              <th style="background-color: #EDFFF4;">규격</th>
              <th style="background-color: #EDFFF4;">단위</th>
              <th style="background-color: #EDFFF4;">단가</th>
              <th style="background-color: #EDFFF4;">수량</th>
              <th style="background-color: #EDFFF4;">소계</th>
              <th style="background-color: #EDFFF4;">화폐단위</th>
              <th style="background-color: #EDFFF4;">비고</th>
            </div>
            </tr>

            <c:set var="totalCnt" value="0" />
            <c:set var="totalPrice" value="0" />

            <c:forEach var="data" items="${list}" varStatus="i">
              <tr>
                <td>${i.index+1}</td>
                <td>${data.material_name}</td>
                <td>${data.material_code}</td>
                <td>${data.material_description}</td>
                <td>${data.cont_material_sku}</td>
                <td>${data.cont_mprice}</td>
                <td>${data.cont_material_cnt}</td>
                <td>${data.total_price}</td>
                <td>${data.mprice_currency}</td>
                <td>${data.purc_order_etc}</td>
              </tr>

              <c:set var="totalCnt" value="${totalCnt + data.cont_material_cnt}" />
              <c:set var="totalPrice" value="${totalPrice + data.total_price}" />
            </c:forEach>

            <tr>
              <td colspan="6">합 계</td>
              <td>${totalCnt}</td>
              <td>${totalPrice}</td>
              <td colspan="2"></td>
            </tr>
          </table>
        </div>

        <div class="d-flex justify-content-between mt-4">
          <button class="btn btn-secondary" onclick="location.href='${contextPath}/purc_order/list'">이전으로</button>
          <div>
            <button class="btn btn-primary" onclick="window.print()">인쇄</button>
            <button class="btn btn-info" onclick="location.href='${contextPath}/contract/contract_main?searchType=contractNo&searchValue=${dto.cont_no}'">계약 상세</button>
          </div>
        </div>
      </div>
    </div>
  </div>

  <%@ include file="../include/footer.jsp" %> <!-- 푸터 포함 -->
</body>
</html>
