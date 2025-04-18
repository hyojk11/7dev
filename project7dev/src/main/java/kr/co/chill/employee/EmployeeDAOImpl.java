package kr.co.chill.employee;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class EmployeeDAOImpl implements EmployeeDAO {

	@Autowired
	SqlSession sqlSession;

	@Override
	public List<EmployeeDTO> listSearchPaged(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("kr.co.chill.employeeMapper.listSearchPaged", map);
	}

	@Override
	public int listSearchCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("kr.co.chill.employeeMapper.listSearchCount", map);
	}

	@Override
	public List<EmployeeDTO> listSearch(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("kr.co.chill.employeeMapper.listSearch", map);
	}

	@Override
	public List<EmployeeDTO> list() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("kr.co.chill.employeeMapper.list");
	}

	@Override
	public EmployeeDTO detail(int emp_no) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("kr.co.chill.employeeMapper.detail", emp_no);
	}

	@Override
	public void register(EmployeeDTO dto) {
		// TODO Auto-generated method stub
		sqlSession.insert("kr.co.chill.employeeMapper.register", dto);
	}

	@Override
	public int idCheck(String emp_id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("kr.co.chill.employeeMapper.idCheck", emp_id);
	}

	@Override
	public void update(EmployeeDTO dto) {
		// TODO Auto-generated method stub
		sqlSession.update("kr.co.chill.employeeMapper.update", dto);
	}

	@Override
	public void delete(int emp_no) {
		// TODO Auto-generated method stub
		sqlSession.delete("kr.co.chill.employeeMapper.delete", emp_no);
	}
	
	
	
}
