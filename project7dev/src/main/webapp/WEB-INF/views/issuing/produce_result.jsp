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
        <div class="col-10 main p-4">
            <h3 class="fw-bold mb-4">부품 출고완료</h3>

            <div class="mb-4">
                <label class="fw-semibold fs-5 d-block">'${selected.product_name }' 제품 ${product_cnt }개 생산을 위한 부품 출고</label>
            </div>

            <div class="mb-4">
                <label class="fw-bold">출고 내역</label>
                <table class="table table-bordered text-center align-middle mt-2" style="background-color: #DBFFE8;">
                    <thead style="background-color: #EDFFF4;">
                        <tr>
                            <th style="background-color: #EDFFF4;">창고번호</th>
                            <th style="background-color: #EDFFF4;">창고코드</th>
                            <th style="background-color: #EDFFF4;">부품번호</th>
                            <th style="background-color: #EDFFF4;">부품코드</th>
                            <th style="background-color: #EDFFF4;">부품이름</th>
                            <th style="background-color: #EDFFF4;">출고수량</th>
                            <th style="background-color: #EDFFF4;">출고단위</th>
                            <th style="background-color: #EDFFF4;">출고일시</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="storageIO" items="${storageIO }">
                            <tr>
                                <td>${storageIO.mstorage_no}</td>
                                <td>${storageIO.mstorage_code}</td>
                                <td>${storageIO.material_no}</td>
                                <td>${storageIO.material_code}</td>
                                <td>${storageIO.material_name}</td>
                                <td>${storageIO.material_out_cnt}</td>
                                <td>EA</td>
                                <td>${storageIO.material_out_date}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>

            <div class="mb-4">
                <label class="fw-bold">입고 내역</label>
                <table class="table table-bordered text-center align-middle mt-2" style="background-color: #FFF5DB;">
                    <thead style="background-color: #EDFFF4;">
                        <tr>
                            <th style="background-color: #EDFFF4;">라인번호</th>
                            <th style="background-color: #EDFFF4;">라인코드</th>
                            <th style="background-color: #EDFFF4;">부품번호</th>
                            <th style="background-color: #EDFFF4;">부품코드</th>
                            <th style="background-color: #EDFFF4;">부품이름</th>
                            <th style="background-color: #EDFFF4;">입고수량</th>
                            <th style="background-color: #EDFFF4;">입고단위</th>
                            <th style="background-color: #EDFFF4;">입고일시</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="storageIO" items="${storageIO }">
                            <tr>
                                <td>${storageIO.line_no}</td>
                                <td>${storageIO.line_code}</td>
                                <td>${storageIO.material_no}</td>
                                <td>${storageIO.material_code}</td>
                                <td>${storageIO.material_name}</td>
                                <td>${storageIO.line_in_cnt}</td>
                                <td>EA</td>
                                <td>${storageIO.line_in_date}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>

            <div class="d-flex justify-content-center gap-3">
                <button type="button" class="btn btn-success px-4 py-2" onclick="location.href='${contextPath }/issuing/produce'">계속하기</button>
                <button type="button" class="btn btn-secondary px-4 py-2" onclick="location.href='${contextPath }/issuing/testview_issuing'">돌아가기</button>
            </div>
        </div>
    </div>
</div>
<%@ include file="../include/footer.jsp" %>
</body>
</html>
