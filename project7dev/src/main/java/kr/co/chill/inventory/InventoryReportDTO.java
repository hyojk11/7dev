package kr.co.chill.inventory;

import lombok.Data;

@Data
public class InventoryReportDTO {

    private String materialType;
    private String plantCode;
    private String stockLocation;
    private Integer openingStockQty;
    private Integer periodNetChangeQty; // 이 값은 요구사항의 '증감수량'과 계산 방식이 다를 수 있음 (순변동량)
    private Integer stockQty; // closing stock qty
    private Long openingStockAmount; // 금액은 클 수 있으므로 long 타입 권장
    private long inventoryAmount; // closing stock amount
    private long periodNetChangeAmount;
    
}
