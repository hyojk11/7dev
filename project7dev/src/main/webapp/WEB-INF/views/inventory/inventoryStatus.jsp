<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>A. 자재 재고 조회</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<style>
    body { margin: 0; font-family: sans-serif; display: flex; flex-direction: column; height: 100vh;}
    .main-container { display: flex; flex-grow: 1; }
    .left-menu { width: 200px; border-right: 1px solid #ccc; background-color: #f8f9fa; height: 100%; overflow-y: auto; }
    .content-area { flex-grow: 1; padding: 20px; display: flex; flex-direction: column; }
    .search-criteria { border: 1px solid #ccc; padding: 15px; margin-bottom: 20px; background-color: #fdfdfd; }
    .search-criteria fieldset { border: none; padding: 0; margin: 0; }
    .search-criteria legend { font-weight: bold; margin-bottom: 10px; font-size: 1.1em; }
    .criteria-row { display: flex; align-items: center; margin-bottom: 10px; flex-wrap: wrap; /* 화면 작을 때 줄바꿈 */}
    .criteria-row label { width: 90px; text-align: right; margin-right: 10px; font-size: 0.9em; }
    .criteria-row input[type=text], .criteria-row input[type=month] { width: 130px; padding: 5px; margin-right: 20px; }
    .search-button-row { text-align: right; margin-top: 10px; }
    #resultsArea { flex-grow: 1; border: 1px solid #ccc; padding: 15px; overflow-y: auto; /* 결과 많을 시 스크롤 */}
    table { width: 100%; border-collapse: collapse; margin-top: 15px; } th, td { border: 1px solid #ddd; padding: 8px; text-align: center; font-size: 0.9em; } th { background-color: #e9ecef; } .error-message { color: red; }
    /* PDF 레이아웃과 유사하게 일부 필드 오른쪽 정렬 */
    td:nth-child(5), td:nth-child(6), td:nth-child(7) { text-align: right; }
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
            <h2>재고 조회</h2> <%-- 페이지 제목 --%>

            <div class="search-criteria">
                <form id="statusForm">
                    <fieldset>
                        <legend>조회 조건</legend>
                        <div class="criteria-row">
                            <label>기간(연월):</label>
                            <input type="month" name="queryMonthFrom" title="시작월"> ~
                            <input type="month" name="queryMonthTo" title="종료월">

                            <label>플랜트:</label> <input type="text" name="plantCodeFrom" title="플랜트 시작"> ~
                            <input type="text" name="plantCodeTo" title="플랜트 종료">
                        </div>
                        <div class="criteria-row">
                             <label>자재품번:</label>
                             <input type="text" name="materialCodeFrom" title="자재품번 시작"> ~
                             <input type="text" name="materialCodeTo" title="자재품번 종료">

                             <label>저장위치:</label>
                             <input type="text" name="storageCodeFrom" title="저장위치 시작"> ~
                             <input type="text" name="storageCodeTo" title="저장위치 종료">
                        </div>
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
                const params = $('#statusForm').serialize();
                $('#resultsArea').html('로딩 중...');
                $.ajax({
                    url: '${pageContext.request.contextPath}/api/inventory/status', // API 호출 (ContextPath 포함)
                    type: 'GET',
                    data: params,
                    dataType: 'json',
                    success: function(response) {
                        // 결과 테이블 생성 (InventoryStatusDTO 기준)
                        let tableHtml = '<table><thead><tr><th>자재품번</th><th>자재내역</th><th>현재고</th><th>단위(TODO)</th><th>플랜트</th><th>저장위치</th><th>기초재고</th><th>기간변동</th></tr></thead><tbody>';
                        if (response && response.length > 0) {
                            $.each(response, function(i, item) {
                                tableHtml += `<tr>
                                	<td>${empty item.materialCode ? '' : item.materialCode}</td>
                                	<td>${empty item.materialDesc ? '' : item.materialDesc}</td>
                                	<td style="text-align:right;">${empty item.stockQty ? 0 : item.stockQty}</td>
                                	<td>${empty item.plantCode ? '' : item.plantCode}</td>
                                	<td>${empty item.stockLocation ? '' : item.stockLocation}</td>
                                	
                                	<td style="text-align:right;">${item.openingStock != null ? item.openingStock : 0}</td>
                                	<td style="text-align:right;">${item.periodNetChange != null ? item.periodNetChange : 0}</td>
                                </tr>`;
                            });
                        } else {
                            tableHtml += '<tr><td colspan="8">조회된 데이터가 없습니다.</td></tr>'; // colspan 수정
                        }
                        tableHtml += '</tbody></table>';
                        $('#resultsArea').html(tableHtml);
                    },
                    error: function(xhr, status, error) {
                         $('#resultsArea').html('<p class="error-message">오류 발생: ' + xhr.status + ' - ' + error + '</p>');
                    }
                });
            });
            // 초기 로딩 시 한번 조회하려면 여기서 $('#searchBtn').click(); 호출
        });
    </script>
</body>
</html>