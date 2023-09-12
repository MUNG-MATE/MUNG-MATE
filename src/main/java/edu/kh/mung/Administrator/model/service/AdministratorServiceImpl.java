package edu.kh.mung.Administrator.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

		Pagination pagination = new Pagination(cp,listCount);

		List<Member> managementList = dao.selectManagementList(pagination);

		Map<String, Object> map = new HashMap<>();

		map.put("petCount", petCount);
		map.put("commonCount", commonCount);
		map.put("pagination", pagination);
		map.put("managementList", managementList);

		return map;
	}

	@Override
	public Map<String, Object> selectManagementList(Map<String, Object> paramMap, int cp) {
		
		// 1. 특정 게시판의 삭제되지 않고 검색 조건이 일치하는 게시글 수 조회
		int listCount = dao.getListCount(paramMap);

		// 2. 1번 조회 결과 + cp를 이용해서 Pagination 객체 생성
		// -> 내부 필드가 모두 계산되어 초기화됨

		Pagination pagination = new Pagination(cp,listCount);

		// 3. 특정 게시판에서
		// 현재 페이지에 해당하는 부분에 대한 게시글 목록 조회
		// + 단, 검색 조건 일치하는 글만 

		List<Member> boardList = dao.selectBoardList(pagination,paramMap);

		// 4. Pagination, boardList를 Map에 담아서 반환
		Map<String, Object> map = new HashMap<>();

		map.put("pagination", pagination);
		map.put("boardList", boardList);

		return map;
	}

}

