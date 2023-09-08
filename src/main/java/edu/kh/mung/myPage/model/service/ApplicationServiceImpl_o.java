package edu.kh.mung.myPage.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kh.mung.myPage.model.dao.ApplicationDAO_o;

@Service
public class ApplicationServiceImpl_o implements ApplicationService_o {

	@Autowired
	private ApplicationDAO_o dao;
	
}
