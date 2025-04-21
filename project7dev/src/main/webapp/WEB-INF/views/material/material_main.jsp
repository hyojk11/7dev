<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="ko">
<%@ include file="../include/header.jsp" %>
<body>
<div class="container-fluid">
    <div class="row">
        <%@ include file="../include/left_column.jsp" %>

        <!-- 메인 콘텐츠 영역 -->
        <div class="col-10 main" style="padding: 40px; background-color: #ffffff; border-radius: 12px; box-shadow: 0 0 15px rgba(0,0,0,0.1); height: 1200px;">

            <h3 class="fw-bold mb-4">품목정보</h3>

            <div class="scroll-container mb-4" style="max-height: 500px; overflow-y: auto; border: 1px solid #ccc;">
                <table class="table table-bordered text-center align-middle scroll-table">
                    <thead class="sticky-top" style="background-color: #f8f9fa;">
                        <tr>
                            <th colspan="7">
                                <form action="${contextPath}/material/material_main" method="get" class="d-flex justify-content-center align-items-center gap-2">
                                    <select name="searchType" id="selectField" class="form-select w-auto">
                                        <option value="materialCode" selected>부품코드</option>
                                        <option value="materialName">부품명</option>
                                    </select>
                                    <input type="text" name="searchValue" id="inputCode" class="form-control w-25">
                                    <input type="submit" value="검색" class="btn btn-primary">
                                </form>
                            </th>
                        </tr>
                        <tr>
                            <th colspan="6">부품 목록</th>
                            <th><button type="button" class="btn btn-success btn-sm" onclick="openMaterialModal()">부품추가</button></th>
                        </tr>
                        <thead style="background-color: #EDFFF4;">
                        <tr>
                            <th style="background-color: #EDFFF4;">부품코드</th>
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
                            <tr>
                                <td>${material.materialCode}</td>
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

            <!-- 부품등록 모달 -->
            <div id="materialModal" class="modal" tabindex="-1" style="display:none; position:fixed; top:20%; left:35%; background:#fff; border:1px solid #000; padding:20px; z-index:1000;">
                <form action="${contextPath}/material/createMaterial" method="post" enctype="multipart/form-data">
                    <input type="hidden" name="productNo" value="${product.productNo}" />
                    <div class="mb-2"><label>부품코드: <input type="text" name="materialCode" required class="form-control"></label></div>
                    <div class="mb-2"><label>부품명: <input type="text" name="materialName" required class="form-control"></label></div>
                    <div class="mb-2"><label>소재: <input type="text" name="materialRawMaterial" required class="form-control"></label></div>
                    <div class="mb-2"><label>규격: <input type="text" name="materialDescription" required class="form-control"></label></div>
                    <div class="mb-2"><label>단위: <input type="text" name="materialUnit" required class="form-control"></label></div>
                    <div class="mb-2"><label>소요량: <input type="number" name="materialQuantity" required class="form-control"></label></div>
                    <div class="mb-3"><label>첨부파일: <input type="file" name="materialFile" class="form-control"></label></div>
                    
                    <div class="d-flex justify-content-end gap-2">
                        <button type="submit" class="btn btn-primary">등록</button>
                        <button type="button" class="btn btn-secondary" onclick="closeMaterialModal()">닫기</button>
                    </div>
                </form>
            </div>

            <!-- 모달 백드롭 -->
            <div id="modalBackdrop" style="display:none; position:fixed; top:0; left:0; width:100vw; height:100vh; background-color:rgba(0,0,0,0.5); z-index:999;"></div>
        </div>
    </div>
</div>

<%@ include file="../include/footer.jsp" %>

<!-- 모달 스크립트 -->
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

</body>
</html>
