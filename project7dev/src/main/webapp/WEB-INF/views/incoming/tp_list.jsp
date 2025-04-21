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
            <div class="d-flex justify-content-between align-items-center mb-4">
                <h3 class="fw-bold mb-0">거래명세서 발행</h3>
            </div>

            <!-- 테이블 -->
            <div class="table-responsive">
                <table class="table table-bordered text-center align-middle" style="background-color: #E6F7FF;">
                    <thead style="background-color: #EDFFF4;">
                        <tr>
                            <th style="background-color: #EDFFF4;">번호</th>
                            <th style="background-color: #EDFFF4;">계약서 코드</th>
                            <th style="background-color: #EDFFF4;">입고수량</th>
                            <th style="background-color: #EDFFF4;">등록일</th>
                            <th style="background-color: #EDFFF4;">담당자</th>
                            <th style="background-color: #EDFFF4;">상호명</th>
                            <th style="background-color: #EDFFF4;">부품명</th>
                            <th style="background-color: #EDFFF4;">상세보기</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="tp" items="${tp_list}">
                            <tr>
                                <td>${tp.trans_paper_no}</td>
                                <td>${tp.cont_code}</td>
                                <td>${tp.trans_paper_material_cnt}</td>
                                <td>${tp.trans_paper_reg_date}</td>
                                <td>${tp.emp_name}</td>
                                <td>${tp.sup_name}</td>
                                <td>${tp.material_name}</td>
                                <td>
                                	<button type="button" class="btn btn-primary w-100" onclick="location.href='${contextPath}/incoming/tp_detail?trans_paper_no=${tp.trans_paper_no}'">보기</button>
                                </td>
                            </tr>
                        </c:forEach>
                        <c:if test="${empty tp_list}">
                            <tr>
                                <td colspan="8">조회 결과가 없습니다.</td>
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
