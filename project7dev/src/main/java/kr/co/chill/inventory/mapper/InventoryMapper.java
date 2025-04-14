package kr.co.chill.inventory.mapper;

import java.util.List;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper; // MyBatis-Spring 사용 시

import kr.co.chill.inventory.dto.InventoryReportDTO;
import kr.co.chill.inventory.dto.InventoryStatusDTO;
import kr.co.chill.inventory.dto.MaterialDocumentDTO;

@Mapper // MyBatis-Spring 연동 시 사용 (@Repository 대신)
public interface InventoryMapper {
	

    /**
     * 자재 재고 상태 조회
     * @param params {snapshotDate, startDate, endDate, materialCodeFrom, ...}
     * @return List<InventoryStatusDTO>
     */
    List<InventoryStatusDTO> selectInventoryStatus(Map<String, Object> params);

    /**
     * 자재 이동 문서 조회
     * @param params {startDate, endDate, materialCodeFrom, ...}
     * @return List<MaterialDocumentDTO>
     */
    List<MaterialDocumentDTO> selectMaterialDocuments(Map<String, Object> params);

    /**
     * 재고 현황 보고서 조회
     * @param params {snapshotDate, startDate, endDate, materialTypeFrom, ...}
     * @return List<InventoryReportDTO>
     */
    List<InventoryReportDTO> selectInventoryReport(Map<String, Object> params);
    
}
	


