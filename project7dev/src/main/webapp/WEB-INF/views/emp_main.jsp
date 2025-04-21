<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>	
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>임직원 전용 페이지</title>

    <!-- Bootstrap & Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">

    <!-- 사용자 정의 CSS -->
    <link href="${contextPath}/resources/css/emp_main.css" rel="stylesheet">

    
</head>

<body class="bg-light">

<div class="content-wrapper">

    <!-- 로그인 메시지 알림 -->
    <c:if test="${not empty resultMsg}">
        <script>
            alert("${resultMsg}");
        </script>
    </c:if>

    <!-- Top-Bar -->
    <div class="container mt-3">
        <div class="top-bar d-flex justify-content-between align-items-center bg-light py-2 px-3">
            <img src="${contextPath}/resources/image/7chilldevLogo_Green_Long.png" width="160" height="40">
            <div>
                <c:choose>
                    <c:when test="${not empty sessionScope.user_name}">
                        <span>안녕하세요 <strong>${sessionScope.user_name} 님</strong>&nbsp;</span>
                    </c:when>
                    <c:otherwise>
                        <span>안녕하세요 <strong>사용자 님</strong>&nbsp;</span>
                    </c:otherwise>
                </c:choose>
                <button class="btn btn-outline-success btn-sm me-2">로그아웃</button>
                <button class="btn btn-success btn-sm">mypage</button>
            </div>
        </div>
    </div>

    <!-- 카드형 메뉴 (2줄, 3개씩) -->
    <div class="main-container py-4">
    <div class="container-grid">
        <div class="card">
            <div class="card-title">
                <div class="card-icon"><i class="bi bi-tools"></i></div>개발
            </div>
            <div class="card-body">
                <a href="${contextPath}/item">품목정보</a>
                <a href="#">부품정보</a>
            </div>
        </div>
        <div class="card">
            <div class="card-title">
                <div class="card-icon"><i class="bi bi-gear-wide-connected"></i></div>생산
            </div>
            <div class="card-body">
                <a href="#">제품생산계획</a>
                <a href="#">자재소요계획</a>
                <a href="#">부품조달계획</a>
            </div>
        </div>
        <div class="card">
            <div class="card-title">
                <div class="card-icon"><i class="bi bi-cart-check"></i></div>구매
            </div>
            <div class="card-body">
                <a href="#">견적관리</a>
                <a href="#">계약관리</a>
                <a href="#">구매발주</a>
                <a href="#">진척검수</a>
                <a href="#">현황관리리포트<br>(발주 진행)</a>
                <a href="#">통합 발주마감</a>
            </div>
        </div>
        <div class="card">
            <div class="card-title">
                <div class="card-icon"><i class="bi bi-boxes"></i></div>자재
            </div>
            <div class="card-body">
                <a href="#">자재조회</a>
                <a href="#">입고 예정목록</a>
                <a href="${contextPath}/issuing/produce">부품 출고하기</a>
                <a href="${contextPath}/issuing/lineout">라인 출고하기</a>
            </div>
        </div>
        <div class="card">
            <div class="card-title">
                <div class="card-icon"><i class="bi bi-bar-chart-line"></i></div>리포트
            </div>
            <div class="card-body">
                <a href="#">진행상황</a>
                <a href="#">재고금액</a>
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


</div> <!-- content-wrapper 끝 -->

<!-- ✅ Footer (하단 고정) -->
<%@ include file="/WEB-INF/views/include/footer.jsp" %>

</body>
</html>
