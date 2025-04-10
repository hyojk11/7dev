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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ProgressMonitoringController {
	
	@Autowired
	private ProgressMonitoringService progressMonitoringService ;
	
	//진척검수 리스트 페이지 이동 + 페이징처리 + 검색처리
	@GetMapping(value="pro_monitoring/list")
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
		
		int totalCount = progressMonitoringService.listSearchCount(map); //전체 데이터 수
		List<ProgressMonitoringDTO> list = progressMonitoringService.listSearchPaged(map); //페이징 리스트
		
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
		
		mav.setViewName("pro_monitoring/list");
		
		return mav;
	}
	
	
	//진척검수 상세 페이지 이동
	@GetMapping(value="pro_monitoring/detail")
	public ModelAndView detail(@RequestParam("purc_order_code")String purc_order_code) {
		
		ProgressMonitoringDTO dto = progressMonitoringService.detailOrderInfo(purc_order_code);
		List<ProgressMonitoringDTO> summaryList = progressMonitoringService.detailSummaryList(purc_order_code);
		List<ProgressMonitoringDTO> progressList = progressMonitoringService.detailProgressList(purc_order_code);
		
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("dto", dto);
		mav.addObject("summaryList", summaryList);
		mav.addObject("progressList", progressList);
		mav.setViewName("pro_monitoring/detail");
		
		return mav;
	}
	
	
	//검수리스트 엑셀 다운로드
	@GetMapping(value="pro_monitoring/excel") //required=false로 하면 null값을 오류없이 받아올 수 있음. 검색전 엑셀눌렀을 때 오류방지
	public void excel(@RequestParam(required = false) String searchType
			,@RequestParam(required = false) String keyword
			,HttpServletResponse response) throws IOException {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchType", searchType);
		map.put("keyword", keyword);
		
		List<ProgressMonitoringDTO> list;
		if(searchType != null && keyword != null && !keyword.isEmpty()) {
			list = progressMonitoringService.listSearch(map);
		} else {
			list = progressMonitoringService.list();
		}
		
		response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"); //엑셀 MINE타입
		response.setHeader("Content-Disposition", "attachment;filename=progressMonitoring_list.xlsx"); //파일명
		
		Workbook wb = new XSSFWorkbook();
		Sheet sheet = wb.createSheet("진척검수 목록");
		
		Row header = sheet.createRow(0);
		header.createCell(0).setCellValue("발주번호");
		header.createCell(1).setCellValue("거래처명");
		header.createCell(2).setCellValue("발주일");
		header.createCell(3).setCellValue("다음 진척검수일");
		header.createCell(4).setCellValue("납기일");
		header.createCell(5).setCellValue("담당자");
		header.createCell(6).setCellValue("진척률(%)");
		
		int rowNum = 1;
		for(ProgressMonitoringDTO dto : list) {
			Row row = sheet.createRow(rowNum++);
			row.createCell(0).setCellValue(dto.getPurc_order_code());
			row.createCell(1).setCellValue(dto.getSup_name());
			row.createCell(2).setCellValue(dto.getPurc_order_reg_date());
			row.createCell(3).setCellValue(dto.getNext_progress_date());
			row.createCell(4).setCellValue(dto.getMrp_due_date());
			row.createCell(5).setCellValue(dto.getEmp_name());
			row.createCell(6).setCellValue(dto.getTotal_progress_rate());
			
		}
		
		wb.write(response.getOutputStream());
		wb.close();
		
	}
	
	
	//검수등록처리
	@PostMapping(value="pro_monitoring/register")
	public String register(
			@RequestParam String purc_order_code
			, @RequestParam int purc_order_no
			, @RequestParam int emp_no
			, @RequestParam int progress_monitoring_ver
			, @RequestParam String progress_monitoring_date
			, @RequestParam("material_nos") int[] materialNos
			, @RequestParam("material_cnts") int[] materialCnts
			, @RequestParam("progress_monitoring_etcs") String[] progressEtcs) {
		
		System.out.println("등록 po.no" + purc_order_no);
		
		for(int i = 0; i < materialNos.length; i++) {
			ProgressMonitoringDTO dto = new ProgressMonitoringDTO();
			dto.setPurc_order_code(purc_order_code);
			dto.setPurc_order_no(purc_order_no);
			dto.setEmp_no(emp_no);
			dto.setProgress_monitoring_ver(progress_monitoring_ver);
			dto.setProgress_monitoring_date(progress_monitoring_date);
			dto.setMaterial_no(materialNos[i]);
			dto.setMaterial_cnt(materialCnts[i]);
			dto.setProgress_monitoring_etc(progressEtcs[i]);

			String code = progressMonitoringService.codemaker(progress_monitoring_date);
			dto.setProgress_monitoring_code(code);
			
			progressMonitoringService.register(dto);
		}
		
		return "redirect:/pro_monitoring/detail?purc_order_code=" + purc_order_code;
	}
	

	
	
	
	
	
	
	
	
	
	
	
	
	
}
