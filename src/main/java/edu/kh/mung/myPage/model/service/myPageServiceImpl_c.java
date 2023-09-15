package edu.kh.mung.myPage.model.service;

import java.io.File;
import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import edu.kh.mung.common.utility.Util;
import edu.kh.mung.myPage.model.dao.myPageDAO_c;
import edu.kh.mung.myPage.model.dto.Pet;

@Service
public class myPageServiceImpl_c implements myPageService_c {

	@Autowired
	private myPageDAO_c dao;

	// 새로운 반려견 등록하기
	@Transactional(rollbackFor = {Exception.class})
	@Override
	public int insertPet(MultipartFile profileImage, String webPath, String filePath, Pet newPet) throws IllegalStateException, IOException {
		
		String rename = null;
		
		if(profileImage.getSize() > 0) { // 업로드된 이미지가 있을 경우
			
			rename = Util.fileRename(profileImage.getOriginalFilename());
			
			newPet.setPetProfile(webPath+rename);
			
		}else {
			newPet.setPetProfile(null);
		}
		
		int result = dao.insertPet(newPet);
		
		if(result > 0) {
			profileImage.transferTo(new File(filePath + rename));
		}
		
		return result;
	}
	
	// 반려견 정보 삭제하기
	@Override
	public int deletePet(int petNo) {
		
		return dao.deletePet(petNo);
	}

	// 반려견 번호 조회하기
	@Override
	public int selectPetNo(Pet newPet) {
		
		return dao.selectPetNo(newPet);
		
	}

	@Override
	public int updatePet(MultipartFile profileImage, String webPath, String filePath, Pet pet) {
		String beforeImage = pet.getPetProfile();
		
		String rename = null; 
		
		if(profileImage.getSize() > 0) {
			rename = Util.fileRename(profileImage.getOriginalFilename());
			
			pet.setPetProfile(rename);
		}else {
			pet.setPetProfile(null);
		}
		
		
		return 0;
	}
	
}
