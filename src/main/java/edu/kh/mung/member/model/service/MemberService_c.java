package edu.kh.mung.member.model.service;

import java.util.Map;

import edu.kh.mung.member.model.dto.Member;
import edu.kh.mung.myPage.model.dto.Pet;

public interface MemberService_c {
	
	/** 회원가입 중 이메일 검사
	 * @param email
	 * @return
	 */
	int CheckEmail(String email);


 	/** 회원가입 중 닉네임 중복 검사
	 * @param nickname
	 * @return count
	 */
	int checkNickname(String nickname);


	/** 회원가입 
	 * @param newMember
	 * @return result
	 */
	int insertNewMember(Member newMember);


	/** 로그인
	 * @param inputMember
	 * @return loginmember
	 */
	Member login(Member inputMember);


	/** 아이디 찾기
	 * @param paramMap
	 * @return result
	 */
	String findEmail(Map<String, Object> paramMap);


	/** 비밀번호 변경
	 * @param map
	 * @return result
	 */
	int changePw(String newPw, String email);


	/** 호그인 회원의 반려견 정보 얻어오기
	 * @param loginMember
	 * @return loginMemberPet
	 */
	Pet selectPet(Member loginMember);
	
	

}
