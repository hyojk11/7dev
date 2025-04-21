<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>	
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="ko">
<%@ include file="../include/header.jsp" %>
<body>
<div class="container-fluid">
    <div class="row">
        <%@ include file="../include/left_column.jsp" %>

        <!-- 오른쪽 메인 화면 -->
        <div class="col-10 main" style="padding-right: 20px;">
            <h3 class="fw-bold mb-4">자재소요계획</h3>

            <div class="mb-4">
                <table class="table table-bordered text-center align-middle" style="max-width: 1100px; margin: 0 auto; border-radius: 8px; box-shadow: 0 0 15px rgba(0, 0, 0, 0.1); background-color: #EDFFF4;">
                    <thead class="sticky-top bg-white">
                        <tr>
                            <th colspan="4">
                                <form action="${contextPath}/mrp/mrp_main" method="get" class="d-flex justify-content-center gap-2">
                                    <select name="searchType" class="form-select w-auto">
                                        <option value="productCode" selected>MRP코드</option>
                                        <option value="productName">제품명</option>
                                    </select>
                                    <input type="text" name="searchValue" class="form-control w-auto" placeholder="검색어 입력">
                                    <button type="submit" class="btn btn-primary">검색</button>
                                </form>
                            </th>
                        </tr>
                        <tr>
                            <th colspan="3" class="table-light">자재소요계획 목록</th>
                            <th>
                                <form action="${contextPath}/mrp/mrp_selectPrpl" method="get">
                                    <button type="submit" class="btn btn-success btn-sm">신규등록</button>
                                </form>
                            </th>
                        </tr>
                        <tr>
                            <th>자재소요계획코드</th>
                            <th>제품명</th>
                            <th>자재 납기일</th>
                            <th>담당자</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:set var="prevMrpCode" value="" />
                        <c:forEach var="mrp" items="${mrp}">
                            <c:if test="${mrp.mrpCode != prevMrpCode}">
                                <tr style="background-color: #f9f9f9;">
                                    <td>
                                        <a href="${contextPath}/mrp/mrp_selectMrp?mrpCode=${mrp.mrpCode}">
                                            ${mrp.mrpCode}
                                        </a>
                                    </td>
                                    <td>${mrp.productName}</td>
                                    <td>${fn:substring(mrp.mrpDueDate, 0, 10)}</td>
                                    <td>${mrp.empName}</td>
                                </tr>
                                <c:set var="prevMrpCode" value="${mrp.mrpCode}" />
                            </c:if>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
<%@ include file="../include/footer.jsp" %>
</body>
</html>
