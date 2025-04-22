<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%@ page session="true" %>  
  
<!DOCTYPE html>
<html>
<%@ include file="../include/header.jsp" %>

<style>
  .scroll-table {
    width: 100%;
    border-collapse: separate;
    table-layout: fixed;
  }

  .scroll-table thead {
    background-color: #f2f2f2;
  }
  
  .scroll-table th,
  .scroll-table td {
    border: 1px solid #ccc;
    padding: 8px;
    text-align: center;
    word-wrap: break-word;
  }

  .scroll-container {
    max-height: 300px;
    overflow-y: auto;
    border: 1px solid #ccc;
  }
  
  .sticky-row th {
  position: sticky;
  background-color: #fff;
  z-index: 2;
}

 .scroll-container thead th {
   position: sticky;
   top: 0;
   background-color: #fff; /* 배경 지정 안 하면 스크롤시 투명해짐 */
   z-index: 1;
 }
 
   .label-cell {
    background-color: #7EFFAF;
    font-weight: semibold;
  }
</style>

<body>
    <div class="container-fluid">
        <div class="row">
            <%@ include file="../include/left_column.jsp" %>

            <!-- 메인 콘텐츠 -->
            <div class="col-10 main p-4">
                <h3 class="fw-bold mb-4">견적 선택</h3>

                <!-- 검색 폼 -->
                <form action="${contextPath}/contract/selectQuotation" method="get" class="row g-3 align-items-end mb-4">
                    <div class="col-md-2">
                        <label class="form-label">검색 유형</label>
                        <select name="searchType" class="form-control">
                            <option value="quotCode" selected>견적코드</option>
                            <option value="materialCode">부품코드</option>
                            <option value="supName">회사명</option>
                        </select>
                    </div>
                    <div class="col-md-4">
                        <label class="form-label">검색값</label>
                        <input type="text" name="searchValue" class="form-control" value="${param.searchValue}" />
                    </div>
                    <div class="col-md-2">
                        <label class="form-label invisible">검색</label>
                        <button type="submit" class="btn btn-primary w-100">검색</button>
                    </div>
                </form>

                <!-- 견적 목록 테이블 -->
                <div class="scroll-container">
                    <table class="table">
                        <thead>
                            <tr>
                                <th colspan="5">부품 목록</th>
                            </tr>
                            <tr>
                                <th>견적코드</th>
                                <th>부품코드</th>
                                <th>부품명</th>
                                <th>상세보기</th>
                                <th>등록하기</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="quotation" items="${quotationList}">
                                <tr>
                                    <td>${quotation.quotCode}</td>
                                    <td>${quotation.materialCode}</td>
                                    <td>${quotation.materialName}</td>
                                    <td>
                                        <form action="${contextPath}/contract/selectContract" method="get">
                                            <input type="hidden" name="quotNo" value="${quotation.quotNo}" />
                                            <button type="submit" class="btn btn-info">보기</button>
                                        </form>
                                    </td>
                                    <td>
                                        <form action="${contextPath}/contract/getCreateContract" method="get">
                                            <input type="hidden" name="quotNo" value="${quotation.quotNo}" />
                                            <button type="submit" class="btn btn-success">선택</button>
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

    <%@ include file="../include/footer.jsp" %>
</body>
</html>