<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:if test="${not empty resultMsg}">
	<script>
		alert("${resultMsg}");
	</script>
</c:if>
<h1>ADMIN</h1>
<button type="button" onclick="location.href='${contextPath}/mypage/empDetail'">마이페이지</button>
<button type="button" onclick="location.href='${contextPath}/logout'">로그아웃</button>
</body>
</html>