package edu.kh.mung.board.model.service;

import java.util.List;
import java.util.Map;

import edu.kh.mung.board.model.dto.Board;

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


	/** DB 이미지(파일) 목록 조회
	 * @return
	 */
	List<String> selectImageList();

	/** 게시글 상세 조
	 * @param map
	 * @return
	 */
	Board selectBoard(Map<String, Object> map);
}
