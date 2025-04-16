package kr.co.chill.employee;

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

import kr.co.chill.productionPlanning.ProductionPlanningDTO;

@Controller
public class EmployeeController {
	
	@Autowired
	private EmployeeService employeeService;
	
	//사원 리스트 페이지 이동 + 페이징처리 + 검색처리
	@GetMapping(value="emp/list")
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
		
		int totalCount = employeeService.listSearchCount(map); //전체 데이터 수
		List<EmployeeDTO> list = employeeService.listSearchPaged(map); //페이징 리스트
		
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
		
		mav.setViewName("emp/list");
		
		return mav;
	}
	
	
	//사원 상세 페이지 이동
	@GetMapping(value="emp/detail")
	public ModelAndView detail(@RequestParam int emp_no) {
		
		EmployeeDTO dto = employeeService.detail(emp_no);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("dto", dto);
		mav.setViewName("emp/detail");
		
		return mav;
	}
	
	
	//사원리스트 엑셀 다운로드
	@GetMapping(value="emp/listExcel") //required=false로 하면 null값을 오류없이 받아올 수 있음. 검색전 엑셀눌렀을 때 오류방지
	public void listExcel(@RequestParam(required = false) String searchType
			,@RequestParam(required = false) String keyword
			,HttpServletResponse response) throws IOException {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchType", searchType);
		map.put("keyword", keyword);
		
		List<EmployeeDTO> list;
		if(searchType != null && keyword != null && !keyword.isEmpty()) {
			list = employeeService.listSearch(map);
		} else {
			list = employeeService.list();
		}
		
		response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"); //엑셀 MINE타입
		response.setHeader("Content-Disposition", "attachment;filename=employee_list.xlsx"); //파일명
		
		Workbook wb = new XSSFWorkbook();
		Sheet sheet = wb.createSheet("진척검수 목록");
		
		Row header = sheet.createRow(0);
		header.createCell(0).setCellValue("사원번호");
		header.createCell(1).setCellValue("사원명");
		header.createCell(2).setCellValue("직책");
		header.createCell(3).setCellValue("아이디");
		header.createCell(4).setCellValue("전화번호");
		header.createCell(5).setCellValue("이메일");
		
		int rowNum = 1;
		for(EmployeeDTO dto : list) {
			Row row = sheet.createRow(rowNum++);
			row.createCell(0).setCellValue(dto.getEmp_no());
			row.createCell(1).setCellValue(dto.getEmp_name());
			row.createCell(2).setCellValue(dto.getEmp_job());
			row.createCell(3).setCellValue(dto.getEmp_id());
			row.createCell(4).setCellValue(dto.getEmp_phone());
			row.createCell(5).setCellValue(dto.getEmp_email());
			
		}
		
		wb.write(response.getOutputStream());
		wb.close();
		
	}
	
	
	//사원등록처리
	@PostMapping(value="emp/register")
	public String register(EmployeeDTO dto) throws Exception {
		employeeService.register(dto);
		return "redirect:/emp/list";
	}
	
	//아이디 중복체크
	@GetMapping("emp/idCheck")
	@ResponseBody
	public Map<String, Boolean> idCheck(@RequestParam String emp_id) {
		Boolean result = employeeService.idCheck(emp_id);
		
		Map<String, Boolean> map = new HashMap<String, Boolean>();
		map.put("exists", result);
		return map;
	}
	
	
	//사원수정처리
	@PostMapping(value="emp/update")
	public String update(EmployeeDTO dto) throws Exception {
		employeeService.update(dto);
		return "redirect:/emp/detail?emp_no=" + dto.getEmp_no();
	}
	
	//사원삭제
	@GetMapping(value="emp/delete")
	public String delete(@RequestParam int emp_no) {
		employeeService.delete(emp_no);
		return "redirect:/emp/list";
	}
	
	
}
