<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="col-2 sidebar">
    <h4>7chilldev</h4>
    
    <div class="user-info-box">
    	<c:if test="${empty sessionScope.user_type}">
    	<p class="user-greeting">
    		<span class="line">로그인을 먼저 해주세요</span>
		</p>
		<div class="user-links">
            <a href="${contextPath }/">🔐 로그인</a>
        </div>
		</c:if>
        <c:if test="${not empty sessionScope.user_id}">
        <p class="user-greeting">
    		<span class="line">안녕하세요</span>
    		<span class="line"><strong>${sessionScope.user_name} 님</strong></span>
		</p>

        <div class="user-links">
            <a href="${contextPath }/">🔐 로그아웃</a>
            <a href="#">🧑 mypage</a>
        </div>
        </c:if>
    </div>

    <hr>
    <nav>
	    <!-- 개발 메뉴 -->
	    <div class="nav-group">
	        <div class="nav-title">개발</div>
	        <ul class="sub-menu">
	            <li><a href="#">부품정보</a></li>
	            <li><a href="#">품목정보</a></li>
	        </ul>
	    </div>
	    <!-- 생산 메뉴 -->
	    <div class="nav-group">
	        <div class="nav-title">생산</div>
	        <ul class="sub-menu">
	            <li><a href="#">제품생산계획</a></li>
	            <li><a href="#">자재소요계획</a></li>
	            <li><a href="#">부품조달계획</a></li>
	        </ul>
	    </div>  
	  	<!-- 구매 메뉴 -->
	    <div class="nav-group">
	        <div class="nav-title">구매</div>
	        <ul class="sub-menu">
	            <li><a href="#">견적관리</a></li>
	            <li><a href="#">계약관리</a></li>
	            <li><a href="#">구매발주</a></li>
	            <li><a href="#">진척검수</a></li>
	            <li><a href="#">현황관리리포트(발주진행)</a></li>
	            <li><a href="#">통합 발주마감</a></li>
	        </ul>
	    </div>  
	  	<!-- 자재 메뉴 -->
	    <div class="nav-group">
	        <div class="nav-title">자재</div>
	        <ul class="sub-menu">
	            <li><a href="#">자재조회</a></li>
	            <li><a href="#">입고 예정목록</a></li>
	        </ul>
	    </div>  
	  	<!-- 리포트 메뉴 -->
	    <div class="nav-group">
	        <div class="nav-title">리포트</div>
	        <ul class="sub-menu">
	            <li><a href="#">발주진행</a></li>
	            <li><a href="#">재고금액</a></li>
	        </ul>
	    </div>  
	  	<!-- 공지사항 메뉴 -->
	    <div class="nav-group">
	        <div class="nav-title">공지사항</div>
	        <ul class="sub-menu">
	            <li><a href="#">공지사항 목록</a></li>
	            <li><a href="#">공지사항 관리</a></li>
	        </ul>
	    </div> 
    </nav>
</div>

<style>
	.user-greeting .line {
	    display: block;
	}

    .sidebar {
        padding: 20px;
        max-width: 250px;
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
	
	.nav-title:hover + .sub-menu {
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