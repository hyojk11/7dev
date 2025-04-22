<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page session="true" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<%@ include file="../include/header.jsp" %>
<body>
<div class="container-fluid">
  <div class="row">
    <%@ include file="../include/left_column.jsp" %>

    <div class="col-10 main" style="padding: 20px;">
      <h3 class="fw-bold mb-4">생산계획 상세보기</h3>

      <form action="${contextPath}/prd_planning/updateSend" method="post">
        <input type="hidden" name="prpl_no" value="${dto.prpl_no}">
        <input type="hidden" name="product_no" value="${dto.product_no}">
        <input type="hidden" name="pstorage_no" value="${dto.pstorage_no}">

        <table class="table table-bordered align-middle">
          <tbody>
            <tr>
              <th style="width: 15%; background-color: #EDFFF4;">제품명</th>
              <td colspan="2"><input type="text" name="product_name" value="${dto.product_name}" class="form-control" readonly></td>
              <th style="background-color: #EDFFF4;">제품코드</th>
              <td colspan="2"><input type="text" name="product_code" value="${dto.product_code}" class="form-control" readonly></td>
            </tr>
            <tr>
              <th style="background-color: #EDFFF4;">공장</th>
              <td colspan="2">
                <select id="plant" name="prpl_plant" class="form-select w-auto" onchange="changeLine()" disabled>
                  <option value="KR" ${dto.prpl_plant == 'KR' ? 'selected' : ''}>KR</option>
                  <option value="CN" ${dto.prpl_plant == 'CN' ? 'selected' : ''}>CN</option>
                </select>
              </td>
              <th style="background-color: #EDFFF4;">라인</th>
              <td colspan="2" id="line">
                <input type="text" name="prpl_line" value="${dto.prpl_line}" class="form-control" readonly>
              </td>
            </tr>
            <tr>
              <th style="background-color: #EDFFF4;">출고계획수량</th>
              <td><input type="number" id="plan_cnt" name="plan_cnt" class="form-control" value="${dto.pstorage_stock + dto.product_cnt}" readonly></td>
              <td><button type="button" class="btn btn-primary btn-sm" id="planCntBtn" onclick="changePlanCnt()" disabled>입력</button></td>
              <th style="background-color: #EDFFF4;">창고재고수량</th>
              <td colspan="2"><input type="number" id="pstorage_stock" name="pstorage_stock" value="${dto.pstorage_stock}" class="form-control" readonly></td>
            </tr>
            <tr>
              <th style="background-color: #EDFFF4;">생산계획수량</th>
              <td><input type="number" id="product_cnt" name="product_cnt" value="${dto.product_cnt}" class="form-control" readonly></td>
              <th style="background-color: #EDFFF4;">출고납기일</th>
              <td><input type="date" id="prpl_due_date" name="prpl_due_date" value="${dto.prpl_due_date_only}" class="form-control" readonly></td>
              <th style="background-color: #EDFFF4;">리드타임</th>
              <td><input type="number" id="prpl_leadtime" name="prpl_leadtime" value="${dto.prpl_leadtime}" class="form-control" readonly></td>
            </tr>
            <tr>
              <th style="background-color: #EDFFF4;">사원번호</th>
              <td><input type="number" id="emp_no" name="emp_no" value="${dto.emp_no}" class="form-control" readonly></td>
              <td><button type="button" class="btn btn-primary btn-sm" id="empBtn" onclick="changeEmp()" disabled>입력</button></td>
              <th style="background-color: #EDFFF4;">담당자명</th>
              <td colspan="2"><input type="text" id="emp_name" name="emp_name" value="${dto.emp_name}" class="form-control" readonly></td>
            </tr>
            <tr>
              <th style="background-color: #EDFFF4;">담당자 연락처</th>
              <td colspan="2"><input type="text" id="emp_phone" name="emp_phone" value="${dto.emp_phone}" class="form-control" readonly></td>
              <th style="background-color: #EDFFF4;">담당자 이메일</th>
              <td colspan="2"><input type="email" id="emp_email" name="emp_email" value="${dto.emp_email}" class="form-control" readonly></td>
            </tr>
            <tr>
              <th style="background-color: #EDFFF4;">기타사항</th>
              <td colspan="5">
                <textarea rows="5" class="form-control" id="prpl_etc" name="prpl_etc" readonly>${dto.prpl_etc}</textarea>
              </td>
            </tr>
          </tbody>
        </table>

        <div class="d-flex gap-2">
          <button type="button" class="btn btn-warning" id="editBtn" onclick="updateForm()">수정</button>
          <button type="submit" class="btn btn-success" id="saveBtn" style="display: none;">저장</button>
          <button type="button" class="btn btn-danger" id="deleteBtn" onclick="location.href='${contextPath}/prd_planning/delete?prpl_no=${dto.prpl_no}'">삭제</button>
          <button type="button" class="btn btn-secondary" id="backBtn" onclick="location.href='${contextPath}/prd_planning/list'">목록으로</button>
          <button type="button" class="btn btn-secondary" id="cancelBtn" onclick="location.href='${contextPath}/prd_planning/detail?prpl_no=${dto.prpl_no}'" style="display: none;">취소</button>
        </div>
      </form>
    </div>
  </div>
