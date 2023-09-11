package edu.kh.mung.board.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.mung.board.model.dto.Board;
import edu.kh.mung.board.model.dto.Pagination;

@Repository
public class ReviewBoardDAO_p {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public int getListCount(int boardCode) {
		return 0;
	}

	public List<Board> selectReviewList(Pagination pagination, int boardCode) {
		
		return null;
	}
}
