package edu.kh.mung.live.model.service;

import java.io.IOException;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import edu.kh.mung.live.model.dto.LiveCard;
import edu.kh.mung.live.model.dto.LocationService;
import edu.kh.mung.reservation.model.dto.Pet2;

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

	/** 예약 번호로 펫 이미지 조회
	 * @param rsNo
	 * @return pet
	 */
	List<Pet2> selectPetImage(int rsNo);

	/** 라이브 카드 삽입
	 * @param filePath 
	 * @param webPath 
	 * @param images 
	 * @return result
	 */
	int insertLiveCard(LiveCard lc, List<MultipartFile> images, String webPath, String filePath) throws IllegalStateException, IOException;
	
	/** 서비스 상태 체크
	 * @param rsNo
	 * @return result
	 */
	String serviceCheck(int rsNo);

	/** 서비스 상태 업데이트(ING -> Y)
	 * @param rsNo
	 */
	void updateServiceState(int rsNo);

	/** 서비스 상태 업데이트(N -> ING)
	 * @param rsNo
	 * @return
	 */
	int startService(int rsNo);
	
}
