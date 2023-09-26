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
import org.springframework.web.servlet.DispatcherServlet;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.kh.mung.Administrator.model.dto.Administrator;
import edu.kh.mung.Administrator.model.service.FAQService;
import edu.kh.mung.board.model.dto.Board;
import edu.kh.mung.common.utility.Util;
import edu.kh.mung.member.model.dto.Member;
import oracle.jdbc.proxy.annotation.Post;

@Controller
@RequestMapping("/Administrator")
public class FAQController_o {
	
	@Autowired
	private FAQService service;
	
	/** faq 페이지 조회
	 * @param boardCode
	 * @return
	 */
	
	// 포워딩이 있을대 == 도메인이 바뀔때
	/*
	 * faq select 
	 * faq를 불러오는 메소드 파리미터로 디폴트밸류 3 << 이거있음 -> 
	 * isFaq = service.selectFaqList(); 예약관련
	 * 값이 있으면? 화면 jsp에서 없으면 '게시글이 없다'	 
	 */
	
	/*
	 * 검색은 별개임 faq조회랑 분리가 되어야돼
	 * public String searchKeyword($RequestParam 검색인풋창 네임값 ){
	 * 	
	 * 		네임값에서 넘어온값으로 
	 * 		ex. var keyword = 결제 <-- 
	 * 		select faq관련컬럼 from 해당테이블 where 제목컬럼 like %keyword%  -> 
	 * }
	 */
	
	/*
	 * 페이징바 하고싶다면
	 * public String page(디폴트밸류임 cpage=1 ,boardCode) 
	 * 페이징처리 꼭 한번 해보길
	 * 실무에서 많이 쓰임 근데 다 가져온코드인데 쓸줄은 알아야함!!!
	 */
	
	/*
	 * if (boardType == '3') {
	 * 	  $sql = 'SELECT BOARD_NO,
				BOARD_TITLE, MEMBER_NO, BOARD_CONTENT, BOARD_CD
				FROM BOARD
				
				
		 pstmt = prepareStatement
		 
		 pstmt->execute
		 
		 		
		 		$var->query($sql);
	 *    $sql += 'where boardType == '3'';
	 * }
	 * 
	 * 
	 * 
	 * 
	 * 
	 */
	
	@GetMapping("/faq/{boardCode:[0-9]+}")
	public String FAQ(@PathVariable(required = false) int boardCode
						, Model model
						, @RequestParam Map<String, Object> paramMap
						){
		
		if (paramMap.get("faqCat") == null) { // 검색어가 없을 때

			// 게시글 목록 조회 서비스 호출
			Map<String, Object> map = service.selectFaqList(boardCode);

			model.addAttribute("map", map);

		} else { // 검색어가 있을 때
		System.out.println("검색어가 있을 때 컨트롤러");
			paramMap.put("boardCode", boardCode);

			 Map<String, Object> map = service.selectSearchList(paramMap);
			
			 System.out.println("검색어가 있을 때 map : " + map);
			model.addAttribute("map", map);
		}
		
		return "/Administrator/faq";
	}
	
	/** faq 작성 페이지 이동
	 * @return
	 */
	@GetMapping("/faqWrite")
	public String faqWrite() {
		return "/Administrator/faqWrite";
	}
	
	/** faq 등록
	 * @param boardCode
	 * @return
	 */
	@PostMapping("/faqWrite")
	public String faqWrite(@RequestParam("boardCode") int boardCode
					, Administrator administrator
					, @SessionAttribute("loginMember") Member loginMember
					, RedirectAttributes ra) {
		
		administrator.setMemberNo(loginMember.getMemberNo());
		administrator.setBoardCode(boardCode);
		int result = service.faqInsert(administrator);
		
		
		
		String path = "redirect:/";
		String message;
		
		if(result > 0) {
			message = "FAQ가 등록되었습니다.";
			path += "Administrator/faq/" + boardCode;
		}else {
			message = "FAQ 등록 실패";
			path += "Administrator/faqWrite";
		}
		
		ra.addFlashAttribute("message", message);
		
		return path;
	}

	/**faq 수정화면으로 이동
	 * @param administrator
	 * @param model
	 * @return
	 */
	@PostMapping("/faq/update")
	public String faqUpdate(Administrator administrator
							, Model model) {
		

		model.addAttribute("administrator", administrator);
		
		return "/Administrator/faqUpdate";
	}
	
	
	/** faq 수정
	 * @param administrator
	 * @param ra
	 * @return
	 */
	@PostMapping("/faq")
	public String faqUpdate2(Administrator administrator
							, RedirectAttributes ra) {
		
		int result = service.faqUpdate(administrator);
		int boardCode = administrator.getBoardCode();
		
		String path = "redirect:/";
		String message;
		
		if(result > 0) {
			message = "FAQ가 수정되었습니다.";
			path += "Administrator/faq/" + boardCode;
		}else {
			message = "FAQ 수정 실패";
			path += "Administrator/faqUpdate";
		}
		
		ra.addFlashAttribute("message", message);
		
		return path;
	}
	
	
	/** faq 삭제
	 * @param boardNo
	 * @return
	 */
	@PostMapping("/faqDelete")
	@ResponseBody
	public int faqDelete(@RequestBody String boardNo) {
		return service.faqDelete(boardNo);
	}
	
	
}
