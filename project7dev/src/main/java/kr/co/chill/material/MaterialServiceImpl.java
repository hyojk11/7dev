package kr.co.chill.material;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class MaterialServiceImpl implements MaterialService {
	
	@Inject
	MaterialDAO materialDAO;
	
}
