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
		<h3>제품 생산하기</h3>
	</div>
	
	<form action="produce" method="post">
		<div>
			<div>
				<label>제품 번호</label>
				<input type="text" name="product_no" 
				placeholder="1~3 사이의 수를 입력하세요" required>
			</div>
			<div>
				<label>생산 수량</label>
				<input type="text" name="product_cnt"
				placeholder="생산할 수량을 입력하세요" required>개
			</div>
			<div>
				<button type="submit">정보보내기</button>
			</div>
		</div>
	</form>
</section>

</body>
</html>