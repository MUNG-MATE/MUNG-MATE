package edu.kh.mung.live.model.service;

import java.util.List;

import edu.kh.mung.live.model.dto.LocationService;

public interface LiveService {

	/** 펫시터 위치(위도, 경도) 삽입
	 * @param ls
	 * @return result
	 */
	int insertLocation(LocationService ls);

	/** 펫시터 위치(위도, 경도) 조회
	 * @param ls
	 * @return locationList
	 */
	List<LocationService> selectLocation(LocationService ls);
	
}
