<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />

<!DOCTYPE html>
<html lang="ko">
<%@ include file="../include/header.jsp" %>
<body>
<div class="container-fluid">
    <div class="row">
        <%@ include file="../include/left_column.jsp" %>

        <!-- 메인 콘텐츠 -->
        <div class="col-10 main p-4">
            <h3 class="fw-bold mb-4">창고별 자재 리스트</h3>

            <!-- 검색 폼 -->
            <form action="${contextPath}/incoming/material_storage" method="get" class="row g-3 align-items-end mb-4">
                <div class="col-md-2">
                    <label class="form-label">창고코드</label>
                    <select name="mstorage_code" class="form-select" required>
                        <option value="MW001" <c:if test="${mstorage_code eq 'MW001'}">selected</c:if>>MW001</option>
                        <option value="MW002" <c:if test="${mstorage_code eq 'MW002'}">selected</c:if>>MW002</option>
                        <option value="MW003" <c:if test="${mstorage_code eq 'MW003'}">selected</c:if>>MW003</option>
                    </select>
                </div>

                <div class="col-md-2">
                    <label class="form-label">자재코드</label>
                    <input type="text" name="material_code" value="${param.material_code}" class="form-control">
                </div>

                <div class="col-md-4">
                    <label class="form-label">입고날짜</label>
                    <div class="d-flex gap-2">
                        <input type="date" name="start_date" value="${param.start_date}" class="form-control">
                        <span class="align-self-center">~</span>
                        <input type="date" name="end_date" value="${param.end_date}" class="form-control">
                    </div>
                </div>

                <div class="col-md-2">
                    <button type="submit" class="btn btn-primary w-100">검색</button>
                </div>
            </form>

            <!-- 자재 테이블 -->
            <div class="table-responsive">
                <table class="table table-bordered table-striped text-center align-middle" style="background-color: #E6F7FF;">
                    <thead style="background-color: #EDFFF4;">
                        <tr>
                            <th style="background-color: #EDFFF4;">부품명</th>
                            <th style="background-color: #EDFFF4;">품목코드</th>
                            <th style="background-color: #EDFFF4;">소재</th>
                            <th style="background-color: #EDFFF4;">규격</th>
                            <th style="background-color: #EDFFF4;">단위</th>
                            <th style="background-color: #EDFFF4;">수량</th>
                            <th style="background-color: #EDFFF4;">창고</th>
                            <th style="background-color: #EDFFF4;">담당자</th>
                            <th style="background-color: #EDFFF4;">공급업체</th>
                            <th style="background-color: #EDFFF4;">투입레벨</th>
                            <th style="background-color: #EDFFF4;">입고날짜</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="incoming" items="${material_storage}">
                        <thead style="background-color: #ffffff;">
                            <tr>
                                <td>${incoming.material_name}</td>
                                <td>${incoming.material_code}</td>
                                <td>${incoming.material_raw_material}</td>
                                <td>${incoming.material_description}</td>
                                <td>${incoming.material_unit}</td>
                                <td>${incoming.mstorage_stock}</td>
                                <td>${incoming.mstorage_code}</td>
                                <td>${incoming.emp_name}</td>
                                <td>${incoming.sup_name}</td>
                                <td>${incoming.product_no}</td>
                                <td>${incoming.material_in_date}</td>
                            </tr>
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
