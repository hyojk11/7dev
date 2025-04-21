<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>	
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:if test="${not empty resultMsg}">
    <script>
        alert("${resultMsg}");
    </script>
</c:if>

<!-- 새로운 관리자 페이지 내용 추가 -->
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
    <title>관리자 전용 페이지</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Bootstrap Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">

    <!-- 관리자 페이지 Custom CSS -->
    <link href="${contextPath}/resources/css/admin.css" rel="stylesheet">
</head>
<body>
<div class="container mt-3">
    <div class="top-bar">
        <img src="${contextPath}/resources/image/7chilldevLogo_Green_Long.png" width="160" height="40">
        <div>
            <span>안녕하세요 <strong>${sessionScope.user_name} 님</strong>&nbsp;</span>
            <button class="btn btn-outline-success btn-sm me-2">로그아웃</button>
            <button class="btn btn-success btn-sm">mypage</button>
        </div>
    </div>
</div>

<div class="main-container">
    <div class="container-grid">
        <!-- 사원 관리 카드 -->
        <div class="card manage-card">
            <div class="manage-card-icon">
                <i class="bi bi-person-badge"></i>
            </div>
            <div class="manage-card-title">
                사원 관리
            </div>
            <div class="manage-card-body">
                <a href="#">사원 목록</a>
                <a href="#">사원 추가</a>
            </div>
        </div>

        <!-- 거래처 관리 카드 -->
        <div class="card manage-card">
            <div class="manage-card-icon">
                <i class="bi bi-building"></i>
            </div>
            <div class="manage-card-title">
                거래처 관리
            </div>
            <div class="manage-card-body">
                <a href="#">거래처 목록</a>
                <a href="#">거래처 추가</a>
            </div>
        </div>

        <!-- 기존 카드들 내용 유지 -->
        <div class="card">
            <div class="card-title">
                <div class="card-icon"><i class="bi bi-tools"></i></div>
                개발
            </div>
            <div class="card-body">
                <a href="#">품목정보</a>
                <a href="#">부품정보</a>
            </div>
        </div>

        <div class="card">
            <div class="card-title">
                <div class="card-icon"><i class="bi bi-gear-wide-connected"></i></div>
                생산
            </div>
            <div class="card-body">
                <a href="#">조달계획</a>
            </div>
        </div>

        <div class="card">
            <div class="card-title">
                <div class="card-icon"><i class="bi bi-cart-check"></i></div>
                구매
            </div>
            <div class="card-body">
                <a href="#">견적 관리</a>
                <a href="#">계약 관리</a>
            </div>
        </div>

        <div class="card">
            <div class="card-title">
                <div class="card-icon"><i class="bi bi-boxes"></i></div>
                자재
            </div>
            <div class="card-body">
                <a href="#">자재 입고</a>
                <a href="#">자재 출고</a>
                <a href="#">재고 관리</a>
                <a href="${contextPath}/issuing/produce">부품 출고하기</a>
                <a href="${contextPath}/issuing/lineout">라인 출고하기</a>
            </div>
        </div>

        <div class="card">
            <div class="card-title">
                <div class="card-icon"><i class="bi bi-bar-chart-line"></i></div>
                현황 관리 리포트
            </div>
            <div class="card-body">
                <a href="#">발주 진행</a>
                <a href="#">재고 금액</a>
            </div>
        </div>

        <div class="card">
            <div class="card-title">
                <div class="card-icon"><i class="bi bi-megaphone"></i></div>
                공지사항
            </div>
            <div class="card-body">
                <a href="#">공지사항 없음</a>
            </div>
        </div>
    </div>
</div>

<!-- Footer Include -->
<%@ include file="/WEB-INF/views/include/footer.jsp" %>

</body>
</html>
</body>
</html>
