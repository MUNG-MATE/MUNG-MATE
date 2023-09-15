package edu.kh.mung.board.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kh.mung.board.model.dao.ReplyDAO_p;
import edu.kh.mung.board.model.dto.Reply;
import edu.kh.mung.common.utility.Util;

@Service
public class ReplyServiceImpl_p implements ReplyService_p{

	@Autowired
	private ReplyDAO_p dao;

	// 댓글 목록 조회
	@Override
	public List<Reply> select(int boardNo) {
		return dao.select(boardNo);
	}

	// 댓글 삽입
	@Override
	public int insert(Reply reply) {

		// XSS 방지 처리
		reply.setReplyContent(Util.XSSHandling(reply.getReplyContent()));

		return dao.insert(reply);
	}

	// 댓글 삭제
	@Override
	public int delete(int replyNo) {
		return dao.delete(replyNo);
	}

	// 댓글 수정
	@Override
	public int put(Reply reply) {
		// XSS 방지 처리
		reply.setReplyContent(Util.XSSHandling(reply.getReplyContent()));
		return dao.put(reply);
	}
}
