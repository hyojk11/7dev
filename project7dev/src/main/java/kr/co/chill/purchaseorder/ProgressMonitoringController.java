package kr.co.chill.purchaseorder;

import java.io.IOException;
import java.time.LocalDate;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.VerticalAlignment;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
	@GetMapping(value="pro_monitoring/listExcel") //required=false로 하면 null값을 오류없이 받아올 수 있음. 검색전 엑셀눌렀을 때 오류방지
	public void listExcel(@RequestParam(required = false) String searchType
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
	

	
	
	//고객사보고 엑셀 다운로드
	@GetMapping(value="pro_monitoring/detailExcel")
	public void detailExcel(@RequestParam String purc_order_code
			, HttpServletResponse response) throws IOException {
		
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("purc_order_code", purc_order_code);
		
		ProgressMonitoringDTO dto = progressMonitoringService.detailOrderInfo(purc_order_code);
		List<ProgressMonitoringDTO> list = progressMonitoringService.detailSummaryList(purc_order_code);
		
		response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"); //엑셀 MINE타입
		response.setHeader("Content-Disposition", "attachment;filename=progress_Report.xlsx"); //파일명
		
		Workbook wb = new XSSFWorkbook();
		Sheet sheet = wb.createSheet("진척검수 현황 보고서");
		
		CellStyle headerStyle = wb.createCellStyle();
		Font headerFont = wb.createFont();
		headerFont.setBold(true);
		headerFont.setFontHeightInPoints((short) 11);
		headerFont.setFontName("맑은 고딕");
		headerStyle.setFont(headerFont);
		headerStyle.setAlignment(HorizontalAlignment.CENTER);
		headerStyle.setVerticalAlignment(VerticalAlignment.CENTER);
		headerStyle.setBorderTop(BorderStyle.THIN);
		headerStyle.setBorderBottom(BorderStyle.THIN);
		headerStyle.setBorderLeft(BorderStyle.THIN);
		headerStyle.setBorderRight(BorderStyle.THIN);
		headerStyle.setFillForegroundColor(IndexedColors.GREY_25_PERCENT.getIndex());
		headerStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);
		
		Row infoHeader = sheet.createRow(0);
		infoHeader.createCell(0).setCellValue("발주번호");
		infoHeader.createCell(1).setCellValue("발주일자");
		infoHeader.createCell(2).setCellValue("담당자");
		infoHeader.createCell(3).setCellValue("작성일");
		
		Row infoRow = sheet.createRow(1);
		infoRow.createCell(0).setCellValue(dto.getPurc_order_code());
		infoRow.createCell(1).setCellValue(dto.getPurc_order_reg_date());
		infoRow.createCell(2).setCellValue(dto.getEmp_name());
		infoRow.createCell(3).setCellValue(LocalDate.now().toString());
		
		
		Row dataHeader = sheet.createRow(3);
		dataHeader.createCell(0).setCellValue("자재코드");
		dataHeader.createCell(1).setCellValue("자재명");
		dataHeader.createCell(2).setCellValue("계약수량");
		dataHeader.createCell(3).setCellValue("납기일");
		dataHeader.createCell(4).setCellValue("누적 검수수량");
		dataHeader.createCell(5).setCellValue("진척률");
		dataHeader.createCell(6).setCellValue("평가등급");
		dataHeader.createCell(7).setCellValue("비고");
		
		int rowNum = 4;
		for(ProgressMonitoringDTO dataDto : list) {
			Row row = sheet.createRow(rowNum++);
			row.createCell(0).setCellValue(dataDto.getMaterial_code());
			row.createCell(1).setCellValue(dataDto.getMaterial_name());
			row.createCell(2).setCellValue(dataDto.getCont_material_cnt());
			row.createCell(3).setCellValue(dataDto.getMrp_due_date());
			row.createCell(4).setCellValue(dataDto.getTotal_material_cnt());
			row.createCell(5).setCellValue(dataDto.getTotal_progress_rate());
			row.createCell(6).setCellValue(dataDto.getProgress_eval());
			
		}
		
		rowNum += 2; // 여유 공간 한 줄
		Row gradeTitle = sheet.createRow(rowNum++);
		gradeTitle.createCell(0).setCellValue("※ 평가 기준");

		Row gradeHeader = sheet.createRow(rowNum++);
		gradeHeader.createCell(0).setCellValue("등급");
		gradeHeader.createCell(1).setCellValue("기준");
		gradeHeader.createCell(2).setCellValue("조치사항");

		Row r0 = sheet.createRow(rowNum++);
		r0.createCell(0).setCellValue("R0");
		r0.createCell(1).setCellValue("계획 이상");
		r0.createCell(2).setCellValue("출하 준비 가능");

		Row r1 = sheet.createRow(rowNum++);
		r1.createCell(0).setCellValue("R1");
		r1.createCell(1).setCellValue("계획 대비 ≤ 15% 미달");
		r1.createCell(2).setCellValue("만회계획 제출");

		Row r2 = sheet.createRow(rowNum++);
		r2.createCell(0).setCellValue("R2");
		r2.createCell(1).setCellValue("15~24% 미달");
		r2.createCell(2).setCellValue("업체 담당자 방문 및 대책");

		Row r3 = sheet.createRow(rowNum++);
		r3.createCell(0).setCellValue("R3");
		r3.createCell(1).setCellValue("≥ 25% 미달");
		r3.createCell(2).setCellValue("업체 대표 방문 및 대책");
		
		wb.write(response.getOutputStream());
		wb.close();
	}
	
	
	//검수삭제
	@PostMapping(value="pro_monitoring/delete")
	@ResponseBody
	public String delete(@RequestParam int progress_monitoring_no) {
		System.out.println("삭제 요청된 번호 : "+ progress_monitoring_no);
		try {
			progressMonitoringService.delete(progress_monitoring_no);
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "fail";
		}
	}
	
	
	
	
	
	
	
}
