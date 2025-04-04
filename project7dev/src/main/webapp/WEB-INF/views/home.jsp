<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<html>
<head>
	<title>Home-login</title>
</head>
<body>
<c:if test="${not empty resultMsg}">
	<script>
		alert("${resultMsg}");
	</script>
</c:if>
	<img src="${contextPath}/resources/img/7chilldevLogo_Green_Long.png">
	<div>
		<h2 style="display: inline;">Login</h2><span>자재조달 관리 시스템</span>
		<form action="${contextPath}/login" method="post">
			<div>
				<p>
				ID<input type="text" name="user_id" required><br>
				PW<input type="password" name="user_password" required>
				</p>
				<p><input type="checkbox">Remember me</p>
			</div>
			<button>sign in</button>
		</form>
	</div>
</body>
</html>
