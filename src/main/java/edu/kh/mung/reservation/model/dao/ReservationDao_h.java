package edu.kh.mung.reservation.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReservationDao_h {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

}
