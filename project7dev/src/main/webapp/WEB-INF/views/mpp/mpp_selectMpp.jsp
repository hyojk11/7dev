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

        <!-- 오른쪽 메인 화면 -->
        <div class="col-10 main" style="padding-right: 20px;">
            <h3 class="fw-bold mb-4">부품조달계획 상세보기</h3>

            <form action="${contextPath}/mpp/getCreatePurchaseOrder" method="get">
                <input type="hidden" name="mrpDueDate" value="${mrp.mrpDueDate}" />
                <input type="hidden" name="mppCode" value="${mpp.mppCode}" />
                <input type="hidden" name="mppNo" value="${mpp.mppNo}" />
                <input type="hidden" name="mppVer" value="${mpp.mppVer}" />
                <input type="hidden" name="mppRegDate" value="${today}" />
                <input type="hidden" name="mrpNo" value="${mpp.mrpNo}" />
                <input type="hidden" name="empNo" value="${mpp.empNo}" />
                <input type="hidden" name="prplNo" value="${mpp.prplNo}" />

                <!-- 부품조달계획 기본정보 테이블 -->
                <table class="table table-bordered text-center align-middle mb-4" style="max-width: 1000px; margin: 0 auto; background-color: #DBFFE8;">
                    <thead style="background-color: #EDFFF4;">
                        <tr>
                            <td style="width: 15%; background-color: #EDFFF4;">부품조달계획코드</td>
                            <td style="width: 35%;">${mpp.mppCode}</td>
                            <td style="width: 15%; background-color: #EDFFF4;">수립일</td>
                            <td style="width: 35%;">${mpp.mppRegDate}</td>
                        </tr>
                        <tr>
                            <td style="width: 15%; background-color: #EDFFF4;">차수</td>
                            <td colspan="3">${mpp.mppVer}</td>
                        </tr>
                    </thead>
                </table>

                <!-- 제품 정보 테이블 -->
                <table class="table table-bordered text-center align-middle mb-4" style="max-width: 1000px; margin: 0 auto;">
                    <thead style="background-color: #f8f9fa;">
                        <tr>
                            <td style="width: 15%; background-color: #EDFFF4;">제품명</td>
                            <td style="width: 35%;">${mpp.productName}</td>
                            <td style="width: 15%; background-color: #EDFFF4;">제품코드</td>
                            <td style="width: 35%;">${mpp.productCode}</td>
                        </tr>
                        <tr>
                            <td style="width: 15%; background-color: #EDFFF4;">자재납기일</td>
                            <td colspan="3">${fn:substring(mpp.mrpDueDate, 0, 10)}</td>
                        </tr>
                    </thead>
                </table>

                <!-- 자재 목록 -->
                <div class="scroll-container mb-4" style="max-width: 1000px; margin: 0 auto;">
                    <table class="table table-bordered text-center align-middle">
                        <thead style="background-color: #f1f1f1;">
                            <tr>
                                <th colspan="8">소요자재 목록</th>
                            </tr>
                            <tr>
                                <th style="width: 5%; background-color: #EDFFF4;"></th>
                                <th style="width: 15%; background-color: #EDFFF4;">자재명</th>
                                <th style="width: 20%; background-color: #EDFFF4;">자재코드</th>
                                <th style="width: 15%; background-color: #EDFFF4;">자재창고</th>
                                <th style="width: 10%; background-color: #EDFFF4;">순소요량</th>
                                <th style="width: 10%; background-color: #EDFFF4;">포장단위</th>
                                <th style="width: 10%; background-color: #EDFFF4;">리드타임(일)</th>
                                <th style="width: 10%; background-color: #EDFFF4;">발주상태</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="mrpList" items="${mrpList}" varStatus="status">
                                <tr>
                                    <td>
                                        <input type="checkbox" name="materials[${status.index}].selected" value="true" />
                                        <input type="hidden" name="materials[${status.index}].materialNo" value="${mrpList.materialNo}" />
                                        <input type="hidden" name="materials[${status.index}].mstorageNo" value="${mrpList.mstorageNo}" />
                                        <input type="hidden" name="materials[${status.index}].mrpNo" value="${mrpList.mrpNo}" />
                                        <input type="hidden" name="materials[${status.index}].mrpQuantity" value="${mrpList.mrpQuantity}" />
                                        <input type="hidden" name="materials[${status.index}].mrpSku" value="${mrpList.mrpSku}" />
                                        <input type="hidden" name="materials[${status.index}].mrpLeadtime" value="${mrpList.mrpLeadtime}" />
                                    </td>
                                    <td>${mrpList.materialName}</td>
                                    <td>${mrpList.materialCode}</td>
                                    <td>${mrpList.mstorageCode}</td>
                                    <td>${mrpList.mrpQuantity}</td>
                                    <td>${mrpList.mrpSku}</td>
                                    <td>${mrpList.mrpLeadtime}</td>
                                    <td>발주상태표시</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>

                <!-- 담당자 정보 -->
                <table class="table table-bordered text-center align-middle mb-4" style="max-width: 1000px; margin: 0 auto;">
                    <tr>
                        <td style="width: 15%; background-color: #EDFFF4;">사원번호</td>
                        <td style="width: 35%;">${mpp.empNo}</td>
                        <td style="width: 15%; background-color: #EDFFF4;">담당자명</td>
                        <td style="width: 35%;">${mpp.empName}</td>
                    </tr>
                    <tr>
                        <td style="background-color: #EDFFF4;">담당자 연락처</td>
                        <td>${mpp.empPhone}</td>
                        <td style="background-color: #EDFFF4;">담당자 메일</td>
                        <td>${mpp.empEmail}</td>
                    </tr>
                    <tr>
                        <td style="background-color: #EDFFF4;">기타사항</td>
                        <td colspan="3">${mpp.mppEtc}</td>
                    </tr>
                </table>

                <div class="text-center mt-4 mb-4">
                    <button type="submit" class="btn btn-primary px-4 py-2">구매발주진행</button>
                    <button type="button" class="btn btn-secondary px-4 py-2" onclick="history.back()">닫기</button>
                </div>

                <script>
                    document.querySelector("form").addEventListener("submit", function(e) {
                        const form = this;
                        const checkboxes = form.querySelectorAll('input[type="checkbox"][name*="selected"]');
                        const isChecked = Array.from(checkboxes).some(checkbox => checkbox.checked);

                        if (!isChecked) {
                            alert("선택된 자재가 없습니다.");
                            e.preventDefault();
                            return;
                        }

                        const rows = document.querySelectorAll("tbody tr");

                        rows.forEach((row, idx) => {
                            const checkbox = row.querySelector(`input[type="checkbox"]`);

                            if (!checkbox || !checkbox.checked) {
                                row.querySelectorAll("input[type='hidden']").forEach(input => {
                                    input.remove();
                                });

                                checkbox.remove();
                            }
                        });
                    });
                </script>
            </form>
        </div>
    </div>
</div>
<%@ include file="../include/footer.jsp" %>
</body>
</html>