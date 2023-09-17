package edu.kh.mung.main.model.service;

import java.util.List;
import java.util.Map;

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

}
