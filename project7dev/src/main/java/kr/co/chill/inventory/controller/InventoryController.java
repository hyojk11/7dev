package kr.co.chill.inventory.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.co.chill.inventory.dto.InventoryParamDTO;
import kr.co.chill.inventory.dto.InventoryReportDTO;
import kr.co.chill.inventory.dto.InventoryStatusDTO;
import kr.co.chill.inventory.dto.MaterialDocumentDTO;
import kr.co.chill.inventory.service.InventoryService;

@RestController
@RequestMapping("/api/inventory/")
public class InventoryController {
	

    private static final Logger logger = LoggerFactory.getLogger(InventoryController.class);

    @Inject // 또는 @Autowired
    private InventoryService inventoryService;

    /**
     * 자재 재고 상태 조회 API
     * 예: /api/inventory/status?queryMonthFrom=2023-04&materialCodeFrom=...
     */
    @GetMapping("/status")
    public ResponseEntity<List<InventoryStatusDTO>> getInventoryStatus(@ModelAttribute InventoryParamDTO params) {
        // @ModelAttribute를 사용하면 DTO 필드 이름과 일치하는 요청 파라미터가 자동으로 바인딩됨
        logger.info("Requesting inventory status with params: {}", params);
        try {
            List<InventoryStatusDTO> result = inventoryService.getInventoryStatus(params);
            return ResponseEntity.ok(result); // 성공 시 200 OK 와 함께 결과 반환
        } catch (Exception e) {
            logger.error("Error fetching inventory status: {}", e.getMessage(), e);
            // 실제 서비스에서는 더 정교한 예외 처리 필요 (예: @ControllerAdvice)
            // return ResponseEntity.internalServerError().build(); // 실패 시 500 Internal Server Error
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }
    }

    /**
     * 자재 이동 문서 조회 API
     * 예: /api/inventory/documents?startDate=2023-04-01&endDate=2023-04-11&plantCodeFrom=...
     */
    @GetMapping("/documents")
    public ResponseEntity<List<MaterialDocumentDTO>> getMaterialDocuments(@ModelAttribute InventoryParamDTO params) {
         logger.info("Requesting material documents with params: {}", params);
         try {
            List<MaterialDocumentDTO> result = inventoryService.getMaterialDocuments(params);
            return ResponseEntity.ok(result);
        } catch (IllegalArgumentException e) {
             logger.warn("Bad request for material documents: {}", e.getMessage());
             return ResponseEntity.badRequest().build(); // 필수 파라미터 누락 등 잘못된 요청 시 400 Bad Request
         } catch (Exception e) {
            logger.error("Error fetching material documents: {}", e.getMessage(), e);
            //return ResponseEntity.internalServerError().build();
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }
    }

    /**
     * 재고 현황 보고서 조회 API
     * 예: /api/inventory/report?queryMonthFrom=2023-04&materialTypeFrom=...
     */
    @GetMapping("/report")
    public ResponseEntity<List<InventoryReportDTO>> getInventoryReport(@ModelAttribute InventoryParamDTO params) {
        logger.info("Requesting inventory report with params: {}", params);
         try {
            List<InventoryReportDTO> result = inventoryService.getInventoryReport(params);
            return ResponseEntity.ok(result);
        } catch (Exception e) {
            logger.error("Error fetching inventory report: {}", e.getMessage(), e);
            //return ResponseEntity.internalServerError().build();
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }
    }

}
