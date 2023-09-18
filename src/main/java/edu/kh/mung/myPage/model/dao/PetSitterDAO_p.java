package edu.kh.mung.myPage.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.mung.myPage.model.dto.rList_p;

@Repository
public class PetSitterDAO_p {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<rList_p> select() {
		return sqlSession.selectList("petsitterMapper.selectRsList");
	}
	

}
