package edu.kh.mung.Administrator.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kh.mung.Administrator.model.dao.FAQDAO_o;

@Service
public class FAQServiceImpl implements FAQService {

	@Autowired
	private FAQDAO_o dao;
}
