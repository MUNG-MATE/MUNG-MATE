package edu.kh.mung.chatting.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kh.mung.chatting.model.dao.ChattingDAO;
import edu.kh.mung.chatting.model.dto.Message;
import edu.kh.mung.common.utility.Util;

@Service
public class ChattingServiceImpl implements ChattingService{

	@Autowired
	private ChattingDAO dao;

	// 메세지 삽입(websocketHandler에서 보냄)
	@Override
	public int insertMessage(Message msg) {
		msg.setMessageContent(Util.XSSHandling(msg.getMessageContent()));
		return dao.insertMessage(msg);
	}
}
