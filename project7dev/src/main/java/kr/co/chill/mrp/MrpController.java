package kr.co.chill.mrp;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;

@Controller
public class MrpController {
	
	@Inject
	MrpService mrpService;
	
	
}
