package edu.kh.mung.member.model.service;

import java.util.HashMap;
import java.util.Map;

import javax.mail.Message;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.kh.mung.member.model.dao.MemberDAO;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDAO dao;

    
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


	

}