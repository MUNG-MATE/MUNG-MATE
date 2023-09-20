package edu.kh.mung.board.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.mung.board.model.dto.Reply;

@Repository
public class ReplyDAO_p {

	@Autowired
	private SqlSessionTemplate sqlSession;

	/** 댓글 목록 조회
	 * @param boardNo
	 * @return
	 */
	public List<Reply> select(int boardNo) {
		return sqlSession.selectList("reviewMapper.selectReplyList",boardNo);
	}

	/** 댓글 삽입
	 * @param reply
	 * @return
	 */
	public int insert(Reply reply) {
		return sqlSession.insert("replyMapper.insert", reply);
	}

	/** 댓글 삭제 
	 * @param replyNo
	 * @return
	 */
	public int delete(int replyNo) {
		return  sqlSession.update("replyMapper.delete", replyNo);
	}

	/** 댓글 수정
	 * @param reply
	 * @return
	 */
	public int put(Reply reply) {
		return sqlSession.update("replyMapper.put", reply);
	}
}
