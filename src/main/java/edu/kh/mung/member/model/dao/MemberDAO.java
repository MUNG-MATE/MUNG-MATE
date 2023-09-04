package edu.kh.mung.member.model.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	
	/** 회원가입 중 이메일 검사
	 * @param email
	 * @return count
	 */
	public int CheckEmail(String email) {
		return sqlSession.selectOne("memberMapper.CheckEmail", email);
	}


	/** 회원가입 중 닉네임 중복검사
	 * @param nickname
	 * @return
	 */
	public int checkNickname(String nickname) {
		return sqlSession.selectOne("memberMapper.checkNickname", nickname);
	}


}
