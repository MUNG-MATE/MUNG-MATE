package edu.kh.mung.Administrator.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.kh.mung.Administrator.model.dao.AdministratorDAO;
import edu.kh.mung.Administrator.model.dto.Pagination;
import edu.kh.mung.member.model.dto.Member;

@Service
public class AdministratorServiceImpl implements AdministratorService{

	@Autowired
	private AdministratorDAO dao;

	@Override
	public Map<String, Object> selectManagementList(int cp) {

		int listCount = dao.getListCount();
		int petCount = dao.petCount();
		int commonCount = dao.commonCount();
		int flagCount = dao.flagCount();
		int mungCount = dao.mungCount();

		Pagination pagination = new Pagination(cp,listCount);

		List<Member> managementList = dao.selectManagementList(pagination);

		Map<String, Object> map = new HashMap<>();
		
		map.put("mungCount", mungCount);
		map.put("flagCount", flagCount);
		map.put("petCount", petCount);
		map.put("commonCount", commonCount);
		map.put("pagination", pagination);
		map.put("managementList", managementList);
		
		return map;
	}
	
	// 검색1
	@Override
	public Map<String, Object> selectManagementList(Map<String, Object> paramMap, int cp) {
		
		int listCount = dao.getListCount(paramMap);
		int petCount = dao.petCount();
		int commonCount = dao.commonCount();
		int flagCount = dao.flagCount();
		int mungCount = dao.mungCount();

		Pagination pagination = new Pagination(cp,listCount); 

		List<Member> managementList = dao.selectBoardList(pagination,paramMap);

		Map<String, Object> map = new HashMap<>();
		
		map.put("mungCount", mungCount);
		map.put("flagCount", flagCount);
		map.put("petCount", petCount);
		map.put("commonCount", commonCount);
		map.put("pagination", pagination);
		map.put("managementList", managementList);
		
		return map;
	}
	
	// ajax 탈퇴
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int delete(String[] check) {
		
		int result = dao.delete(check);
		
		return result;
	}
	
	// ajax 조회
	@Override
	public List<Member> select() {
		
		return dao.select();
	}
	// 펫시터조회
	@Override
	public Map<String, Object> petManagement() {
		
		List<Member> petManagement = dao.petManagement();
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("petManagement",petManagement);
	
		return map;
	}
	
	// 펫시터삭제
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int petsitterDelete(int petNo) {
		
		return dao.petsitterDelete(petNo);
	}
	
	// 예약조회
	@Override
	public Map<String, Object> selectReserveList(int cp) {
		
		// 완료된 예약
		int endR = dao.endR();
		// 진행안된예약
		int noCompletedR = dao.noCompletedR();
		
		// 오늘예약
		int todayR = dao.todayR();
		// 어제예약
		int yesterdayR = dao.yesterdayR();
		// 내일 예약
		int tomorrowR = dao.tomorrowR();
		// 다음달 예약
		int FMonthR = dao.FMonthR();
		// 이번달 예약
		int thisMonthR = dao.thisMonthR();
		// 이번달 매출
		int thisMonthSales = dao.thisMonthSales();
		// 예상매출
		int FtotalSales = dao.FtotalSales();
		// 총매출
		int totalSales = dao.totalSales();
		
		int listCount = dao.getReserveListCount();

		Pagination pagination = new Pagination(cp,listCount);

		List<Member> selectReserveList = dao.selectReserveList(pagination);

		Map<String, Object> map = new HashMap<>();
		
		map.put("endR", endR);
		map.put("noCompletedR", noCompletedR);
		
		map.put("yesterdayR", yesterdayR);
		map.put("todayR", todayR);
		map.put("tomorrowR", tomorrowR);
		map.put("thisMonthR", thisMonthR);
		map.put("FMonthR", FMonthR);
		
		map.put("thisMonthSales", thisMonthSales);
		map.put("FtotalSales", FtotalSales);
		map.put("totalSales", totalSales);
		
		map.put("pagination", pagination);
		map.put("selectReserveList", selectReserveList);
		
		return map;
		
	}
	
	// 펫시터 신고목록
	@Override
	public Map<String, Object> declarationList(int memberNo) {
		
		List<Member> declarationList = dao.declarationList(memberNo);
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("declarationList",declarationList);
		return map;
	}
	// 펫시터 정보조회
	@Override
	public List<Member> declarationPesitter(int petsitterNo) {
		
		return dao.declarationPesitter(petsitterNo);
	}
	
	// 펫시터 신고삽입
	@Override
	public int declarationInsert(Map<String, Object> map) {
		
		return dao.declarationInsert(map);
	}
	
	// 신고관리목록 조회
	@Override
	public Map<String, Object> reportList(int cp) {
		
		int reportCount = dao.reportCount();
		
		Pagination pagination = new Pagination(cp,reportCount);
		
		List<Member> reportList = dao.reportList(pagination);

		Map<String, Object> map = new HashMap<>();
		
		map.put("pagination", pagination);
		map.put("reportList",reportList);

		return map;
	}
	
	// 신고체크
	@Override
	public int check(Map<String, Object> obj) {
		return dao.check(obj);
	}


	
}

