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

            <!-- 검색 폼 -->
            <form action="${contextPath}/incoming/expected" method="get" class="row g-3 align-items-end mb-4">
                <div class="col-md-2">
                    <label class="form-label">자재코드</label>
                    <input type="text" name="material_code" value="${param.material_code}" class="form-control">
                </div>

                <div class="col-md-2">
                    <label class="form-label">입고상태</label>
                    <div class="d-flex gap-2">
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="material_in_state" value="0" ${material_in_state == 0 ? 'checked' : ''}>
                            <label class="form-check-label">검수중</label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="material_in_state" value="1" ${material_in_state == 1 ? 'checked' : ''}>
                            <label class="form-check-label">완료</label>
                        </div>
                    </div>
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
                <table class="table table-bordered text-center align-middle" style="background-color: #E6F7FF;">
                    <thead style="background-color: #EDFFF4;">
                        <tr>
                            <th style="background-color: #EDFFF4;">선택</th>
                            <th style="background-color: #EDFFF4;">부품명</th>
                            <th style="background-color: #EDFFF4;">품목코드</th>
                            <th style="background-color: #EDFFF4;">소재</th>
                            <th style="background-color: #EDFFF4;">규격</th>
                            <th style="background-color: #EDFFF4;">단위</th>
                            <th style="background-color: #EDFFF4;">수량</th>
                            <th style="background-color: #EDFFF4;">공급업체</th>
                            <th style="background-color: #EDFFF4;">
                                <c:choose>
                                    <c:when test="${material_in_state == 1}">입고날짜</c:when>
                                    <c:otherwise>도착날짜</c:otherwise>
                                </c:choose>
                            </th>
                            <th style="background-color: #EDFFF4;">입고가능여부</th>
                            <th style="background-color: #EDFFF4;">상태</th>
                            <th style="background-color: #EDFFF4;">입고번호</th>
                        </tr>
                    </thead>
                    <tbody class="chkbox">
                        <c:forEach var="incoming" items="${expected}">
                            <tr>
                                <td><input type="checkbox" class="form-check-input materialChk"
                                           data-no="${incoming.material_no}"
                                           data-name="${incoming.material_name}"
                                           data-code="${incoming.material_code}"
                                           data-raw_material="${incoming.material_raw_material}"
                                           data-description="${incoming.material_description}"
                                           data-unit="${incoming.material_unit}"
                                           data-cnt="${incoming.material_in_cnt}"
                                           data-sup_no="${incoming.sup_no}"
                                           data-sup_name="${incoming.sup_name}"
                                           data-in_date="${incoming.mstorage_in_date}"
                                           data-material_in_state="${incoming.material_in_state}"
                                           data-status="${incoming.purc_order_status}"
                                           data-in_no="${incoming.material_in_no}"
                                           data-mstorage_snapshot_month="${incoming.mstorage_snapshot_month}"
                                           <c:if test="${incoming.material_in_state == 1 || incoming.purc_order_status == 0}">disabled</c:if>
                                    ></td>
                                <td>${incoming.material_name}</td>
                                <td>${incoming.material_code}</td>
                                <td>${incoming.material_raw_material}</td>
                                <td>${incoming.material_description}</td>
                                <td>${incoming.material_unit}</td>
                                <td>${incoming.material_in_cnt}</td>
                                <td>${incoming.sup_name}</td>
                                <td>${incoming.mstorage_in_date}</td>
                                <td>${incoming.purc_order_status == 0 ? '입고불가' : '입고가능' }</td>
                                <td>${incoming.material_in_state == 0 ? '입고대기' : '입고완료'}</td>
                                <td>${incoming.material_in_no}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>

            <!-- 자재 등록 버튼 -->
            <c:if test="${material_in_state != 1}">
                <button type="button" onclick="openModal()" class="btn btn-success mt-3">자재 등록</button>
            </c:if>

            <!-- 모달 -->
            <div id="myModal" class="border p-4 mt-4 bg-light" style="display:none;">
                <h5 class="mb-3">선택한 자재 리스트</h5>
                <form action="${contextPath}/incoming/expected/inProcess" method="post">
                    <table id="modalTable" class="table table-bordered table-sm text-center align-middle">
                        <thead class="table-light">
                            <tr>
                                <th>번호</th>
                                <th>부품명</th>
                                <th>품목코드</th>
                                <th>소재</th>
                                <th>규격</th>
                                <th>단위</th>
                                <th>수량</th>
                                <th>공급업체</th>
                                <th>
                                    <c:choose>
                                        <c:when test="${material_in_state == 1}">입고날짜</c:when>
                                        <c:otherwise>도착날짜</c:otherwise>
                                    </c:choose>
                                </th>
                                <th>상태</th>
                                <th>입고번호</th>
                                <th>창고</th>
                            </tr>
                        </thead>
                        <tbody id="body"></tbody>
                    </table>
                    <div class="mt-3 d-flex gap-2">
                        <input type="submit" value="등록" class="btn btn-primary">
                        <button type="button" onclick="closeModal()" class="btn btn-secondary">닫기</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<%@ include file="../include/footer.jsp" %>
</body>
</html>
