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

	// 리뷰 게시글 목록 조회
	@GetMapping("/{boardCode:[0-9]+}")
	public String selectReviewList(@PathVariable("boardCode") int boardCode
	         , @RequestParam(value="cp",required=false,    defaultValue = "1") int cp
	         , Model model
	         , @RequestParam Map<String, Object> paramMap 
	         ){
		
		return "reviewBoard/reviewBoardList";
	}
}
