package edu.kh.mung.Administrator.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.mung.Administrator.model.dto.Administrator;

@Repository
public class NoticeDAO_o {

	@Autowired
	private SqlSessionTemplate sqlSession;

	/** 공지사항 리스트 카운트
	 * @param boardCode
	 * @return
	 */
	public int getListCount(int boardCode) {
		return sqlSession.selectOne("AdministratorMapper_o.getListCount", boardCode);
	}

	public List<Administrator> selectBoardList(int boardCode) {
		return sqlSession.selectList("AdministratorMapper_o.selectFaqList", boardCode);
	}
	
}
