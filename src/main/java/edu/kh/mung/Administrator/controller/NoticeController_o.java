package edu.kh.mung.Administrator.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.kh.mung.Administrator.model.dto.Administrator;
import edu.kh.mung.Administrator.model.service.NoticeService_o;
import edu.kh.mung.member.model.dto.Member;

@Controller
@RequestMapping("/Administrator")
public class NoticeController_o {
	
	@Autowired
	private NoticeService_o service;
	
	/** 공지사항 목록 조회
	 * @param model
	 * @param boardCode
	 * @return
	 */
	@GetMapping("/notice/{boardCode}")
	public String noticeList(Model model
							, @PathVariable(required = false) int boardCode) {
		
		Map<String, Object> map = service.selectNoticeList(boardCode);
		

		model.addAttribute("map", map);
		
		return "/Administrator/notice";
	}
	
	
	/**공지사항 작성 페이지로 이동
	 * @return
	 */
	@GetMapping("/noticeWrite/{boardCode}")
	public String noticeWrite() {
		return "/Administrator/noticeWrite";
	}
	
	
	/** 공지사항 작성
	 * @param boardCode
	 * @param administrator
	 * @param loginMember
	 * @param ra
	 * @return
	 */
	@PostMapping("/noticeWrite/{boardCode}")
	public String noticeWrite(@PathVariable(required = false) int boardCode
							, Administrator administrator
							, @SessionAttribute("loginMember") Member loginMember
							, RedirectAttributes ra
							) {
		
		administrator.setMemberNo(loginMember.getMemberNo());
		administrator.setBoardCode(boardCode);
		int result = service.noticeInsert(administrator);
		
		System.out.println("성공");
		
		String path = "redirect:/";
		String message;
		
		if(result > 0) {
			message = "공지사항이 등록되었습니다.";
			path += "Administrator/notice/1";
		}else {
			message = "공지사항 등록 실패";
			path += "Administrator/noticeWrite";
		}
		
		ra.addFlashAttribute("message", message);
		
		return path;
		
	}
	
	/** 공지사항 수정화면으로 이동
	 * @param administrator
	 * @param model
	 * @return
	 */
	@PostMapping("/notice/update/{boardCode}")
	public String faqUpdate(Administrator administrator
							,@PathVariable(required = false) int boardCode
							, Model model) {
		
		administrator.setBoardCode(boardCode);
		System.out.println(boardCode);
		
		model.addAttribute("administrator", administrator);
		
		return "/Administrator/noticeUpdate"; 
	}
	
	
	/** 공지사항 수정
	 * @param administrator
	 * @param ra
	 * @return
	 */
	@PostMapping("/notice")
	public String noticeUpdate2(Administrator administrator
							, RedirectAttributes ra) {
		
		int result = service.noticeUpdate(administrator);
		int boardCode = administrator.getBoardCode();
		
		
		String path = "redirect:/";
		String message;
		
		if(result > 0) {
			message = "공지사항이 수정되었습니다.";
			path += "Administrator/notice/" + boardCode;
		}else {
			message = "공지사항 수정 실패";
			path += "Administrator/noticeUpdate";
		}
		
		ra.addFlashAttribute("message", message);
		
		return path;
	}
	
	
	/** 공지사항 삭제
	 * @param boardNo
	 * @return
	 */
	@PostMapping("/noticeDelete")
	@ResponseBody
	public int noticeDelete(@RequestBody String boardNo) {
		return service.noticeDelete(boardNo);
	}
	
	
	
	
	
	
	
	
	
	
}
