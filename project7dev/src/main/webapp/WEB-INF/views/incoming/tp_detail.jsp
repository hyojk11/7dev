<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="ko">
<%@ include file="../include/header.jsp" %>
<body>
<div class="container-fluid">
    <div class="row">
        <%@ include file="../include/left_column.jsp" %>

        <!-- 메인 콘텐츠 -->
        <div class="col-10 main p-4" id="printArea">
        <div class="col-10 main p-4">
            <div class="d-flex justify-content-between align-items-center mb-4">
                <h3 class="fw-bold mb-0">거래명세서 상세</h3>
            </div>

            <!-- 기본 정보 테이블 -->
            <div class="table-responsive mb-4">
                <table class="table table-bordered text-center align-middle" style="background-color: #E6F7FF;">
                    <thead style="background-color: #EDFFF4;">
                        <tr>
						    <th class="align-middle">거래명세서<br>No.</th>
						    <th class="align-middle">등록일</th>
						    <th class="align-middle">거래처<br>사업자번호</th>
						    <th class="align-middle">거래처<br>상호명</th>
						    <th class="align-middle">거래처<br>대표자</th>
						    <th class="align-middle">거래처<br>주소</th>
						    <th class="align-middle">거래처<br>상세주소</th>
						    <th class="align-middle">사업자번호</th>
						    <th class="align-middle">회사<br>상호명</th>
						    <th class="align-middle">회사<br>대표자</th>
						    <th class="align-middle">회사<br>주소</th>
						    <th class="align-middle">회사<br>상세주소</th>
						    <th class="align-middle">담당자</th>
						</tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>${transPaper.trans_paper_no}</td>
                            <td>${transPaper.trans_paper_reg_date}</td>
                            <td>${transPaper.sup_reg_no}</td>
                            <td>${transPaper.sup_name}</td>
                            <td>${transPaper.sup_ceo_name}</td>
                            <td>${transPaper.sup_addr1}</td>
                            <td>${transPaper.sup_addr2}</td>
                            <td>${transPaper.comp_reg_no}</td>
                            <td>${transPaper.comp_name}</td>
                            <td>${transPaper.comp_ceo_name}</td>
                            <td>${transPaper.comp_addr1}</td>
                            <td>${transPaper.comp_addr2}</td>
                            <td>${transPaper.emp_name}</td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <!-- 거래 내역 테이블 -->
            <div class="table-responsive mb-4">
                <table class="table table-bordered text-center align-middle" style="background-color: #E6F7FF;">
                    <thead style="background-color: #EDFFF4;">
                        <tr>
                            <th>No</th>
                            <th>부품명</th>
                            <th>부품코드</th>
                            <th>수량</th>
                            <th>단위</th>
                            <th>계약단가</th>
                            <th>비고</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>${transPaper.material_no}</td>
                            <td>${transPaper.material_name}</td>
                            <td>${transPaper.material_code}</td>
                            <td>${transPaper.cont_material_cnt}</td>
                            <td>${transPaper.material_unit}</td>
                            <td>${transPaper.cont_mprice} ${transPaper.mprice_currency}</td>
                            <td></td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <!-- 버튼 영역 -->
            <div class="d-flex gap-2">
                <a href="${contextPath}/incoming/tp_list" class="btn btn-secondary no-print">뒤로가기</a>
                <button class="btn btn-outline-primary no-print" onclick="window.print()">출력하기</button>
            </div>
        </div>
    </div>
</div>

<%@ include file="../include/footer.jsp" %>
</body>

<script>
    function printPage() {
        // 인쇄 전에 숨길 요소들
        document.querySelector('.left_column').style.display = 'none';
        document.querySelector('footer').style.display = 'none';

        // 인쇄 실행
        window.print();

        // 인쇄 후 요소를 다시 표시
        document.querySelector('.left_column').style.display = 'block';
        document.querySelector('footer').style.display = 'block';
    }
</script>

</html>
