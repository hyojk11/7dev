package kr.co.chill.incoming;

import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.co.chill.HomeController;

@Controller
public class IncomingController {
	
	private static final Logger logger = LoggerFactory.getLogger(IncomingController.class);
	
	@Autowired
	private IncomingService inService;
	
	
	//자재창고에 있는 자재리스트확인
    @GetMapping(value="/material_storage")
    public ModelAndView material_storage(IncomingDTO incomingDTO
    		, HttpServletRequest request) throws UnsupportedEncodingException {
        ModelAndView mav = new ModelAndView(); 
        request.setCharacterEncoding("UTF-8");
    
       List<IncomingDTO> material_storage = inService.material_storage(incomingDTO);
       
       logger.info("리스트:" + material_storage);
       mav.addObject("mstorage_code", incomingDTO.getMstorage_code());
       mav.addObject("material_storage", material_storage);
       mav.setViewName("material_storage");
        return mav;
    }
    
    @GetMapping(value="/expected")
    public ModelAndView expected(IncomingDTO incomingDTO
    		, HttpServletRequest request) throws UnsupportedEncodingException {
    	ModelAndView mav = new ModelAndView();
    	request.setCharacterEncoding("UTF-8");
    	
    	List<IncomingDTO> expected = inService.expected(incomingDTO);
    	
    	logger.info("입고예정 자재리스트");
    	mav.addObject("expected", expected);
    	mav.setViewName("expected");
    	return mav;
    }
    
    //아래 @RequestParam(value="material_material_no")의 value는 expected.jsp에 창고에 등록하려는 자재들을 체크하는 name이 material_material_no이기 때문이다. 
    @PostMapping(value="/materialIn")
    public ModelAndView materialIn(@RequestParam("material_material_no") List<Integer> materialNoList
    		, IncomingDTO incomingDTO
    		, HttpServletRequest request) throws UnsupportedEncodingException {
    	ModelAndView mav = new ModelAndView();
    	request.setCharacterEncoding("UTF-8");
    	// String -> Integer 변환
    		
    	
    		
    	logger.info("체크된 자재번호 리스트:" + materialNoList);
    		
    	int result = inService.MaterialIn(materialNoList);
    	
    	
    	if(result>0) {
    		logger.info("넘어온 자재번호 List : " + incomingDTO.getMaterial_material_no());
    		logger.info("state값 변경: " + incomingDTO + incomingDTO.getState());
    		mav.setViewName("redirect:/expected");
    	}else {
    		logger.info("state 값 변경 실패..");
    		mav.setViewName("redirect:/expected");
    	}
    	return mav;
    }
    
}
