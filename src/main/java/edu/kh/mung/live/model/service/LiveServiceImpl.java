package edu.kh.mung.live.model.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import edu.kh.mung.common.utility.Util;
import edu.kh.mung.live.model.dao.LiveDAO;
import edu.kh.mung.live.model.dto.LiveCard;
import edu.kh.mung.live.model.dto.LiveCardImage;
import edu.kh.mung.live.model.dto.LocationService;
import edu.kh.mung.live.model.exception.FileUploadException;
import edu.kh.mung.reservation.model.dto.Pet2;

@Service
public class LiveServiceImpl implements LiveService {
	
	@Autowired
	private LiveDAO dao;
	
	// 펫시터 위치(위도, 경도) 삽입
	@Override
	public int insertLocation(LocationService ls) {
		return dao.insertLocation(ls);
	}
	
	// 펫시터 위치(위도, 경도) 조회
	@Override
	public List<LocationService> selectLocation(LocationService ls) {
		return dao.selectLocation(ls);
	}
	
	// 예약 번호로 펫 이미지 조회
	@Override
	public List<Pet2> selectPetImage(int rsNo) {
		return dao.selectPetImage(rsNo);
	}

	// 라이브 카드 삽입 
	@Override
	public int insertLiveCard(LiveCard lc, List<MultipartFile> images, String webPath, String filePath) throws IllegalStateException, IOException {
		
		lc.setLiveContent( Util.XSSHandling( lc.getLiveContent() ) );
		
		int liveNo = dao.insertLiveCard(lc);
		
		if(liveNo > 0) {
			List<LiveCardImage> uploadList = new ArrayList<>();
			for(int i = 0; i < images.size(); i++) {
				
				if(images.get(i).getSize() > 0) {
					LiveCardImage img = new LiveCardImage();
					
					// img에 파일 정보를 담아서 uploadList에 추가
					img.setImagePath(webPath); // 웹 접근 경로
					img.setLiveNo(liveNo); // 게시글 번호
					img.setImageOrder(i); // 이미지 순서
					
					// 파일 원본명
					String fileName = images.get(i).getOriginalFilename();
					img.setImageOriginal(fileName); // 원본명
					img.setImageReName(Util.fileRename(fileName)); // 변경명
					
					uploadList.add(img);
				}
			}
			
			if(!uploadList.isEmpty()) {
				int result = dao.insertImageList(uploadList);
				
				if(result == uploadList.size()) {
					int updateResult = dao.updateServiceState(lc);
					for(int i = 0; i < uploadList.size(); i++) {
						
						int index = uploadList.get(i).getImageOrder();
						
						String rename = uploadList.get(i).getImageReName();
						
						images.get(index).transferTo(new File(filePath + rename));
					}
					
				} else {
					throw new FileUploadException();
				}
			}
		}
		
		return liveNo;
	}
	
}
