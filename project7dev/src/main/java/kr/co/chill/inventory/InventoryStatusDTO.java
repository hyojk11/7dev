package kr.co.chill.inventory;

import lombok.Data; // Lombok 사용 (Getter, Setter, toString 등 자동 생성)

@Data
public class InventoryStatusDTO {

    private String materialCode;
    private String materialDesc;
    private String plantCode;
    private String stockLocation;
    private int openingStock;
    private int periodNetChange;
    private Integer stockQty; // closing stock

}
