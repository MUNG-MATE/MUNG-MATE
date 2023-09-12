package edu.kh.mung.myPage.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.kh.mung.member.model.dto.Member;
import edu.kh.mung.myPage.model.dto.Application;
import edu.kh.mung.myPage.model.service.ApplicationService_c;

@Controller
@SessionAttributes({"loginMember"})
@RequestMapping("/petsitter")
public class PetSitterController_c {
	
	@Autowired
	private ApplicationService_c service;
	
	@GetMapping("/toPetsitterApply")
	public String ToPetsitterApply() {
		
		return "petsitter/toPetsitterApply";
	}
	
	@PostMapping("/goToPetsitter")
	public String goToPetsitter(String sido1 	// 시도
							   ,String gugun1 	// 구군
							   ,String exper	// 반려경험
							   ,String motive	// 지원동기
							   ,RedirectAttributes ra
							   ,@SessionAttribute("loginMember") Member loginMember
							   ) {
		
		Application app = new Application();
		
		app.setMemberNo(loginMember.getMemberNo());
		app.setAppLocation(sido1 + " " + gugun1);
		app.setAppEx(exper);
		app.setAppContent(motive);
		
		
		int result = service.insertApp(app);
		
		String path = "redirect:";
		String message = "";
		
		if(result > 0) {
			message = "펫시터 신청 완료 !! \n ( 관리자의 승인은 1~3일 이내에 완료처리 됩니다. )";
			path += "/";
			
		}else {
			message = "펫시터 신청에 실패하셨습니다.";
			path += "/petsitter/toPetsitterApply";
		}
		ra.addFlashAttribute("message", message);
		
		return path;
	}
	
	@GetMapping("/admin/petsitterlist1")
	public String petsitterList(Model model) {
		
		List<Application> appList = service.selectAppList();
		
		
		model.addAttribute("appList", appList);
		
		return "Administrator/petsitterApp_goPetSitter";
	}
	
	
	@PostMapping(value="/admin/petsitterInsert", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public int insertPetsitter(@RequestBody Map<String, Object> map
							  ,@SessionAttribute("loginMember") Member loginMember
							  ) {
		map.put("memberNo", loginMember.getMemberNo());
		
		// 1. 일단 펫시터테이블에 insert
		int result = service.insertPetsitter(map);
		
		if(result > 0) {
			// 2. insert 성공 후 member에 펫시터 여부를 Y로 바꾸기
			result = service.updateMember(map);
			
			if(result > 0) {
				// 3. member에서 펫시터 여부 Y로 바꾼 후엔 신청 테이블에서 delete 하기 
				result = service.deleteApp(map);
			}
		}
		
		return result;
	}
	
	
	
}
