package edu.kh.mung.live.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.mung.live.model.dto.LocationService;

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
	
}
