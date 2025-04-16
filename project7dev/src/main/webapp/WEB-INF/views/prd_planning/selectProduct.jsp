<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%@ page session="true" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>품목정보</title>
</head>
<body>
	<table border="1" cellpadding="5" cellspacing="1">
   	<thead>
        <tr>
	        <th colspan="4">
	        	<form action="${contextPath}/prd_planning/searchProduct" method="get">
						<select name="searchType" id="selectField">
				            <option value="product_code" selected>품목코드</option>
				            <option value="product_name">품목명</option>
				        </select>
					  <input type="text" name="keyword" id="inputCode">
		            <input type="submit" value="검색">
	            </form>
		    </th>
        </tr>
    </thead>
	<thead>
        <tr>
            <th>품목코드</th>
            <th>품목명</th>
            <th>판매여부</th>
            <th>생산계획</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="product" items="${list}">
      	  	<c:if test="${product.product_no >= 1}">
	            <tr>
	                <td>${product.product_code}</td>
	                <td>${product.product_name}</td>
	                <td>
						<c:choose>
						    <c:when test="${product.eop == 0}">판매예정</c:when>
						    <c:when test="${product.eop == 1}">판매중</c:when>
						    <c:when test="${product.eop == 2}">단종</c:when>
						    <c:otherwise>알 수 없음</c:otherwise>
						</c:choose>
					</td>
	                <td>
	             	    <form action="${contextPath}/prd_planning/register" method="get">
	                        <input type="hidden" name="product_no" value="${product.product_no}" />
	                        <input type="hidden" name="product_name" value="${product.product_name}" />
	                        <input type="hidden" name="product_code" value="${product.product_code}" />
	                        <button type="submit">등록</button>
	                    </form>
	                </td>
	            </tr>
            </c:if>
        </c:forEach>
    </tbody>
</table>
<div id="productModal" style="display:none; position:fixed; top:30%; left:40%; background:#fff; border:1px solid #000; padding:20px;">
    <form action="${contextPath}/prd_planning/registerSend" method="post">
        <label>품목코드: <input type="text" name="product_code" required></label><br>
        <label>품목명: <input type="text" name="product_name" required></label><br>
        <label>판매여부:
            <select name="eop">
                <option value="0">판매예정</option>
                <option value="1">판매중</option>
                <option value="2">단종</option>
            </select>
        </label><br>
        <button type="submit">저장</button>
        <button type="button" onclick="closeModal()">닫기</button>
    </form>
</div>	
<script>
  function openModal() {
    document.getElementById("productModal").style.display = "block";
  }

  function closeModal() {
    document.getElementById("productModal").style.display = "none";
  }
</script>            


</body>
</html>