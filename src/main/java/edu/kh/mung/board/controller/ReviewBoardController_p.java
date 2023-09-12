package edu.kh.mung.board.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import edu.kh.mung.board.model.service.ReviewBoardService_p;

@Controller
@SessionAttributes("{loginMember}")
@RequestMapping("/reviewBoard")
public class ReviewBoardController_p {

	@Autowired
	private ReviewBoardService_p service;

	// 커뮤니티(리뷰게시판) 화면 띄우기
	@GetMapping("/reviewBoardList")
	public String reviewBoard() {
		
		System.out.println("test");
		
		return "reviewBoard/reviewBoardList";

		
	}


	// 리뷰 게시글 목록 조회
	/* @GetMapping("/reviewBoardList")
	public String selectReviewList(@PathVariable("boardCode") int boardCode
			, @RequestParam(value="cp",required=false,    defaultValue = "1") int cp
			, Model model
			, @RequestParam Map<String, Object> paramMap 
			){
		if(paramMap.get("key") == null) { //검색어가 없을 때( 검색 x )

			// 게시글 목록 조회 서비스 호출
			Map<String, Object> map = service.selectReviewList(boardCode,cp);

			// 조회 결과를 request scope에 세팅 후 forward
			model.addAttribute("map", map);

		}else { // 검색어가 있을 때( 검색 o )

			paramMap.put("boardCode", boardCode);

			Map<String, Object> map = service.selectReviewList(paramMap, cp);

			model.addAttribute("map",map);




		}
		return "reviewBoard/reviewBoardList";
	}
	 */
}
