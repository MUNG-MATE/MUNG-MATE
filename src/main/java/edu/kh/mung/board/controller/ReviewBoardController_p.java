package edu.kh.mung.board.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import edu.kh.mung.board.model.dto.Board;
import edu.kh.mung.board.model.service.ReviewBoardService_p;
import edu.kh.mung.member.model.dto.Member;

@Controller
@SessionAttributes("{loginMember}")
@RequestMapping("/reviewBoard")
public class ReviewBoardController_p {

	@Autowired
	private ReviewBoardService_p service;

	

	// 리뷰 게시글 목록 조회
	@GetMapping("/reviewBoardList")
	public String selectReviewList(
			@RequestParam(value="cp",required=false, defaultValue = "1") int cp
			, Model model
			, @RequestParam Map<String, Object> paramMap 
			){
		int boardCode = 6;
		
		if(paramMap.get("key") == null) { //검색어가 없을 때( 검색 x )

			// 게시글 목록 조회 서비스 호출
			Map<String, Object> map = service.selectReviewList(boardCode ,cp);

			// 조회 결과를 request scope에 세팅 후 forward
			model.addAttribute("map", map);
			
			System.out.println(map);

		}else { // 검색어가 있을 때( 검색 o )

			paramMap.put("boardCode", boardCode);

			Map<String, Object> map = service.selectReviewList(paramMap, cp);

			model.addAttribute("map",map);

		}
		
		
		return "reviewBoard/reviewBoardList";
	}
	
	//게시글 상세 조회
	@GetMapping("/reviewBoardList/{boardNo}")
	public String reviewDetail(@PathVariable("boardNo") int boardNo
					, Model model
					, @SessionAttribute(value="loginMember", required=false) Member loginMember
					, HttpServletRequest req
					, HttpServletResponse resp ){
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("boardNo", boardNo);
		
		//게시글 상세 조회 서비스 호출
		Board board = service.selectBoard(map);
		
		System.out.println(board);
		
		model.addAttribute("board",board);
		
		
		
		return "reviewBoard/reviewBoardDetail";
		
	}
	
	
	
}
