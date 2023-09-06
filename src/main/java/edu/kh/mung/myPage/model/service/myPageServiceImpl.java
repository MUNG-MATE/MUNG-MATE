package edu.kh.mung.myPage.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.kh.mung.myPage.model.dao.myPageDAO;

@Service
public class myPageServiceImpl implements myPageService {

	@Autowired
	private myPageDAO dao;
	
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
	public int pwCheck(String memberPw) {
		return dao.pwCheck(memberPw);
	}
	
	
	
}
