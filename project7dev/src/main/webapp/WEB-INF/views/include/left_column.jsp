<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="col-2 sidebar">
	<h4>7chilldev</h4>

	<div class="user-info-box">
		<c:if test="${empty sessionScope.user_id}">
			<p class="user-greeting">
				<span class="line">로그인을 먼저 해주세요</span>
			</p>
			<div class="user-links">
				<a href="${contextPath }/">🔐 로그인</a>
			</div>
		</c:if>
		<c:if test="${not empty sessionScope.user_id}">
			<p class="user-greeting">
				<span class="line">안녕하세요</span> <span class="line"><strong>${sessionScope.user_name}
						님</strong></span>
			</p>

			<div class="user-links">
				<a href="${contextPath }/">🔐 로그아웃</a>
				<c:choose>
					<c:when test="${sessionScope.user_type == 'EMP'}">
						<a href="${contextPath }/mypage/empDetail">🧑 mypage</a>
					</c:when>
					<c:when test="${sessionScope.user_type == 'SUP'}">
						<a href="${contextPath }/mypage/supDetail">🧑 mypage</a>
					</c:when>
				</c:choose>
			</div>
		</c:if>
	</div>

	<hr>
	<nav>
		<c:if test="${not empty sessionScope.user_id}">
			<c:choose>
				<%-- 사원 메뉴 --%>
				<c:when test="${sessionScope.user_type == 'EMP'}">
					<c:if test="${sessionScope.user_id == 'admin01'}">
						<%-- 관리 메뉴 --%>
						<div class="nav-group">
							<div class="nav-title">관리</div>
							<ul class="sub-menu">
								<li><a href="${contextPath}/emp/list">사원 관리</a></li>
								<li><a href="${contextPath}/supplier/supplier_main">거래처 관리</a></li>
							</ul>
						</div>
					</c:if>
					<%-- 개발 메뉴 --%>
					<div class="nav-group">
						<div class="nav-title">개발</div>
						<ul class="sub-menu">
							<li><a href="${contextPath}/material/material_main">부품 정보</a></li>
							<li><a href="${contextPath}/product/product_main">제품 정보</a></li>
						</ul>
					</div>
					<%-- 생산 메뉴 --%>
					<div class="nav-group">
						<div class="nav-title">생산</div>
						<ul class="sub-menu">
							<li><a href="${contextPath}/prd_planning/list">제품 생산 계획</a></li>
							<li><a href="${contextPath}/mrp/mrp_main">자재 소요 계획</a></li>
							<li><a href="${contextPath}/mpp/mpp_main">부품 조달 계획</a></li>
						</ul>
					</div>
					<%-- 구매 메뉴 --%>
					<div class="nav-group">
						<div class="nav-title">구매</div>
						<ul class="sub-menu">
							<c:if test="${sessionScope.user_id == 'admin01'}">
								<li><a href="${contextPath}/quotation/quotation_main">견적 관리</a></li>
							</c:if>
							<li><a href="${contextPath}/contract/contract_main">계약 관리</a></li>
							<li><a href="${contextPath}/incoming/status_list">발주 진행 현황</a></li>
							<li><a href="${contextPath}/purc_order/list">구매 발주</a></li>
							<li><a href="${contextPath}/pro_monitoring/list">진척 검수</a></li>
						</ul>
					</div>
					<%-- 자재 메뉴 --%>
					<div class="nav-group">
						<div class="nav-title">자재</div>
						<ul class="sub-menu">
							<li><a href="${contextPath}/incoming/material_storage">창고별 자재 현황</a></li>
							<li><a href="${contextPath}/incoming/expected">자재 입고 관리</a></li>
							<li><a href="${contextPath}/incoming/material_handling">자재 통합 관리</a></li>
							<li><a href="${contextPath}/issuing/produce">부품 출고하기</a></li>
							<li><a href="${contextPath}/issuing/lineout">라인 출고하기</a></li>
						</ul>
					</div>
					<%-- 조회 메뉴 --%>
					<div class="nav-group">
						<div class="nav-title">조회</div>
						<ul class="sub-menu">
							<li><a href="${contextPath}/inventory/status">자재 재고 조회</a></li>
							<li><a href="${contextPath}/inventory/documents">자재 입출고 조회</a></li>
							<li><a href="${contextPath}/inventory/report">재고 현황 보고서</a></li>
							<li><a href="${contextPath}/incoming/tp_list">거래 명세서</a></li>
						</ul>
					</div>
					<%-- 공지사항 메뉴 --%>
					<div class="nav-group">
						<div class="nav-title">공지사항</div>
						<ul class="sub-menu">
							<li><a href="#">공지사항 목록</a></li>
							<li><a href="#">공지사항 관리</a></li>
						</ul>
					</div>
				</c:when>

				<%-- 거래처 메뉴 --%>
				<c:when test="${sessionScope.user_type == 'SUP'}">
					<%-- 구매 메뉴 --%>
					<div class="nav-group">
						<div class="nav-title">구매</div>
						<ul class="sub-menu">
							<li><a href="${contextPath}/quotation/quotation_main">견적관리</a></li>
							<li><a href="${contextPath}/incoming/status_list">발주진행현황</a></li>
							<li><a href="${contextPath}/purc_order/list">구매발주</a></li>
							<li><a href="${contextPath}/pro_monitoring/list">진척검수</a></li>
						</ul>
					</div>
					<%-- 리포트 메뉴 --%>
					<div class="nav-group">
						<div class="nav-title">조회</div>
						<ul class="sub-menu">
							<li><a href="${contextPath}/incoming/tp_list">거래명세서</a></li>
						</ul>
					</div>
					<%-- 공지사항 메뉴 --%>
					<div class="nav-group">
						<div class="nav-title">공지사항</div>
						<ul class="sub-menu">
							<li><a href="#">공지사항 목록</a></li>
						</ul>
					</div>
				</c:when>

			</c:choose>
		</c:if>
	</nav>
