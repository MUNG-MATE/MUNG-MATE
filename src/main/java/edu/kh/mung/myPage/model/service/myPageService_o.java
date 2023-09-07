package edu.kh.mung.myPage.model.service;

public interface myPageService_o {

	/** 회원 탈퇴
	 * @param memberNo
	 * @param memberPw
	 * @return
	 */
	int memberSecession(int memberNo, String memberPw);

	/** 회원 정보 수정 전 비밀번호 확인
	 * @param memberPw
	 * @return
	 */
	int pwCheck(String memberPw, int memberNo);

}
