<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="col-2 sidebar">
    <h4>7chilldev</h4>
    
    <div class="user-info-box">
        <p class="user-greeting">
    <span class="line">안녕하세요</span>
    <span class="line"><strong>${sessionScope.user_name} 님</strong></span>
</p>

        <div class="user-links">
            <a href="#">🔐 로그아웃</a>
            <a href="#">🧑 mypage</a>
        </div>
    </div>

    <hr>
    <nav>
        <a href="javascript:void(0);" class="toggle-btn nav-title" data-target="development-options">개발</a>
        <div id="development-options" class="options" style="display:none;">
            <select class="form-select form-select-sm mb-2" name="development">
                <option value="부품정보" selected>부품정보</option>
                <option value="품목정보">품목정보</option>
            </select>
        </div>

        <a href="javascript:void(0);" class="toggle-btn nav-title" data-target="production-options">생산</a>
        <div id="production-options" class="options" style="display:none;">
            <select class="form-select form-select-sm mb-2" name="production">
                <option value="제품생산계획" selected>제품생산계획</option>
                <option value="자재소요계획">자재소요계획</option>
                <option value="부품조달계획">부품조달계획</option>
            </select>
        </div>    

        <a href="javascript:void(0);" class="toggle-btn nav-title" data-target="purchase-options">구매</a>
        <div id="purchase-options" class="options" style="display:none;">
            <select class="form-select form-select-sm mb-2" name="purchase">
                <option value="견적관리" selected>견적관리</option>
                <option value="계약관리">계약관리</option>
                <option value="구매발주">구매발주</option>
                <option value="진척검수">진척검수</option>
                <option value="현황관리리포트(발주진행)">현황관리리포트(발주진행)</option>
                <option value="통합 발주마감">통합 발주마감</option>
            </select>
        </div>    

        <a href="javascript:void(0);" class="toggle-btn nav-title" data-target="material-options">자재</a>
        <div id="material-options" class="options" style="display:none;">
            <select class="form-select form-select-sm mb-2" name="material">
                <option value="자재조회" selected>자재조회</option>
                <option value="입고 예정목록">입고 예정목록</option>
            </select>
        </div>    

        <a href="javascript:void(0);" class="toggle-btn nav-title" data-target="report-options">리포트</a>
        <div id="report-options" class="options" style="display:none;">
            <select class="form-select form-select-sm mb-2" name="report">
                <option value="발주진행" selected>발주진행</option>
                <option value="재고금액">재고금액</option>
            </select>
        </div>    

        <a href="#" class="nav-title">공지사항</a>    
    </nav>
</div>

<script>
    document.querySelectorAll('.toggle-btn').forEach(function(btn) {
        btn.addEventListener('click', function () {
            const target = document.getElementById(btn.getAttribute('data-target'));
            target.style.display = target.style.display === 'none' || target.style.display === '' ? 'block' : 'none';
        });
    });
</script>

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
        width: 280px;
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

    .nav-title {
        font-size: 18px;
        font-weight: bold;
        margin-top: 10px;
        display: inline-block;
    }
</style>
