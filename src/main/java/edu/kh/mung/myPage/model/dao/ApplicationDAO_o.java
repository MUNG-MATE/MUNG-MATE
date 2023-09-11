package edu.kh.mung.myPage.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;

import edu.kh.mung.myPage.model.dto.Application;

@Repository
public class ApplicationDAO_o {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	/** 펫시터에서 일반회원으로 전환
	 * @param appContent
	 * @param memberNo
	 * @return
	 */
	public int goToGeneral(Application app) {
		
		
		return sqlSession.insert("appMapper_o.goToGeneral",app);
	}

}
