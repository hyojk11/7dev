<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
      <h3 class="fw-bold mb-4">제품생산계획 등록</h3>
      
      <form action="${contextPath}/prd_planning/registerSend" method="post">
        <input type="hidden" name="product_no" value="${product_no}">
        <input type="hidden" name="pstorage_no" value="${dto.pstorage_no}">

        <table class="table table-bordered align-middle">
          <tbody>
            <tr>
              <th style="width: 15%; background-color: #EDFFF4;">작성일</th>
              <td colspan="6">
                <input type="date" name="reg_date" class="form-control w-25">
              </td>
            </tr>
            <tr>
              <th style="background-color: #EDFFF4;">제품명</th>
              <td colspan="2">
                <input type="text" name="product_name" value="${product_name}" class="form-control" readonly>
              </td>
              <th style="background-color: #EDFFF4;">제품코드</th>
              <td colspan="3">
                <input type="text" name="product_code" value="${product_code}" class="form-control" readonly>
              </td>
            </tr>
            <tr>
              <th style="background-color: #EDFFF4;">공장</th>
              <td colspan="2">
                <select id="plant" name="prpl_plant" class="form-select w-auto" onchange="changeLine()">
                  <option value="KR">KR</option>
                  <option value="CN">CN</option>
                </select>
              </td>
              <th style="background-color: #EDFFF4;">라인</th>
              <td colspan="3" id="line"></td>
            </tr>
            <tr>
              <th style="background-color: #EDFFF4;">출고계획수량</th>
              <td>
                <input type="number" id="plan_cnt" class="form-control" required>
              </td>
              <td>
                <button type="button" class="btn btn-primary btn-sm" onclick="changePlanCnt()">입력</button>
              </td>
              <th style="background-color: #EDFFF4;">창고재고수량</th>
              <td colspan="3">
                <input type="number" id="pstorage_stock" name="pstorage_stock" value="${dto.pstorage_stock}" class="form-control" readonly>
              </td>
            </tr>
            <tr>
              <th style="background-color: #EDFFF4;">생산계획수량</th>
              <td colspan="2">
                <input type="number" id="product_cnt" name="product_cnt" class="form-control" readonly>
              </td>
              <th style="background-color: #EDFFF4;">리드타임</th>
              <td>
                <input type="number" name="prpl_leadtime" class="form-control" placeholder="조립소요기간(일)" required>
              </td>
              <th style="background-color: #EDFFF4;">출고납기일</th>
              <td>
                <input type="date" name="prpl_due_date" class="form-control" required>
              </td>
            </tr>
            <tr>
              <th style="background-color: #EDFFF4;">사원번호</th>
              <td>
                <input type="number" id="emp_no" name="emp_no" class="form-control" required>
              </td>
              <td>
                <button type="button" class="btn btn-primary btn-sm" onclick="changeEmp()">입력</button>
              </td>
              <th style="background-color: #EDFFF4;">담당자명</th>
              <td colspan="3">
                <input type="text" id="emp_name" name="emp_name" class="form-control" readonly>
              </td>
            </tr>
            <tr>
              <th style="background-color: #EDFFF4;">담당자 연락처</th>
              <td colspan="2">
                <input type="text" id="emp_phone" name="emp_phone" class="form-control" readonly>
              </td>
              <th style="background-color: #EDFFF4;">담당자 이메일</th>
              <td colspan="3">
                <input type="email" id="emp_email" name="emp_email" class="form-control" readonly>
              </td>
            </tr>
            <tr>
              <th style="background-color: #EDFFF4;">기타사항</th>
              <td colspan="6">
                <textarea rows="5" class="form-control" name="prpl_etc" placeholder="비고를 입력하세요."></textarea>
              </td>
            </tr>
          </tbody>
        </table>

        <div class="d-flex gap-2">
          <button type="submit" class="btn btn-success">등록</button>
          <button type="button" class="btn btn-secondary" onclick="location.href='${contextPath}/prd_planning/list'">취소</button>
        </div>
      </form>
    </div>
  </div>
</div>

<%@ include file="../include/footer.jsp" %>

	<!-- 등록란 동적변환 -->
	<script>
	
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
			const plan_cnt = Number(document.getElementById("plan_cnt").value);
			const pstorage_stock = Number(document.getElementById("pstorage_stock").value);
			const product_cnt = document.getElementById("product_cnt");
			
			if(plan_cnt != "" && pstorage_stock != "") {
				if(plan_cnt <= pstorage_stock) {
					product_cnt.value = 0;
				} else {
					product_cnt.value = plan_cnt - pstorage_stock;
				}
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
		
	</script>
</body>
</html>
