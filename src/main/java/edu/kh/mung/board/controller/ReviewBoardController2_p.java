package edu.kh.mung.board.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.kh.mung.board.model.dto.Board;
import edu.kh.mung.board.model.service.ReviewBoardService2_p;
import edu.kh.mung.board.model.service.ReviewBoardService_p;

@Controller
@RequestMapping("/reviewBoard")
@SessionAttributes({ "loginMember" })
public class ReviewBoardController2_p {

	@Autowired
	private ReviewBoardService2_p service;
	@Autowired
	private ReviewBoardService_p boardService;
	
	// 게시글 작성 화면전환
	@GetMapping("/reviewBoardWrite")
	public String reviewWrite() {
		
		return "reviewBoard/reviewBoardWrite";
	}
	
	
	
	
	
	
	
	
	
	
	// 게시글 수정 화면전환
	@GetMapping("/reviewBoardList/{boardNo}/update")
	public String reviewUpdate(@PathVariable("boardNo") int boardNo
							,Model model) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("boardNo", boardNo);

		Board board = boardService.selectBoard(map);
		
		System.out.println(board);
			
		model.addAttribute("board",board);
		
		
		return "reviewBoard/reviewBoardUpdate";
	}
	
	// 게시글 수정 진짜수정
	@PostMapping("/reviewBoardList/{boardNo}/update")
	public String reviewUpdate( Board board
							, @PathVariable("boardNo") int boardNo
							, @RequestParam(value="cp", required=false, defaultValue="1") int cp
							, @RequestParam(value="deleteList", required=false) String deleteList 
							, @RequestParam(value="images", required=false) List<MultipartFile> images
							, HttpSession session
							, RedirectAttributes ra) throws IllegalStateException, IOException{
		
		board.setBoardNo(boardNo);
		
		String webPath = "/resources/images/";
		String filePath = session.getServletContext().getRealPath(webPath);
		
		int rowCount = service.reviewUpdate(board, images, webPath, filePath, deleteList);
		
		String message = null;
		String path ="redirect:";
		
		if(rowCount > 0) {
			message =" 게시글이 수정 되었습니다.";
			path +="/reviewBoard/reviewBoardList"+ "/" + boardNo + "?cp=" + cp; // 상세조회 페이지
		}else {
			message = "게시글 수정 실패";
			path += "update";
		}

		ra.addFlashAttribute("message", message);

		return path;
	}
	// 게시글 삭제
	@GetMapping("/reviewBoardList/{boardNo}/delete")
	public String boardDelete( Board board
				,@PathVariable("boardNo") int boardNo
				,RedirectAttributes ra
				,@RequestHeader("referer") String referer) {
		
		board.setBoardNo(boardNo);
		
		int result = service.boardDelete(board);
		
		
		String message = null;
		String path = "redirect:";
		
		if(result > 0) {
			message = "삭제 되었습니다";
			path += "/reviewBoard/reviewBoardList";
		}else {
			message = "삭제 실패";
			path += "/reviewBoard/reviewBoardList" + boardNo;
		}
		
		
		ra.addFlashAttribute("message",message);
		
		return path;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
