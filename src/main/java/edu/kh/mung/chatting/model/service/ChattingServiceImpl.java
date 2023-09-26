package edu.kh.mung.chatting.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import edu.kh.mung.chatting.model.dao.ChattingDAO;
import edu.kh.mung.chatting.model.dto.ChattingRoom;
import edu.kh.mung.chatting.model.dto.Message;
import edu.kh.mung.common.utility.Util;
import edu.kh.mung.reservation.model.dto.Reservation;

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

	// 채팅 읽음표시
	@Override
	public int updateReadFlag(Map<String, Object> paramMap) {
		return dao.updateReadFlag(paramMap);
	}

	// 채팅메세지 목록
	@Override
	public List<Message> selectMessageList(Map<String, Object> paramMap) {

		List<Message> messageList = dao.selectMessageList(  Integer.parseInt( String.valueOf(paramMap.get("chatNo") )));
		if(!messageList.isEmpty()) {
			int result = dao.updateReadFlag(paramMap);
		}

		return messageList;
	}

	// 채팅 - 일반
	@Override
	public List<ChattingRoom> chattingList(int memberNo) {
		return dao.chattingList(memberNo);
	}


	// 채팅 - 일반

	@Override public List<Reservation> reservation(int memberNo) {

		return dao.reservation(memberNo); 

	}


	// 채팅 - 펫시터 

	@Override
	public List<ChattingRoom> chattingList1(int memberNo) {

		return dao.chattingList1(memberNo);
	}

	// 채팅룸
	@Override
	public int createChattingRoom(Map<String, Integer> map) {

		return dao.createChattingRoom(map);
	}

	// 채팅방 체크 
	@Override
	public int checkChattingNo(Map<String, Integer> map) {
		return dao.checkChattingNo(map);
	}




}