</div>

<%@ include file="../include/footer.jsp" %>

	<!-- 등록란 동적변환 -->
	<script>
	
		//전체 엔터키 방지 + 입력버튼들에 엔터키 효과 삽입
		document.addEventListener("DOMContentLoaded", function() {
			document.querySelectorAll("form").forEach(form => {
				form.addEventListener("keydown", function(event) {
					if(event.key === "Enter") {
						event.preventDefault(); //엔터키 막기
						
						const targetId = event.target.id;
						const planCntBtn = document.getElementById("planCntBtn");
						const empBtn = document.getElementById("empBtn");
						
						if(targetId === "plan_cnt") {
							planCntBtn.click();
						} else if(targetId === "emp_no") {
							empBtn.click();
						}
					}
				});
			});
		});
		
		const contextPath = "${pageContext.request.contextPath}";
	
		function changeLine() {
			const plant = document.getElementById("plant").value;
			const line = document.getElementById("line");
			
			if(plant === "KR") {
				line.innerHTML = `
					<select name="prpl_line">
						<option value="KR01">KR01</option>
						<option value="KR02">KR02</option>
					</select>
				`;
			} else if(plant === "CN") {
				line.innerHTML = `
					<select name="prpl_line">
						<option value="C01">C01</option>
					</select>
				`;
			}
		}
		window.addEventListener("DOMContentLoaded", changeLine);
		
		function changePlanCnt() {
			const plan_cnt = document.getElementById("plan_cnt").value;
			const pstorage_stock = document.getElementById("pstorage_stock").value;
			const product_cnt = document.getElementById("product_cnt");
			
			if(product_cnt != "" && pstorage_stock != "") {
				product_cnt.value = plan_cnt - pstorage_stock;
			}
		}
		function changeEmp() {
			const emp_no = document.getElementById("emp_no").value.trim();
			const emp_name = document.getElementById("emp_name");
			const emp_phone = document.getElementById("emp_phone");
			const emp_email = document.getElementById("emp_email");
			console.log("emp_no : ", emp_no);
			const url = contextPath + "/prd_planning/getEmpInfo?emp_no=" + emp_no;
			console.log("url : ",url);
			
			fetch(url)
				.then(response => {
					if(!response.ok) throw new Error("조회실패");
					return response.json();
				})
				.then(data => {
					if(data) {
						emp_name.value = data.emp_name || "";
						emp_phone.value = data.emp_phone || "";
						emp_email.value = data.emp_email || "";
					} else {
						alert("사원 정보를 찾을 수 없습니다");
					}
				})
				.catch(error => {
					console.error("에러 발생 : ",error);
					alert("사원 정보를 불러오는 중 오류가 발생했습니다");
				});
			
		}
		
		function updateForm() {
			const prpl_plant = document.getElementById("plant");
			const plan_cnt = document.getElementById("plan_cnt");
			const planCntBtn = document.getElementById("planCntBtn");
			const prpl_due_date = document.getElementById("prpl_due_date");
			const prpl_leadtime = document.getElementById("prpl_leadtime");
			const emp_no = document.getElementById("emp_no");
			const empBtn = document.getElementById("empBtn");
			const prpl_etc = document.getElementById("prpl_etc");
			const cancelBtn = document.getElementById("cancelBtn");
			
			prpl_plant.removeAttribute("disabled");
			plan_cnt.removeAttribute("readonly");
			planCntBtn.removeAttribute("disabled");
			prpl_due_date.removeAttribute("readonly");
			prpl_leadtime.removeAttribute("readonly");
			emp_no.removeAttribute("readonly");
			empBtn.removeAttribute("disabled");
			prpl_etc.removeAttribute("readonly");
			
			changeLine();
			
			document.getElementById("editBtn").style.display = "none";
			document.getElementById("saveBtn").style.display = "inline-block";
			document.getElementById("backBtn").style.display = "none";
			document.getElementById("cancelBtn").style.display = "inline-block";
			
		}
	</script>
</body>
</html>
