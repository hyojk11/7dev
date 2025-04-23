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
          <thead class="sticky-row">
            <!-- 검색 영역 -->
            <tr style="position: sticky; top: 0; background-color: #fff; z-index: 3;">
              <th colspan="7">
                <form action="${contextPath}/supplier/supplier_main" method="get" class="d-flex justify-content-center align-items-center gap-2">
                  <select name="searchType" id="selectField" class="form-select w-auto">
                    <option value="supName" selected>거래처명</option>
                    <option value="supRegNo" >사업자등록번호</option>
                  </select>
                  <input type="text" name="searchValue" id="inputCode" class="form-control w-25">
                  <input type="submit" value="검색" class="btn btn-primary">
                </form>
              </th>
            </tr>

            <!-- 목록 헤더 -->
            <tr style="position: sticky; top: 56px; background-color: #fff; z-index: 2;">
              <th colspan="6">거래처 목록</th>
              <th><button type="button" class="btn btn-success btn-sm" onclick="openNewSupplierModal()">신규등록</button></th>
            </tr>

            <!-- 실제 테이블 컬럼 헤더 -->
            <tr style="position: sticky; top: 96px; background-color: #EDFFF4; z-index: 1;">
              <th style="background-color: #EDFFF4;">사업자등록번호</th>
              <th style="background-color: #EDFFF4;">회사명</th>
              <th style="background-color: #EDFFF4;">분류</th>
              <th style="background-color: #EDFFF4;">회사 연락처</th>
              <th style="background-color: #EDFFF4;">회사 메일</th>
              <th style="background-color: #EDFFF4;">회사 주소</th>
              <th style="background-color: #EDFFF4;">대표명</th>
            </tr>
          </thead>
          
          <tbody>
            <c:forEach var="supplier" items="${supplierList}">
              <c:if test="${supplier.supNo >= 1}">
                <tr>
                  <td>${supplier.supRegNo}</td>
                  <td style="cursor: pointer; color: blue; text-decoration: underline;">
                    <a href="${contextPath}/supplier/getSupplierBySupNo?supNo=${supplier.supNo}">${supplier.supName}</a>
                  </td>
                  <td>${supplier.supCategory}</td>
                  <td>${supplier.supPhone}</td>
                  <td>${supplier.supEmail}</td>
                  <td>${supplier.supAddr1} ${supplier.supAddr2}</td>
                  <td>${supplier.supCeoName}</td>
                </tr>
              </c:if>
            </c:forEach>
          </tbody>
        </table>
      </div>
    </div>
  </div>
</div>

<!-- 거래처등록 모달 -->
<div id="newSupplierModal" class="modal" tabindex="-1" role="dialog" aria-labelledby="newSupplierModalLabel" aria-hidden="true" style="display: none;">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="newSupplierModalLabel">거래처 신규등록</h5>
        <button type="button" class="close" onclick="closeNewSupplierModal()">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form action="${contextPath}/supplier/createSupplier" method="post">
          <div class="form-group">
            <label for="supName">*회사명</label>
            <input type="text" name="supName" class="form-control" required>
          </div>
          <div class="form-group">
            <label for="supRegNo">*사업자등록번호</label>
            <input type="text" name="supRegNo" class="form-control" required>
          </div>
          <div class="form-group">
            <label for="supCategory">*분류</label>
            <input type="text" name="supCategory" class="form-control" required>
          </div>
          <div class="form-group">
            <label for="supPhone">*회사 연락처</label>
            <input type="text" name="supPhone" class="form-control" required>
          </div>
          <div class="form-group">
            <label for="supEmail">*회사 메일</label>
            <input type="email" name="supEmail" class="form-control" required>
          </div>
          <div class="form-group">
            <label for="supAddr1">*회사 주소</label>
            <input type="text" name="supAddr1" class="form-control" required>
          </div>
          <div class="form-group">
            <label for="supAddr2">상세주소</label>
            <input type="text" name="supAddr2" class="form-control">
          </div>
          <div class="form-group">
            <label for="supCeoName">*대표명</label>
            <input type="text" name="supCeoName" class="form-control" required>
          </div>
          <div class="form-group">
            <label for="supCip">*담당자명</label>
            <input type="text" name="supCip" class="form-control" required>
          </div>
          <div class="form-group">
            <label for="supCipPhone">*담당자 연락처</label>
            <input type="text" name="supCipPhone" class="form-control" required>
          </div>
          <div class="form-group">
            <label for="supCipEmail">*담당자 이메일</label>
            <input type="email" name="supCipEmail" class="form-control" required>
          </div>
          <div class="form-group">
            <label for="supId">거래처 아이디</label>
            <input type="text" name="supId" class="form-control" required>
          </div>
          <div class="form-group">
            <label for="supPassword">거래처 비밀번호</label>
            <input type="password" name="supPassword" class="form-control" required>
          </div>
          <div class="form-group">
            <label for="supEtc">기타사항</label>
            <textarea name="supEtc" class="form-control"></textarea>
          </div>
          <div class="form-group mt-4">
            <button type="submit" class="btn btn-success">등록</button>
            <button type="button" class="btn btn-secondary" onclick="closeNewSupplierModal()">닫기</button>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>

<!-- 배경 어둡게 -->
<div id="modalBackdrop" style="display:none; position:fixed; top:0; left:0; width:100vw; height:100vh; background-color:rgba(0,0,0,0.5); z-index:999;"></div>

<%@ include file="../include/footer.jsp" %>

<script>
  function openNewSupplierModal() {
    document.getElementById("newSupplierModal").style.display = "block";
    document.getElementById("modalBackdrop").style.display = "block";
  }

  function closeNewSupplierModal() {
    document.getElementById("newSupplierModal").style.display = "none";
    document.getElementById("modalBackdrop").style.display = "none";
  }
</script>
</body>
</html>
