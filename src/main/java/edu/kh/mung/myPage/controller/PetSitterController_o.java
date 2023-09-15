package edu.kh.mung.myPage.controller;

import java.lang.ProcessBuilder.Redirect;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.kh.mung.member.model.dto.Member;
import edu.kh.mung.myPage.model.dto.Application;
import edu.kh.mung.myPage.model.service.ApplicationService_o;

@Controller
@SessionAttributes({"loginMember"})
@RequestMapping("/petsitter")
public class PetSitterController_o {
	
	@Autowired
	private ApplicationService_o service;

	@GetMapping("/toGeneralApply")
	public String ToGeneralApply() {
		return "petsitter/toGeneralApply"; 
	}
	
	@PostMapping("/goToGeneral")
	public String goToGeneral(@RequestParam("reason") String appContent
							, @SessionAttribute("loginMember")Member loginMember
							, RedirectAttributes ra) {
	
		
		
		int memberNo = loginMember.getMemberNo();
		
		Application app = new Application();
		
		app.setMemberNo(memberNo);
		app.setAppContent(appContent);
		
		int result = service.goToGeneral(app);
		
		System.out.println(result);
		
		String message = "";
		String path;
		
		if(result > 0) {
			message = "일반회원 전환 신청이 완료되었습니다.(1~3일 소요)";
			path = "redirect:/";
		}else {
			message = "일반회원 전환 실패";
			path = "/petsitter/goToGeneral";
		}
		
		ra.addFlashAttribute("message", message);
		
		System.out.println(loginMember);
		return path;
	}
	
	@GetMapping("/admin/petsitterlist2")
	public String petsitterList(Model model) {

		List<Application> appList = service.selectAppList();

		model.addAttribute("appList", appList);
		

		return "Administrator/petsitterApp_goMember";
	}
	
	
	/**
	 * 펫시터에서 일반회원으로 전환
	 * 
	 * @param memberNo
	 * @return
	 */
	@PostMapping("/admin/petsitterDelete")
	@ResponseBody
	public int petsitterDelete(@RequestBody int memberNo) {

		int result = 0;

		// 펫시터 N으로 바꾸기
		result = service.petSitterDeleteN(memberNo);

		if (result > 0) {
			// 펫시터 테이블에서 삭제
			result = service.petsitterDelete(memberNo);
			
			if (result > 0) {
				// 신청 테이블에서 삭제
				result = service.appDelete(memberNo);
			}
		}

		return result;
	}
	
	
	
	
	
	
}
