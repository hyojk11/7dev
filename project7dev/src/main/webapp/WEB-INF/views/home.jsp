<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Home-login</title>

    <!-- ✅ Bootstrap CSS CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
          crossorigin="anonymous">

    <!-- ✅ Custom 스타일 -->
    <style>
        .pastel-green {
            background-color: #d4f5d3 !important;
        }
        .text-pastel-green {
            color: #2e7d32;
        }
        html, body {
            height: 100%;
        }
    </style>
</head>
<body>

<!-- ✅ 로그인 결과 메시지 alert -->
<c:if test="${not empty resultMsg}">
    <script>
        alert("${resultMsg}");
    </script>
</c:if>

<!-- ✅ 로그인 화면 UI -->
<div class="container d-flex justify-content-center align-items-start" style="height: 100vh; margin-top: 50px;">
    <div class="row justify-content-sm-center w-100">
        <div class="col-sm-9 col-md-7 col-lg-5 col-xl-5 col-xxl-4">

            <!-- 로고 이미지 -->
            <div class="text-center my-5">
                <img src="${contextPath}/resources/image/7chilldevLogo_Green_Long.png" width="200" height="50" />
            </div>

            <!-- 로그인 카드 박스 -->
            <div class="card shadow-lg">

                <!-- 상단 카드 헤더 -->
                <div class="card-header pastel-green d-flex justify-content-between">
                    <h6 class="mb-0 fw-bold text-dark">Login</h6>
                    <h6 class="mb-0 text-dark">자재조달 관리 시스템</h6>
                </div>

                <!-- 입력 영역 -->
                <div class="card-body p-4">
                    <form action="${contextPath}/login" method="post" autocomplete="off">
                        <div class="mb-3">
                            <input type="text" name="user_id" class="form-control" placeholder="ID" required autofocus>
                        </div>
                        <div class="mb-3">
                            <input type="password" name="user_password" class="form-control" placeholder="PW" required>
                        </div>
                        <div class="form-check mb-3 d-flex justify-content-end">
                            <input type="checkbox" class="form-check-input" id="rememberMe">
                            <label class="form-check-label" for="rememberMe">Remember me</label>
                        </div>

                        <div class="d-grid">
                            <button type="submit" class="btn btn-success">sign in</button>
                        </div>
                    </form>
                </div>

            </div>
        </div>
    </div>
</div>

</body>
</html>
