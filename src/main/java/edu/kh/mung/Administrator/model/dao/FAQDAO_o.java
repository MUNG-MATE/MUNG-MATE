package edu.kh.mung.Administrator.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.mung.Administrator.model.dto.Administrator;
import edu.kh.mung.Administrator.model.dto.PageInfo;

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
	public List<Administrator> selectBoardList(int boardCode, PageInfo pagination) {
		
		int offset = (pagination.getCurrentPage() - 1) * pagination.getPageLimit();

		RowBounds rowBounds = new RowBounds(offset, pagination.getPageLimit());
		
		return sqlSession.selectList("AdministratorMapper_o.selectFaqList", boardCode, rowBounds);
	}

	/** faq 글 등록
	 * @param administrator
	 * @return
	 */
	public int faqInsert(Administrator administrator) {
		return sqlSession.insert("AdministratorMapper_o.faqInsert", administrator);
	}

	/** faq 글 수정
	 * @param administrator
	 * @return
	 */
	public int faqUpdate(Administrator administrator) {
		return sqlSession.update("AdministratorMapper_o.faqUpdate", administrator);
	}

	/** faq 게시글 삭제
	 * @param boardNo
	 * @return
	 */
	public int faqDelete(String boardNo) {
		return sqlSession.delete("AdministratorMapper_o.faqDelete", boardNo);
	}

	/** faq 게시글 수 카운트 (검색 일 때)
	 * @param paramMap
	 * @return
	 */
	public int getListCount(Map<String, Object> paramMap) {
		return sqlSession.selectOne("AdministratorMapper_o.getListCount_search", paramMap);
	}

	
	/** faq 게시글 리스트 조회 (검색 일 때)
	 * @param paramMap
	 * @return
	 */
	public List<Administrator> selectSearchList(Map<String, Object> paramMap, PageInfo pagination) {
		
		int offset = (pagination.getCurrentPage() - 1) * pagination.getPageLimit();

		RowBounds rowBounds = new RowBounds(offset, pagination.getPageLimit());
		
		return sqlSession.selectList("AdministratorMapper_o.selectSearchList", paramMap, rowBounds);
	}
	

}
