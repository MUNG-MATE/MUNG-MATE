package edu.kh.mung.myPage.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.mung.member.model.dto.Member;
import edu.kh.mung.reservation.model.dto.Reservation;

@Repository
public class MyPageDAO_k {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public List<Reservation> selectRsList(Member loginMember) {
		return sqlSession.selectList("myPageMapper_k.selectRsList", loginMember);
	}

}
