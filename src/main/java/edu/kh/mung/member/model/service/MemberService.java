package edu.kh.mung.member.model.service;

public interface MemberService {
	
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
}
