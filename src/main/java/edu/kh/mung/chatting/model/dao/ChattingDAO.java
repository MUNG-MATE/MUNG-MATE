package edu.kh.mung.chatting.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.mung.chatting.model.dto.ChattingRoom;
import edu.kh.mung.chatting.model.dto.Message;
import edu.kh.mung.reservation.model.dto.Reservation;

/**
 * @author user1
 *
 */
@Repository
public class ChattingDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	// 채팅-광민 0
	public List<ChattingRoom> chattingList(int memberNo) {
		return sqlSession.selectList("chattingMapper.chattingList",memberNo);
	}
	
	/** 메세지 전송(websocketHandler)
	 * @param msg
	 * @return
	 */
	public int insertMessage(Message msg) {
		
		return sqlSession.insert("chattingMapper.insertMessage", msg);
	}
	
	/** 메세지 목록 0
	 * @param parseInt
	 * @return
	 */
	public List<Message> selectMessageList(int chatNo) {
		
		return sqlSession.selectList("chattingMapper.selectMessageList", chatNo);
	}	

	/** 채팅 읽음 표시
	 * @param paramMap
	 * @return
	 */
	public int updateReadFlag(Map<String, Object> paramMap) {
		return sqlSession.update("chattingMapper.updateReadFlag", paramMap);
	}
	
	// 채팅방 생성
	public int createChattingRoom(Map<String, Integer> map) {
		int result = sqlSession.insert("chattingMapper.createChattingRoom", map);
	
	    return result;
	}
	// 예약 펫시터/멤버번호 조회
	public List<Reservation> reservation(int memberNo) {
		
		return sqlSession.selectList("chattingMapper.reservation",memberNo);
	}
	// 채팅 - 펫시터
	public List<ChattingRoom> chattingList1(int memberNo) {
		return sqlSession.selectList("chattingMapper.reservation1",memberNo);
	}

	public int checkChattingNo(Map<String, Integer> map) {
		return sqlSession.selectOne("chattingMapper.checkChattingNo", map);
	}

	

}
