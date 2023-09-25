package edu.kh.mung.chatting.model.service;

import java.util.List;
import java.util.Map;

import edu.kh.mung.chatting.model.dto.ChattingRoom;
import edu.kh.mung.chatting.model.dto.Message;
import edu.kh.mung.reservation.model.dto.Reservation;

public interface ChattingService {

	
	/** 메세지 삽입( websocketHandler 에서 보낸거!)
	 * @param msg
	 * @return
	 */
	int insertMessage(Message msg);

	/** 채팅 읽음 표시
	 * @param paramMap
	 * @return
	 */
	int updateReadFlag(Map<String, Object> paramMap);
	
	// 채팅목록조회
	List<Message> selectMessageList(Map<String, Object> paramMap);
	
	// 채팅 - 일반
	List<ChattingRoom> chattingList(int memberNo);

	// 채팅 - 일반
	List<Reservation> reservation(int memberNo);
	
	// 채팅 - 펫시터
	List<ChattingRoom> chattingList1(int memberNo);

	// 채팅룸
	int createChattingRoom(Map<String, Integer> map);

	// 채팅방 체크
	int checkChattingNo(Map<String, Integer> map);
}
