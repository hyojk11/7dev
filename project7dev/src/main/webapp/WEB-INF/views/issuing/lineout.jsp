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
            <h3 class="fw-bold mb-4">라인 출고하기</h3>

            <!-- 라인 출고 form -->
            <form action="lineout" method="post">
                <table class="table table-bordered text-center align-middle" style="max-width: 800px; margin: 0 auto; border-radius: 8px; box-shadow: 0 0 15px rgba(0, 0, 0, 0.1); background-color: #DBFFE8;">
                    <thead class="table-light">
                        <tr>
                            <th colspan="2" class="text-center" style="background-color: #DBFFE8; padding: 25px; font-size: 1.2rem;">출고 정보 입력</th>
                        </tr>
                    </thead>
                    <tbody>
                        <!-- 제품 이름 선택 -->
                        <tr>
                            <th class="col-3" style="background-color: #f1f1f1; padding: 12px 20px; font-size: 1rem;">제품 이름</th>
                            <td style="background-color: #f9f9f9; padding: 12px 20px;">
                                <select name="product_no" class="form-select w-auto" style="font-size: 1rem; border-radius: 5px; padding: 8px;">
                                    <c:forEach var="productlist" items="${productlist}">
                                        <option value="${productlist.product_no}">${productlist.product_name}</option>
                                    </c:forEach>
                                </select>
                            </td>
                        </tr>
                        <!-- 생산 수량 입력 -->
                        <tr>
                            <th style="background-color: #f1f1f1; padding: 12px 20px; font-size: 1rem;">생산 수량</th>
                            <td style="background-color: #f9f9f9; padding: 12px 20px;">
                                <div class="d-flex align-items-center">
                                    <input type="text" name="product_cnt" class="form-control me-2" placeholder="생산할 수량을 입력하세요" required style="max-width: 160px; font-size: 1rem; border-radius: 5px; padding: 8px;">
                                    <span style="font-size: 1rem;">개</span>
                                </div>
                            </td>
                        </tr>
                        <!-- 부품 창고확인 버튼을 생산수량 아래로 이동 -->
                        <tr>
                            <td colspan="2" style="background-color: #f9f9f9; text-align: right; padding: 12px 20px;">
                                <button type="submit" class="btn btn-primary" style="font-size: 1rem; border-radius: 5px; padding: 12px 30px;">
                                    생산라인 확인
                                </button>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </form>
        </div>
    </div>
</div>

<%@ include file="../include/footer.jsp" %>
</body>
</html>
