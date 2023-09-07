package edu.kh.mung.myPage.model.service;

import java.io.File;
import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import edu.kh.mung.common.utility.Util;
import edu.kh.mung.member.model.dto.Member;
import edu.kh.mung.myPage.model.dao.myPageDAO_o;

@Service
public class myPageServiceImpl_o implements myPageService_o {

	@Autowired
	private myPageDAO_o dao;
	
	@Autowired 
	private BCryptPasswordEncoder bcrypt;

	/**
	 * 회원탈퇴
	 */
	@Override
	@Transactional(rollbackFor = Exception.class)
	public int memberSecession(int memberNo, String memberPw) {
		
		String encPw = dao.selectEncPw(memberNo);
		
		if(bcrypt.matches(memberPw, encPw)) {
			return dao.memberSecession(memberNo);
		}
		return 0;
	}

	/**
	 *회원 정보 수정 전 비밀번호 확인
	 */
	@Override
	public int pwCheck(String memberPw, int memberNo) {
		
		int result = 0;
		
		String encPw = dao.selectEncPw(memberNo);
		
		if(bcrypt.matches(memberPw, encPw)) {
			result += 1;
		}
		System.out.println("service : " + result);
		
		return result;
	}

	/**
	 * 회원 정보 수정
	 */
	@Override
	public int infoUpdate(Member member) {
		return dao.infoUpdate(member);
	}

	/**
	 *회원 프로필 사진 수정
	 * @throws IOException 
	 * @throws IllegalStateException 
	 */
	@Override
	public int profileUpdate(MultipartFile profileImage, String webPath, String filePath, Member loginMember) throws IllegalStateException, IOException {
		
		String temp = loginMember.getProfileImage(); 
		
		String rename = null; 
		
		if (profileImage.getSize() > 0) {

			// 1) 파일 이름 변경
			rename = Util.fileRename(profileImage.getOriginalFilename());

			// 2) 바뀐 이름 loginMember에 세팅
			loginMember.setProfileImage(webPath + rename);

		} else {
			loginMember.setProfileImage(null);
		}
		
		int result = dao.profileUpdate(loginMember);
		
		
		if (result > 0) { 
			if(rename != null) {
				profileImage.transferTo(new File(filePath + rename));
			}
			
		} else {
			loginMember.setProfileImage(temp);
		}
		
		return result;
	}
	
	
	
}
