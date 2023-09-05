package edu.kh.mung.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.kh.mung.member.model.dto.Member;
import edu.kh.mung.member.model.service.MemberService;


@Controller
@RequestMapping("/member")
@SessionAttributes("loginMember")
public class MemberController {

	@Autowired
	private MemberService service;

	@GetMapping("/login")
	public String login() {
		return "member/login";
	}
	
	
	
	
	
	
	
	
	
	
	@GetMapping("/signUp")
	public String signUp() {
		return "member/signUp";
	}
	
	// 회원가입 중 이메일 졍규식 검사
	@GetMapping("/dupCheck/email")
	@ResponseBody
	public int dupCheckEmail(String email) {
	
		return service.CheckEmail(email);
	}
	
	// 회원가입 중 닉네임 중복 검사
	@GetMapping("/dupCheck/nickname")
	@ResponseBody
	public int checkNickname(String nickname) {
		
		return service.checkNickname(nickname);
	}
	
	
	
	// 회원 가입
	@PostMapping("/signUp")
	public String signUp(Member newMember
						,String[] memberAddress
						,RedirectAttributes ra) {
		
		if(newMember.getMemberAddress().equals(",,")) {
			newMember.setMemberAddress(null); 
			
		}else { 
			String address = String.join("^^^", memberAddress);
			newMember.setMemberAddress(address);
		}
		
		int result = service.insertNewMember(newMember);
		
		String path = "redirect:";
		String message = null;
		
		if(result > 0 ) {
			
			path += "/";
			message = newMember.getMemberNickname() + "님의 가입을 환영합니다.";
			
		}else {
			
			path +="/member/signUp";
			message = "회원가입 실패 !!";	
			
		}
		
		ra.addFlashAttribute(message);
		
		return path;
	}
	
}
