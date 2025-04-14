<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<title>부품 출고</title>
</head>
<body>

<section>
	<div>
		<h3>부품 출고하기</h3>
	</div>
	
	<form action="produce" method="post">
		<div>
			<div>
				<label>제품 이름</label>
				<select name="product_no">
					<c:forEach var="productlist" items="${productlist }">
						<option value="${productlist.product_no}">${productlist.product_name }
					</c:forEach>
				</select>
			</div>
			<div>
				<label>생산 수량</label>
				<input type="text" name="product_cnt"
				placeholder="생산할 수량을 입력하세요" required>개
			</div>
			<div>
				<button type="submit">부품 창고확인</button>
			</div>
		</div>
	</form>
</section>

</body>
</html>