<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<title>제품 생산</title>
</head>
<body>

<section>
	<div>
		<h3>재고 확인 후 생산하기</h3>
	</div>
	
	<c:set var="canProduce" value="true" />
	
	<section>
		<div>
			<table>
			<tr>
				<td>부품번호</td>
				<td>부품이름</td>
				<td>부품코드</td>
				<td>부품원자재</td>
				<td>부품창고코드</td>
				<td>부품창고재고</td>
			</tr>
		<c:forEach var="materialstock" items="${materialstock }">
			<c:if test="${materialstock.mstorage_stock < (product_cnt * materialstock.material_quantity) }">
				<c:set var="canProduce" value="false" />
			</c:if>
			<tr>
				<td>${materialstock.material_no}</td>
				<td>${materialstock.material_name}</td>
				<td>${materialstock.material_code}</td>
				<td>${materialstock.material_raw_material}</td>
				<td>${materialstock.mstorage_code}</td>
				<td>${materialstock.mstorage_stock}</td>
			</tr>
		</c:forEach>
			</table>
			<br>
			<div>생산수량 : ${product_cnt }</div>
		</div>
	</section>
		<div>
		<c:choose>
			<c:when test="${canProduce eq 'true' }">
				<p>창고 내 재고가 충분히 있습니다</p><br>
				<button type="button">생산하기</button>
				<button type="button">취소하기</button>
			</c:when>
			<c:otherwise>
				<p>재고가 부족한 부품이 있어 생산할 수 없습니다</p><br>
				<button type="button">뒤로가기</button>
			</c:otherwise>
		</c:choose>
		</div>

</section>

</body>
</html>