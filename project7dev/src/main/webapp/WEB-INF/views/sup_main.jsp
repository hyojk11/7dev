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
<body>
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
                <button class="btn btn-outline-success btn-sm me-2">로그아웃</button>
                <button class="btn btn-success btn-sm">mypage</button>
            </div>
        </div>
    </div>

    <!-- 거래처 전용 카드 레이아웃 -->
    <div class="main-container mt-4">
        <div class="container-grid">
            <div class="card">
                <div class="card-title">
                    <div class="card-icon"><i class="bi bi-tools"></i></div>발주 내역
                </div>
                <div class="card-body">
                    <a href="#">발주 확인</a>
                    <a href="#">발주 진행 확인</a>
                </div>
            </div>
            <div class="card">
                <div class="card-title">
                    <div class="card-icon"><i class="bi bi-gear-wide-connected"></i></div>계약 및 견적
                </div>
                <div class="card-body">
                    <a href="#">계약 상태 확인</a>
                    <a href="#">견적 요청 내역</a>
                </div>
            </div>
            <div class="card">
                <div class="card-title">
                    <div class="card-icon"><i class="bi bi-cart-check"></i></div>배송 및 수령
                </div>
                <div class="card-body">
                    <a href="#">배송 일정 확인</a>
                    <a href="#">수령 내역</a>
                </div>
            </div>
            <div class="card">
                <div class="card-title">
                    <div class="card-icon"><i class="bi bi-boxes"></i></div>거래처 정보
                </div>
                <div class="card-body">
                    <a href="#">회사 정보 관리</a>
                    <a href="#">연락처 업데이트</a>
                </div>
            </div>
            <div class="card">
                <div class="card-title">
                    <div class="card-icon"><i class="bi bi-bar-chart-line"></i></div>현황 관리 리포트
                </div>
                <div class="card-body">
                    <a href="#">거래 내역 분석</a>
                    <a href="#">보고서 다운로드</a>
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
