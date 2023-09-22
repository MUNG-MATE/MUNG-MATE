package edu.kh.mung.chatting.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import edu.kh.mung.chatting.model.dao.ChattingDAO;
import edu.kh.mung.chatting.model.dto.Message;
import edu.kh.mung.common.utility.Util;
import edu.kh.mung.member.model.dto.Member;
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
	
	// 펫시터 번호조회
	@Override
	public int selectPetsitterNo(int memberNo) {
		
		return dao.selectPetsitterNo(memberNo);
	}
	
	// 채팅메세지 목록
	@Override
	public List<Message> selectMessageList(Map<String, Object> paramMap) {
		
		 List<Message> messageList = dao.selectMessageList(  Integer.parseInt( String.valueOf(paramMap.get("petSitterNo") )));
		 if(!messageList.isEmpty()) {
	            int result = dao.updateReadFlag(paramMap);
	        }
		 
		return messageList;
	}

	// 채팅회원번호 조회
	@Override
	public int selectChattingMemberNo(int memberNo) {
		
		return dao.selectChattingMemberNo(memberNo);
	}

}
