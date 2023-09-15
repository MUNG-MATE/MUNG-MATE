package edu.kh.mung.Administrator.model.service;

import java.util.List;
import java.util.Map;

import edu.kh.mung.member.model.dto.Member;

public interface AdministratorService {

	Map<String, Object> selectManagementList(int cp);

	Map<String, Object> selectManagementList(Map<String, Object> paramMap, int cp);
	
	// ajax
	
	int delete(String[] check);
	
	List<Member> select();

	Map<String, Object> petManagement();

	int petsitterDelete(int petNo);

}
