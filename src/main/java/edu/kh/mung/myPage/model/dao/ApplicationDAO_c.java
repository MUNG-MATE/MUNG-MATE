package edu.kh.mung.myPage.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.mung.myPage.model.dto.Application;

@Repository
public class ApplicationDAO_c {

	@Autowired
	private SqlSessionTemplate sqlSession;
	/** 일반회원 -> 펫시터 신청하기
	 * @param app
	 * @return result
	 */
	public int insertApp(Application app) {
			
		return sqlSession.insert("appMapper_c.insertApp", app);
	}

}
