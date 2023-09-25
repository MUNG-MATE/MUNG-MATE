package edu.kh.mung.live.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.mung.live.model.dto.LiveCard;
import edu.kh.mung.live.model.dto.LiveCardImage;
import edu.kh.mung.live.model.dto.LocationService;
import edu.kh.mung.reservation.model.dto.Pet2;

@Repository
public class LiveDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	/** 펫시터 위치(위도, 경도) 삽입
	 * @param ls
	 * @return result
	 */
	public int insertLocation(LocationService ls) {
		return sqlSession.insert("liveMapper.insertLocation", ls);
	}

	/** 펫시터 위치(위도, 경도) 조회
	 * @param ls
	 * @return locationList
	 */
	public List<LocationService> selectLocation(LocationService ls) {
		return sqlSession.selectList("liveMapper.selectLocation", ls);
	}

	/** 예약 번호로 펫 이미지 조회
	 * @param rsNo
	 * @return pet
	 */
	public List<Pet2> selectPetImage(int rsNo) {
		return sqlSession.selectList("liveMapper.selectPetImage", rsNo);
	}

	/** 라이브 카드 삽입
	 * @param lc
	 * @return result
	 */
	public int insertLiveCard(LiveCard lc) {
		
		int result = sqlSession.insert("liveMapper.insertLiveCard", lc);
		
		if(result > 0) result = lc.getLiveNo();
		
		return result;
	}

	/** 이미지 리스트(여러 개) 삽입
	 * @param uploadList
	 * @return result
	 */
	public int insertImageList(List<LiveCardImage> uploadList) {
		return sqlSession.insert("liveMapper.insertImageList", uploadList);
	}
	
}
