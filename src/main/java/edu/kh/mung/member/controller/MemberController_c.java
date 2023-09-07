package edu.kh.mung.member.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.serviceloader.ServiceListFactoryBean;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.kh.mung.member.model.dto.Member;
import edu.kh.mung.member.model.service.MemberService_c;


@Controller
@RequestMapping("/member")
@SessionAttributes("loginMember")
public class MemberController_c {

	@Autowired
	private MemberService_c service;
	
	// 회원가입 화면 출력
	@GetMapping("/signUp")
	public String signUp() {
		return "member/signUp";
	}
	
	// 회원가입 중 이메일 정규식 검사
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
			
			path += "/member/login";
			message = newMember.getMemberNickname() + "님의 가입을 환영합니다.";
			
		}else {
			
			path +="/member/signUp";
			message = "회원가입 실패 !!";	
			
		}
		
		ra.addFlashAttribute("message", message);
		
		return path;
	}
	
	
	// 로그인 화면 출력
	@GetMapping("/login")
	public String login() {
		return "member/login";
	}
	
	// 로그인 기능 구현
	@PostMapping("/login")
	public String login(Member inputMember, Model model
						,@RequestHeader(value="referer") String referer
						,@RequestParam(value="saveId", required=false) String saveId
						,HttpServletResponse resp
						,RedirectAttributes ra) {

		Member loginMember = service.login(inputMember);
		
		String path = "redirect:";
		
		if(loginMember != null) {
			path += "/";

			model.addAttribute("loginMember",loginMember);

			Cookie cookie = new Cookie("saveId", loginMember.getMemberEmail());
			
			if(saveId != null) {
		
				cookie.setMaxAge(60 * 60 * 24 * 30);
				
			}else {

				cookie.setMaxAge(0);
			}
			
			cookie.setPath("/");
			
			resp.addCookie(cookie);
			
		}else {
			path += referer;
		
			ra.addFlashAttribute("message","아이디 또는 비밀번호가 일치하지 않습니다.");
		}
		
			ra.addFlashAttribute("message", loginMember.getMemberNickname() + "님 환영합니다.");
		return path;
		
	}
	
	
	// 이메일 찾기 비동기 통신(ajax)
	@PostMapping(value="findEmail", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String findEmail(@RequestBody Map<String, Object> paramMap) {
		
		String result = service.findEmail(paramMap);
			
		return result;
	}
	
	// 비밀번호 변경 화면 출력
	@PostMapping("/findPw")
	public String findPw(String memberEmail
			   			,Model model) {
		
		model.addAttribute("memberEmail", memberEmail);
		
		return "member/changePw";
	}
	
	// 로그아웃 
	@GetMapping("/logout")
	public String logout(SessionStatus status) {
		
		status.setComplete();
		return "redirect:/";
	}
	
	@PostMapping("/changePw")
	public String changePw(String newPw
						  ,String newPwCheck
						  ,String email
						  ,Model model
						  ,RedirectAttributes ra) {
		

		int result = service.changePw(newPw,email);
		
		String path = "redirect:";
		String message = null;
		
		if(result > 0) {
			path += "/member/login";
			message = "비밀번호 변경 성공 !! 로그인 화면으로 이동합니다.";
		}else {
			path += "/member/changePw";
			message = "비밀번호 변경 실패 ㅜㅜ";
			model.addAttribute("memberEmail", email);
			ra.addFlashAttribute("memberEmail", model);
		}
		
		ra.addFlashAttribute("message", message);
		
		
		return path;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
