package edu.kh.mung.main.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kh.mung.board.model.dto.Board;
import edu.kh.mung.main.model.dao.MainDao_h;
import edu.kh.mung.reservation.model.dto.PetSitter;

@Service
public class MainServiceImpl_h implements MainService_h{
	
	@Autowired
	private MainDao_h dao;

	// 펫시터 리스트 조회
	@Override
	public List<PetSitter> petSitterList() {
		return dao.petSitterList();
	}

	// 찜목록
	@Override
	public int wishListCheck(Map<String, Integer> paramMap) {
		
		int result = 0;
		int insert = 0;
		int delete = 0;
		
		System.out.println("check 확인 : " + paramMap.get("check"));
		
		if(paramMap.get("check")  == 0) {
			
			insert = dao.insertWishList(paramMap);


		}else { 
			
			delete = dao.deleteWishList(paramMap);

		}
		System.out.println("insert 확인 : " + insert);
		System.out.println("delete 확인 : " + delete);
		if(insert == 1) { // 찜목록 추가 성공 시
			return result = 1;
		}
		
		if(delete == 1) { // 찜목록 삭제 성공 시
			return result = 2;
		}
		
		if(delete == 0 || insert == 0) {
			return result = -1;
		}
		
		System.out.println("result 확인 : " + result);
		
		return result;
	}

	// 찜 목록 확인
	@Override
	public int myWishList(int petSitterNo, int memberNo) {
		
		return dao.myWishList(petSitterNo, memberNo);
	}

	// 마이페이지 펫시터 찜 목록 
	@Override
	public List<PetSitter> petSitterLikeList(int memberNo) {
		
		return dao.petSitterLikeList(memberNo);
	}

	/**
	 * 리뷰 리스트 불러오기
	 */
	@Override
	public List<Board> reviewList() {
		return dao.reviewList();
	} 

}
