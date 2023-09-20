package edu.kh.mung.chatting.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kh.mung.chatting.model.dao.ChattingDAO;

@Service
public class ChattingServiceImpl implements ChattingService {

	@Autowired
	private ChattingDAO dao;
}
