<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원관리</title>
<style>
	.modal {
	  display: none;
	  position: fixed;
	  z-index: 9999;
	  left: 0; top: 0;
	  width: 100%; height: 100%;
	  background-color: rgba(0,0,0,0.5); /* 반투명 배경 */
	}
	
	.modal_content {
	  background-color: white;
	  margin: 10% auto;
	  padding: 20px;
	  width: 600px; height: 300px;
	  border-radius: 10px;
	  position: relative;
	}
	
</style>
</head>
<body>
	<h2>사원관리</h2>
	<table border="1">
		<tr>
			<td colspan ="5">
			<form action="${contextPath}/emp/list" method="get">
				<select id="searchType" name="searchType">
					<option value="emp_no" ${param.searchType == 'emp_no' ? 'selected' : ''}>사원번호</option>
					<option value="emp_name" ${param.searchType == 'emp_name' ? 'selected' : ''}>사원명</option>
					<option value="emp_job" ${param.searchType == 'emp_job' ? 'selected' : ''}>직책</option>
					<option value="emp_id" ${param.searchType == 'emp_id' ? 'selected' : ''}>아이디</option>
				</select>
				<span id="inputType">
					<input type="text" name="keyword" value="${param.keyword}" placeholder="검색어">
				</span>
				<button>검색</button>
			</form>
			</td>
			<td>
				<form action="${contextPath}/emp/listExcel" method="get">
				<input type="hidden" name="searchType" value="${param.searchType}">
				<input type="hidden" name="keyword" value="${param.keyword}">
				<button>EXCEL 다운</button>
				</form>
			</td>
			<td>
				<button type="button" id="openModalBtn">신규사원등록</button>
			</td>
		</tr>
		<tr>
			<th colspan="7">사원 목록</th>
		</tr>
		<tr>
			<th>사원번호</th>
			<th>사원명</th>
			<th>직책</th>
			<th>아이디</th>
			<th>전화번호</th>
			<th colspan ="2">이메일</th>
		</tr>
		<c:forEach var="data" items="${list}">
		<tr>
			<td>${data.emp_no}</td>
			<td>
				<a href="${contextPath}/emp/detail?emp_no=${data.emp_no}">${data.emp_name}</a>
			</td>
			<td>${data.emp_job}</td>
			<td>${data.emp_id}</td>
			<td>${data.emp_phone}</td>
			<td colspan ="2">${data.emp_email}</td>
		</tr>
		</c:forEach>
	</table>
	<div>
		<c:if test="${startPage > 1}">
			<a href="?page=${startPage - 1}&searchType=${searchType}&keyword=${keyword}">◀</a>
		</c:if>
		
		<c:forEach begin="${startPage}" end="${endPage}" var="i">
			<a href="?page=${i}&searchType=${searchType}&keyword=${keyword}">${i}</a>
		</c:forEach>
		
		<c:if test="${endPage < totalPage}">
			<a href="?page=${endPage + 1}&searchType=${searchType}&keyword=${keyword}">▶</a>
		</c:if>
	</div>
	
	
	<!-- 사원 등록 모달 -->
	<div id="modal" class="modal">
		<div class="modal_content">
			<h3>신규사원등록</h3>
			<form action="${contextPath}/emp/register" method="post">
				<table border="1">
					<tr>
						<td>사원명</td>
						<td colspan="2"><input type="text" name="emp_name" required></td>
						<td>직책</td>
						<td colspan="2"><input type="text" name="emp_job" required></td>
					</tr>
					<tr>
						<td>아이디</td>
						<td><input type="text" id="emp_id" name="emp_id" required></td>
						<td><button type="button" id="idckBtn">중복확인</button></td>
						<td>임시비밀번호</td>
						<td colspan="2"><input type="text" name="emp_password" required></td>
					</tr>
					<tr>
						<td>이메일</td>
						<td colspan="2"><input type="email" name="emp_email" placeholder="ex)chill@email.com" required></td>
						<td>전화번호</td>
						<td colspan="2"><input type="tel" name="emp_phone" required></td>
					</tr>
				</table>
				<br>
				<button>사원등록</button>
				<button type="button" class="close" id="close">취소</button>
			</form>
		</div>
	</div>
	<!-- / 모달 끝 -->
	
	<!-- 자바스크립트 함수-->
	<script>
		document.getElementById("openModalBtn").onclick = function() {
			document.getElementById("modal").style.display = "block";
			
			const idInput = document.querySelector("#emp_id");
			const idckBtn = document.getElementById("idckBtn");
			
			idInput.value = "";
			idInput.readOnly = false;
			idckBtn.disabled = false; 
		};
		
		document.getElementById("close").onclick = function() {
			document.getElementById("modal").style.display = "none";
		};
		
		const contextPath = "${contextPath}";
		
		//아이디 중복체크
		document.getElementById("idckBtn").onclick = function() {
			const idInput = document.querySelector("#emp_id");
			const emp_id = idInput.value.trim();
			const idckBtn = document.getElementById("idckBtn");
			
			if(emp_id === "") {
				alert("아이디를 입력하세요");
				idInput.focus();
				return;
			}
			
			const url = contextPath + "/emp/idCheck?emp_id=" + encodeURIComponent(emp_id);
			
			fetch(url)
				.then(response => {
					if(!response.ok) throw new Error("서버오류");
					return response.json();
				})
				.then(data => {
					if(data.exists) {
						alert("이미 사용 중인 아이디입니다");
						idInput.focus();
					} else {
						alert("사용 가능한 아이디입니다");
						idckBtn.disabled = true; 
						idInput.readOnly = true;
					}
				})
				.catch(error => {
					console.error("중복체크 에러:"+error);
					alert("중복 체크 중 오류가 발생했습니다");
				});
		};
		
		
		
	</script>
	
</body>
</html>