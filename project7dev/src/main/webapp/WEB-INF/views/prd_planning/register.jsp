<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>생산계획 신규등록</title>
</head>
<body>
	<h2>제품생산계획 등록</h2>
	<form action="${contextPath}/prd_planning/registerSend" method="post">
	<input type="hidden" name="product_no" value="${product_no}">
	<input type="hidden" name="pstorage_no" value="${dto.pstorage_no}">
	<table border="1">
		<tr>
			<td>작성일</td>
			<td colspan="5"><input type="date" name="reg_date"></td>
		</tr>
		<tr>
			<td>제품명</td>
			<td colspan="2"><input type="text"  name="product_name" value="${product_name}" readonly></td>
			<td>제품코드</td>
			<td colspan="2"><input type="text"  name="product_code" value="${product_code}" readonly></td>
		</tr>
		<tr><td colspan="6"><br></td></tr>
		<tr>
			<td>공장</td>
			<td colspan="2">
				<select id = "plant" name = "prpl_plant" onchange = "changeLine()">
					<option value="KR">KR</option>
					<option value="CN">CN</option>
				</select>
			</td>
			<td>라인</td>
			<td colspan="2" id = "line"></td>
		</tr>
		<tr>
			<td>출고계획수량</td>
			<td><input type="number" id="plan_cnt" required></td>
			<td><button type="button" onclick="changePlanCnt()">입력</button>
			<td>창고재고수량</td>
			<td colspan="2"><input type="number" id="pstorage_stock" name="pstorage_stock" value="${dto.pstorage_stock}" readonly></td>
		</tr>
		<tr>
			<td>생산계획수량</td>
			<td><input type="number" id="product_cnt" name="product_cnt" readonly></td>
			<td>리드타임</td>
			<td><input type="number" name="prpl_leadtime" placeholder="조립소요기간(일)" required></td>
			<td>출고납기일</td>
			<td><input type="date" name="prpl_due_date" required></td>
		</tr>
		<tr><td colspan="6"><br></td></tr>
		<tr>
			<td>사원번호</td>
			<td><input type="number" id="emp_no" name="emp_no" required></td>
			<td><button type="button" onclick="changeEmp()">입력</button></td>
			<td>담당자명</td>
			<td colspan="2"><input type="text" id="emp_name" name="emp_name" readonly></td>
		</tr>
		<tr>
			<td>담당자 연락처</td>
			<td colspan="2"><input type="text" id="emp_phone" name="emp_phone" readonly></td>
			<td>담당자 이메일</td>
			<td colspan="2"><input type="email" id="emp_email" name="emp_email" readonly></td>
		</tr>
		<tr><td colspan="6"><br></td></tr>
		<tr>
			<td>기타사항</td>
			<td colspan="5">
				<textarea rows="5" cols="70" name="prpl_etc"></textarea>
			</td>
		</tr>
		</table>
	<button type="submit">등록</button>
	<button type="button" onclick="location.href='${contextPath}/prd_planning/list'">취소</button>
	</form>
	
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
			const plan_cnt = document.getElementById("plan_cnt").value;
			const pstorage_stock = document.getElementById("pstorage_stock").value;
			const product_cnt = document.getElementById("product_cnt");
			
			if(plan_cnt != "" && pstorage_stock != "") {
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
		
	</script>
	
<body>
</html>