<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>라인 출고</title>
</head>
<body>

<section>
	<div>
		<h3>라인 출고완료</h3>
	</div>
	
	<section>
		<div>
			<div>
				<label>'${selected.product_name }' 제품 ${product_cnt }개 생산을 위한 부품 출고</label>
			</div>
			<br>
			<div>
				<label>출고 내역</label>
			</div>
			<table>
			<tr>
				<td>라인번호</td>
				<td>라인코드</td>
				<td>제품번호</td>
				<td>제품코드</td>
				<td>제품이름</td>
				<td>출고수량</td>
				<td>출고단위</td>
				<td>출고일시</td>
			</tr>
		<c:forEach var="lineIO" items="${lineIO }">
			<tr>
				<td>${lineIO.line_no}</td>
				<td>${lineIO.line_code}</td>
				<td>${lineIO.product_no}</td>
				<td>${lineIO.product_code}</td>
				<td>${lineIO.product_name}</td>
				<td>${lineIO.line_out_cnt}</td>
				<td>EA</td>
				<td>${lineIO.line_out_date}</td>
			</tr>
		</c:forEach>
			</table>
			<br>
			<div>
				<label>입고 내역</label>
			</div>
			<table>
			<tr>
				<td>창고번호</td>
				<td>창고코드</td>
				<td>제품번호</td>
				<td>제품코드</td>
				<td>제품이름</td>
				<td>입고수량</td>
				<td>입고단위</td>
				<td>입고일시</td>
			</tr>
		<c:forEach var="lineIO" items="${lineIO }" varStatus="status">
		<c:if test="${status.first}">
			<tr>
				<td>${lineIO.pstorage_no}</td>
				<td>${lineIO.pstorage_code}</td>
				<td>${lineIO.product_no}</td>
				<td>${lineIO.product_code}</td>
				<td>${lineIO.product_name}</td>
				<td>${lineIO.product_in_cnt}</td>
				<td>EA</td>
				<td>${lineIO.product_in_date}</td>
			</tr>
		</c:if>
		</c:forEach>
			</table>
		</div>
	</section>
		<div>
			<form>
				<button type="button" onclick="location.href='${contextPath }/issuing/lineout'">계속하기</button>
				<button type="button" onclick="location.href='${contextPath }/issuing/testview_issuing'">돌아가기</button>
			</form>
		</div>

</section>

</body>
</html>