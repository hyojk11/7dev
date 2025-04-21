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

        <!-- 메인 화면 영역 -->
        <div class="col-10 main" style="padding-right: 20px;">
            <h3 class="fw-bold mb-4">제품 부품 목록</h3>

            <table class="table table-bordered text-center align-middle" style="max-width: 1000px; margin: 0 auto; border-radius: 8px; box-shadow: 0 0 15px rgba(0, 0, 0, 0.1); background-color: #DBFFE8;">
                <thead>
                    <tr>
                        <th colspan="2" style="background-color: #EDFFF4;">품목코드</th>
                        <td colspan="2">${product.productCode}</td>
                        <th colspan="2" style="background-color: #EDFFF4;">품목명</th>
                        <td colspan="2">${product.productName}</td>
                    </tr>
                    <tr>
                        <th colspan="7" style="background-color: white;">부품목록</th>
                        <th style="background-color: white;">
                            <button type="button" class="btn btn-success btn-sm" onclick="openMaterialModal()">부품등록</button>
                        </th>
                    </tr>
                    <tr>
                        <th colspan="2" style="background-color: #EDFFF4;">부품코드</th>
                        <th style="background-color: #EDFFF4;">부품명</th>
                        <th style="background-color: #EDFFF4;">재질</th>
                        <th style="background-color: #EDFFF4;">규격</th>
                        <th style="background-color: #EDFFF4;">단위</th>
                        <th style="background-color: #EDFFF4;">소요량</th>
                        <th style="background-color: #EDFFF4;">투입레벨</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="material" items="${materialList}">
                        <tr style="background-color: #f9f9f9;">
                            <td colspan="2">${material.materialCode}</td>
                            <td>${material.materialName}</td>
                            <td>${material.materialRawMaterial}</td>
                            <td>${material.materialDescription}</td>
                            <td>${material.materialUnit}</td>
                            <td>${material.materialQuantity}</td>
                            <td>L1</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>

<!-- 부품등록 모달 -->
<div id="materialModal" class="modal" tabindex="-1" style="display:none;">
    <div class="modal-dialog">
        <div class="modal-content">
            <form action="${contextPath}/material/createMaterial" method="post" enctype="multipart/form-data">
                <div class="modal-header">
                    <h5 class="modal-title">부품 등록</h5>
                    <button type="button" class="btn-close" aria-label="Close" onclick="closeMaterialModal()"></button>
                </div>
                <div class="modal-body">
                    <input type="hidden" name="productNo" value="${product.productNo}" />
                    <div class="mb-3">
                        <label class="form-label">부품코드</label>
                        <input type="text" class="form-control" name="materialCode" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">부품명</label>
                        <input type="text" class="form-control" name="materialName" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">소재</label>
                        <input type="text" class="form-control" name="materialRawMaterial" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">규격</label>
                        <input type="text" class="form-control" name="materialDescription" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">단위</label>
                        <input type="text" class="form-control" name="materialUnit" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">소요량</label>
                        <input type="number" class="form-control" name="materialQuantity" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">첨부파일</label>
                        <input type="file" class="form-control" name="materialFile">
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-primary">등록</button>
                    <button type="button" class="btn btn-secondary" onclick="closeMaterialModal()">닫기</button>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- 모달 배경 -->
<div id="modalBackdrop" style="display:none; position:fixed; top:0; left:0; width:100vw; height:100vh; background-color:rgba(0,0,0,0.5); z-index:1040;"></div>

<!-- 스크립트 -->
<script>
  function openMaterialModal() {
    document.getElementById("materialModal").style.display = "block";
    document.getElementById("modalBackdrop").style.display = "block";
  }

  function closeMaterialModal() {
    document.getElementById("materialModal").style.display = "none";
    document.getElementById("modalBackdrop").style.display = "none";
  }
</script>

<%@ include file="../include/footer.jsp" %>
</body>
</html>