</div>

<style>
.user-greeting .line {
	display: block;
}

.sidebar {
	padding: 20px;
}

.user-info-box {
	background-color: white;
	padding: 15px;
	border-radius: 8px;
	margin-bottom: 20px;
	width: 100%;
	height: 220px;
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
}

.user-greeting {
	text-align: center;
	font-size: 18px;
	line-height: 1.8;
	color: black;
	margin-bottom: 10px;
}

.user-links {
	display: flex;
	flex-direction: column;
	gap: 5px;
}

.user-links a {
	text-decoration: none;
	color: #007bff;
	font-weight: bold;
}

.user-links a:hover {
	text-decoration: underline;
}

.options {
	margin-left: 20px;
}

.form-select {
	width: 100%;
}

.nav-group {
	margin-bottom: 10px;
	position: relative;
}

.nav-title {
	font-size: 18px;
	font-weight: bold;
	cursor: pointer;
	padding: 5px;
}

.sub-menu {
	display: block;
	list-style: none;
	padding: 10px;
	margin-top: 5px;
	background-color: #f8f9fa;
	border-radius: 4px;
	width: 100%;
	box-sizing: border-box;
	position: relative;
	max-height: 0;
	overflow: hidden;
	opacity: 0;
	transform: translateY(-10px);
	transition: all 0.6s ease-in-out;
	visibility: hidden;
}

.nav-group:hover .sub-menu {
	max-height: 500px;
	display: block;
	opacity: 1;
	visibility: visible;
	transform: translateY(0);
}

.nav-title:hover+.sub-menu {
	display: block !important;
}

.sub-menu li {
	margin: 5px 0;
}

.sub-menu li a {
	text-decoration: none;
	color: #333;
}

.sub-menu li a:hover {
	text-decoration: underline;
	color: #007bff;
}
</style>