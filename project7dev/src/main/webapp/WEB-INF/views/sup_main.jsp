<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>	
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>거래처 전용 페이지</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
    <link href="${contextPath}/resources/css/sup_main.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="wrapper"><!-- wrapper 시작 -->

    <!-- 알림 메시지 출력 -->
    <c:if test="${not empty resultMsg}">
        <script>
            alert("${resultMsg}");
        </script>
    </c:if>

    <!-- 로그인한 사용자의 이름 표시 -->
    <div class="container mt-3">
        <div class="top-bar d-flex justify-content-between align-items-center">
            <img src="${contextPath}/resources/image/7chilldevLogo_Green_Long.png" width="160" height="40">
            <div>
                <span>안녕하세요 <strong>${sessionScope.user_name} 님</strong>&nbsp;</span>
                <button class="btn btn-outline-success btn-sm me-2" onclick="location.href='${contextPath }/'">로그아웃</button>
                <button class="btn btn-success btn-sm" onclick="location.href='${contextPath }/mypage/supDetail'">mypage</button>
            </div>
        </div>
    </div>

    <!-- 거래처 전용 카드 레이아웃 -->
    <div class="main-container mt-4">
        <div class="container-grid">
            <div class="card">
                <div class="card-title">
                    <div class="card-icon"><i class="bi bi-tools"></i></div>발주
                </div>
                <div class="card-body">
                    <a href="${contextPath}/quotation/quotation_main">견적관리</a>
					<a href="${contextPath}/incoming/status_list">발주진행현황</a>
					<a href="${contextPath}/purc_order/list">구매발주</a>
					<a href="${contextPath}/pro_monitoring/list">진척검수</a>
                </div>
            </div>
            <div class="card">
                <div class="card-title">
                    <div class="card-icon"><i class="bi bi-gear-wide-connected"></i></div>조회
                </div>
                <div class="card-body">
                    <a href="${contextPath}/incoming/tp_list">거래명세서</a>
                </div>
            </div>
            <div class="card">
                <div class="card-title">
                    <div class="card-icon"><i class="bi bi-megaphone"></i></div>공지사항
                </div>
                <div class="card-body">
                    <a href="#">공지사항 없음</a>
                </div>
            </div>
        </div>
    </div>

    <!-- Footer Include -->
    <%@ include file="/WEB-INF/views/include/footer.jsp" %>

</div><!-- wrapper 끝 -->
</body>
</html>
