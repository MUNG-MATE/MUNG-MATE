package edu.kh.mung.Administrator.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.mung.Administrator.model.dto.Administrator;

@Repository
public class FAQDAO_o {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	/** 게시글 수 조회
	 * @param boardCode
	 * @return
	 */
	public int getListCount(int boardCode) {
		return sqlSession.selectOne("AdministratorMapper_o.getListCount", boardCode);
	}

	/** 게시글 리스트 조회
	 * @param boardCode
	 * @return
	 */
	public List<Administrator> selectBoardList(int boardCode) {
		return sqlSession.selectList("AdministratorMapper_o.selectFaqList", boardCode);
	}

	public int faqInsert(Administrator administrator) {
		return sqlSession.insert("AdministratorMapper_o.faqInsert", administrator);
	}
	

}
