<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제품 생산</title>
</head>
<body>

<section>
	<div>
		<h3>부품 출고완료</h3>
	</div>
	
	<c:set var="canProduce" value="true" />
	
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
				<td>창고번호</td>
				<td>창고코드</td>
				<td>부품번호</td>
				<td>부품코드</td>
				<td>부품이름</td>
				<td>출고수량</td>
				<td>출고단위</td>
				<td>출고일시</td>
			</tr>
		<c:forEach var="storageIO" items="${storageIO }">
			<tr>
				<td>${storageIO.mstorage_no}</td>
				<td>${storageIO.mstorage_code}</td>
				<td>${storageIO.material_no}</td>
				<td>${storageIO.material_code}</td>
				<td>${storageIO.material_name}</td>
				<td>${storageIO.material_out_cnt}</td>
				<td>EA</td>
				<td>${storageIO.material_out_date}</td>
			</tr>
		</c:forEach>
			</table>
			<br>
			<div>
				<label>입고 내역</label>
			</div>
			<table>
			<tr>
				<td>라인번호</td>
				<td>라인코드</td>
				<td>부품번호</td>
				<td>부품코드</td>
				<td>부품이름</td>
				<td>입고수량</td>
				<td>입고단위</td>
				<td>입고일시</td>
			</tr>
		<c:forEach var="storageIO" items="${storageIO }">
			<tr>
				<td>${storageIO.line_no}</td>
				<td>${storageIO.line_code}</td>
				<td>${storageIO.material_no}</td>
				<td>${storageIO.material_code}</td>
				<td>${storageIO.material_name}</td>
				<td>${storageIO.line_in_cnt}</td>
				<td>EA</td>
				<td>${storageIO.line_in_date}</td>
			</tr>
		</c:forEach>
			</table>
		</div>
	</section>
		<div>
			<form>
				<button type="button" onclick="location.href='${contextPath }/issuing/produce'">계속하기</button>
				<button type="button" onclick="location.href='${contextPath }/issuing/testview_issuing'">돌아가기</button>
			</form>
		</div>

</section>

</body>
</html>