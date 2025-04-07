package kr.co.chill.productionPlanning;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class ProductionPlaningDAOImpl implements ProductionPlanningDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	
}
