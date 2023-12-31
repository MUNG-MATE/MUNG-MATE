package edu.kh.mung.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import edu.kh.mung.board.model.dto.Reply;
import edu.kh.mung.board.model.service.ReplyService_p;

@RestController
public class ReplyController_p {

	@Autowired
	private ReplyService_p service;

	// 댓글 목록 조회
	@GetMapping(value="/reply", produces="application/json; charset=UTF-8")
	public List<Reply> select(/*@RequestParam("boardNo")*/ int boardNo) {

		return service.select(boardNo);
	}

	// 댓글 삽입
	@PostMapping("/reply")
	public int insert(@RequestBody Reply reply) {

		return service.insert(reply);
	}

	// 댓글 삭제
	@DeleteMapping("/reply")
	public int delete(@RequestBody int replyNo ) {
		// ajax 요청 시 body에 담겨있는 하나 밖에 없는 데이터는
		// 매개변수 int commentNo에 담기게 된다

		return service.delete(replyNo);

	}

	// 댓글 수정
	@PutMapping("/reply")
	public int put(@RequestBody Reply reply) {

		return service.put(reply);
	}
}
