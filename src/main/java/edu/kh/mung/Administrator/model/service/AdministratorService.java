package edu.kh.mung.Administrator.model.service;

import java.util.List;
import java.util.Map;

import edu.kh.mung.member.model.dto.Member;

public interface AdministratorService {
	
	// 회원관리
	Map<String, Object> selectManagementList(int cp);
	// 회원관리(검색)
	Map<String, Object> selectManagementList(Map<String, Object> paramMap, int cp);
	
	// ajax
	
	// 회원관리 탈퇴
	int delete(String[] check);
	
	// 회원관리 조회
	List<Member> select();
	
	// 펫시터 조회
	Map<String, Object> petManagement();
	
	// 펫시터 삭제
	int petsitterDelete(int petNo);
	
	// 예약조회
	Map<String, Object> selectReserveList(int cp);
	
	// 펫시터 신고목록
	Map<String, Object> declarationList(int memberNo);
	
	// 펫시터 정보조회
	List<Member> declarationPesitter(int petsitterNo);
	
	// 펫시터 신고삽입
	int declarationInsert(Map<String, Object> map);
	
	// 신고관리목록 조회
	Map<String, Object> reportList(int cp);
	
	// 신고 체크
	int check(Map<String, Object> obj);

}
