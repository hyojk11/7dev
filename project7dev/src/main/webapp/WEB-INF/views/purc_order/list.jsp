<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구매발주목록</title>
</head>
<body>
	<h2>구매발주</h2>
	<table border="1">
		<tr>
			<th colspan="10">구매발주목록</th>
		</tr>
		<tr>
			<th>NO.</th>
			<th>발주번호</th>
			<th>발주일</th>
			<th>거래처명</th>
			<th>총 수량</th>
			<th>총 금액</th>
			<th>화폐단위</th>
			<th>납기일</th>
			<th>담당자</th>
			<th>상태</th>
		</tr>
		<c:forEach var="data" items="${list}" varStatus="status">
		<tr>
			<td>${status.index+1}</td>
			<td>${data.purc_order_code}</td>
			<td>${data.purc_order_reg_date}</td>
			<td>${data.sup_name}</td>
			<td>${data.cont_material_cnt}</td>
			<td>${data.total_price}</td>
			<td>${data.mprice_currency}</td>
			<td>${data.end_date}</td>
			<td>${data.emp_name}</td>
			<td>
				<c:choose>
					<c:when test="${data.purc_order_status == 1}">
						<span style="color:red;">마감 전</span>
					</c:when>
					<c:when test="${data.purc_order_status == 0}">
						<span style="color:blue;">마감완료</span>
					</c:when>
					<c:otherwise>
						-
					</c:otherwise>
				</c:choose>
			</td>
		</tr>
		</c:forEach>
	</table>
</body>
</html>