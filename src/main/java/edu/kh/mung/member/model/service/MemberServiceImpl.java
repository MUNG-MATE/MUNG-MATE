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

import edu.kh.mung.member.model.dao.MemberDAO;
import edu.kh.mung.member.model.dto.Member;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDAO dao;

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
	@Override
	public int insertNewMember(Member newMember) {
		
		String encPw = bcrypt.encode(newMember.getMemberPw());
		newMember.setMemberPw(encPw);
		
		int result = dao.insertNewMember(newMember);
		
		return result;
	}
	
	// 로그인
	@Override
	public Member login(Member inputMember) {
		
		System.out.println("암호화 확인 : " + bcrypt.encode(inputMember.getMemberPw()));
		Member loginMember = dao.login(inputMember);
		System.out.println("DB에 있는 비밀번호 :" + loginMember.getMemberPw());
		
		
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


	

}