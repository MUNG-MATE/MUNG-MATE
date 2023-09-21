package edu.kh.mung.main.model.service;

import java.util.List;
import java.util.Map;

import edu.kh.mung.board.model.dto.Board;
import edu.kh.mung.reservation.model.dto.PetSitter;

public interface MainService_h {

	/** 펫시터 리스트 조회
	 * @return
	 */
	List<PetSitter> petSitterList();

	/** 찜목록
	 * @param paramMap
	 * @return
	 */
	int wishListCheck(Map<String, Integer> paramMap);



	/** 찜 목록 확인
	 * @param petSitterNo
	 * @param memberNo
	 * @return 
	 */
	int myWishList(int petSitterNo, int memberNo);

	/** 마이페이지 펫시터 찜 목록
	 * @return
	 */
	List<PetSitter> petSitterLikeList(int memberNo);

	/** 리뷰 리스트 불러오기
	 * @return
	 */
	List<Board> reviewList();

}
