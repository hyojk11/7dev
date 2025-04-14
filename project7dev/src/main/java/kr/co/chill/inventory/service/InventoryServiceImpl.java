package kr.co.chill.inventory.service;

import java.time.LocalDate;
import java.time.YearMonth;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.chill.inventory.dto.InventoryParamDTO;
import kr.co.chill.inventory.dto.InventoryReportDTO;
import kr.co.chill.inventory.dto.InventoryStatusDTO;
import kr.co.chill.inventory.dto.MaterialDocumentDTO;
import kr.co.chill.inventory.mapper.InventoryMapper;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Service
public class InventoryServiceImpl implements InventoryService{

	private static final Logger logger = LoggerFactory.getLogger(InventoryServiceImpl.class);

	@Inject
	private InventoryMapper inventoryMapper;
	

	@Override
	public List<InventoryStatusDTO> getInventoryStatus(InventoryParamDTO params) {
		Map<String, Object> daoParams = new HashMap<>();

        // --- 날짜 계산 로직 (요구사항 반영) ---
        // queryMonthFrom 기준으로 snapshotDate, startDate, endDate 계산
        // 예시: queryMonthFrom이 "YYYY-MM" 형식이라고 가정
        try {
            YearMonth yearMonth = YearMonth.parse(params.getQueryMonthFrom(), DateTimeFormatter.ofPattern("yyyy-MM"));
            LocalDate firstDayOfMonth = yearMonth.atDay(1);
            LocalDate lastDayOfMonth = yearMonth.atEndOfMonth();

            // snapshotDate는 해당 월의 마지막 날짜로 가정 (요구사항에 따라 변경 가능)
            Date snapshotDate = Date.from(lastDayOfMonth.atStartOfDay(ZoneId.systemDefault()).toInstant());
            // startDate는 해당 월의 첫 날짜로 가정
            Date startDate = Date.from(firstDayOfMonth.atStartOfDay(ZoneId.systemDefault()).toInstant());
            // endDate는 해당 월의 마지막 날짜로 가정
            Date endDate = snapshotDate; // snapshotDate와 동일하게 설정하거나 lastDayOfMonth 사용

            daoParams.put("snapshotDate", snapshotDate);
            daoParams.put("startDate", startDate);
            daoParams.put("endDate", endDate);

        } catch (Exception e) {
            logger.error("날짜 변환 오류 (queryMonthFrom: {}): {}", params.getQueryMonthFrom(), e.getMessage());
            // 적절한 예외 처리 또는 기본값 설정 필요
            throw new RuntimeException("Invalid date format for queryMonthFrom", e);
        }
        // --- 날짜 계산 로직 끝 ---

        // 나머지 파라미터 복사
        copyParamToMap(params, daoParams);

        return inventoryMapper.selectInventoryStatus(daoParams);
    }

    @Override
    public List<MaterialDocumentDTO> getMaterialDocuments(InventoryParamDTO params) {
        Map<String, Object> daoParams = new HashMap<>();
        // 기간 파라미터는 Controller에서 Date 타입으로 받아서 그대로 사용
        if (params.getStartDate() == null || params.getEndDate() == null) {
             throw new IllegalArgumentException("startDate and endDate are required for material documents.");
        }
        daoParams.put("startDate", params.getStartDate());
        daoParams.put("endDate", params.getEndDate());

        // 나머지 필터 파라미터 복사
        copyParamToMap(params, daoParams);

        return inventoryMapper.selectMaterialDocuments(daoParams);
    }

    @Override
    public List<InventoryReportDTO> getInventoryReport(InventoryParamDTO params) {
         Map<String, Object> daoParams = new HashMap<>();

        // --- 날짜 계산 로직 (getInventoryStatus와 유사) ---
         try {
            YearMonth yearMonth = YearMonth.parse(params.getQueryMonthFrom(), DateTimeFormatter.ofPattern("yyyy-MM"));
            LocalDate firstDayOfMonth = yearMonth.atDay(1);
            LocalDate lastDayOfMonth = yearMonth.atEndOfMonth();

            Date snapshotDate = Date.from(lastDayOfMonth.atStartOfDay(ZoneId.systemDefault()).toInstant());
            Date startDate = Date.from(firstDayOfMonth.atStartOfDay(ZoneId.systemDefault()).toInstant());
            Date endDate = snapshotDate;

            daoParams.put("snapshotDate", snapshotDate);
            daoParams.put("startDate", startDate);
            daoParams.put("endDate", endDate);

        } catch (Exception e) {
            logger.error("날짜 변환 오류 (queryMonthFrom: {}): {}", params.getQueryMonthFrom(), e.getMessage());
            throw new RuntimeException("Invalid date format for queryMonthFrom", e);
        }
        // --- 날짜 계산 로직 끝 ---

        // 나머지 필터 파라미터 복사
        copyParamToMap(params, daoParams);

        return inventoryMapper.selectInventoryReport(daoParams);
    }

    // 파라미터 DTO -> Map 변환 헬퍼 메서드 (중복 제거)
    private void copyParamToMap(InventoryParamDTO params, Map<String, Object> map) {
        if (params.getMaterialCodeFrom() != null) map.put("materialCodeFrom", params.getMaterialCodeFrom());
        if (params.getMaterialCodeTo() != null) map.put("materialCodeTo", params.getMaterialCodeTo());
        if (params.getPlantCodeFrom() != null) map.put("plantCodeFrom", params.getPlantCodeFrom());
        if (params.getPlantCodeTo() != null) map.put("plantCodeTo", params.getPlantCodeTo());
        if (params.getStorageCodeFrom() != null) map.put("storageCodeFrom", params.getStorageCodeFrom());
        if (params.getStorageCodeTo() != null) map.put("storageCodeTo", params.getStorageCodeTo());
        if (params.getMaterialTypeFrom() != null) map.put("materialTypeFrom", params.getMaterialTypeFrom());
        if (params.getMaterialTypeTo() != null) map.put("materialTypeTo", params.getMaterialTypeTo());
        if (params.getMaterialCodeFrom() != null) map.put("materialCodeFrom", params.getMaterialCodeFrom());
 
        if (params.getQueryMonthFrom() != null) map.put("queryMonthFrom", params.getQueryMonthFrom());
        if (params.getQueryMonthTo() != null) map.put("queryMonthTo", params.getQueryMonthTo());
        // queryMonthFrom/To는 날짜 계산에 사용되었으므로 Map에 직접 넣지 않음 (매퍼에서 관련 조건 제거됨)
    }

}
