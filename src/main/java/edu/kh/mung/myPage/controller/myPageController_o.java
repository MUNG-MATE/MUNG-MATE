package edu.kh.mung.myPage.controller;

import java.io.IOException;

import javax.mail.Session;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
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
	
	/** 회원 정보 수정 전 비밀번호 확인
	 * @param memberPw
	 * @param ra
	 * @param loginMember
	 * @param resp
	 * @param req
	 * @return
	 */
	@PostMapping("/pwCheck")
	public String pwCheck(String memberPw
						,RedirectAttributes ra
						, @SessionAttribute("loginMember") Member loginMember
						, HttpServletResponse resp
						, HttpServletRequest req) {
		
		int memberNo = loginMember.getMemberNo();
		
		int result = service.pwCheck(memberPw, memberNo);
		
		String message = null;
		String referer = req.getHeader("Referer");
		String path = "";
		
		if(result > 0) {
			path += "/myPage/memberInfoUpdate";
		}else{
			message = "비밀번호가 일치하지 않습니다.";
			path += "redirect:" + referer;
		}
		ra.addFlashAttribute("message", message);
		return path;
	}
	
	/** 회원 정보 수정
	 * @return
	 * @throws IOException 
	 * @throws IllegalStateException 
	 */
	@PostMapping("/memberInfoUpdate")
	public String memberInfoUpdate(@RequestParam("name") String memberName
								, @RequestParam("nickName") String memberNickname
								, @RequestParam("phone") String memberTel
								, @RequestParam("address") String[] memberAddress
								, @SessionAttribute("loginMember") Member loginMember
								, @RequestParam("profileImage")MultipartFile profileImage
								, HttpSession session
								, Member member
								, RedirectAttributes ra) throws IllegalStateException, IOException {
		
		String addr = String.join("^^^", memberAddress);
		member.setMemberAddress(addr);
		member.setMemberName(memberName);
		member.setMemberNickname(memberNickname);
		member.setMemberTel(memberTel);
		member.setMemberNo(loginMember.getMemberNo());
		
		String webPath = "/resources/images/member/";
		
		String filePath = session.getServletContext().getRealPath(webPath);
		
		// 회원 정보 수정
		int result = service.infoUpdate(member);
		
		System.out.println(result);
		
		// 회원 프로필 수정
		int result2 = service.profileUpdate(profileImage, webPath, filePath, loginMember);
		
		String message = null;
		String path = "";

		System.out.println("result2" + result2);
		
		if(result > 0) {
			loginMember.setMemberTel(member.getMemberTel());
			loginMember.setMemberNickname(member.getMemberNickname());
			loginMember.setMemberAddress(member.getMemberAddress());
			loginMember.setMemberName(member.getMemberName());
			
			message = loginMember.getMemberNickname() + "님의 정보가 수정 되었습니다.";
			path = "/myPage/memberInfo";
			
		}else {
			message = "정보 수정 실패";
			path = "/myPage/memberInfoUpdate";
			
		}
		ra.addFlashAttribute("message", message);
		
		return path;
	}
	
}
