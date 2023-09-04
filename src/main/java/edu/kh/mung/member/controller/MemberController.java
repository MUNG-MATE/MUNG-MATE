package edu.kh.mung.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import edu.kh.mung.member.model.service.MemberService;


@Controller
@RequestMapping("/member")
@SessionAttributes("loginMember")
public class MemberController {

	@Autowired
	private MemberService service;

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
}
