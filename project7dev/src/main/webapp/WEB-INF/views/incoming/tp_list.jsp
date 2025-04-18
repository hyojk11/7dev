<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<title>거래명세서 목록</title>
    <style>
        .sidebar {
            width: 200px;
            background-color: #2e7d32;
            color: white;
            min-height: 100vh;
            padding: 20px;
          }
    </style>
</head>
<body>
<div class="container-fluid">
    <div class="row">
    	<div class="col-2">
		</div>
		
		
	 <!-- 메인 영역 -->
	 <div class="col-10 p-4">
      <div class="d-flex justify-content-between align-items-center mb-2">
               <h5 class="fw-bold mb-0">거래명세서 발행</h5>
      </div>
      <br>
      
	 	<!-- 테이블 -->
     	<table class="table table-bordered text-center align-middle">
     		<thead class="table-light">
                    <tr>
                        <th>번호</th>
                        <th>계약서 코드</th>
                        <th>입고수량</th>
                        <th>등록일</th>
                        <th>담당자</th>
                        <th>상호명</th>
                        <th>부품명</th>
                        <th>상세보기</th>
                    </tr>
                </thead>
                <tbody>
                <c:forEach var="tp" items="${tp_list}">
                    <tr>
                        <td>${tp.trans_paper_no}</td>
                        <td>${tp.cont_code}</td>
                        <td>${tp.trans_paper_material_cnt}</td>
                        <td>${tp.trans_paper_reg_date}</td>
                        <td>${tp.emp_name}</td>
                        <td>${tp.sup_name}</td>
                        <td>${tp.material_name}</td>
                        <td>
                            <a href="<c:url value='/incoming/tp_detail?trans_paper_no=${tp.trans_paper_no}'/>" class="btn btn-secondary">보기</a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
 </div>
    
</body>
</html>
