package kr.co.chill.incoming;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class IncomingDAOImpl implements IncomingDAO{

	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<IncomingDTO> material_storage() {
		// TODO Auto-generated method stub
		return null;
	}
	
	
}
