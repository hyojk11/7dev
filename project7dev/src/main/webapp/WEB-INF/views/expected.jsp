<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>입고예정 리스트</title>
</head>
<body>
	
	<h1> 입고예정 리스트 </h1>
	
	<form action="expected" method="get">
	자재코드 : <input type="text" name="material_code" required>
	검수상태 : 합<input type="checkbox" name="ok"> / 미흡<input type="checkbox" name="no">
	입고날짜 : <input type="date" name="material_in_date">
	<button type="submit">검색</button>
	</form>
	
<form action="/chill/materialIn" method="post">
<table border="1">
    <thead>
        <tr>
            <th>선택</th>
            <th>번호</th>
            <th>부품명</th>
            <th>품목코드</th>
            <th>소재</th>
            <th>규격</th>
            <th>단위</th>
            <th>수량</th>
            <th>공급업체</th>
            <th>입고날짜</th>
            <th>상태</th>
        </tr>
    </thead>
    <tbody>
    <c:forEach var="incoming" items="${expected}">
    <tr>
        <td><input type="checkbox" name="material_material_no" value="${incoming.material_material_no}"></td>
        <td>${incoming.material_material_no}</td>
        <td>${incoming.material_name}</td>
        <td>${incoming.material_code}</td>
        <td>${incoming.material_raw_material}</td>
        <td>${incoming.material_description}</td>
        <td>${incoming.material_unit}</td>
        <td>${incoming.mstorage_stock}</td>
        <td>${incoming.sup_name}</td>
        <td>${incoming.material_in_date}</td>
        <td>${incoming.state}</td>
    </tr>
    </c:forEach>
    </tbody>
</table>

<button type="submit">입고 등록</button>
</form>

</body>
</html>