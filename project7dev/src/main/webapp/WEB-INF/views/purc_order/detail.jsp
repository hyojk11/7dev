<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page session="true" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구매발주서 보기</title>
<style>
	@media print {
		button {
			display: none;
		}
		#printArea {
			position: absolute;
			top: 0;
			left: 0;
			width: 100%;
		}
	}
</style>
</head>
<body>
	<div id="printArea">
	<h2>구매발주서</h2>
	<table border="1">
		<tr>
			<td colspan="4">
				작성일 : 
				<fmt:parseDate value="${dto.purc_order_reg_date}" pattern="yyyy-MM-dd HH:mm:ss" var="regDate" />
				<fmt:formatDate value="${regDate}" pattern="yyyy년 MM월 dd일 E요일" />
			</td>
			<td colspan="3">
				납기일 : ${dto.mrp_due_date}
			</td>
			<td colspan="3">
				문서번호 : ${dto.purc_order_code}
			</td>
		</tr>
		<tr>
			<td colspan="5">공급자</td>
			<td colspan="5">공급받는자</td>
		</tr>
		<tr>
			<td colspan="2">등록번호</td>
			<td colspan="3">${dto.sup_reg_no}</td>
			<td colspan="2">등록번호</td>
			<td colspan="3">${dto.comp_reg_no}</td>
		</tr>
		<tr>
			<td>상 호</td>
			<td colspan="2">${dto.sup_name}</td>
			<td>성 명</td>
			<td>${dto.sup_ceo_name}</td>
			<td>상 호</td>
			<td colspan="2">${dto.comp_name}</td>
			<td>성 명</td>
			<td>${dto.comp_ceo_name}</td>
		</tr>
		<tr>
			<td>주 소</td>
			<td colspan="4">${dto.sup_total_addr}</td>
			<td>주 소</td>
			<td colspan="4">${dto.comp_total_addr}</td>
		</tr>
		<tr>
			<td>담당자</td>
			<td>${dto.sup_cip}</td>
			<td>담당자 이메일</td>
			<td colspan="2">${dto.sup_cip_email}</td>
			<td>담당자</td>
			<td>${dto.emp_name}</td>
			<td>담당자 이메일</td>
			<td colspan="2">${dto.emp_email}</td>
		</tr>
		<tr>
			<td colspan="10"><br></td>
		</tr>
		<tr>
			<td>NO</td>
			<td>품목</td>
			<td>품목번호</td>
			<td>규격</td>
			<td>단위</td>
			<td>단가</td>
			<td>수량</td>
			<td>소계</td>
			<td>화폐단위</td>
			<td>비고</td>
		</tr>
		
		<c:set var="totalCnt" value="0" />
		<c:set var="totalPrice" value="0" />
		
		<c:forEach var="data" items="${list}" varStatus="i">
		<tr>
			<td>${i.index+1}</td>
			<td>${data.material_name}</td>
			<td>${data.material_code}</td>
			<td>${data.material_description}</td>
			<td>${data.cont_material_sku}</td>
			<td>${data.cont_mprice}</td>
			<td>${data.cont_material_cnt}</td>
			<td>${data.total_price}</td>
			<td>${data.mprice_currency}</td>
			<td>${data.purc_order_etc}</td>
		</tr>
		
		<c:set var="totalCnt" value="${totalCnt + data.cont_material_cnt}" />
		<c:set var="totalPrice" value="${totalPrice + data.total_price}" />
		
		</c:forEach>
		<tr>
			<td colspan="6">합 계</td>
			<td>${totalCnt}</td>
			<td>${totalPrice}</td>
			<td colspan="2"></td>
		</tr>
	</table>
	</div>
	<button onclick="location.href='${contextPath}/purc_order/list'">이전으로</button>
	<button onclick="window.print()">인 쇄</button>
	<button>계약 상세</button>
</body>
</html>