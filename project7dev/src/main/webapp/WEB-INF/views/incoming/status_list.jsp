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
            <h3 class="fw-bold mb-4">발주진행현황</h3>

            <!-- 검색 폼 -->
            <form action="${contextPath}/incoming/status_list" method="get" class="row g-3 align-items-end mb-4">
                <div class="col-md-3">
                    <label class="form-label">거래처</label>
                    <input type="text" list="supplier" name="sup" value="${param.sup}" class="form-control">
                    <datalist id="supplier">
                        <option value="ooo잉크테크"></option>
                        <option value="클립앤파트너스"></option>
                        <option value="에이비사출산업"></option>
                        <option value="흑연코리아"></option>
                        <option value="나무마루"></option>
                    </datalist>
                </div>

                <div class="col-md-2">
                    <label class="form-label">발주일</label>
                    <input type="date" name="purc_order_reg_date" value="${param.purc_order_reg_date}" class="form-control">
                </div>

                <div class="col-md-2">
                    <label class="form-label">부품번호</label>
                    <input type="text" name="material_code" value="${param.material_code}" class="form-control">
                </div>

                <div class="col-md-2">
                    <label class="form-label">부품명</label>
                    <input type="text" name="material_name" value="${param.material_name}" class="form-control">
                </div>

                <div class="col-md-2">
                    <label class="form-label">발주번호</label>
                    <input type="text" name="purc_order_code" value="${param.purc_order_code}" class="form-control">
                </div>

                <div class="col-md-1">
                    <label class="form-label invisible">조회</label>
                    <button type="submit" class="btn btn-primary w-100">조회</button>
                </div>
            </form>

            <!-- 요약 -->
            <div class="mb-3">
                <strong>입고품목 [ 총 <c:out value="${totalCount}" /> 건 ]</strong>
            </div>

            <!-- 테이블 -->
            <div class="table-responsive">
                <table class="table table-bordered table-striped text-center align-middle" style="background-color: #E6F7FF;">
                    <thead style="background-color: #EDFFF4;">
                        <tr>
                            <th style="background-color: #EDFFF4;">No</th>
                            <th style="background-color: #EDFFF4;">진행상태</th>
                            <th style="background-color: #EDFFF4;">거래처</th>
                            <th style="background-color: #EDFFF4;">부품번호</th>
                            <th style="background-color: #EDFFF4;">부품명</th>
                            <th style="background-color: #EDFFF4;">발주번호</th>
                            <th style="background-color: #EDFFF4;">입고번호</th>
                            <th style="background-color: #EDFFF4;">발주일</th>
                            <th style="background-color: #EDFFF4;">납품일</th>
                            <th style="background-color: #EDFFF4;">입고일</th>
                            <th style="background-color: #EDFFF4;">발주수량</th>
                            <th style="background-color: #EDFFF4;">입고수량</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="ps" items="${status_list}" varStatus="status">
                            <tr>
                                <td>${status.index + 1}</td>
                                <td>${ps.material_in_state}</td>
                                <td>${ps.sup_name}</td>
                                <td>${ps.material_code}</td>
                                <td>${ps.material_name}</td>
                                <td>${ps.purc_order_code}</td>
                                <td>${ps.material_in_no}</td>
                                <td>${ps.purc_order_reg_date}</td>
                                <td>${ps.mrp_due_date}</td>
                                <td>${ps.material_in_date}</td>
                                <td>${ps.cont_material_cnt}</td>
                                <td>${ps.material_in_cnt}</td>
                            </tr>
                        </c:forEach>
                        <c:if test="${empty status_list}">
                            <tr>
                                <td colspan="12">조회 결과가 없습니다.</td>
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
