package edu.kh.mung.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kh.mung.member.model.dao.MemberDAO;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDAO dao;
	
	// 회원가입 중 이메일 검사
	@Override
	public int CheckEmail(String email) {
		// TODO Auto-generated method stub
		return 0;
	}
}
