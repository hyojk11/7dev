<!-- product_table.jsp -->
<table class="table table-bordered text-center align-middle" style="background-color: #DBFFE8; border-radius: 8px; box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);">
    <thead class="table-light">
    <tr>
        <th>품목코드</th>
        <th>품목명</th>
        <th>판매여부</th>
        <th>BOM</th>
    </tr>
    </thead>
    <tbody>
    <tr>
        <td><input type="text" class="form-control" value="BM30050kR000" style="border-radius: 4px; font-size: 0.85rem;"></td>
        <td><input type="text" class="form-control" value="삼색 볼펜" style="border-radius: 4px; font-size: 0.85rem;"></td>
        <td>
            <select class="form-select" style="font-size: 0.85rem; border-radius: 4px;">
                <option selected>판매예정</option>
                <option>판매중지</option>
            </select>
        </td>
        <td>
            <a href="${pageContext.request.contextPath}/bom">
                <button class="btn btn-success" style="font-size: 0.85rem; border-radius: 4px;">등록</button>
            </a>
        </td>
    </tr>
    <tr>
        <td><input type="text" class="form-control" value="P000HBOCN000" style="border-radius: 4px; font-size: 0.85rem;"></td>
        <td><input type="text" class="form-control" value="연필 HB" style="border-radius: 4px; font-size: 0.85rem;"></td>
        <td>
            <select class="form-select" style="font-size: 0.85rem; border-radius: 4px;">
                <option>판매예정</option>
                <option selected>판매중지</option>
            </select>
        </td>
        <td>
            <button class="btn btn-secondary" style="font-size: 0.85rem; border-radius: 4px;">보기</button>
        </td>
    </tr>
    </tbody>
</table>
