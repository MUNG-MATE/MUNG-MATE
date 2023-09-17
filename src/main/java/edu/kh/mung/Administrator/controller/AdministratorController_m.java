package edu.kh.mung.Administrator.controller;

import java.util.Arrays;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import edu.kh.mung.Administrator.model.service.AdministratorService;
import edu.kh.mung.member.model.dto.Member;

@RequestMapping("/Administrator")
@Controller
public class AdministratorController_m {

	@Autowired 
	private AdministratorService service;

	@GetMapping("/management")
	public String management(@RequestParam(value="cp", required = false, defaultValue = "1") int cp , Model model,
			@RequestParam Map<String,Object> paramMap ) {

		if(paramMap.get("managementSearch") == null) {
			// 게시글 목록 조회 서비스 호출
			Map<String, Object> map = service.selectManagementList(cp);

			// 조회 결과를 request scope에 세팅 후 forward
			model.addAttribute("map",map);

		}else { // 검색어가 있을때 (검색O)

			Map<String,Object> map = service.selectManagementList(paramMap,cp);

			model.addAttribute("map",map);

		}

		return "Administrator/management";

	}


	@GetMapping("/petManagement")
	public String petManagement(Model model) {
		
		Map<String, Object> map = service.petManagement();
		
		model.addAttribute("map",map);
		
		return "Administrator/petManagement";
	}

	@GetMapping("/reserve")
	public String reserve(@RequestParam(value="cp", required = false, defaultValue = "1") int cp , Model model) {
		
		Map<String, Object> map = service.selectReserveList(cp);
		
		model.addAttribute(map);
		
		return "Administrator/reserve";
		
	}
	
	@GetMapping("/declaration")
	public String declaration() {

		return "Administrator/declaration";

	}

}
