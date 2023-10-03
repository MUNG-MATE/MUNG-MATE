package edu.kh.mung.chatting.model.service;

import java.util.List;
import java.util.Map;

import edu.kh.mung.chatting.model.dto.ChattingRoom2;
import edu.kh.mung.chatting.model.dto.Message2;
import edu.kh.mung.reservation.model.dto.Reservation;

public interface ChattingService2 {

	
	// 채팅페이지
	List<ChattingRoom2> chatList(int memberNo);
	
	// 채팅 메시지 삽입
	int insertMessage2(Message2 msg);
	
	// 채팅 읽음표시
	int updateReadFlag(Map<String, Object> paramMap);
	
	// 채팅목록조회
	List<Message2> selectMessageList(Map<String, Object> paramMap);

	// 채팅룸
	int createChattingRoom(Map<String, Integer> map);

	// 채팅방 체크
	int checkChattingNo(Map<String, Integer> map);
	
	// 채팅 상대 조회 
	List<Reservation> chattingTarget(Map<String, Object> map);
	
	// Live적용할 reNo 구하기
	int selectRsNo(Map<String, Object> map);
	
}
