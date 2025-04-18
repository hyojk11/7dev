package kr.co.chill.employee;

import java.util.List;
import java.util.Map;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class EmployeeServiceImpl implements EmployeeService {

	@Autowired
	EmployeeDAO employeeDAO;
	
	@Override
	public List<EmployeeDTO> listSearchPaged(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return employeeDAO.listSearchPaged(map);
	}

	@Override
	public int listSearchCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return employeeDAO.listSearchCount(map);
	}

	@Override
	public List<EmployeeDTO> listSearch(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return employeeDAO.listSearch(map);
	}

	@Override
	public List<EmployeeDTO> list() {
		// TODO Auto-generated method stub
		return employeeDAO.list();
	}

	@Override
	public EmployeeDTO detail(int emp_no) {
		// TODO Auto-generated method stub
		return employeeDAO.detail(emp_no);
	}

	@Override
	public void register(EmployeeDTO dto) {
		// TODO Auto-generated method stub
		employeeDAO.register(dto);
	}

	@Override
	public boolean idCheck(String emp_id) {
		// TODO Auto-generated method stub
		return employeeDAO.idCheck(emp_id) > 0;
	}

	@Override
	public void update(EmployeeDTO dto) {
		// TODO Auto-generated method stub
		employeeDAO.update(dto);
	}

	@Override
	public void delete(int emp_no) {
		// TODO Auto-generated method stub
		employeeDAO.delete(emp_no);
	}

}
