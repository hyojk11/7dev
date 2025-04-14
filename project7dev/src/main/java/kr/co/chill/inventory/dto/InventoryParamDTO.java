package kr.co.chill.inventory.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class InventoryParamDTO {
	
    // 공통 기간 (자재문서용, 또는 서비스에서 계산 후 사용)
    @DateTimeFormat(pattern = "yyyy-MM-dd") // Controller에서 받을 때 형식 지정
    private Date startDate;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date endDate;

    // 월별 조회용 (상태/보고서용 - 서비스에서 startDate/endDate/snapshotDate 계산)
    private String queryMonthFrom; // YYYY-MM 형식 가정
    private String queryMonthTo;   // YYYY-MM 형식 가정

    // 공통 필터
    private String materialCodeFrom;
    private String materialCodeTo;
    private String plantCodeFrom;
    private String plantCodeTo;
    private String storageCodeFrom;
    private String storageCodeTo;

    // 보고서용 필터
    private String materialTypeFrom;
    private String materialTypeTo;

    // 내부 계산용 (Service -> DAO 전달 시 Map에 담길 값)
    // private Date snapshotDate; // Map에 담아 전달

	
}
