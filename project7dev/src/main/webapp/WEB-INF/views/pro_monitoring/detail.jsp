<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>진척검수 현황</title>
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
	  width: 800px;
	  border-radius: 10px;
	  position: relative;
	}
	
</style>
</head>
<body>
	<h2>진척검수 현황</h2>
	<table border="1">
		<tr>
			<td>발주번호</td>
			<td colspan="2">${dto.purc_order_code}</td>
			<td>발주날짜</td>
			<td colspan="2">${dto.purc_order_reg_date}</td>
			<td>담당자</td>
			<td>${dto.emp_name}</td>
		</tr>
		<tr>
			<td colspan="2">거래처명</td>
			<td colspan="2">${dto.sup_name}</td>
			<td colspan="2">사업자 등록번호</td>
			<td colspan="2">${dto.sup_reg_no}</td>
		</tr>
		<tr>
			<td colspan="2">대표자</td>
			<td colspan="2">${dto.sup_ceo_name}</td>
			<td colspan="2">전화번호</td>
			<td colspan="2">${dto.sup_phone}</td>
		</tr>
		<tr>
			<td colspan="2">주소</td>
			<td colspan="2">${dto.sup_total_addr}</td>
			<td colspan="2">거래처 담당자</td>
			<td colspan="2">${dto.sup_cip}</td>
		</tr>
		<tr>
			<td colspan="2">담당자 연락처</td>
			<td colspan="2">${dto.sup_cip_phone}</td>
			<td colspan="2">담당자 이메일</td>
			<td colspan="2">${dto.sup_cip_email}</td>
		</tr>
		</table>
		<br>
		<table border="1">
		<tr>
			<td colspan="8">자재별 진척검수 현황</td>
		</tr>
		<tr>
			<td>NO.</td>
			<td>자재명</td>
			<td>자재번호</td>
			<td>발주수량</td>
			<td>납기일</td>
			<td>검수완료수량</td>
			<td>진척률(%)</td>
			<td>평가</td>
		</tr>
		<c:forEach var="sdata" items="${summaryList}" varStatus="i">
		<tr>
			<td>${i.index+1}</td>
			<td>${sdata.material_name}</td>
			<td>${sdata.material_code}</td>
			<td>${sdata.cont_material_cnt}</td>
			<td>${sdata.mrp_due_date}</td>
			<td>${sdata.total_material_cnt}</td>
			<td>${sdata.total_progress_rate}</td>
			<td></td><!-- *************** 평가구현해야함 ************-->
		</tr>
		</c:forEach>
	</table>
	<br>
	<table border="1">
		<tr>
			<td colspan="9">차수별 진척검수 현황</td>
		</tr>
		<c:set var="currentVer" value="0" />
		<c:forEach var="pdata" items="${progressList}" varStatus="i">
			<c:if test="${currentVer != pdata.progress_monitoring_ver}">
				<c:set var="currentVer" value="${pdata.progress_monitoring_ver}" />
				<tr>
					<td colspan="9">ver.${pdata.progress_monitoring_ver}(${pdata.progress_monitoring_ver}차)</td>
				</tr>
				<tr>
					<td>NO.</td>
					<td>자재명</td>
					<td>자재번호</td>
					<td>발주수량</td>
					<td>납기일</td>
					<td>검수날짜</td>
					<td>검수완료수량</td>
					<td>진척률(%)</td>
					<td>평가</td>
				</tr>
			</c:if>
			<c:if test="${currentVer > 0}">
			<tr>
				<td>${i.index+1}</td>
				<td>${pdata.material_name}</td>
				<td>${pdata.material_code}</td>
				<td>${pdata.cont_material_cnt}</td>
				<td>${pdata.mrp_due_date}</td>
				<td>${pdata.progress_monitoring_date}</td>
				<td>${pdata.total_material_cnt}</td>
				<td>${pdata.total_progress_rate}</td>
				<td></td>
			</tr>
			<tr>
				<button>고객사보고</button>
			</tr>
			</c:if>
		</c:forEach>
	</table>
	<br>
	<button type="button" onclick="location.href='${contextPath}/pro_monitoring/list'">목록으로</button>
	<button id="openModalBtn">검수등록</button>
	
	
	<!-- 진척검수 등록 모달 -->
	<div id="modal" class="modal">
		<div class="modal_content">
			<h3>진척검수 등록</h3>
			<form action="${contextPath}/pro_monitoring/register" method="post">
				<input type="hidden" name="purc_order_code" value="${dto.purc_order_code}">
				<input type="hidden" name="purc_order_no" value="${dto.purc_order_no}">
				<input type="hidden" name="emp_no" value="${dto.emp_no}">
				<table border="1">
					<tr>
						<td>ver.</td>
						<td><input type="text" name="progress_monitoring_ver" value=${dto.progress_monitoring_ver + 1} readOnly></td>
					</tr>
					<tr>
						<td>검수 날짜</td>
						<td><input type="date" name="progress_monitoring_date" required></td>
					</tr>
				</table>
				<br>
				<table border="1">
					<tr>
						<td>자재명</td>
						<td>자재번호</td>
						<td>발주수량</td>
						<td>누적 검수수량</td>
						<td>당차 검수수량</td>
						<td>비고</td>
					</tr>
					<c:forEach var="data" items="${summaryList}">
					<tr>
						<td>${data.material_name}</td>
						<td>${data.material_code}</td>
						<td>${data.cont_material_cnt}</td>
						<td>${data.total_material_cnt}</td>
						<td>
						<input type="hidden" name="material_nos" value="${data.material_no}">
						<input type="number" name="material_cnts" required>
						</td>
						<td><textarea name="progress_monitoring_etcs" rows="3" cols="30" placeholder="검수 관련 메모, 특이사항 등"></textarea></td>
					</tr>
					</c:forEach>
				</table>
				<br>
				<button>검수등록</button>
				<button type="button" class="close" id="close">취소</button>
			</form>
		</div>
	</div>
	<!-- / 모달 끝 -->
	
	<!-- 자바스크립트 함수-->
	<script>
		document.getElementById("openModalBtn").onclick = function() {
			document.getElementById("modal").style.display = "block";
		};
		
		document.getElementById("close").onclick = function() {
			document.getElementById("modal").style.display = "none";
		};
		
	</script>
	
	
<body>
</html>