package edu.kh.mung.myPage.controller;

import javax.mail.Session;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.kh.mung.member.model.dto.Member;
import edu.kh.mung.myPage.model.service.myPageService_o;

@Controller
@RequestMapping("/myPage")
@SessionAttributes({"loginMember"})
public class myPageController_o {
	
	@Autowired
	private myPageService_o service;

	/** 마이페이지이동
	 * @return
	 */
	@GetMapping("/memberInfo")
	public String memberInfo() {
		return "/myPage/memberInfo";
	}
	
	
	/** 회원탈퇴페이지 이동
	 * @return
	 */
	@GetMapping("/memberSecession")
	public String memberSecession() {
		return "/myPage/memberSecession";
	}
	
	/** 회원 탈퇴
	 * @param loginMember
	 * @param memberPw
	 * @param status
	 * @param resp
	 * @param ra
	 * @return
	 */
	@PostMapping("/memberSecession")
	public String memberSecession(@SessionAttribute("loginMember")Member loginMember
								, String memberPw , SessionStatus status
								, HttpServletResponse resp
								, RedirectAttributes ra) {

		int memberNo = loginMember.getMemberNo();

		int result = service.memberSecession(memberNo, memberPw);

		String path = "redirect:";
		String message = null;

		if (result > 0) {
			message = "탈퇴 되었습니다.";
			path += "/";

			status.setComplete();

			Cookie cookie = new Cookie("saveId", "");
			cookie.setMaxAge(0);
			cookie.setPath("/");
			resp.addCookie(cookie);
			
			loginMember = null;
			
		} else {
			message = "탈퇴 실패.";
			path += "/myPage/memberSecession";

		}
		ra.addFlashAttribute("message", message);
		return path;
	}
	
	@PostMapping("/pwCheck")
	public String pwCheck(String memberPw
						,RedirectAttributes ra
						, @SessionAttribute("loginMember") Member loginMember
						, HttpServletResponse resp) {
		
		int memberNo = loginMember.getMemberNo();
		
		int result = service.pwCheck(memberPw, memberNo);
		
		String message = null;
		
		String path = "";
		
		if(result > 0) {
			path += "/myPage/memberInfoUpdate";
		}else{
			message = "비밀번호가 일치하지 않습니다.";
		}
		ra.addFlashAttribute("message", message);
		return path;
	}
	
}
