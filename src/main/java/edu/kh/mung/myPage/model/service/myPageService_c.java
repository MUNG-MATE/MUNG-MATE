package edu.kh.mung.myPage.model.service;

import java.io.IOException;

import org.springframework.web.multipart.MultipartFile;

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

}
