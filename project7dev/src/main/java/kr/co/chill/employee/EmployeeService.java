package kr.co.chill.employee;

import java.util.List;
import java.util.Map;

public interface EmployeeService {
	
	//전체조회
	List<EmployeeDTO> listSearchPaged(Map<String, Object> map);
	int listSearchCount(Map<String, Object> map);
	
	//엑셀용 리스트조회
	List<EmployeeDTO> listSearch(Map<String, Object> map);
	List<EmployeeDTO> list();
	
	//상세조회
	EmployeeDTO detail(int emp_no);
	
	//등록
	void register(EmployeeDTO dto);
	//아이디 중복조회
	boolean idCheck(String emp_id);
	
	//수정
	void update(EmployeeDTO dto);
	
	//삭제
	void delete(int emp_no);

}
