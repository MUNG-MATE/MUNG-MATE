package edu.kh.mung.myPage.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.mung.Administrator.model.dto.Pagination;
import edu.kh.mung.board.model.dto.Board;
import edu.kh.mung.member.model.dto.Member;
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
	
	// 반려견 정보 수정하기전 번호 얻어오기
	public int selectPetNo(Pet newPet) {
		return sqlSession.selectOne("myPageMapper_c.selectPetNo", newPet);
	}
	
	// 반려견 정보 수정하기
	public int updatePetImage(Pet pet) {
		return sqlSession.update("myPageMapper_c.updatePet", pet);
	}
	
	// 내 게시글 조회하기
	public int selectListCount(Member loginMember) {
		return sqlSession.selectOne("myPageMapper_c.selectListCount", loginMember);
	}

	public List<Board> selectMyPostList(Pagination pagination, Member loginMember) {
		
		int offset = (pagination.getCurrentPage() - 1 ) * pagination.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());
		
		return sqlSession.selectList("myPageMapper_c.selectMyPostList", loginMember, rowBounds);
	}
	
}
