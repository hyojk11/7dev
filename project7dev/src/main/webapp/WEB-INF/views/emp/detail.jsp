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
      <h3 class="fw-bold mb-4">사원정보 상세</h3>
      <form action="${contextPath}/emp/update" method="post">
        <table class="table table-bordered text-center">
          <tr>
            <td style="background-color: #EDFFF4;">사원번호</td>
            <td colspan="2"><input type="text" id="emp_no" name="emp_no" value="${dto.emp_no}" readonly class="form-control"></td>
          </tr>
          <tr>
            <td style="background-color: #EDFFF4;">사원명</td>
            <td colspan="2"><input type="text" id="emp_name" name="emp_name" value="${dto.emp_name}" readonly class="form-control"></td>
          </tr>
          <tr>
            <td style="background-color: #EDFFF4;">직책</td>
            <td colspan="2"><input type="text" id="emp_job" name="emp_job" value="${dto.emp_job}" readonly class="form-control"></td>
          </tr>
          <tr>
            <td style="background-color: #EDFFF4;">아이디</td>
            <td colspan="2">
              <input type="text" id="emp_id" name="emp_id" value="${dto.emp_id}" readonly class="form-control">
              <button type="button" id="idckBtn" style="display: none;" class="btn btn-secondary btn-sm">중복확인</button>
            </td>
          </tr>
          <tr>
            <td style="background-color: #EDFFF4;">비밀번호</td>
            <td colspan="2"><input type="text" id="emp_password" name="emp_password" value="${dto.emp_password}" readonly class="form-control"></td>
          </tr>
          <tr>
            <td style="background-color: #EDFFF4;">전화번호</td>
            <td colspan="2"><input type="tel" id="emp_phone" name="emp_phone" value="${dto.emp_phone}" readonly class="form-control"></td>
          </tr>
          <tr>
            <td style="background-color: #EDFFF4;">이메일</td>
            <td colspan="2"><input type="email" id="emp_email" name="emp_email" value="${dto.emp_email}" readonly class="form-control"></td>
          </tr>
        </table>
        <br>
        <button type="button" id="editBtn" class="btn btn-warning" onclick="updateForm()">수정</button>
        <button type="submit" id="saveBtn" style="display: none;" class="btn btn-success">저장</button>
        <button type="button" id="deleteBtn" onclick="location.href='${contextPath}/emp/delete?emp_no=${dto.emp_no}'" class="btn btn-danger">삭제</button>
        <button type="button" id="backBtn" onclick="location.href='${contextPath}/emp/list'" class="btn btn-secondary">목록으로</button>
        <button type="button" id="cancelBtn" onclick="location.href='${contextPath}/emp/detail?emp_no=${dto.emp_no}'" style="display: none;" class="btn btn-secondary">취소</button>
      </form>
    </div>
  </div>
</div>

<!-- 자바스크립트 -->
<script>
  // 수정
  function updateForm() {
    const emp_name = document.getElementById("emp_name");
    const emp_job = document.getElementById("emp_job");
    const emp_id = document.getElementById("emp_id");
    const emp_password = document.getElementById("emp_password");
    const emp_phone = document.getElementById("emp_phone");
    const emp_email = document.getElementById("emp_email");
    
    const idckBtn = document.getElementById("idckBtn");
    const editBtn = document.getElementById("editBtn");
    const saveBtn = document.getElementById("saveBtn");
    const deleteBtn = document.getElementById("deleteBtn");
    const backBtn = document.getElementById("backBtn");
    const cancelBtn = document.getElementById("cancelBtn");
    
    emp_name.removeAttribute("readonly");
    emp_job.removeAttribute("readonly");
    emp_id.removeAttribute("readonly");
    emp_password.removeAttribute("readonly");
    emp_phone.removeAttribute("readonly");
    emp_email.removeAttribute("readonly");
    
    idckBtn.style.display = "inline-block";
    editBtn.style.display = "none";
    saveBtn.style.display = "inline-block";
    deleteBtn.style.display = "none";
    backBtn.style.display = "none";
    cancelBtn.style.display = "inline-block";
  }
  
  const contextPath = "${contextPath}";
  
  // 아이디 중복체크
  document.getElementById("idckBtn").onclick = function() {
    const idInput = document.querySelector("#emp_id");
    const emp_id = idInput.value.trim();
    const idckBtn = document.getElementById("idckBtn");
    
    if(emp_id === "") {
      alert("아이디를 입력하세요");
      idInput.focus();
      return;
    }
    
    const url = contextPath + "/emp/idCheck?emp_id=" + encodeURIComponent(emp_id);
    
    fetch(url)
      .then(response => {
        if(!response.ok) throw new Error("서버오류");
        return response.json();
      })
      .then(data => {
        if(data.exists) {
          alert("이미 사용 중인 아이디입니다");
          idInput.focus();
        } else {
          alert("사용 가능한 아이디입니다");
          idckBtn.disabled = true; 
          idInput.readOnly = true;
        }
      })
      .catch(error => {
        console.error("중복체크 에러:"+error);
        alert("중복 체크 중 오류가 발생했습니다");
      });
  };
</script>

<%@ include file="../include/footer.jsp" %>

</body>
</html>
