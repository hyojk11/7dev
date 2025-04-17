package kr.co.chill.purchaseorder;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class PurchaseorderController {
	
	@Autowired
	private PurchaseorderService purchaseorderService;
	
	//구매발주 리스트 페이지 이동 + 페이징처리 + 검색처리
	@GetMapping(value="purc_order/list")
	public ModelAndView list(@RequestParam(defaultValue = "1") int page
			,@RequestParam(defaultValue = "") String searchType
			,@RequestParam(defaultValue = "") String keyword) {
		
		int pageSize = 10; //한 페이지당 데이터 수
		int pageGroup = 5; //한 화면의 페이지 번호 그룹
		int startRow = (page - 1) * pageSize; //시작 데이터
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pageSize", pageSize);
		map.put("startRow", startRow);
		map.put("searchType", searchType);
		map.put("keyword", keyword);
		
		int totalCount = purchaseorderService.listSearchCount(map); //전체 데이터 수
		List<PurchaseorderDTO> list = purchaseorderService.listSearchPaged(map); //페이징 리스트
		
		int totalPage = (int) Math.ceil((double)totalCount / pageSize); //총 페이지
		
		int startPage = ((page - 1) / pageGroup) * pageGroup +1;
		int endPage = Math.min(startPage + pageGroup - 1, totalPage);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.addObject("page", page);
		mav.addObject("totalPage", totalPage);
		mav.addObject("startPage", startPage);
		mav.addObject("endPage", endPage);
		
		mav.addObject("searchType", searchType);
		mav.addObject("keyword", keyword);
		
		mav.setViewName("purc_order/list");
		
		return mav;
	}
	
	
	
	//구매발주서 상세보기 페이지 이동
	@GetMapping(value="purc_order/detail")
	public ModelAndView detail(@RequestParam("purc_order_code")String purc_order_code) {
		
		PurchaseorderDTO dto = purchaseorderService.detailOrderInfo(purc_order_code);
		List<PurchaseorderDTO> list = purchaseorderService.detailOrderList(purc_order_code);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("dto", dto);
		mav.addObject("list", list);
		mav.setViewName("purc_order/detail");
		
		return mav;
	}
	
	
	//발주리스트 엑셀 다운로드
	@GetMapping(value="purc_order/excel") //required=false로 하면 null값을 오류없이 받아올 수 있음. 검색전 엑셀눌렀을 때 오류방지
	public void excel(@RequestParam(required = false) String searchType
			,@RequestParam(required = false) String keyword
			,HttpServletResponse response) throws IOException {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchType", searchType);
		map.put("keyword", keyword);
		
		List<PurchaseorderDTO> list;
		if(searchType != null && keyword != null && !keyword.isEmpty()) {
			list = purchaseorderService.listSearch(map);
		} else {
			list = purchaseorderService.list();
		}
		
		response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"); //엑셀 MINE타입
		response.setHeader("Content-Disposition", "attachment;filename=purchaseorder_list.xlsx"); //파일명
		
		Workbook wb = new XSSFWorkbook();
		Sheet sheet = wb.createSheet("구매발주 목록");
		
		Row header = sheet.createRow(0);
		header.createCell(0).setCellValue("발주번호");
		header.createCell(1).setCellValue("발주일");
		header.createCell(2).setCellValue("거래처명");
		header.createCell(3).setCellValue("총 수량");
		header.createCell(4).setCellValue("총 금액");
		header.createCell(5).setCellValue("화폐단위");
		header.createCell(6).setCellValue("납기일");
		header.createCell(7).setCellValue("담당자");
		header.createCell(8).setCellValue("상태");
		
		int rowNum = 1;
		for(PurchaseorderDTO dto : list) {
			Row row = sheet.createRow(rowNum++);
			row.createCell(0).setCellValue(dto.getPurc_order_code());
			row.createCell(1).setCellValue(dto.getPurc_order_reg_date());
			row.createCell(2).setCellValue(dto.getSup_name());
			row.createCell(3).setCellValue(dto.getCont_material_cnt());
			row.createCell(4).setCellValue(dto.getTotal_price());
			row.createCell(5).setCellValue(dto.getMprice_currency());
			row.createCell(6).setCellValue(dto.getMrp_due_date());
			row.createCell(7).setCellValue(dto.getEmp_name());
			row.createCell(8).setCellValue(dto.getPurc_order_status() == 0 ? "마감 전" : "마감완료");
		}
		
		wb.write(response.getOutputStream());
		wb.close();
		
	}
	
	
	

}
