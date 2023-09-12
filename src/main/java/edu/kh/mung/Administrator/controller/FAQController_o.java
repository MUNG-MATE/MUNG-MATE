package edu.kh.mung.Administrator.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;

import edu.kh.mung.Administrator.model.dto.Administrator;
import edu.kh.mung.Administrator.model.service.FAQService;
import edu.kh.mung.member.model.dto.Member;
import oracle.jdbc.proxy.annotation.Post;

@Controller
public class FAQController_o {
	
	@Autowired
	private FAQService service;
	
	/** faq 페이지 조회
	 * @param boardCode
	 * @return
	 */
	@GetMapping( value = "/Administrator/faq/{boardCode:[0-9]+}")
	public String FAQ(@PathVariable(required = false) int boardCode
						, Model model
						, @RequestParam Map<String, Object> paramMap){
		
		if (paramMap.get("key") == null) { // 검색어가 없을 때

			// 게시글 목록 조회 서비스 호출
			Map<String, Object> map = service.selectFaqList(boardCode);

			model.addAttribute("map", map);
			System.out.println(map);

		} else { // 검색어가 있을 때

			paramMap.put("boardCode", boardCode);

			// Map<String, Object> map = service.selectFaqList(paramMap);
			
			//model.addAttribute("map", map);
		}
		
		
		return "/Administrator/faq";
	}
	
	/** faq 작성 페이지 이동
	 * @return
	 */
	@GetMapping("/Administrator/faqWrite")
	public String faqWrite() {
		return "/Administrator/faqWrite";
	}
	
	/** faq 등록
	 * @param boardCode
	 * @return
	 */
	@PostMapping("/Administrator/faqWrite")
	public String faqWrite(@RequestParam("boardCode") int boardCode
					, Administrator administrator
					, @SessionAttribute("loginMember") Member loginMember) {
		
		administrator.setMemberNo(loginMember.getMemberNo());
		administrator.setBoardCode(boardCode);
		int result = service.faqInsert(administrator);
		
		System.out.println(result);
		
		return "/Administrator/faqWrite";
	}
	
	
}
