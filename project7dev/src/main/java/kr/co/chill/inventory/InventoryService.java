package kr.co.chill.inventory;

import java.util.List;
import kr.co.chill.inventory.InventoryParamDTO; // 파라미터 DTO 사용
import kr.co.chill.inventory.InventoryReportDTO;
import kr.co.chill.inventory.InventoryStatusDTO;
import kr.co.chill.inventory.MaterialDocumentDTO;

	public interface InventoryService {
		

	    /**
	     * 자재 재고 상태 조회 (월 기준)
	     * @param params 필터 조건 및 조회 월(queryMonthFrom/To) 포함
	     * @return List<InventoryStatusDTO>
	     */
	    List<InventoryStatusDTO> getInventoryStatus(InventoryParamDTO params);

	    /**
	     * 자재 이동 문서 조회 (일자 기준)
	     * @param params 필터 조건 및 조회 기간(startDate/endDate) 포함
	     * @return List<MaterialDocumentDTO>
	     */
	    List<MaterialDocumentDTO> getMaterialDocuments(InventoryParamDTO params);

	    /**
	     * 재고 현황 보고서 조회 (월 기준)
	     * @param params 필터 조건 및 조회 월(queryMonthFrom/To) 포함
	     * @return List<InventoryReportDTO>
	     */
	    List<InventoryReportDTO> getInventoryReport(InventoryParamDTO params);
	}
		

