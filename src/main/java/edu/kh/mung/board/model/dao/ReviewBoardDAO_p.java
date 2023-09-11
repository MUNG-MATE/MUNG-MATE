package edu.kh.mung.board.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReviewBoardDAO_p {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public int getListCount(int boardCode) {
		return 0;
	}
}
