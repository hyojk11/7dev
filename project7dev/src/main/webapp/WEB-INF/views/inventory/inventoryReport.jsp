<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>	
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />

<!DOCTYPE html>
<html lang="ko">
<%@ include file="../include/header.jsp" %>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/test.css">
<style>
	#resultsArea { flex-grow: 1; border: 1px solid #ccc; padding: 15px; overflow-y: auto; }
    table.styled-table { width: 100%; border-collapse: collapse; margin-top: 15px; }
    table.styled-table th, table.styled-table td { border: 1px solid #ddd; padding: 8px; text-align: center; font-size: 0.9em; }
    table.styled-table th { background-color: #EDFFF4; }
    .error-message { color: red; }
    table.styled-table td:nth-child(n+4) { text-align: right; }
</style>

<body>

    <div class="container-fluid">
        <div class="row">
            <%@ include file="../include/left_column.jsp" %>

            <div class="col-10 main" style="padding: 20px;">
                <h3 class="fw-bold mb-4">재고 현황 보고서</h3>

                <div class="card p-4 shadow mb-4 bg-light">
                    <form id="reportForm">
                        <fieldset>
                            <legend class="fw-bold mb-3">조회 조건</legend>
                            <div class="row mb-3">
                                <div class="col-md-3">
                                    <label class="form-label">조회 월(시작)</label>
                                    <input type="month" class="form-control" name="queryMonthFrom">
                                </div>
                                <div class="col-md-3">
                                    <label class="form-label">조회 월(종료)</label>
                                    <input type="month" class="form-control" name="queryMonthTo">
                                </div>
                                <div class="col-md-3">
                                    <label class="form-label">자재 유형(시작)</label>
                                    <input type="text" class="form-control" name="materialTypeFrom">
                                </div>
                                <div class="col-md-3">
                                    <label class="form-label">자재 유형(종료)</label>
                                    <input type="text" class="form-control" name="materialTypeTo">
                                </div>
                            </div>
                            <div class="row mb-3">
                                <div class="col-md-3">
                                    <label class="form-label">자재 품번(시작)</label>
                                    <input type="text" class="form-control" name="materialCodeFrom">
                                </div>
                                <div class="col-md-3">
                                    <label class="form-label">자재 품번(종료)</label>
                                    <input type="text" class="form-control" name="materialCodeTo">
                                </div>
                                <div class="col-md-3">
                                    <label class="form-label">저장 위치(시작)</label>
                                    <input type="text" class="form-control" name="storageCodeFrom">
                                </div>
                                <div class="col-md-3">
                                    <label class="form-label">저장 위치(종료)</label>
                                    <input type="text" class="form-control" name="storageCodeTo">
                                </div>
                            </div>
                            <div class="text-end">
                                <button type="button" id="searchBtn" class="btn btn-success px-4">조회</button>
                            </div>
                        </fieldset>
                    </form>
                </div>

                <div id="resultsArea" class="bg-white p-3 shadow rounded"></div>
            </div>
        </div>
    </div>

    <script type="text/javascript">
        $(document).ready(function() {
            $('#searchBtn').on('click', function() {
                const formId = '#reportForm';
                const params = $(formId).serialize();
                const apiUrl = '${pageContext.request.contextPath}/api/inventory/report';
                const pageIdentifier = 'report';
                $('#resultsArea').html('로딩 중...');
                $.ajax({
                    url: apiUrl,
                    type: 'GET',
                    data: params,
                    dataType: 'json',
                    success: function(response, textStatus, jqXHR) {
                        const columns = 9;
                        let tableHtml = '<table class="styled-table">';
                        tableHtml += '<thead><tr>';
                        tableHtml += '<th>자재유형</th><th>플랜트</th><th>저장위치</th>';
                        tableHtml += '<th>기초수량</th><th>기간변동</th><th>기말수량</th>';
                        tableHtml += '<th>기초금액</th><th>기말금액</th><th>증감금액</th>';
                        tableHtml += '</tr></thead>';
                        tableHtml += '<tbody>';
                        if (Array.isArray(response) && response.length > 0) {
                            $.each(response, function(i, item) {
                                const materialType = item.materialType || '';
                                const plantCode = item.plantCode || '';
                                const stockLocation = item.stockLocation || '';
                                const openingStockQty = item.openingStockQty || 0;
                                const periodNetChangeQty = item.periodNetChangeQty || 0;
                                const stockQty = item.stockQty || 0;
                                const openingStockAmount = item.openingStockAmount || 0;
                                const inventoryAmount = item.inventoryAmount || 0;
                                const periodNetChangeAmount = item.periodNetChangeAmount || 0;
                                tableHtml += '<tr>' +
                                               '<td>' + materialType + '</td>' +
                                               '<td>' + plantCode + '</td>' +
                                               '<td>' + stockLocation + '</td>' +
                                               '<td style="text-align:right;">' + openingStockQty + '</td>' +
                                               '<td style="text-align:right;">' + periodNetChangeQty + '</td>' +
                                               '<td style="text-align:right;">' + stockQty + '</td>' +
                                               '<td style="text-align:right;">' + openingStockAmount + '</td>' +
                                               '<td style="text-align:right;">' + inventoryAmount + '</td>' +
                                               '<td style="text-align:right;">' + periodNetChangeAmount + '</td>' +
                                            '</tr>';
                            });
                        } else {
                            tableHtml += '<tr><td colspan="' + columns + '"><p class="error-message">조회된 데이터가 없습니다.</p></td></tr>';
                        }
                        tableHtml += '</tbody></table>';
                        $('#resultsArea').html(tableHtml);
                    },
                    error: function(xhr, status, error) {
                        console.error(`--- ${pageIdentifier} AJAX 오류 ---`);
                        console.error('Status:', status, 'Error:', error);
                        const errorColumns = 9;
                        $('#resultsArea').html(`<table><tbody><tr><td colspan="${errorColumns}"><p class="error-message">데이터 조회 중 오류 (${status})</p></td></tr></tbody></table>`);
                    }
                });
            });
            $('input[name="queryMonthFrom"]').val('2025-01');
            $('input[name="queryMonthTo"]').val('2025-04');
            $('#searchBtn').click();
        });
     </script>
<%@ include file="../include/footer.jsp" %>
</body>
</html>
