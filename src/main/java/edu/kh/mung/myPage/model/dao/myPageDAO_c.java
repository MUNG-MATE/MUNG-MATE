package edu.kh.mung.myPage.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class myPageDAO_c {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
}
