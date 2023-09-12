package edu.kh.mung.Administrator.model.service;

import java.util.Map;

public interface AdministratorService {

	Map<String, Object> selectManagementList(int cp);

	Map<String, Object> selectManagementList(Map<String, Object> paramMap, int cp);

}
