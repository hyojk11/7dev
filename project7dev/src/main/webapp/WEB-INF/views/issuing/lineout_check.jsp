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

        <!-- 오른쪽 메인 화면 -->
        <div class="col-10 main" style="padding-right: 20px;">
            <h3 class="fw-bold mb-4">라인 재고 확인 후 생산하기</h3>

            <c:set var="canLineout" value="true" />
            
            <!-- 라인 재고 현황 테이블 -->
            <div class="mb-4">
                <label class="fw-bold">${selected.product_name} 제품의 사용부품 및 재고 현황</label>
                <br><br>
                <table class="table table-bordered text-center align-middle" style="max-width: 1000px; margin: 0 auto; border-radius: 8px; box-shadow: 0 0 15px rgba(0, 0, 0, 0.1); background-color: #DBFFE8;">
                    <thead style="background-color: #EDFFF4;">
                        <tr>
                            <th style="background-color: #EDFFF4;">부품번호</th>
                            <th style="background-color: #EDFFF4;">부품이름</th>
                            <th style="background-color: #EDFFF4;">부품코드</th>
                            <th style="background-color: #EDFFF4;">부품원자재</th>
                            <th style="background-color: #EDFFF4;">생산라인코드</th>
                            <th style="background-color: #EDFFF4;">생산라인재고</th>
                            <th style="background-color: #EDFFF4;">필요수량</th>
                            <th style="background-color: #EDFFF4;">충분여부</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="linestock" items="${linestock}">
                            <c:set var="haveMaterial" value="true" />
                            <c:if test="${linestock.line_stock < linestock.material_produce }">
                                <c:set var="canLineout" value="false" />
                                <c:set var="haveMaterial" value="false" />
                            </c:if>
                            <tr style="background-color: #f9f9f9;">
                                <td>${linestock.material_no}</td>
                                <td>${linestock.material_name}</td>
                                <td>${linestock.material_code}</td>
                                <td>${linestock.material_raw_material}</td>
                                <td>${linestock.line_code}</td>
                                <td>${linestock.line_stock}EA</td>
                                <td>${linestock.material_produce}EA</td>
                                <c:choose>
                                    <c:when test="${haveMaterial eq 'true' }">
                                        <td>충분</td>
                                    </c:when>
                                    <c:otherwise>
                                        <td>부족(${linestock.material_produce - linestock.line_stock }EA)</td>
                                    </c:otherwise>
                                </c:choose>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>

            <!-- 생산수량 표시 -->
            <div class="mb-4">
                <strong>생산수량:</strong> ${product_cnt} 개
            </div>

            <!-- 라인 출고 버튼 및 취소 버튼 -->
            <div class="d-flex justify-content-center align-items-center gap-3">
                <c:choose>
                    <c:when test="${canLineout eq 'true' }">
                        <p class="text-success fw-bold">라인 내 재고가 충분히 있습니다</p><br>
                        <form action="${contextPath}/issuing/lineout_process">
                            <input type="hidden" name="product_no" value="${selected.product_no}">
                            <input type="hidden" name="product_cnt" value="${product_cnt}">
                            <button type="submit" class="btn btn-success px-4 py-2">생산하기</button>
                            <button type="button" class="btn btn-secondary px-4 py-2" onclick="location.href='${contextPath}/issuing/testview_issuing'">취소하기</button>
                        </form>
                    </c:when>
                    <c:otherwise>
                        <p class="text-danger fw-bold">※ 재고가 부족한 부품이 있어 정상적으로 생산할 수 없습니다.</p>
                        <button type="button" class="btn btn-warning px-4 py-2" onclick="history.back();">뒤로가기</button>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </div>
</div>

<%@ include file="../include/footer.jsp" %>
</body>
</html>
