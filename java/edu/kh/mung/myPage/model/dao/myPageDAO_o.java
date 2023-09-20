package edu.kh.mung.myPage.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.mung.member.model.dto.Member;

@Repository
public class myPageDAO_o {

	@Autowired
	private SqlSessionTemplate sqlSession;

	
	/** 비밀번호 일치하는지 확인
	 * @param memberNo
	 * @return
	 */
	public String selectEncPw(int memberNo) {
		
		return sqlSession.selectOne("myPageMapper.selectEncPw", memberNo);
	}

	
	/** 회원탈퇴
	 * @param memberNo
	 * @return
	 */
	public int memberSecession(int memberNo) {
		return sqlSession.update("myPageMapper.memberSecession", memberNo);
	}


	/** 회원 정보 수정 전 비밀번호 확인
	 * @param memberPw
	 * @return
	 */
	public int pwCheck(String memberPw) {
		return sqlSession.selectOne("myPageMapper.pwCheck", memberPw);
	}


	/** 회원 정보 수정
	 * @param member
	 * @return
	 */
	public int infoUpdate(Member member) {
		return sqlSession.update("myPageMapper.infoUpdate", member);
	}


	/** 회원 프로필 사진 수정
	 * @param loginMember
	 * @return
	 */
	public int profileUpdate(Member loginMember) {
		return sqlSession.update("myPageMapper.profileUpdate", loginMember);
	}
}
