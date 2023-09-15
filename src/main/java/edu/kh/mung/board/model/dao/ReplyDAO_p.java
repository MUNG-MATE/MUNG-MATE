package edu.kh.mung.board.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReplyDAO_p {

	@Autowired
	private SqlSessionTemplate sqlSession;
}
