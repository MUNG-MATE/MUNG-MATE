package edu.kh.mung.myPage.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class myPageDAO {

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
}
