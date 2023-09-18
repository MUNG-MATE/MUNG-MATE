package edu.kh.mung.myPage.model.service;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import edu.kh.mung.board.model.dto.BoardImage;
import edu.kh.mung.member.model.dto.Member;
import edu.kh.mung.myPage.model.dto.Pet;

public interface myPageService_c {

	/** 새로운 반려견 등록하기
	 * @param profileImage
	 * @param webPath
	 * @param filePath
	 * @param newPet
	 * @return result
	 * @throws IOException 
	 * @throws IllegalStateException 
	 */
	int insertPet(MultipartFile profileImage, String webPath, String filePath, Pet newPet) throws IllegalStateException, IOException;

	/** 반려견 정보 삭제하기
	 * @param petNo
	 * @return result
	 */
	int deletePet(int petNo);

	/** 반려견 번호 조회하기 --> 등록하고 그 번호를 가지고 있어야 하기에
	 * @param newPet
	 * @return petNo
	 */
	int selectPetNo(Pet newPet);

	/** 반려견 정보 수정하기
	 * @param profileImage
	 * @param webPath
	 * @param filePath
	 * @param pet
	 * @return result
	 * @throws IOException 
	 * @throws IllegalStateException 
	 */
	int updatePet(MultipartFile profileImage, String webPath, String filePath, Pet pet) throws IllegalStateException, IOException;

	/** 내 게시글 목록 조회
	 * @param loginMember
	 * @param cp
	 * @return Map
	 */
	Map<String, Object> selectMyPostList(Member loginMember, int cp);

	
	/** 내 게시글에 해당하는 이미지 목록 조회
	 * @return selectImageList
	 */
	List<BoardImage> selectImageList();

}
