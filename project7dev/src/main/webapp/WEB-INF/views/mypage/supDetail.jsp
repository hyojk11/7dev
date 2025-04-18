<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
</head>
<body>
	<h2>마이페이지 - 상세정보</h2>
	<h4>정보 변경은 담당자에게 문의해 주시기 바랍니다</h4>
	<table border="1">
		<tr>
			<td>회사명</td>
			<td colspan="2">${dto.sup_name}</td>
		</tr>
		<tr>
			<td>사업자 등록번호</td>
			<td colspan="2">${dto.sup_reg_no}</td>
		</tr>
		<tr>
			<td>대표명</td>
			<td colspan="2">${dto.sup_ceo_name}</td>
		</tr>
		<tr>
			<td>회사 연락처</td>
			<td colspan="2">${dto.sup_phone}</td>
		</tr>
		<tr>
			<td>회사 메일</td>
			<td colspan="2">${dto.sup_email}</td>
		</tr>
		<tr>
			<td>회사 주소</td>
			<td colspan="2">${dto.sup_total_addr}</td>
		</tr>
		<tr><td colspan="2"><br></td></tr>
		<tr>
			<td>담당자명</td>
			<td colspan="2">${dto.sup_cip}</td>
		</tr>
		<tr>
			<td>담당자 연락처</td>
			<td colspan="2">${dto.sup_cip_phone}</td>
		</tr>
		<tr>
			<td>담당자 이메일</td>
			<td colspan="2">${dto.sup_cip_email}</td>
		</tr>
	</table>
	<br>
	<button type="button" id="backBtn" onclick="location.href='${contextPath}/sup_main'">메인으로</button>
	
	
<body>
</html>