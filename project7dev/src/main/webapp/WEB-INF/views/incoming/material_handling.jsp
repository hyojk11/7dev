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
            <h3 class="fw-bold mb-4">자재 입고 관리</h3>

            <!-- 검색 조건 -->
            <form action="${contextPath}/incoming/material_handling" method="get" class="row g-3 align-items-end mb-4">
                <div class="col-md-2">
                    <label class="form-label">발주번호</label>
                    <input type="text" name="order_code" value="${param.purc_order_code}" class="form-control">
                </div>

                <div class="col-md-2">
                    <label class="form-label">조달상태</label>
                    <select name="mstorage_in_date" class="form-select">
                        <option value="">선택없음</option>
                        <option value="1" ${mstorage_in_date == '1' ? 'selected' : ''}>완료</option>
                        <option value="0" ${mstorage_in_date == '0' ? 'selected' : ''}>미완료</option>
                    </select>
                </div>

                <div class="col-md-2">
                    <label class="form-label">구매마감상태</label>
                    <select name="purc_order_status" class="form-select">
                        <option value="">선택없음</option>
                        <option value="1" ${purc_order_status == 1 ? 'selected' : ''}>완료</option>
                        <option value="0" ${purc_order_status == 0 ? 'selected' : ''}>미완료</option>
                    </select>
                </div>

                <div class="col-md-2">
                    <label class="form-label">자재마감상태</label>
                    <select name="material_in_state" class="form-select">
                        <option value="">선택없음</option>
                        <option value="1" ${material_in_state == 1 ? 'selected' : ''}>완료</option>
                        <option value="0" ${material_in_state == 0 ? 'selected' : ''}>미완료</option>
                    </select>
                </div>

                <div class="col-md-3">
                    <label class="form-label">발주날짜</label>
                    <div class="d-flex gap-2">
                        <input type="date" name="start_date" value="${param.start_date}" class="form-control">
                        <span class="align-self-center">~</span>
                        <input type="date" name="end_date" value="${param.end_date}" class="form-control">
                    </div>
                </div>

                <div class="col-md-1">
                    <label class="form-label invisible">검색</label>
                    <button type="submit" class="btn btn-primary w-100">검색</button>
                </div>
            </form>

            <!-- 입고예정 목록 테이블 -->
            <form action="${contextPath}/incoming/purchaseClose" method="post" id="myForm">
                <div class="table-responsive">
                    <table class="table table-bordered table-striped text-center align-middle" style="background-color: #E6F7FF;">
                        <thead style="background-color: #EDFFF4;">
                            <tr>
                                <th style="background-color: #EDFFF4;">선택</th>
                                <th style="background-color: #EDFFF4;">발주번호</th>
                                <th style="background-color: #EDFFF4;">거래처명</th>
                                <th style="background-color: #EDFFF4;">품목명</th>
                                <th style="background-color: #EDFFF4;">구매수량</th>
                                <th style="background-color: #EDFFF4;">입고수량</th>
                                <th style="background-color: #EDFFF4;">발주일</th>
                                <th style="background-color: #EDFFF4;">도착날짜</th>
                                <th style="background-color: #EDFFF4;">조달상태</th>
                                <th style="background-color: #EDFFF4;">구매마감</th>
                                <th style="background-color: #EDFFF4;">자재마감</th>
                            </tr>
                        </thead>
                        <tbody class="chkbox">
                            <c:forEach var="incoming" items="${material_handling}">
                                <tr>
                                    <td>
                                        <input type="checkbox" name="purc_order_no" value="${incoming.purc_order_no}"
                                            <c:if test="${incoming.material_in_state == 1 || incoming.purc_order_status == 1 || incoming.mstorage_in_date == null}">disabled</c:if>
                                            class="material-check">
                                    </td>
                                    <td>${incoming.purc_order_code}</td>
                                    <td>${incoming.sup_name}</td>
                                    <td>${incoming.material_name}</td>
                                    <td>${incoming.material_in_cnt}</td>
                                    <td>${incoming.material_in_cnt}</td>
                                    <td>${incoming.purc_order_reg_date}</td>
                                    <td>${incoming.mstorage_in_date}</td>
                                    <td>${incoming.mstorage_in_date != null ? '도착완료' : '배송중'}</td>
                                    <td>${incoming.purc_order_status == 0 ? '미완료' : '완료'}</td>
                                    <td>${incoming.material_in_state == 0 ? '미완료' : '완료'}</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>

                <div class="mt-3">
                    <button type="submit" class="btn btn-success">선택 발주 구매마감</button>
                </div>
            </form>
        </div>
    </div>
</div>

<%@ include file="../include/footer.jsp" %>

<script>
    document.getElementById("myForm").addEventListener("submit", function (e){
        const checked = document.querySelectorAll(".material-check:checked");
        if(checked.length === 0){
            alert("항목을 체크해야 합니다.");
            e.preventDefault();
        }
    });
</script>

</body>
</html>
