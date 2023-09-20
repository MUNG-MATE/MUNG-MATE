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

	/** 공지사항 리스트 조회
	 * @param boardCode
	 * @return
	 */
	public List<Administrator> selectBoardList(int boardCode) {
		return sqlSession.selectList("AdministratorMapper_o.selectFaqList", boardCode);
	}

	/** 공지사항 게시글 삽입
	 * @param administrator
	 * @return
	 */
	public int noticeInsert(Administrator administrator) {
		return sqlSession.insert("AdministratorMapper_o.faqInsert", administrator);
	}

	/** 공지사항 수정
	 * @param administrator
	 * @return
	 */
	public int noticeUpdate(Administrator administrator) {
		return sqlSession.update("AdministratorMapper_o.faqUpdate", administrator);
	}

	/** 공지사항 삭제
	 * @param boardNo
	 * @return
	 */
	public int noticeDelete(String boardNo) {
		return sqlSession.delete("AdministratorMapper_o.faqDelete", boardNo);
	}
	
}
