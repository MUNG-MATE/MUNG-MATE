package edu.kh.mung.Administrator.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.mung.Administrator.model.dto.Pagination;
import edu.kh.mung.member.model.dto.Member;

@Repository
public class AdministratorDAO {

	@Autowired 
	private SqlSessionTemplate sqlSession;

	public int getListCount() {

		return sqlSession.selectOne("AdministratorMapper.getListCount");
	}
	public int petCount() {
		return sqlSession.selectOne("AdministratorMapper.petCount");
	}
	
	public int commonCount() {
		return sqlSession.selectOne("AdministratorMapper.commonCount");
	}
	public int flagCount() {
		return sqlSession.selectOne("AdministratorMapper.flagCount");
	}
	public int mungCount() {
		return sqlSession.selectOne("AdministratorMapper.mungCount");
	}

	public List<Member> selectManagementList(Pagination pagination) {

		int offset
		=(pagination.getCurrentPage() -1) * pagination.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset,pagination.getLimit());

		return sqlSession.selectList("AdministratorMapper.selectManagementList", null,rowBounds);
	}
	
	// 검색
	public int getListCount(Map<String, Object> paramMap) {
		
		return sqlSession.selectOne("AdministratorMapper.getListCount_search", paramMap);
	}
	public List<Member> selectBoardList(Pagination pagination, Map<String, Object> paramMap) {
		
		int offset
		=(pagination.getCurrentPage() -1) * pagination.getLimit();

		// 2) RowBounds 객체 생성
		RowBounds rowBounds = new RowBounds(offset,pagination.getLimit());

		// 3) selectList("namespace.id",파라미터, RowBounds)
		return sqlSession.selectList("AdministratorMapper.selectManagementList_search", paramMap, rowBounds);
			
	}
	// ajax 탈퇴
	public int delete(String[] check) {
		
		int deleteCount = 0;
		
		for (String item : check) {
			
			sqlSession.selectOne("AdministratorMapper.delete", item);
			deleteCount ++;
			
	    }
	
		return deleteCount;
	}
	// ajax 목록 조회
	public List<Member> select() {
		
		return sqlSession.selectList("AdministratorMapper.selectList");
	}
	public List<Member> petManagement() {
		
		return sqlSession.selectList("AdministratorMapper.petsitterList");
	}
	// 펫시터 삭제
	public int petsitterDelete(int petNo) {

		return sqlSession.update("AdministratorMapper.petsitterDelete",petNo);
	}
	// 예약관리
	public int getReserveListCount() {
		return sqlSession.selectOne("AdministratorMapper.getReserveListCount");
	}
	public List<Member> selectReserveList(Pagination pagination) {
		
		int offset
		=(pagination.getCurrentPage() -1) * pagination.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset,pagination.getLimit());

		return sqlSession.selectList("AdministratorMapper.selectReserveList", null,rowBounds);
	}
	
	
	

}
