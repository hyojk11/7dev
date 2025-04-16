package kr.co.chill.user;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MypageControllor {
	
	@Autowired
	private MypageService mypageService;
	
	
	//마이페이지 이동
	@GetMapping(value="mypage/empDetail")
	public ModelAndView empDetail(HttpSession session) {
		
		String user_id = (String) session.getAttribute("user_id");
		UserDTO dto = mypageService.detailEmp(user_id);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("dto", dto);
		mav.setViewName("mypage/empDetail");
		
		return mav;
	}
	
	//아이디 중복체크
	@GetMapping("mypage/empIdCheck")
	@ResponseBody
	public Map<String, Boolean> idCheck(@RequestParam String emp_id) {
		Boolean result = mypageService.idCheck(emp_id);
		
		Map<String, Boolean> map = new HashMap<String, Boolean>();
		map.put("exists", result);
		return map;
	}
	
	//개인정보 수정
	@PostMapping("mypage/empUpdate")
	public String empUpdate(UserDTO dto) {
		mypageService.updateEmp(dto);
		return "redirect:/mypage/empDetail";
	}
	
	
	
}
