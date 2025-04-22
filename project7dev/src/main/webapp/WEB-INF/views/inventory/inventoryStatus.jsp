<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>	
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
    table.styled-table td:nth-child(3),
    table.styled-table td:nth-child(7),
    table.styled-table td:nth-child(8) { text-align: right; }
</style>

<body>
    <div class="container-fluid">
        <div class="row">
            <%@ include file="../include/left_column.jsp" %>

            <div class="col-10 main" style="padding: 20px;">
                <h3 class="fw-bold mb-4">자재 재고 조회</h3>

                <div class="card p-4 shadow mb-4 bg-light">
                    <form id="statusForm">
                        <fieldset>
                            <legend class="fw-bold mb-3">조회 조건</legend>
                            <div class="row mb-3">
                                <div class="col-md-3">
                                    <label class="form-label">기간(시작)</label>
                                    <input type="month" class="form-control" name="queryMonthFrom" title="시작월">
                                </div>
                                <div class="col-md-3">
                                    <label class="form-label">기간(종료)</label>
                                    <input type="month" class="form-control" name="queryMonthTo" title="종료월">
                                </div>
                                <div class="col-md-3">
                                    <label class="form-label">플랜트(시작)</label>
                                    <input type="text" class="form-control" name="plantCodeFrom" title="플랜트 시작">
                                </div>
                                <div class="col-md-3">
                                    <label class="form-label">플랜트(종료)</label>
                                    <input type="text" class="form-control" name="plantCodeTo" title="플랜트 종료">
                                </div>
                            </div>
                            <div class="row mb-3">
                                <div class="col-md-3">
                                    <label class="form-label">자재 품번(시작)</label>
                                    <input type="text" class="form-control" name="materialCodeFrom" title="자재품번 시작">
                                </div>
                                <div class="col-md-3">
                                    <label class="form-label">자재 품번(종료)</label>
                                    <input type="text" class="form-control" name="materialCodeTo" title="자재품번 종료">
                                </div>
                                <div class="col-md-3">
                                    <label class="form-label">저장 위치(시작)</label>
                                    <input type="text" class="form-control" name="storageCodeFrom" title="저장위치 시작">
                                </div>
                                <div class="col-md-3">
                                    <label class="form-label">저장 위치(종료)</label>
                                    <input type="text" class="form-control" name="storageCodeTo" title="저장위치 종료">
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
                const formId = '#statusForm';
                const params = $(formId).serialize();
                const apiUrl = '${pageContext.request.contextPath}/api/inventory/status';
                const pageIdentifier = 'status';
                $('#resultsArea').html('로딩 중...');
                $.ajax({
                    url: apiUrl,
                    type: 'GET',
                    data: params,
                    dataType: 'json',
                    success: function(response, textStatus, jqXHR) {
                        const columns = 8;
                        let tableHtml = '<table class="styled-table">';
                        tableHtml += '<thead><tr>';
                        tableHtml += '<th>자재품번</th><th>자재내역</th><th>현재고</th><th>단위</th>';
                        tableHtml += '<th>플랜트</th><th>저장위치</th><th>기초재고</th><th>기간변동</th>';
                        tableHtml += '</tr></thead>';
                        tableHtml += '<tbody>';
                        if (Array.isArray(response) && response.length > 0) {
                            $.each(response, function(i, item) {
                                const materialCode = item.materialCode || '';
                                const materialDesc = item.materialDesc || '';
                                const stockQty = item.stockQty != null ? item.stockQty : 0;
                                const plantCode = item.plantCode || '';
                                const stockLocation = item.stockLocation || '';
                                const openingStock = item.openingStock != null ? item.openingStock : 0;
                                const periodNetChange = item.periodNetChange != null ? item.periodNetChange : 0;
                                tableHtml += '<tr>' +
                                                '<td>' + materialCode + '</td>' +
                                                '<td>' + materialDesc + '</td>' +
                                                '<td style="text-align:right;">' + stockQty + '</td>' +
                                                '<td>EA</td>' +
                                                '<td>' + plantCode + '</td>' +
                                                '<td>' + stockLocation + '</td>' +
                                                '<td style="text-align:right;">' + openingStock + '</td>' +
                                                '<td style="text-align:right;">' + periodNetChange + '</td>' +
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
                        const errorColumns = 8;
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
