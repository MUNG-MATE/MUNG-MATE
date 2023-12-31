package edu.kh.mung.chatting.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import edu.kh.mung.chatting.model.dao.ChattingDAO2;
import edu.kh.mung.chatting.model.dto.ChattingRoom2;
import edu.kh.mung.chatting.model.dto.Message2;
import edu.kh.mung.common.utility.Util;
import edu.kh.mung.reservation.model.dto.Reservation;

@Service
public class ChattingServiceImpl2 implements ChattingService2{

	@Autowired
	private ChattingDAO2 dao;

	// 메세지 삽입(websocketHandler에서 보냄)
	@Override
	public int insertMessage2(Message2 msg) {
		msg.setMessageContent(Util.XSSHandling(msg.getMessageContent()));
		return dao.insertMessage2(msg);
	}

	// 채팅 읽음표시
	@Override
    public int updateReadFlag(Map<String, Object> paramMap) {
        return dao.updateReadFlag(paramMap);
    }
		
	// 채팅메세지 목록
	@Override
	public List<Message2> selectMessageList(Map<String, Object> paramMap) {
		
		 List<Message2> messageList = dao.selectMessageList(  Integer.parseInt( String.valueOf(paramMap.get("chatNo") )));
		 if(!messageList.isEmpty()) {
	            int result = dao.updateReadFlag(paramMap);
	        }
		 
		return messageList;
	}
	
	// 채팅룸 생성
	@Override
	public int createChattingRoom(Map<String, Integer> map) {
		
		return dao.createChattingRoom(map);
	}

	// 채팅방 체크 
	@Override
	public int checkChattingNo(Map<String, Integer> map) {
		return dao.checkChattingNo(map);
	}
	
	// 채팅 상대 조회
	@Override
	public List<Reservation> chattingTarget(Map<String, Object> map) {
		return dao.chattingTarget(map);
	}
	
	// 채팅 페이지
	@Override
	public List<ChattingRoom2> chatList(int memberNo) {
		return dao.chatList(memberNo);
	}
	
	// Live적용할 reNo 구하기
	@Override
	public int selectRsNo(Map<String, Object> map) {
		
		return dao.selectRsNo(map);
	}
	
}
