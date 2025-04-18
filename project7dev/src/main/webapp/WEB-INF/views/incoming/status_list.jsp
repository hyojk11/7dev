<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<html>
<head>
	<title>현황관리</title>
	<style>
        body { font-family: Arial; padding: 20px; }
        table { border-collapse: collapse; width: 100%; margin-top: 20px; }
        th, td { border: 1px solid #ccc; padding: 8px; text-align: center; }
        th { background-color: #f2f2f2; }
        .search-box input { margin-right: 10px; }
        .search-box { margin-bottom: 20px; }
        .summary { margin-top: 10px; font-weight: bold; }
        .btn { padding: 6px 12px; background-color: #007bff; color: white; border: none; border-radius: 4px; cursor: pointer; }
        .btn:hover { background-color: #0056b3; }
    </style>
    <style>
    .search-box {
        border: 1px solid #ccc;
        padding: 15px;
        border-radius: 6px;
        background-color: #f9f9f9;
        margin-bottom: 20px;
    }
    .form-group {
        display: flex;
        flex-wrap: wrap;
        gap: 15px;
        margin-bottom: 10px;

    }
    .form-group label {
        min-width: 200px;
    }
</style>
</head>
<body>

			<h3> 발주진행현황 </h3>
				
				<form action="${pageContext.request.contextPath}/incoming/status_list" method="get" class="search-box">
					<div class="form-group">
					    <label> 거래처 : 
						<input type="text" list="supplier" name="sup" value="${param.sup}">
						<datalist id="supplier">
							<option value="ooo잉크테크"></option>
							<option value="클립앤파트너스"></option>
							<option value="에이비사출산업"></option>
							<option value="흑연코리아"></option>
							<option value="나무마루"></option>
						</datalist>
						</label>
						<label>발주일 :
							<input type="date" name="purc_order_reg_date" value="${param.purc_order_reg_date}">
						</label>
					</div>
					<div class="form-group">
			            <label>부품번호:
			                <input type="text" name="material_code" value="${param.material_code}">
			            </label>
			            <label>부품명:
			                <input type="text" name="material_name" value="${param.material_name}">
			            </label>
			        </div>
			        <div class="form-group">
			            <label>발주번호:
			                <input type="text" name="purc_order_code" value="${param.purc_order_code}">
			            </label>
			            <button type="submit" class="btn">조회</button>
			        </div>
				</form>
			        
			    <div class="summary">
			    	입고품목 [ 총 <c:out value="${totalCount}"/> 건 ]
			    
			    </div>    
				 
			<table>
				<thead>
					<tr>				
						<th> No </th>
						<th> 진행상태 </th>
						<th> 거래처 </th>
						<th> 부품번호 </th>
						<th> 부품명 </th>
						<th> 발주번호 </th>
						<th> 입고번호 </th>
						<th> 발주일 </th>
						<th> 납품일 </th>
						<th> 입고일 </th>
						<th> 발주수량 </th>
						<th> 입고수량 </th>
					</tr>
				</thead>
				<tbody>
        <c:forEach var="ps" items="${status_list}" varStatus="status">
            <tr>
                <td>${status.index + 1}</td>
                <td>${ps.material_in_state}</td>
                <td>${ps.sup_name}</td>
                <td>${ps.material_code}</td>
                <td>${ps.material_name}</td>
                <td>${ps.purc_order_code}</td>
                <td>${ps.material_in_no}</td>
                <td>${ps.purc_order_reg_date}</td>
                <td>${ps.mrp_due_date}</td>
                <td>${ps.material_in_date}</td>
                <td>${ps.cont_material_cnt}</td>
                <td>${ps.material_in_cnt}</td>
            </tr>
		        </c:forEach>
		        <c:if test="${empty status_list}">
		            <tr><td colspan="12">조회 결과가 없습니다.</td></tr>
		        </c:if>
		    </tbody>
		</table>
	

<p>서버시간:${servertime}</p>
</body>
</html>
