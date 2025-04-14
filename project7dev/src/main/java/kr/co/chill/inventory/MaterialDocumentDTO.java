package kr.co.chill.inventory;

import java.util.Date;
import lombok.Data;

@Data
public class MaterialDocumentDTO {

    private Integer documentNo; // DB는 int 타입
    private String materialCode;
    private String materialDesc;
    private Integer quantity;
    private String plantCode;
    private String stockLocation;
    private Date documentDate; // DB는 datetime 타입
    private String documentType; // "IN" or "OUT"
    
}
