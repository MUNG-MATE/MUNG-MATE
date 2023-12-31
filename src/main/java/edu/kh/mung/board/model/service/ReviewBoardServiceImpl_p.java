package edu.kh.mung.board.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kh.mung.board.model.dao.ReviewBoardDAO_p;
import edu.kh.mung.board.model.dto.Board;
import edu.kh.mung.board.model.dto.BoardImage;
import edu.kh.mung.board.model.dto.Pagination;

@Service
public class ReviewBoardServiceImpl_p implements ReviewBoardService_p{

	@Autowired
	private ReviewBoardDAO_p dao;

	// 게시글 목록 조회
	@Override
	public Map<String, Object> selectReviewList(int boardCode, int cp) {

		// 1. 특정 게시판의 삭제되지 않은 게시글 수 조회
		int listCount = dao.getListCount(boardCode);

		// 2. 1번 조회 결과 + cp를 이용해서 Pagination 객체 생성
		// -> 내부 필드가 모두 계산되어 초기화됨
		Pagination pagination = new Pagination(cp, listCount); 

		// 3. 특정 게시판에서 현재 페이지에 해당하는 부분에 대한 게시글 목록 조회
		// (어떤 게시판 (boardCode)에서 몇 페이지(pagination.currentPage)에 대한 게시글 몇 개(pagination.limit) 조회 )
		List<Board> boardList = dao.selectReviewList(pagination, boardCode); 

		// 4. pagination, boardList를 Map에 담아서 반환
		Map<String, Object> map = new HashMap<>();
		map.put("pagination", pagination);
		map.put("boardList", boardList);

		return map;
	}
	// 게시글 목록 조회(검색하기)
	@Override
	public Map<String, Object> selectReviewList(Map<String, Object> paramMap, int cp) {
		
		int listCount = dao.getListCount(paramMap);

		Pagination pagination = new Pagination(cp, listCount); 

		List<Board> boardList = dao.selectReviewList(pagination, paramMap); 

		Map<String, Object> map = new HashMap<>();
		map.put("pagination", pagination);
		map.put("boardList", boardList);

		return map;
	}
	// Db 이미지(파일) 목록 조회
	@Override
	public List<BoardImage> selectImageList() {
		return dao.selectImageList();
	}
	// 게시글 상세 조회
	@Override
	public Board selectBoard(Map<String, Object> map) {
		return dao.selectBoard(map);
	}
	//조회수 증가 서비스
	@Override
	public int updateReadCount(int boardNo) {
		return dao.updateReadCount(boardNo);
	}

}
