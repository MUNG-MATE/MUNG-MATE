package edu.kh.mung.main.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.mung.reservation.model.dto.PetSitter;

@Repository
public class MainDao_h {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	/** 펫시터 리스트 조회
	 * @return
	 */
	public List<PetSitter> petSitterList() {
		return sqlSession.selectList("reservationMapper.petSitterList");
	}

	/** 찜목록 추가
	 * @param paramMap
	 * @return
	 */
	public int insertWishList(Map<String, Integer> paramMap) {
		
		return sqlSession.insert("reservationMapper.insertWishList", paramMap);
	}

	/** 찜목록 삭제
	 * @param paramMap
	 * @return
	 */
	public int deleteWishList(Map<String, Integer> paramMap) {
		return sqlSession.delete("reservationMapper.deleteWishList", paramMap);
	}

}
