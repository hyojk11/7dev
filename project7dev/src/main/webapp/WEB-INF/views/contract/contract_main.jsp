<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<%@ page session="true" %>    

<!DOCTYPE html>
<html lang="ko">
<%@ include file="../include/header.jsp" %>

<body>
<div class="container-fluid">
    <div class="row">
        <%@ include file="../include/left_column.jsp" %>

        <!-- 메인 콘텐츠 -->
        <div class="col-10 main p-4">
            <h3 class="fw-bold mb-4">계약 관리</h3>

            <!-- 검색 폼 -->
            <form action="${contextPath}/contract/contract_main" method="get" class="row g-3 align-items-end mb-4">
                <div class="col-md-2">
                    <label class="form-label">검색 유형</label>
                    <select name="searchType" id="selectField" class="form-control">
                        <option value="contCode" selected >계약코드</option>
                        <option value="materialCode">부품코드</option>
                        <option value="supName">거래처명</option>
                    </select>
                </div>
                <div class="col-md-4">
                    <label class="form-label">검색값</label>
                    <input type="text" name="searchValue" id="inputCode" class="form-control" value="${param.searchValue}">
                </div>
                <div class="col-md-2">
                    <label class="form-label invisible">검색</label>
                    <button type="submit" class="btn btn-primary w-100">검색</button>
                </div>
                <div class="col-md-2 ms-auto">
                    <label class="form-label invisible">신규등록</label>
                        <button type="button" class="btn btn-success w-100" onclick="window.location.href='${contextPath}/contract/selectQuotation'">
                        	신규등록
                        </button>
                </div>
            </form>

            <!-- 계약 목록 테이블 -->
            <div class="scroll-container">
                <table class="table table-bordered text-center align-middle">
                    <thead style="background-color: #ffffff;">
                        <tr>
                            <th colspan="5">계약 목록</th>
                        </tr>
                        <tr>
                            <th style="background-color: #EDFFF4;">계약코드</th>
                            <th style="background-color: #EDFFF4;">부품코드</th>
                            <th style="background-color: #EDFFF4;">부품명</th>
                            <th style="background-color: #EDFFF4;">회사명</th>
                            <th style="background-color: #EDFFF4;">상세보기</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="contract" items="${contractList}">
                            <tr>
                                <td>${contract.contCode}</td>
                                <td>${contract.materialCode}</td>
                                <td>${contract.materialName}</td>
                                <td>${contract.supName}</td>
                                <td>
                                    <form action="${contextPath}/contract/selectContract" method="get">
                                        <input type="hidden" name="contNo" value="${contract.contNo}" />
                                        <button type="submit" class="btn btn-success">보기</button>
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>
                        <c:if test="${empty contractList}">
                            <tr>
                                <td colspan="5">조회 결과가 없습니다.</td>
                            </tr>
                        </c:if>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<%@ include file="../include/footer.jsp" %>
</body>
</html>
