<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page session="true" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="ko">
<%@ include file="../include/header.jsp" %>

<body>
<div class="container-fluid">
    <div class="row">
        <div class="col-12 main p-4">
            <h3 class="fw-bold mb-4">자재 리스트</h3>

            <table class="table table-bordered text-center align-middle table-light">
                <thead>
                    <tr>
                        <th style="background-color: #EDFFF4;">자재명</th>
                        <th style="background-color: #EDFFF4;">자재코드</th>
                        <th style="background-color: #EDFFF4;">선택</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="material" items="${materialList}">
                        <tr>
                            <td style="background-color: #FFFFFF;">${material.materialName}</td>
                            <td style="background-color: #FFFFFF;">${material.materialCode}</td>
                            <td style="background-color: #FFFFFF;">
                                <button type="button" class="btn btn-success select-btn"
                                    data-name="${fn:escapeXml(material.materialName)}"
                                    data-code="${fn:escapeXml(material.materialCode)}"
                                    data-no="${material.materialNo}">
                                    선택
                                </button>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>

<script>
document.addEventListener("DOMContentLoaded", function () {
	const buttons = document.querySelectorAll(".select-btn");
	buttons.forEach(button => {
		button.addEventListener("click", function () {
			const name = this.dataset.name;
			const code = this.dataset.code;
			const materialNo = this.dataset.no;

			// 부모창 함수 호출
			window.opener.addMaterialToParent(name, code, materialNo);
			//window.close();
		});
	});
});
</script>

</body>
</html>
