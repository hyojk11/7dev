package kr.co.chill.inventory.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/inventory/")
public class InventoryViewController {
	

    // 메뉴에서 "A. 자재 재고 조회" 클릭 시 호출
    @GetMapping("/status")
    public String showStatusPage() {
        return "inventory/inventoryStatus"; // /WEB-INF/views/inventory/inventoryStatus.jsp 파일을 보여줌
    }

    // 메뉴에서 "B. 자재 문서 조회" 클릭 시 호출
    @GetMapping("/documents")
    public String showDocumentsPage() {
        return "inventory/materialDocuments"; // /WEB-INF/views/inventory/materialDocuments.jsp 파일을 보여줌
    }

    // 메뉴에서 "C. 재고 현황 보고서" 클릭 시 호출
    @GetMapping("/report")
    public String showReportPage() {
        return "inventory/inventoryReport"; // /WEB-INF/views/inventory/inventoryReport.jsp 파일을 보여줌
    }

}
