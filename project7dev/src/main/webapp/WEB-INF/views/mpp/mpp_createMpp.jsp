<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>	
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page session="true" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="ko">
<%@ include file="../include/header.jsp" %>
<body>
<div class="container-fluid">
    <div class="row">
        <%@ include file="../include/left_column.jsp" %>

        <!-- 메인 콘텐츠 -->
        <div class="col-10 main" style="padding-right: 20px;">
            <h3 class="fw-bold mb-4">부품조달계획 등록</h3>

            <form action="${contextPath}/mpp/createMpp" method="post">
                <input type="hidden" name="mrpDueDate" value="${mrp.mrpDueDate}" />
                <input type="hidden" name="mppCode" value="${mppCode}" />
                <input type="hidden" name="mppVer" value="${mppVer}" />
                <input type="hidden" name="mppRegDate" value="${today}" />
                <input type="hidden" name="mrpNo" value="${mrp.mrpNo}" />
                <input type="hidden" name="empNo" value="${mrp.empNo}" />
                <input type="hidden" name="prplNo" value="${mrp.prplNo}" />

                <!-- 기본 정보 -->
                <table class="table table-bordered text-center align-middle mb-4">
                    <tbody>
                        <tr>
                            <td style="background-color: #EDFFF4; width: 15%;">부품조달계획코드</td>
                            <td style="width: 35%;">${mppCode}</td>
                            <td style="background-color: #EDFFF4; width: 15%;">수립일</td>
                            <td style="width: 35%;">${today}</td>
                        </tr>
                        <tr>
                            <td style="background-color: #EDFFF4;">차수</td>
                            <td>${mppVer}</td>
                            <td colspan="2"></td>
                        </tr>
                    </tbody>
                </table>

                <!-- 제품 정보 -->
                <table class="table table-bordered text-center align-middle mb-4">
                    <tbody>
                        <tr>
                            <td style="background-color: #EDFFF4;">제품명</td>
                            <td>${mrp.productName}</td>
                            <td style="background-color: #EDFFF4;">제품코드</td>
                            <td>${mrp.productCode}</td>
                        </tr>
                        <tr>
                            <td style="background-color: #EDFFF4;">자재납기일</td>
                            <td>${fn:substring(mrp.mrpDueDate, 0, 10)}</td>
                            <td colspan="2"></td>
                        </tr>
                    </tbody>
                </table>

                <!-- 소요자재 목록 -->
                <div class="mb-4">
                    <label class="fw-bold mb-2">소요자재 목록</label>
                    <div class="table-responsive">
                        <table class="table table-bordered text-center align-middle">
                            <thead style="background-color: #EDFFF4;">
                                <tr>
                                    <th style="background-color: #EDFFF4;">자재명</th>
                                    <th style="background-color: #EDFFF4;">자재코드</th>
                                    <th style="background-color: #EDFFF4;">자재창고</th>
                                    <th style="background-color: #EDFFF4;">순소요량</th>
                                    <th style="background-color: #EDFFF4;">포장단위</th>
                                    <th style="background-color: #EDFFF4;">리드타임(일)</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="mrpItem" items="${mrpList}">
                                    <tr>
                                        <td>${mrpItem.materialName}</td>
                                        <td>${mrpItem.materialCode}</td>
                                        <td>${mrpItem.mstorageCode}</td>
                                        <td>${mrpItem.mrpQuantity}</td>
                                        <td>${mrpItem.mrpSku}</td>
                                        <td>${mrpItem.mrpLeadtime}</td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>

                <!-- 담당자 정보 -->
                <table class="table table-bordered text-center align-middle mb-4">
                    <tbody>
                        <tr>
                            <td style="background-color: #EDFFF4;">사원번호</td>
                            <td>${mrp.empNo}</td>
                            <td style="background-color: #EDFFF4;">담당자명</td>
                            <td>${mrp.empName}</td>
                        </tr>
                        <tr>
                            <td style="background-color: #EDFFF4;">담당자 연락처</td>
                            <td>${mrp.empPhone}</td>
                            <td style="background-color: #EDFFF4;">담당자 메일</td>
                            <td>${mrp.empEmail}</td>
                        </tr>
                        <tr>
                            <td style="background-color: #EDFFF4;">기타사항</td>
                            <td colspan="3">
                                <textarea name="mppEtc" class="form-control" rows="4">${mrp.mrpEtc}</textarea>
                            </td>
                        </tr>
                    </tbody>
                </table>

                <!-- 버튼 -->
                <div class="text-center mb-5">
                    <button type="submit" class="btn btn-success px-4 py-2">등록</button>
                    <button type="button" class="btn btn-secondary px-4 py-2" onclick="history.back()">닫기</button>
                </div>
            </form>
        </div>
    </div>
</div>
<%@ include file="../include/footer.jsp" %>
</body>
</html>
