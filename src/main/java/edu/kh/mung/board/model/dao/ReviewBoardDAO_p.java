package edu.kh.mung.board.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.mung.board.model.dto.Board;
import edu.kh.mung.board.model.dto.Pagination;

@Repository
public class ReviewBoardDAO_p {

	@Autowired
	private SqlSessionTemplate sqlSession;


	/** 특정 게시판의 삭제되지 않은 게시글 수 조회
	 * @param boardCode
	 * @return
	 */
	public int getListCount(int boardCode) {
		return sqlSession.selectOne("reviewMapper.getListCount", boardCode);
	}

	/** 특정 게시판에서 현재 페이지에 해당하는 부분에 대한 게시글 목록 조회
	 * @param pagination
	 * @param boardCode
	 * @return
	 */
	public List<Board> selectReviewList(Pagination pagination, int boardCode) {

		// 1) offset 계산
		int offset = (pagination.getCurrentPage() - 1) * pagination.getLimit();

		// 2) RowBounds 객체 생성
		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());

		// 3) selectList("namespace.id", 파라미터, RowBounds 호출)
		return sqlSession.selectList("reviewMapper.selectReviewList", boardCode, rowBounds);
	}

	/** 게시글 목록 조회(검색하기)
	 * @param paramMap
	 * @return
	 */
	public int getListCount(Map<String, Object> paramMap) {
		return sqlSession.selectOne("reviewMapper.getListCount_search", paramMap);
	}

	/** 게시글 목록 조회
	 * @param pagination
	 * @param paramMap
	 * @return 
	 */
	public List<Board> selectReviewList(Pagination pagination, Map<String, Object> paramMap) {
		// 1) offset 계산
		int offset = (pagination.getCurrentPage() - 1) * pagination.getLimit();

		// 2) RowBounds 객체 생성
		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());

		// 3) selectList("namespace.id", 파라미터, RowBounds 호출)
		return sqlSession.selectList("reviewMapper.selectReviewList_search", paramMap, rowBounds);
	}

	/** DB 이미지(파일) 목록 조회
	 * @return list
	 */
	public List<String> selectImageList() {
		return sqlSession.selectList("reviewMapper.selectImageListAll");
	}

	/** 게시글 상세 조회
	 * @param map
	 * @return
	 */
	public Board selectBoard(Map<String, Object> map) {
		return sqlSession.selectOne("reviewMapper.selectBoard", map);
	}

}


