package kr.co.chill.incoming;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class IncomingController {
	
	@Autowired
	private IncomingService inService;
	
	
	//자재창고에 있는 자재리스트확인
    @GetMapping(value="incoming/material_storage")
    public ModelAndView material_storage(IncomingDTO incomingDTO
    		, HttpServletRequest request) throws UnsupportedEncodingException {
        ModelAndView mav = new ModelAndView(); 
        request.setCharacterEncoding("UTF-8");
    
       List<IncomingDTO> material_storage = inService.material_storage(incomingDTO);
       
       mav.addObject("material_storage", material_storage);
       mav.setViewName("material_storage");
        return mav;
    }
}
