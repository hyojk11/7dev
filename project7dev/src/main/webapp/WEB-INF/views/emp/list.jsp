<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<%@ include file="../include/header.jsp" %>
<body>
<div class="container-fluid">
  <div class="row">
    <%@ include file="../include/left_column.jsp" %>

    <!-- 메인 콘텐츠 영역 -->
    <div class="col-10 main" style="padding: 20px;">
      <h3 class="fw-bold mb-4">사원관리</h3>

      <div class="scroll-container" style="max-height: 600px; overflow-y: auto; border: 1px solid #ccc; padding: 10px; background-color: #fff;">
        <table class="table table-bordered text-center align-middle scroll-table" style="width: 100%; table-layout: fixed;">
          <thead class="sticky-row">
            <!-- 검색 영역 -->
            <tr style="position: sticky; top: 0; background-color: #fff; z-index: 3;">
              <th colspan="4">
                <form action="${contextPath}/emp/list" method="get" class="d-flex justify-content-center align-items-center gap-2">
                  <select name="searchType" id="searchType" class="form-select w-auto">
                    <option value="emp_no" ${param.searchType == 'emp_no' ? 'selected' : ''}>사원번호</option>
                    <option value="emp_name" ${param.searchType == 'emp_name' ? 'selected' : ''}>사원명</option>
                    <option value="emp_job" ${param.searchType == 'emp_job' ? 'selected' : ''}>직책</option>
                    <option value="emp_id" ${param.searchType == 'emp_id' ? 'selected' : ''}>아이디</option>
                  </select>
                  <input type="text" name="keyword" value="${param.keyword}" placeholder="검색어" class="form-control w-25">
                  <button class="btn btn-primary">검색</button>
                </form>
              </th>
              <th>
                <form action="${contextPath}/emp/listExcel" method="get">
                  <input type="hidden" name="searchType" value="${param.searchType}">
                  <input type="hidden" name="keyword" value="${param.keyword}">
                  <button class="btn btn-success">EXCEL 다운</button>
                </form>
              </th>
              <th>
                <button type="button" class="btn btn-success btn-sm" id="openModalBtn">신규사원등록</button>
              </th>
            </tr>

            <!-- 목록 헤더 -->
            <tr>
              <th colspan="7">사원 목록</th>
            </tr>

            <!-- 실제 테이블 컬럼 헤더 -->
            <tr style="background-color: #EDFFF4;">
              <th style="background-color: #EDFFF4;">사원번호</th>
              <th style="background-color: #EDFFF4;">사원명</th>
              <th style="background-color: #EDFFF4;">직책</th>
              <th style="background-color: #EDFFF4;">아이디</th>
              <th style="background-color: #EDFFF4;">전화번호</th>
              <th colspan="2" style="background-color: #EDFFF4;">이메일</th>
            </tr>
          </thead>

          <tbody>
            <c:forEach var="data" items="${list}">
              <tr>
                <td>${data.emp_no}</td>
                <td><a href="${contextPath}/emp/detail?emp_no=${data.emp_no}">${data.emp_name}</a></td>
                <td>${data.emp_job}</td>
                <td>${data.emp_id}</td>
                <td>${data.emp_phone}</td>
                <td colspan="2">${data.emp_email}</td>
              </tr>
            </c:forEach>
          </tbody>
        </table>
      </div>

      <!-- 페이징 -->
		<div class="pagination-container d-flex justify-content-center my-4">
		  <c:if test="${startPage > 1}">
		    <a class="btn btn-outline-secondary mx-1" href="?page=${startPage - 1}&searchType=${searchType}&keyword=${keyword}">◀</a>
		  </c:if>
		
		  <c:forEach begin="${startPage}" end="${endPage}" var="i">
		    <a class="btn btn-outline-secondary mx-1" href="?page=${i}&searchType=${searchType}&keyword=${keyword}">${i}</a>
		  </c:forEach>
		
		  <c:if test="${endPage < totalPage}">
		    <a class="btn btn-outline-secondary mx-1" href="?page=${endPage + 1}&searchType=${searchType}&keyword=${keyword}">▶</a>
		  </c:if>
		</div>


      <!-- 사원 등록 모달 -->
      <div id="modal" class="modal" style="display: none;">
        <div class="modal-content">
          <h3>신규사원등록</h3>
          <form action="${contextPath}/emp/register" method="post">
            <div class="form-group">
              <label for="emp_name">사원명</label>
              <input type="text" name="emp_name" required class="form-control">
            </div>
            <div class="form-group">
              <label for="emp_job">직책</label>
              <input type="text" name="emp_job" required class="form-control">
            </div>
            <div class="form-group">
              <label for="emp_id">아이디</label>
              <input type="text" name="emp_id" id="emp_id" required class="form-control">
            </div>
            <div class="form-group">
              <label for="emp_password">임시비밀번호</label>
              <input type="text" name="emp_password" required class="form-control">
            </div>
            <div class="form-group">
              <label for="emp_email">이메일</label>
              <input type="email" name="emp_email" placeholder="ex)chill@email.com" required class="form-control">
            </div>
            <div class="form-group">
              <label for="emp_phone">전화번호</label>
              <input type="tel" name="emp_phone" required class="form-control">
            </div>
            <div class="form-group mt-4">
              <button type="submit" class="btn btn-success">사원등록</button>
              <button type="button" class="btn btn-secondary" id="close">취소</button>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>
</div>

<%@ include file="../include/footer.jsp" %>

<script>
  document.getElementById("openModalBtn").onclick = function() {
    document.getElementById("modal").style.display = "flex";
  };

  document.getElementById("close").onclick = function() {
    document.getElementById("modal").style.display = "none";
  };
</script>

<style>
  /* 모달 배경 스타일 */
  .modal {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: rgba(0, 0, 0, 0.5); /* 반투명 배경 */
    display: none;
    justify-content: center; /* 수평 중앙 */
    align-items: center; /* 수직 중앙 */
  }

  .modal-content {
    background-color: white;
    padding: 20px;
    width: 400px;
    border-radius: 8px;
    box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);
  }
</style>

</body>
</html>
