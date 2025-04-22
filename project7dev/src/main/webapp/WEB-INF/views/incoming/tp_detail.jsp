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
                <h3 class="fw-bold mb-0">거 래 명 세 서 (공급자용)</h3>
            </div>

            <!-- 기본 정보 테이블 -->
            <div class="print-table mb-4 mx-auto">
                <table class="table table-bordered text-center align-middle" style="background-color: #E6F7FF;">
                    <thead style="background-color: #EDFFF4;">
                        <tr>
                        	<th class="align-middle" style="background-color: #EDFFF4;">명세서 No.</th>
                        	<td colspan="2"> ${transPaper.trans_paper_no}</td>
                        	<th class="align-middle" style="background-color: #EDFFF4;">등록일</th>
				            <td colspan="2" >${transPaper.trans_paper_reg_date}</td>
						</tr>
						<tr>
							 <th colspan="3" class="align-middle" style="background-color: #EDFFF4;">공 급 받 는 자</th>
            				 <th colspan="3" class="align-middle" style="background-color: #EDFFF4;">공 급 자</th>
						</tr>
						<tr>
							<th class="align-middle" style="background-color: #EDFFF4;">사업자번호</th>
				            <td colspan="2" >${transPaper.sup_reg_no}</td>
				            <th class="align-middle" style="background-color: #EDFFF4;">사업자번호</th>
				            <td colspan="2" >${transPaper.comp_reg_no}</td>
						</tr>
						<tr>
							 <th class="align-middle" style="background-color: #EDFFF4;">상호명</th>
					         <td colspan="2" >${transPaper.sup_name}</td>
					         <th class="align-middle" style="background-color: #EDFFF4;">상호명</th>
					         <td colspan="2">${transPaper.comp_name}</td>
						</tr>
						<tr>
							 <th class="align-middle" style="background-color: #EDFFF4;">주 소</th>
				             <td colspan="2" >${transPaper.sup_addr1} ${transPaper.sup_addr2}</td>
				             <th class="align-middle" style="background-color: #EDFFF4;">주 소</th>
				             <td colspan="2" >${transPaper.comp_addr1} ${transPaper.comp_addr2}</td>
						</tr>
						<tr>
						     <th class="align-middle" style="background-color: #EDFFF4;">성 명</th>
            				 <td colspan="2">${transPaper.sup_ceo_name}</td>
						     <th class="align-middle" style="background-color: #EDFFF4;">성 명</th>
            				 <td colspan="2">${transPaper.comp_ceo_name}</td>
						</tr>
                    </thead>
                </table>
            </div>

            <!-- 거래 내역 테이블 -->
            <div class="print-table mb-4 mx-auto">
                <table class="table table-bordered text-center align-middle" style="background-color: #E6F7FF;">
                    <thead style="background-color: #EDFFF4;">
                        <tr>
                            <th style="background-color: #EDFFF4;">No</th>
                            <th style="background-color: #EDFFF4;">부품명</th>
                            <th style="background-color: #EDFFF4;">부품코드</th>
                            <th style="background-color: #EDFFF4;">수량</th>
                            <th style="background-color: #EDFFF4;">단위</th>
                            <th style="background-color: #EDFFF4;">계약단가</th>
                            <th style="background-color: #EDFFF4;">비고</th>
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
