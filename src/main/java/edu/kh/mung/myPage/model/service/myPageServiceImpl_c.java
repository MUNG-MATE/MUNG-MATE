package edu.kh.mung.myPage.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kh.mung.myPage.model.dao.myPageDAO_c;

@Service
public class myPageServiceImpl_c implements myPageService_c {

	@Autowired
	private myPageDAO_c dao;
	
}
