package edu.kh.mung.myPage.model.service;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import edu.kh.mung.Administrator.model.dto.Pagination;
import edu.kh.mung.board.model.dto.Board;
import edu.kh.mung.board.model.dto.BoardImage;
import edu.kh.mung.common.utility.Util;
import edu.kh.mung.member.model.dto.Member;
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
	public int updatePet(MultipartFile profileImage, String webPath, String filePath, Pet pet) throws IllegalStateException, IOException {
		String beforeImage = pet.getPetProfile();
		
		String rename = null; 
		
		if(profileImage.getSize() > 0) {
			
			rename = Util.fileRename(profileImage.getOriginalFilename());
			
			pet.setPetProfile(webPath+rename);
		}else {
			
			pet.setPetProfile(null);
			
		}
		
		int result = dao.updatePetImage(pet);
		
		if(result > 0) {
			
			if(rename != null) {
				profileImage.transferTo(new File(filePath + rename));
			}
			
		}else {
			pet.setPetProfile(beforeImage);
		}
		
		return result;
	}

	// 내 게시글 목록 조회
	@Override
	public Map<String, Object> selectMyPostList(Member loginMember, int cp) {
		
		int listCount = dao.selectListCount(loginMember);
		
		Pagination pagination = new Pagination(cp, listCount);
		
		List<Board> postList = dao.selectMyPostList(pagination,loginMember);
		
		System.out.println(postList);
		
		
		Map<String, Object> map = new HashMap<>();
		map.put("pagination", pagination);
		map.put("postList", postList);
		
		return map;
	}
	
	// 게시글 이미지 조회
	@Override
	public List<BoardImage> selectImageList() {
		
		return dao.selectImageList();
	}
	
}
