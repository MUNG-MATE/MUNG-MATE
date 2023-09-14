package edu.kh.mung.myPage.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.mung.myPage.model.dto.Pet;

@Repository
public class myPageDAO_c {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 새로운 반려견 등록하기
	public int insertPet(Pet newPet) {
		return sqlSession.insert("myPageMapper_c.insertPet", newPet);
	}
	
	// 반려견 정보 삭제하기
	public int deletePet(int petNo) {
		return sqlSession.delete("myPageMapper_c.deletePet", petNo);
	}

	public int selectPetNo(Pet newPet) {
		return sqlSession.selectOne("myPageMapper_c.selectPetNo", newPet);
	}
	
}
