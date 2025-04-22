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

      <form action="${contextPath}/mrp/createMrp" method="post">
        <input type="hidden" name="prplNo" value="${prpl.prpl_no}"/>
        <input type="hidden" name="productNo" value="${prpl.product_no}"/>
        <input type="hidden" name="mrpDueDate" value="${mrp_due_date}"/>
        <input type="hidden" name="empNo" value="4"/>

        <table class="table table-bordered align-middle">
          <tbody>
            <tr>
              <th style="width: 15%; background-color: #EDFFF4;" class="table-success">제품명</th>
              <td style="width: 35%;">${prpl.product_name}</td>
              <th style="width: 15%; background-color: #EDFFF4;" class="table-success">제품코드</th>
              <td style="width: 35%;">${prpl.product_code}</td>
            </tr>
            <tr>
              <th class="table-success" style="background-color: #EDFFF4;">자재납기일</th>
              <td colspan="3">${mrp_due_date}</td>
            </tr>
          </tbody>
        </table>

        <div class="border rounded p-2 mb-3" style="max-height: 400px; overflow-y: auto;">
          <table class="table table-bordered text-center mb-0">
            <thead class="table-light position-sticky top-0">
              <tr>
                <th colspan="7" class="table-success" style="background-color: #FFFFFF;">소요자재 목록</th>
                <th style="background-color: #FFFFFF;"><input type="button" value="자재조회" class="btn btn-outline-primary btn-sm" onclick="openMaterialModal()"></th>
              </tr>
              <tr>
                <th style="background-color: #EDFFF4;">자재명</th>
                <th style="background-color: #EDFFF4;">자재코드</th>
                <th style="background-color: #EDFFF4;">자재창고</th>
                <th style="background-color: #EDFFF4;">가용재고</th>
                <th style="background-color: #EDFFF4;">총소요량</th>
                <th style="background-color: #EDFFF4;">순소요량</th>
                <th style="background-color: #EDFFF4;">포장단위</th>
                <th style="background-color: #EDFFF4;">리드타임(일)</th>
              </tr>
            </thead>
            <tbody id="materialBody"></tbody>
          </table>
        </div>

        <table class="table table-bordered align-middle">
          <tbody>
            <tr>
              <th class="table-success" style="width: 15%; background-color: #EDFFF4;">사원번호</th>
              <td style="width: 35%;">${employee.emp_no}</td>
              <th class="table-success" style="width: 15%; background-color: #EDFFF4;">담당자명</th>
              <td style="width: 35%;">${employee.emp_name}</td>
            </tr>
            <tr>
              <th class="table-success" style="background-color: #EDFFF4;">담당자 연락처</th>
              <td>${employee.emp_phone}</td>
              <th class="table-success" style="background-color: #EDFFF4;">담당자 메일</th>
              <td>${employee.emp_email}</td>
            </tr>
            <tr>
              <th class="table-success" style="background-color: #EDFFF4;">기타사항</th>
              <td colspan="3">
                <textarea class="form-control" name="etc" rows="4" placeholder="비고를 입력하세요."></textarea>
              </td>
            </tr>
          </tbody>
        </table>

        <div class="d-flex justify-content-center gap-2 mt-3">
          <button type="submit" class="btn btn-success">등록</button>
          <button type="button" class="btn btn-secondary" onclick="history.back()">닫기</button>
        </div>
      </form>
    </div>
  </div>
</div>

<%@ include file="../include/footer.jsp" %>

	<script>
		function openMaterialModal() {
			window.open('${contextPath}/material/search', '자재조회', 'width=600,height=500');
			
		}
		document.addEventListener("DOMContentLoaded", function () {
			  // 모든 총소요량 input에 이벤트 달기
			  document.addEventListener("input", function (e) {
			    if (e.target.classList.contains("totalQty")) {
			      const totalInput = e.target; // 총소요량 input
			      const row = totalInput.closest("tr"); // 해당 tr 찾기

			      const availableInput = row.querySelector(".availableQty"); // 가용재고 input
			      const netInput = row.querySelector(".netQty"); // 순소요량 input

			      const total = parseInt(totalInput.value) || 0;
			      const available = parseInt(availableInput.value) || 0;
			      const net = Math.max(total - available, 0); // 음수 방지

			      netInput.value = net;
			    }
			  });
			});
		
		let materialIndex = 0;

		function addMaterialToParent(name, code, materialNo) {
			const table = document.querySelector('#materialBody');
			const newRow = document.createElement('tr');

			newRow.innerHTML = '' +
				'<input type="hidden" name="materials[' + materialIndex + '].materialNo" value="' + materialNo + '">' +
				'<td>' + name + '</td>' +
				'<td>' + code + '</td>' +
				'<td>자재창고.창고코드</td>' +
				'<td><input type="number" class="availableQty" value="30" style="width: 60px;" readonly></td>' +
				'<td><input type="number" class="totalQty" style="width: 60px;"></td>' +
				'<td><input type="text" name="materials[' + materialIndex + '].mrpQuantity" class="netQty" style="width: 60px;" readonly></td>' +
				'<td>' +
				'<select name="materials[' + materialIndex + '].mrpSku">' +
				'<option value="EA">EA</option>' +
				'<option value="BOX">BOX</option>' +
				'<option value="PCS">PCS</option>' +
				'<option value="PK">PK</option>' +
				'<option value="SET">SET</option>' +
				'</select>' +
				'</td>' +
				'<td><input type="number" name="materials[' + materialIndex + '].mrpLeadtime" style="width: 60px;"></td>';

			table.appendChild(newRow);
			materialIndex++;
		}

		// 총소요량 입력 시 순소요량 자동 계산
		document.addEventListener("input", function (e) {
			if (e.target.classList.contains("totalQty")) {
				const totalInput = e.target;
				const row = totalInput.closest("tr");

				const availableInput = row.querySelector(".availableQty");
				const netInput = row.querySelector(".netQty");

				const total = parseInt(totalInput.value) || 0;
				const available = parseInt(availableInput.value) || 0;
				const net = Math.max(total - available, 0);

				netInput.value = net;
			}
		});
	</script>
</body>
</html>