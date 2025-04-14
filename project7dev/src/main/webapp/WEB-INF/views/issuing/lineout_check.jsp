<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<title>라인 출고</title>
</head>
<body>

<section>
	<div>
		<h3>라인 재고 확인 후 생산하기</h3>
	</div>
	
	<c:set var="canLineout" value="true" />
	
	<section>
		<div>
			<div>
				<label>'${selected.product_name }' 제품의 사용부품 및 재고 현황</label>
			</div>
			<br>
			<table>
			<tr>
				<td>부품번호</td>
				<td>부품이름</td>
				<td>부품코드</td>
				<td>부품원자재</td>
				<td>생산라인코드</td>
				<td>생산라인재고</td>
				<td>필요수량</td>
				<td>충분여부</td>
			</tr>
		<c:forEach var="linestock" items="${linestock }">
			<c:set var="haveMaterial" value="true" />
			<c:if test="${linestock.line_stock < linestock.material_produce }">
				<c:set var="canLineout" value="false" />
				<c:set var="haveMaterial" value="false" />
			</c:if>
			<tr>
				<td>${linestock.material_no}</td>
				<td>${linestock.material_name}</td>
				<td>${linestock.material_code}</td>
				<td>${linestock.material_raw_material}</td>
				<td>${linestock.line_code}</td>
				<td>${linestock.line_stock}EA</td>
				<td>${linestock.material_produce}EA</td>
				<c:choose>
					<c:when test="${haveMaterial eq 'true' }">
						<td>충분</td>
					</c:when>
					<c:otherwise>
						<td>부족(${linestock.material_produce - linestock.line_stock }EA)
					</c:otherwise>
				</c:choose>
			</tr>
		</c:forEach>
			</table>
			<br>
			<div>생산수량 : ${product_cnt }</div>
		</div>
	</section>
		<div>
		<c:choose>
			<c:when test="${canLineout eq 'true' }">
				<p>라인 내 재고가 충분히 있습니다</p><br>
				
				<form action="${contextPath }/issuing/lineout_process">
					<input type="hidden" name="product_no" value="${selected.product_no }">
					<input type="hidden" name="product_cnt" value="${product_cnt }">
				
					<button type="submit">생산하기</button>
					<button type="button" onclick="location.href='${contextPath }/issuing/testview_issuing'">취소하기</button>
				</form>
			</c:when>
			<c:otherwise>
				<p>재고가 부족한 부품이 있어 정상적으로 생산할 수 없습니다</p><br>
				<button type="button" onclick="history.back();">뒤로가기</button>
			</c:otherwise>
		</c:choose>
		</div>

</section>

</body>
</html>