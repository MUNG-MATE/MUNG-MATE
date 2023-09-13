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

	
}

