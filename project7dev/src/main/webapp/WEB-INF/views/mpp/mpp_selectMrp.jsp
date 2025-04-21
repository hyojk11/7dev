<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%@ page session="true" %>    
<!DOCTYPE html>
<html lang="ko">
<%@ include file="../include/header.jsp" %>
<body>
<div class="container-fluid">
    <div class="row">
        <%@ include file="../include/left_column.jsp" %>

        <!-- 메인 콘텐츠 -->
        <div class="col-10 main" style="padding-right: 20px;">
            <h3 class="fw-bold mb-4">부품조달계획</h3>

            <!-- 검색 폼 -->
            <div class="mb-4 d-flex justify-content-center">
                <form action="${contextPath}/mrp/mrp_main" method="get" class="d-flex gap-2 align-items-center">
                    <select name="searchType" id="selectField" class="form-select w-auto">
                        <option value="productCode" selected>제품코드</option>
                        <option value="productName">제품명</option>
                    </select>
                    <input type="text" name="searchValue" id="inputCode" class="form-control w-auto" placeholder="검색어 입력">
                    <input type="submit" value="검색" class="btn btn-primary">
                </form>
            </div>

            <!-- 자재소요계획 테이블 -->
            <div class="scroll-container">
                <table class="table table-bordered text-center align-middle" style="background-color: #F5F9FF;">
                    <thead class="table-light">
                        <tr>
                            <th colspan="5" class="bg-white">자재소요계획 목록</th>
                        </tr>
                        <thead style="background-color: #EDFFF4;">
                        <tr>
                            <th style="background-color: #EDFFF4;">자재소요계획코드</th>
                            <th style="background-color: #EDFFF4;">제품명</th>
                            <th style="background-color: #EDFFF4;">자재 납기일</th>
                            <th style="background-color: #EDFFF4;">담당자</th>
                            <th style="background-color: #EDFFF4;">선택</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:set var="prevMrpCode" value="" />
                        <c:forEach var="mrp" items="${mrp}">
                            <c:if test="${mrp.mrpCode != prevMrpCode}">    
                                <tr>
                                    <td>${mrp.mrpCode}</td>
                                    <td>${mrp.productName}</td>
                                    <td>${fn:substring(mrp.mrpDueDate, 0, 10)}</td>
                                    <td>${mrp.empName}</td>
                                    <td>
                                        <form action="${contextPath}/mpp/mpp_getCreateMpp" method="get">
                                            <input type="hidden" name="mrpCode" value="${mrp.mrpCode}" />
                                            <input type="hidden" name="prplNo" value="${mrp.prplNo}" />
                                            <input type="submit" value="등록" class="btn btn-success btn-sm">
                                        </form>
                                    </td>
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
