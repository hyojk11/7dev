<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>	
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
            <h3 class="fw-bold mb-4">구매발주서</h3>

            <form action="${contextPath}/purchaseOrder/register" method="post">
                <input type="hidden" name="emp_no" value="${mpp.empNo}"/>
                <input type="hidden" name="purc_order_code" value="${mpp.mppCode}" />
                <input type="hidden" name="purc_order_status" value="0" />

                <div class="card p-4 shadow" style="background-color: #f8f9fa;">
                    <table class="table table-bordered align-middle text-center bg-white">
                        <tr>
                            <td colspan="4">
                                작성일 :
                                <fmt:parseDate value="2000-01-01 00:00:00" pattern="yyyy-MM-dd HH:mm:ss" var="regDate" />
                                <fmt:formatDate value="${regDate}" pattern="yyyy년 MM월 dd일 E요일" />
                            </td>
                            <td colspan="3">납기일 : ${fn:substring(mpp.mrpDueDate, 0, 10)}</td>
                            <td colspan="3">발주번호 : ${mpp.mppCode}</td>
                        </tr>
                        <!-- 공급자, 공급받는자 부분에 배경색 추가 -->
                        <tr class="bg-light" style="background-color: #EDFFF4;">
						    <td colspan="5" class="fw-bold" style="background-color: #EDFFF4;">공급자</td>
						    <td colspan="5" class="fw-bold" style="background-color: #EDFFF4;">공급받는자</td>
						</tr>

                        <tr>
                            <td colspan="2" style="background-color: #EDFFF4;">등록번호</td>
                            <td colspan="3">${sup.supRegNo}</td>
                            <td colspan="2" style="background-color: #EDFFF4;">등록번호</td>
                            <td colspan="3">${company.compRegNo}</td>
                        </tr>
                        <tr>
                            <td style="background-color: #EDFFF4;">상 호</td>
                            <td colspan="2">${sup.supName}</td>
                            <td style="background-color: #EDFFF4;">성 명</td>
                            <td>${sup.supCeoName}</td>
                            <td style="background-color: #EDFFF4;">상 호</td>
                            <td colspan="2">${company.compName}</td>
                            <td style="background-color: #EDFFF4;">성 명</td>
                            <td>${company.compCeoName}</td>
                        </tr>
                        <tr>
                            <td style="background-color: #EDFFF4;">주 소</td>
                            <td colspan="4">${sup.supAddr1} ${sup.supAddr2}</td>
                            <td style="background-color: #EDFFF4;">주 소</td>
                            <td colspan="4">${company.compAddr1} ${company.compAddr2}</td>
                        </tr>
                        <tr>
                            <td style="background-color: #EDFFF4;">담당자</td>
                            <td>${sup.supCip}</td>
                            <td style="background-color: #EDFFF4;">이메일</td>
                            <td colspan="2">${sup.supCipEmail}</td>
                            <td style="background-color: #EDFFF4;">담당자</td>
                            <td>${mrp.empName}</td>
                            <td style="background-color: #EDFFF4;">이메일</td>
                            <td colspan="2">${mrp.empEmail}</td>
                        </tr>
                    </table>

                    <h5 class="mt-4 mb-3 fw-bold">발주 품목</h5>
                    <table class="table table-bordered align-middle text-center bg-white">
                        <thead class="table-success">
                            <tr>
                                <th>NO</th>
                                <th>품목</th>
                                <th>품목번호</th>
                                <th>규격</th>
                                <th>단위</th>
                                <th>단가</th>
                                <th>수량</th>
                                <th>소계</th>
                                <th>화폐단위</th>
                                <th>비고</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:set var="totalCnt" value="0" />
                            <c:set var="totalPrice" value="0" />

                            <c:forEach var="material" items="${mrpList}" varStatus="status">
                                <tr>
                                    <td>${material.materialNo}</td>
                                    <td>${material.materialName}</td>
                                    <td>${material.materialCode}</td>
                                    <td>${material.materialDescription}</td>
                                    <td>${material.materialUnit}</td>
                                    <td>${material.sellMprice}</td>
                                    <td>${material.mrpQuantity}</td>
                                    <td>${material.sellMprice * material.mrpQuantity}</td>
                                    <td>${material.mpriceCurrency}</td>
                                    <td><input type="text" name="purcOrderEtc" class="form-control"/></td>
                                </tr>

                                <c:set var="totalCnt" value="${totalCnt + material.mrpQuantity}" />
                                <c:set var="totalPrice" value="${totalPrice + (material.sellMprice * material.mrpQuantity)}" />
                            </c:forEach>

                            <tr class="fw-bold">
                                <td colspan="6">합 계</td>
                                <td>${totalCnt}</td>
                                <td>${totalPrice}</td>
                                <td colspan="2"></td>
                            </tr>
                        </tbody>
                    </table>

                    <div class="d-flex justify-content-center mt-4 gap-3">
                        <input type="submit" value="저장" class="btn btn-primary px-4 py-2" />
                        <button type="button" class="btn btn-secondary px-4 py-2" onclick="history.back()">닫기</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<%@ include file="../include/footer.jsp" %>
</body>
</html>
