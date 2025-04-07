package kr.co.chill.user;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class LoginController {

	@Autowired
	private LoginService loginService;
	
	//사원 메인페이지 이동
	@GetMapping(value="emp_main")
	public String emp_main() {
		return "emp_main";
	}
	
	//거래처 메인페이지 이동
	@GetMapping(value="sup_main")
	public String sup_main() {
		return "sup_main";
	}
	
	//관리자 메인페이지 이동
	@GetMapping(value="admin_main")
	public String admin_main() {
		return "admin_main";
	}
	
	
	//로그인 처리
	@PostMapping(value="login")
	public String login(HttpSession session
			, RedirectAttributes ra
			, @RequestParam Map<String, Object> map) {
		
		Map<String, Object> user = loginService.login(map);
		
		if(user == null) {
			ra.addFlashAttribute("resultMsg", "아이디나 비밀번호가 일치하지 않습니다. 관리자에게 문의해주세요.");
			return "redirect:/";
		} else {
			session.setAttribute("user_id", user.get("user_id"));
			session.setAttribute("user_name", user.get("user_name"));
			ra.addFlashAttribute("resultMsg", "성공적으로 로그인되었습니다.");
			
			String user_type = (String) user.get("user_type");

			switch(user_type) {
			case "EMP" :
				if("admin01".equals(user.get("user_id"))) {
					//앞에 "admin01".equals(...)처럼 리터럴을 먼저 쓰는 걸 추천. user.get("user_id")가 null일 경우 NullPointerException이 발생할 수 있기 때문
					return "redirect:/admin_main";
				}
				return "redirect:/emp_main";
			case "SUP" :
				return "redirect:/sup_main";
			}
			return "redirect:/";
		}
		
	}
	
	
	
	
	
	
	
}
