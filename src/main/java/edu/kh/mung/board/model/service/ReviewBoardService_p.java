package edu.kh.mung.board.model.service;

import java.util.Map;

public interface ReviewBoardService_p {

	/** 게시글 목록 조회
	 * @param boardCode
	 * @param cp
	 * @return map
	 */
	Map<String, Object> selectReviewList(int boardCode, int cp);

	/**
	 * @param paramMap
	 * @param cp
	 * @return
	 */
	Map<String, Object> selectReviewList(Map<String, Object> paramMap, int cp);

}
