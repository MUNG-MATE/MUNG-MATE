package edu.kh.mung.board.model.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.mung.board.model.dto.Board;
import edu.kh.mung.board.model.dto.BoardImage;

@Repository
public class ReviewBoardDAO2_p {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	/** 게시글 수정
	 * @param board
	 * @return
	 */
	public int reviewUpdate(Board board) {
			
		return sqlSession.update("reviewMapper.reviewUpdate", board);
	}

	/* 이미지 삭제
	 * @param boardNo
	 * @return
	 */
	public int imageDelete(Map<String, Object> deleteMap) {
		
		return sqlSession.delete("reviewMapper.imageDelete", deleteMap);
	}

	/** 이미지 수정
	 * @param img
	 * @return
	 */
	public int imageUpdate(BoardImage img) {
		return sqlSession.update("reviewMapper.imageUpdate",img);
	}

	/** 이미지 삽입
	 * @param img
	 * @return
	 */
	public int imageInsert(BoardImage img) {
		return sqlSession.insert("reviewMapper.imageInsert", img);
	}

}
