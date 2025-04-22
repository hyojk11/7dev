<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%@ page session="true" %>

<!DOCTYPE html>
<html lang="ko">
<%@ include file="../include/header.jsp" %>

    <style>
        /* 테이블 스타일 */
        .table {
            width: 100%;
            border-collapse: collapse;
            table-layout: fixed;
            margin-bottom: 20px;
        }

        .table th,
        .table td {
            border: 1px solid #ccc;
            padding: 10px;
            text-align: center;
            word-wrap: break-word;
        }

        .table th {
            background-color: #f2f2f2;
        }

        .table td button {
            padding: 5px 10px;
            border-radius: 4px;
        }

        /* 스크롤 컨테이너 */
        .scroll-container {
            max-height: 400px;
            overflow-y: auto;
            border: 1px solid #ccc;
        }

        /* 검색 폼 스타일 */
        .search-form {
            display: flex;
            gap: 10px;
            align-items: center;
            margin-bottom: 20px;
        }

        .search-form select,
        .search-form input {
            padding: 5px;
            font-size: 1rem;
        }

        .search-form button {
            padding: 8px 16px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .search-form button:hover {
            background-color: #0056b3;
        }

        /* Sticky 헤더 */
        .sticky-header th {
            position: sticky;
            top: 0;
            background-color: #fff;
            z-index: 2;
        }
    </style>
    
<body>
    <div class="container-fluid">
        <div class="row">
            <%@ include file="../include/left_column.jsp" %>

            <!-- 메인 콘텐츠 -->
            <div class="col-10 main p-4">
                <h3 class="fw-bold mb-4">자재소요계획</h3>

                <h4>제품생산계획 선택</h4>
                
				<!-- 검색 폼 -->
				<form action="${contextPath}/mrp/mrp_main" method="get" class="row g-3 align-items-end mb-4">
				    <div class="col-md-2">
				        <select name="searchType" id="selectField" class="form-select">
				            <option value="productCode" selected>제품코드</option>
				            <option value="productName">제품명</option>
				        </select>
				    </div>
				    <div class="col-md-4">
				        <input type="text" name="searchValue" id="inputCode" class="form-control" placeholder="검색어 입력" />
				    </div>
				    <div class="col-md-2">
				        <button type="submit" class="btn btn-primary">검색</button>
				    </div>
				</form>

                <!-- 제품생산계획 목록 테이블 -->
                <div class="scroll-container">
                    <table class="table">
                        <thead class="sticky-header">
                            <tr>
                                <th colspan="8">제품생산계획 목록</th>
                            </tr>
                            <tr>
                                <th style="background-color: #EDFFF4;">제품코드</th>
                                <th style="background-color: #EDFFF4;">제품명</th>
                                <th style="background-color: #EDFFF4;">생산공장</th>
                                <th style="background-color: #EDFFF4;">생산라인</th>
                                <th style="background-color: #EDFFF4;">생산계획수량</th>
                                <th style="background-color: #EDFFF4;">생산 납기일</th>
                                <th style="background-color: #EDFFF4;">담당자</th>
                                <th style="background-color: #EDFFF4;">선택</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="productionPlanning" items="${productionPlanning}">
                                <tr>
                                    <td>${productionPlanning.product_code}</td>
                                    <td>${productionPlanning.product_name}</td>
                                    <td>${productionPlanning.prpl_plant}</td>
                                    <td>${productionPlanning.prpl_line}</td>
                                    <td>${productionPlanning.product_cnt}</td>
                                    <td>${fn:substring(productionPlanning.prpl_due_date, 0, 10)}</td>
                                    <td>${productionPlanning.emp_name}</td>
                                    <td>
                                        <form action="${contextPath}/mrp/mrp_getCreateMrp" method="get">
                                            <input type="hidden" name="prplNo" value="${productionPlanning.prpl_no}" />
                                            <button type="submit" class="btn btn-success">등록</button>
                                        </form>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
