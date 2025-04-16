package kr.co.chill.productionPlanning;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ProductionPlaningController {
	
	@Autowired
	ProductionPlanningService productionPlanningService;
	
	private static final Logger logger = LoggerFactory.getLogger(ProductionPlaningController.class);
	
	//생산계획 리스트 페이지 이동 + 페이징처리 + 검색처리
	@GetMapping(value="prd_planning/list")
	public ModelAndView list(@RequestParam(defaultValue = "1") int page
			,@RequestParam(defaultValue = "") String searchType
			,@RequestParam(defaultValue = "") String keyword) throws Exception {
		
		int pageSize = 10; //한 페이지당 데이터 수
		int pageGroup = 5; //한 화면의 페이지 번호 그룹
		int startRow = (page - 1) * pageSize; //시작 데이터
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pageSize", pageSize);
		map.put("startRow", startRow);
		map.put("searchType", searchType);
		map.put("keyword", keyword);
		
		int totalCount = productionPlanningService.listSearchCount(map); //전체 데이터 수
		List<ProductionPlanningDTO> list = productionPlanningService.listSearchPaged(map); //페이징 리스트
		
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
		
		mav.setViewName("prd_planning/list");
		
		return mav;
	}
	
	
	//생산계획 상세 페이지 이동
	@GetMapping(value="prd_planning/detail")
	public ModelAndView detail(@RequestParam("prpl_no")int prpl_no) throws Exception {
		
		ProductionPlanningDTO dto = productionPlanningService.readProductionPlanningByPrplNo(prpl_no);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("dto", dto);
		mav.setViewName("prd_planning/detail");
		
		return mav;
	}
	
	
	//생산계획리스트 엑셀 다운로드
	@GetMapping(value="prd_planning/listExcel") //required=false로 하면 null값을 오류없이 받아올 수 있음. 검색전 엑셀눌렀을 때 오류방지
	public void listExcel(@RequestParam(required = false) String searchType
			,@RequestParam(required = false) String keyword
			,HttpServletResponse response) throws Exception {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchType", searchType);
		map.put("keyword", keyword);
		
		List<ProductionPlanningDTO> list;
		if(searchType != null && keyword != null && !keyword.isEmpty()) {
			list = productionPlanningService.listSearch(map);
		} else {
			list = productionPlanningService.readProductionPlanning();
		}
		
		response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"); //엑셀 MINE타입
		response.setHeader("Content-Disposition", "attachment;filename=production_planning_list.xlsx"); //파일명
		
		Workbook wb = new XSSFWorkbook();
		Sheet sheet = wb.createSheet("제품 생산계획");
		
		Row header = sheet.createRow(0);
		header.createCell(0).setCellValue("제품번호");
		header.createCell(1).setCellValue("제품명");
		header.createCell(2).setCellValue("생산공장");
		header.createCell(3).setCellValue("생산라인");
		header.createCell(4).setCellValue("생산납기일");
		header.createCell(5).setCellValue("담당자");
		
		int rowNum = 1;
		for(ProductionPlanningDTO dto : list) {
			Row row = sheet.createRow(rowNum++);
			row.createCell(0).setCellValue(dto.getProduct_code());
			row.createCell(1).setCellValue(dto.getProduct_name());
			row.createCell(2).setCellValue(dto.getPrpl_plant());
			row.createCell(3).setCellValue(dto.getPrpl_line());
			row.createCell(4).setCellValue(dto.getPrpl_due_date_only());
			row.createCell(5).setCellValue(dto.getEmp_name());
		}
		
		wb.write(response.getOutputStream());
		wb.close();
		
	}
	
	
	//생산계획 등록을 위한 제품리스트 페이지 이동
	@GetMapping(value="prd_planning/selectProduct")
	public String selectProduct() {
		return "prd_planning/selectProduct";
	}
	//제품검색처리
	@GetMapping(value="prd_planning/searchProduct")
	public ModelAndView searchProduct(@RequestParam Map<String, Object> map) throws Exception {
		System.out.println("map : " + map);
		List<ProductionPlanningDTO> list = productionPlanningService.searchProduct(map);
		System.out.println("list : " + list);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("prd_planning/selectProduct");
		return mav;
	}
	
	
	
	//등록페이지 이동
	@GetMapping(value="prd_planning/register")
	public ModelAndView register(
			@RequestParam String product_name
			, @RequestParam String product_code
			, @RequestParam int product_no) throws Exception {
		
		ProductionPlanningDTO dto = productionPlanningService.searchStock(product_no);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("product_no", product_no);
		mav.addObject("product_name", product_name);
		mav.addObject("product_code", product_code);
		mav.addObject("dto", dto);
		
		return mav;
	}
	
	//사원검색
	@GetMapping(value="prd_planning/getEmpInfo")
	public ResponseEntity<ProductionPlanningDTO> getEmpInfo(@RequestParam int emp_no) throws Exception {
		System.out.println("emp_no : " + emp_no);
		ProductionPlanningDTO dto = productionPlanningService.getEmployeeByEmpNo(emp_no);
		System.out.println("dto : " + dto);
		if (dto != null) {
			return ResponseEntity.ok(dto);
		} else {
			return ResponseEntity.notFound().build();
		}
	}

	//생산계획 등록
	@PostMapping(value="prd_planning/registerSend")
	public String registerSend(ProductionPlanningDTO dto) throws Exception {

		String code = productionPlanningService.codemaker(dto.getReg_date());
		dto.setPrpl_code(code);
		
		productionPlanningService.createProductionPlanning(dto);
		
		return "redirect:/prd_planning/list";
	}
	
	//생산계획 수정
	@PostMapping(value="prd_planning/updateSend")
	public String updateSend(ProductionPlanningDTO dto) throws Exception {
		productionPlanningService.updateProductionPlanning(dto);
		return "redirect:/prd_planning/detail?prpl_no=" + dto.getPrpl_no();
	}

	//생산계획 삭제
	@GetMapping(value="prd_planning/delete")
	public String delete(@RequestParam int prpl_no) throws Exception {
		productionPlanningService.deleteProductionPlanning(prpl_no);
		return "redirect:/prd_planning/list";
	}
	
}
