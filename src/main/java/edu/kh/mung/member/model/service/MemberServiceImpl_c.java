package edu.kh.mung.member.model.service;

import java.util.HashMap;
import java.util.Map;

import javax.mail.Message;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.kh.mung.member.model.dao.MemberDAO_c;
import edu.kh.mung.member.model.dto.Member;
import edu.kh.mung.myPage.model.dto.Pet;

@Service
public class MemberServiceImpl_c implements MemberService_c {

	@Autowired
	private MemberDAO_c dao;

	@Autowired
	private BCryptPasswordEncoder bcrypt;
    
	// 회원가입 중 이메일 검사
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int CheckEmail(String email) {
		return dao.CheckEmail(email);
	}
	
	// 회원가입 중 닉네임 중복검사
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int checkNickname(String nickname) {

		return dao.checkNickname(nickname);
	}
	
	// 회원가입
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int insertNewMember(Member newMember) {
		
		String encPw = bcrypt.encode(newMember.getMemberPw());
		newMember.setMemberPw(encPw);
		
		int result = dao.insertNewMember(newMember);
		
		return result;
	}
	
	// 로그인
	@Transactional(rollbackFor = Exception.class)
	@Override
	public Member login(Member inputMember) {

		Member loginMember = dao.login(inputMember);

		if(loginMember != null) {

			
			if(bcrypt.matches(inputMember.getMemberPw(), 
							  loginMember.getMemberPw())) {
				
				loginMember.setMemberPw(null);
				
			}else {
				loginMember = null; 
			}
		}

		return loginMember;
	}
	
	// 아이디 찾기
	@Transactional(rollbackFor = Exception.class)
	@Override
	public String findEmail(Map<String, Object> paramMap) {
		
		return dao.findEmail(paramMap);
	}
	
	
	@Transactional(rollbackFor = Exception.class)
	// 비밀번호 변경
	@Override
	public int changePw(String newPw, String email) {
		
		String encPw = bcrypt.encode(newPw);
	
		return dao.changePw(encPw, email);
	}

	// 로그인한 회원의 반려견 정보 얻어오기
	@Override
	public Pet selectPet(Member loginMember) {
			
		return dao.selectPet(loginMember);
	}

	


}