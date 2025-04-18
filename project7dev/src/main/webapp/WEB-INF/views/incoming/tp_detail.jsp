<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>거래명세서 상세</title>
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
               <h5 class="fw-bold mb-0">거래명세서</h5>
      </div>
      <br>
		
		<!-- 테이블 -->
    	<table class="table table-bordered text-center align-middle">
     		<thead class="table-light">
		        <tr>
			        <th>거래명세서 No.</th>
			        <th>등록일</th>
			        <th>거래처 사업자번호</th>
			        <th>거래처 상호명</th>
			        <th>거래처 대표자</th>
			        <th>거래처 주소</th>
			        <th>거래처 상세주소</th>
			        <th>사업자번호</th>
			        <th>상호명</th>
			        <th>대표자</th>
			        <th>주소</th>
			        <th>상세주소</th>
			        <th>담당자</th>
		        </tr>
                </thead>
                <tbody>
	        <tr>
		        <td>${transPaper.trans_paper_no}</td>
		        <td>${transPaper.trans_paper_reg_date}</td>
		        <td>${transPaper.sup_reg_no}</td>
			    <td>${transPaper.sup_name}</td>
		        <td>${transPaper.sup_ceo_name}</td>
				<td>${transPaper.sup_addr1}</td>
				<td>${transPaper.sup_addr2}</td>
		        <td>${transPaper.comp_reg_no}</td>
			    <td>${transPaper.comp_name}</td>
		        <td>${transPaper.comp_ceo_name}</td>
				<td>${transPaper.comp_addr1}</td>
				<td>${transPaper.comp_addr2}</td>
		        <td>${transPaper.emp_name}</td>
	        </tr>
	        </tbody>
	    </table>
	    
	    
        <!-- 거래내역 -->
        <table class="table table-bordered text-center align-middle">
     		<thead class="table-light">
		        <tr>
			        <th>No</th>
			        <th>부품명</th>
			        <th>부품코드</th>
			        <th>수 량</th>
			        <th>단위</th>
			        <th>계약단가</th>
			        <th>비 고</th>
			
				<tbody>
					<tr>					
						<td>${transPaper.material_no}</td>
						<td>${transPaper.material_name}</td>
						<td>${transPaper.material_code}</td>
						<td>${transPaper.cont_material_cnt}</td>
						<td>${transPaper.material_unit}</td>
						<td>${transPaper.cont_mprice} ${transPaper.mprice_currency}</td>
						<td></td>
					</tr>
				</tbody>
    		</table>
    
    	<br>
    <div>
    <a class="btn btn-box" href="tp_list">뒤로가기</a>
    <button class="btn btn-box" onclick="window.print()">출력하기</button>
    </div>
    
    </div>
   </div>
  </div>
	
    
</body>
</html>