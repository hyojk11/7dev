package kr.co.chill.material;

import java.io.File;
import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class MaterialController {
	@Autowired
	private ServletContext servletContext;
	
	@Inject
	MaterialService materialService;
	
	//부품정보로 이동
	@GetMapping("material/material_main")
	public String materialMain(@RequestParam(value = "searchType", required = false)String searchType
			, @RequestParam(value = "searchValue", required = false)String searchValue
			, HttpSession session
			, HttpServletRequest request
			, Model model) throws Exception {
		List<MaterialDTO> materialList;
		
		if(searchType != null && searchValue != null && !searchValue.isEmpty()) {
			HashMap<String, Object> searchMap = new HashMap<String, Object>();
			searchMap.put("searchType", searchType);
			searchMap.put("searchValue", searchValue);
			materialList = materialService.searchMaterial(searchMap);
		} else {
			materialList = materialService.readMaterial();
		}
		model.addAttribute("materialList", materialList);
//		System.out.println("리턴값"+materialList);
		
		return "material/material_main";
	}
	
	
	//자재검색(자재코드)
	@GetMapping("material/searchMaterial")
	public String searchMaterial(@RequestParam(value = "searchValue", required = false)String searchValue
			, HttpSession session
			, HttpServletRequest request
			, Model model) throws Exception {
		List<MaterialDTO> materialList;
		
		if(searchValue != null && !searchValue.isEmpty()) {
			HashMap<String, Object> searchCode = new HashMap<String, Object>();
			searchCode.put("searchValue", searchValue);
			materialList = materialService.getMaterialByMaterialCode(searchCode);
		} else {
			materialList = materialService.readMaterial();
		}
		model.addAttribute("materialList", materialList);
		return "material/searchMaterial";
	}
	//자재추가
	@PostMapping("material/createMaterial")
	public String createMaterial(@ModelAttribute("material")MaterialDTO materialDTO
			, @RequestParam("file") MultipartFile file
			, HttpSession session
			, HttpServletRequest request) throws Exception {
	    if (!file.isEmpty()) {
	        String uploadDir = servletContext.getRealPath("/resources/file/");
	        
	        String fileName = file.getOriginalFilename();
	        File dest = new File(uploadDir + fileName);
	        file.transferTo(dest);
	        
	        materialDTO.setMaterialFile(fileName); 
	    }
//	    System.out.println(file.getOriginalFilename());
		materialService.createMaterial(materialDTO);
		
		return "redirect:/product/product_bom?productNo="+materialDTO.getProductNo();
	}
	
	
	
}
