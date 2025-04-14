<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>C. 재고 현황 보고서</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<style>
    /* 공통 레이아웃 스타일 + 이 페이지 스타일 */
     body { margin: 0; font-family: sans-serif; display: flex; flex-direction: column; height: 100vh;}
    .main-container { display: flex; flex-grow: 1; }
    .left-menu { width: 200px; border-right: 1px solid #ccc; background-color: #f8f9fa; height: 100%; overflow-y: auto; }
    .content-area { flex-grow: 1; padding: 20px; display: flex; flex-direction: column; }
    .search-criteria { border: 1px solid #ccc; padding: 15px; margin-bottom: 20px; background-color: #fdfdfd; }
    .search-criteria fieldset { border: none; padding: 0; margin: 0; }
    .search-criteria legend { font-weight: bold; margin-bottom: 10px; font-size: 1.1em; }
    .criteria-row { display: flex; align-items: center; margin-bottom: 10px; flex-wrap: wrap; }
    .criteria-row label { width: 90px; text-align: right; margin-right: 10px; font-size: 0.9em; }
    .criteria-row input[type=text], .criteria-row input[type=month] { width: 130px; padding: 5px; margin-right: 20px; }
    .search-button-row { text-align: right; margin-top: 10px; }
    #resultsArea { flex-grow: 1; border: 1px solid #ccc; padding: 15px; overflow-y: auto; }
    table { width: 100%; border-collapse: collapse; margin-top: 15px; } th, td { border: 1px solid #ddd; padding: 8px; text-align: center; font-size: 0.9em; } th { background-color: #e9ecef; } .error-message { color: red; }
     /* PDF 레이아웃과 유사하게 숫자 필드 오른쪽 정렬 */
    td:nth-child(n+4) { text-align: right; } /* 4번째 컬럼부터 오른쪽 정렬 */
</style>
</head>
<body>
    <%-- 공통 헤더 포함 --%>
    <jsp:include page="common/header.jsp" />

    <div class="main-container">
        <div class="left-menu">
            <%-- 왼쪽 메뉴 포함 --%>
            <jsp:include page="common/menu.jsp" />
        </div>

        <div class="content-area">
             <h2>재고 현황 보고서</h2> <%-- 페이지 제목 --%>

             <div class="search-criteria">
                <form id="reportForm">
                    <fieldset>
                        <legend>조회 조건</legend>
                        <div class="criteria-row">
                            <label>조회 월:</label>
                            <input type="month" name="queryMonthFrom" title="시작월"> ~ <input type="month" name="queryMonthTo" title="종료월"> <label>자재 유형:</label> <input type="text" name="materialTypeFrom" title="자재 유형 시작"> ~
                            <input type="text" name="materialTypeTo" title="자재 유형 종료">
                        </div>
                         <div class="criteria-row">
                             <label>자재 품번:</label>
                             <input type="text" name="materialCodeFrom" title="자재 품번 시작"> ~ <input type="text" name="materialCodeTo" title="자재 품번 종료"> <label>저장 위치:</label>
                             <input type="text" name="storageCodeFrom" title="저장 위치 시작"> ~ <input type="text" name="storageCodeTo" title="저장 위치 종료"> </div>
                         <div class="search-button-row">
                            <button type="button" id="searchBtn">조회</button>
                        </div>
                    </fieldset>
                </form>
            </div>

             <div id="resultsArea">
                 <%-- 결과 테이블이 여기에 동적으로 생성됨 --%>
            </div>
        </div>
    </div>

     <script type="text/javascript">
        $(document).ready(function() {
            $('#searchBtn').on('click', function() {
                const params = $('#reportForm').serialize();
                $('#resultsArea').html('로딩 중...');
                $.ajax({
                    url: '${pageContext.request.contextPath}/api/inventory/report', // API 호출
                    type: 'GET',
                    data: params,
                    dataType: 'json',
                    success: function(response) {
                         // 결과 테이블 생성 (InventoryReportDTO 기준)
                        let tableHtml = '<table><thead><tr><th>자재유형</th><th>플랜트</th><th>저장위치</th><th>기초수량</th><th>기간변동</th><th>기말수량</th><th>기초금액</th><th>기말금액</th><th>증감금액</th></tr></thead><tbody>';
                         if (response && response.length > 0) {
                            $.each(response, function(i, item) {
                                tableHtml += `<tr>
                                    <td>${item.materialType != null ? item.materialType : ''}</td>
                                    <td>${item.plantCode != null ? item.plantCode : ''}</td>
                                    <td>${item.stockLocation != null ? item.stockLocation : ''}</td>
                                    <td style="text-align:right;">${item.openingStockQty != null ? item.openingStockQty : 0}</td>
                                    <td style="text-align:right;">${item.periodNetChangeQty != null ? item.periodNetChangeQty : 0}</td>
                                    <td style="text-align:right;">${item.stockQty != null ? item.stockQty : 0}</td>
                                    <td style="text-align:right;">${item.openingStockAmount != null ? item.openingStockAmount : 0}</td>
                                    <td style="text-align:right;">${item.inventoryAmount != null ? item.inventoryAmount : 0}</td>
                                    <td style="text-align:right;">${item.periodNetChangeAmount != null ? item.periodNetChangeAmount : 0}</td>
                                </tr>`;
                            });
                        } else {
                             tableHtml += '<tr><td colspan="9">조회된 데이터가 없습니다.</td></tr>'; // colspan 수정
                        }
                        tableHtml += '</tbody></table>';
                        $('#resultsArea').html(tableHtml);
                    },
                    error: function(xhr, status, error) {
                         $('#resultsArea').html('<p class="error-message">오류 발생: ' + xhr.status + ' - ' + error + '</p>');
                    }
                });
            });
        });
    </script>
</body>
</html>