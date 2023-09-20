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
	
	// 완료된 예약
	public int endR() {
		
		return sqlSession.selectOne("AdministratorMapper.endR");
	}
	// 완료안된 예약
	public int noCompletedR() {
		
		return sqlSession.selectOne("AdministratorMapper.noCompletedR");
	}
	// 어제 예약
	public int yesterdayR() {
		
		return sqlSession.selectOne("AdministratorMapper.yesterdayR");
	}
	
	// 오늘예약
	public int todayR() {
		
		return sqlSession.selectOne("AdministratorMapper.todayR");
	}
	// 내일예약
	public int tomorrowR() {
		
		return sqlSession.selectOne("AdministratorMapper.tomorrowR");
	}
	
	// 이번달 예약
	public int thisMonthR() {
		
		return sqlSession.selectOne("AdministratorMapper.thisMonthR");
	}
	// 다음달 예약
	public int FMonthR() {
		
		return sqlSession.selectOne("AdministratorMapper.FMonthR");
	}
	// 이번달 매출
	public int thisMonthSales() {
		
		return sqlSession.selectOne("AdministratorMapper.thisMonthSales");
	}
	
	// 앞으로매출
	public int FtotalSales() {
		
		return sqlSession.selectOne("AdministratorMapper.FtotalSales");
	}
	
	// 총매출
	public int totalSales() {
		
		return sqlSession.selectOne("AdministratorMapper.totalSales");
	}
	// 펫신터 신고목록 조회
	public List<Member> declarationList(int memberNo) {
		
		return sqlSession.selectList("AdministratorMapper.declarationList",memberNo);
	}
	public String declarationPesitter(int petsitterNo) {
		
		return sqlSession.selectOne("AdministratorMapper.declarationPesitter",petsitterNo);
	}
	
	
	
	

}
