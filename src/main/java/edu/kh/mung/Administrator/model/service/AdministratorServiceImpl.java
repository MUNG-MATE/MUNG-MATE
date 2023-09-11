package edu.kh.mung.Administrator.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kh.mung.Administrator.model.dao.AdministratorDAO;

@Service
public class AdministratorServiceImpl implements AdministratorService{
	
	@Autowired
	private AdministratorDAO dao;

}
