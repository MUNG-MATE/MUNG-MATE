package edu.kh.mung.myPage.model.service;

import java.util.List;

import edu.kh.mung.myPage.model.dto.rList_p;

public interface PetSitterService_p {


	/** 예약목록조회
	 * @param rsNo
	 * @return
	 */
	List<rList_p> select(Integer rsNo);

}
