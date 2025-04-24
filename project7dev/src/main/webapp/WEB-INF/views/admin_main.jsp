<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>	
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 전용 페이지</title>
</head>
<body>
<c:if test="${not empty resultMsg}">
    <script>
        alert("${resultMsg}");
    </script>
</c:if>

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
<body class="bg-light">
<div class="container mt-3">
    <div class="top-bar">
        <img src="${contextPath}/resources/image/7chilldevLogo_Green_Long.png" width="160" height="40">
        <div>
            <span>안녕하세요 <strong>${sessionScope.user_name} 님</strong>&nbsp;</span>
            <button class="btn btn-outline-success btn-sm me-2" onclick="location.href='${contextPath }/'">로그아웃</button>
            <button class="btn btn-success btn-sm" onclick="location.href='${contextPath }/mypage/empDetail'">mypage</button>
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
                <a href="${contextPath}/emp/list">사원 목록</a>
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
                <a href="${contextPath}/supplier/supplier_main">거래처 목록</a>
            </div>
        </div>

        <!-- 기존 카드들 내용 유지 -->
        <div class="card">
            <div class="card-title">
                <div class="card-icon"><i class="bi bi-tools"></i></div>
                개발
            </div>
            <div class="card-body">
                <a href="${contextPath}/material/material_main">부품 정보</a>
                <a href="${contextPath}/product/product_main">제품 정보</a>
            </div>
        </div>

        <div class="card">
            <div class="card-title">
                <div class="card-icon"><i class="bi bi-gear-wide-connected"></i></div>
                생산
            </div>
            <div class="card-body">
                <a href="${contextPath}/prd_planning/list">제품 생산 계획</a>
				<a href="${contextPath}/mrp/mrp_main">자재 소요 계획</a>
				<a href="${contextPath}/mpp/mpp_main">부품 조달 계획</a>
            </div>
        </div>

        <div class="card">
            <div class="card-title">
                <div class="card-icon"><i class="bi bi-cart-check"></i></div>
                구매
            </div>
            <div class="card-body">
				<a href="${contextPath}/quotation/quotation_main">견적 관리</a>
				<a href="${contextPath}/contract/contract_main">계약 관리</a>
				<a href="${contextPath}/incoming/status_list">발주 진행 현황</a>
				<a href="${contextPath}/purc_order/list">구매 발주</a>
				<a href="${contextPath}/pro_monitoring/list">진척 검수</a>
            </div>
        </div>

        <div class="card">
            <div class="card-title">
                <div class="card-icon"><i class="bi bi-boxes"></i></div>
                자재
            </div>
            <div class="card-body">
                <a href="${contextPath}/incoming/material_storage">창고별 자재 현황</a>
				<a href="${contextPath}/incoming/expected">자재 입고 관리</a>
				<a href="${contextPath}/incoming/material_handling">자재 통합 관리</a>
				<a href="${contextPath}/issuing/produce">부품 출고하기</a>
				<a href="${contextPath}/issuing/lineout">라인 출고하기</a>
            </div>
        </div>

        <div class="card">
            <div class="card-title">
                <div class="card-icon"><i class="bi bi-bar-chart-line"></i></div>
                조회
            </div>
            <div class="card-body">
                <a href="${contextPath}/inventory/status">자재 재고 조회</a>
				<a href="${contextPath}/inventory/documents">자재 입출고 조회</a>
				<a href="${contextPath}/inventory/report">재고 현황 보고서</a>
				<a href="${contextPath}/incoming/tp_list">거래 명세서</a>
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
