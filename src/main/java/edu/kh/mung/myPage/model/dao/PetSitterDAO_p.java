package edu.kh.mung.myPage.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.mung.myPage.model.dto.rList_p;

@Repository
public class PetSitterDAO_p {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	/** 예약목록조회
	 * @param rsNo
	 * @return
	 */
	public List<rList_p> select(Integer rsNo) {
		return sqlSession.selectList("petsitterMapper.selectRsList",rsNo);
	}

}
