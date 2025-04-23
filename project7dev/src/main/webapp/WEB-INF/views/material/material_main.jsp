<%@ page contentType="text/html;charset=UTF-8" language="java"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="ko">
<%@ include file="../include/header.jsp"%>
<body>
	<div class="container-fluid">
		<div class="row">
			<%@ include file="../include/left_column.jsp"%>

			<!-- 메인 콘텐츠 영역 -->
			<div class="col-10 main"
				style="padding: 40px; background-color: #ffffff; border-radius: 12px; box-shadow: 0 0 15px rgba(0, 0, 0, 0.1); height: 1200px;">

				<h3 class="fw-bold mb-4">부품정보</h3>

				<div class="scroll-container mb-4"
					style="max-height: 500px; overflow-y: auto; border: 1px solid #ccc;">
					<table
						class="table table-bordered text-center align-middle scroll-table">
						<thead class="sticky-top" style="background-color: #f8f9fa;">
							<tr>
								<th colspan="7">
									<form action="${contextPath}/material/material_main"
										method="get"
										class="d-flex justify-content-center align-items-center gap-2">
										<select name="searchType" id="selectField"
											class="form-select w-auto">
											<option value="materialCode" selected>부품코드</option>
											<option value="materialName">부품명</option>
										</select> <input type="text" name="searchValue" id="inputCode"
											class="form-control w-25"> <input type="submit"
											value="검색" class="btn btn-primary">
									</form>
								</th>
							</tr>
							<tr>
								<th colspan="8">부품 목록</th>
								<%-- <th><button type="button" class="btn btn-success btn-sm"
										onclick="openMaterialModal()">부품추가</button></th> --%>
							</tr>
							<tr>
								<th style="background-color: #EDFFF4;">부품코드</th>
								<th style="background-color: #EDFFF4;">부품명</th>
								<th style="background-color: #EDFFF4;">재질</th>
								<th style="background-color: #EDFFF4;">규격</th>
								<th style="background-color: #EDFFF4;">단위</th>
								<th style="background-color: #EDFFF4;">소요량</th>
								<th style="background-color: #EDFFF4;">투입레벨</th>
								<th style="background-color: #EDFFF4;">첨부파일</th>
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
									<td><a href="${contextPath}/resources/file/${material.materialFile}" target="_blank">${material.materialFile}</a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>

				<!-- 부품등록 모달 -->
				<div id="materialModal" class="modal" tabindex="-1" role="dialog"
					aria-labelledby="materialModalLabel" aria-hidden="true"
					style="display: none;">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="materialModalLabel">부품 추가</h5>
								<button type="button" class="close"
									onclick="closeMaterialModal()">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body">
								<form action="${contextPath}/material/createMaterial" method="post" enctype="multipart/form-data">
									<input type="hidden" name="productNo" value="${product.productNo}" />

									<div class="form-group">
										<label for="materialCode">부품코드</label> <input type="text"
											name="materialCode" id="materialCode" class="form-control"
											required>
									</div>
									<div class="form-group">
										<label for="materialName">부품명</label> <input type="text"
											name="materialName" id="materialName" class="form-control"
											required>
									</div>
									<div class="form-group">
										<label for="materialRawMaterial">소재</label> <input type="text"
											name="materialRawMaterial" id="materialRawMaterial"
											class="form-control" required>
									</div>
									<div class="form-group">
										<label for="materialDescription">규격</label> <input type="text"
											name="materialDescription" id="materialDescription"
											class="form-control" required>
									</div>
									<div class="form-group">
										<label for="materialUnit">단위</label> <input type="text"
											name="materialUnit" id="materialUnit" class="form-control"
											required>
									</div>
									<div class="form-group">
										<label for="materialQuantity">소요량</label> <input type="number"
											name="materialQuantity" id="materialQuantity"
											class="form-control" required>
									</div>
									<div class="form-group">
										<label for="materialFile">첨부파일</label> <input type="file"
											name="file" id="materialFile" class="form-control">
									</div>

									<div class="form-group mt-4">
										<button type="submit" class="btn btn-success">등록</button>
										<button type="button" class="btn btn-secondary"
											onclick="closeMaterialModal()">닫기</button>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%@ include file="../include/footer.jsp"%>

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
