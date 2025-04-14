<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>B. 자재 문서 조회</title>
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
    .criteria-row input[type=text], .criteria-row input[type=date] { width: 130px; padding: 5px; margin-right: 20px; }
    .search-button-row { text-align: right; margin-top: 10px; }
    #resultsArea { flex-grow: 1; border: 1px solid #ccc; padding: 15px; overflow-y: auto; }
    table { width: 100%; border-collapse: collapse; margin-top: 15px; } th, td { border: 1px solid #ddd; padding: 8px; text-align: center; font-size: 0.9em; } th { background-color: #e9ecef; } .error-message { color: red; }
     /* PDF 레이아웃과 유사하게 일부 필드 오른쪽 정렬 */
    td:nth-child(6) { text-align: right; }
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
            <h2>자재 문서 조회 <small>(입고 및 출고 내역)</small></h2> <%-- 페이지 제목 --%>

             <div class="search-criteria">
                <form id="docsForm">
                    <fieldset>
                        <legend>조회 조건</legend>
                        <div class="criteria-row">
                            <label>조회 기간:</label>
                            <input type="date" name="startDate" title="시작일"> ~ <input type="date" name="endDate" title="종료일"> <label>플랜트:</label> <input type="text" name="plantCodeFrom" title="플랜트 시작"> ~
                            <input type="text" name="plantCodeTo" title="플랜트 종료">
                        </div>
                        <div class="criteria-row">
                             <label>자재품번:</label>
                             <input type="text" name="materialCodeFrom" title="자재품번 시작"> ~ <input type="text" name="materialCodeTo" title="자재품번 종료"> <label>저장위치:</label>
                             <input type="text" name="storageCodeFrom" title="저장위치 시작"> ~ <input type="text" name="storageCodeTo" title="저장위치 종료"> </div>
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
                const params = $('#docsForm').serialize();
                $('#resultsArea').html('로딩 중...');
                $.ajax({
                    url: '${pageContext.request.contextPath}/api/inventory/documents', // API 호출
                    type: 'GET',
                    data: params,
                    dataType: 'json',
                    success: function(response) {
                        // 결과 테이블 생성 (MaterialDocumentDTO 기준)
                        let tableHtml = '<table><thead><tr><th>문서타입</th><th>문서번호</th><th>일자</th><th>자재품번</th><th>자재내역</th><th>수량</th><th>단위(TODO)</th><th>플랜트</th><th>저장위치</th></tr></thead><tbody>';
                        if (response && response.length > 0) {
                            $.each(response, function(i, item) {
                                let docDate = item.documentDate ? new Date(item.documentDate).toLocaleDateString() : '';
                                let typeText = item.documentType === 'IN' ? '입고' : (item.documentType === 'OUT' ? '출고' : item.documentType); // 타입 텍스트 변환
                                tableHtml += `<tr>
                                	<td>${typeText != null ? typeText : ''}</td>
                                	<td>${item.documentNo != null ? item.documentNo : ''}</td>
                                	<td>${docDate != null ? docDate : ''}</td>
                                	<td>${item.materialCode != null ? item.materialCode : ''}</td>
                                	<td>${item.materialDesc != null ? item.materialDesc : ''}</td>
                                	<td style="text-align:right;">${item.quantity != null ? item.quantity : 0}</td>
                                	<td>EA</td> <%-- 단위는 DTO/API에 없으므로 임시 표시 또는 추가 필요 --%>
                                	<td>${item.plantCode != null ? item.plantCode : ''}</td>
                                	<td>${item.stockLocation != null ? item.stockLocation : ''}</td>
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