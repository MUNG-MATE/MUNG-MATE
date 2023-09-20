package edu.kh.mung.board.model.service;

import java.util.List;

import edu.kh.mung.board.model.dto.Reply;

public interface ReplyService_p {

	/** 댓글 목록 조회
	 * @param boardNo
	 * @return
	 */
	List<Reply> select(int boardNo);

	/** 댓글 삽입
	 * @param reply
	 * @return
	 */
	int insert(Reply reply);

	/** 댓글 삭제
	 * @param replyNo
	 * @return
	 */
	int delete(int replyNo);

	/** 댓글 수정
	 * @param reply
	 * @return
	 */
	int put(Reply reply);

}
