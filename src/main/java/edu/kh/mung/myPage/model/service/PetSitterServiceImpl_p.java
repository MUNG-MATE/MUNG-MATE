package edu.kh.mung.myPage.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kh.mung.myPage.model.dao.PetSitterDAO_p;
import edu.kh.mung.myPage.model.dto.rList_p;

@Service
public class PetSitterServiceImpl_p implements PetSitterService_p{

	@Autowired
	private PetSitterDAO_p dao;
	
	//예약목록조회
	@Override
	public List<rList_p> select(Integer rsNo) {
		return dao.select(rsNo);
	}


}
