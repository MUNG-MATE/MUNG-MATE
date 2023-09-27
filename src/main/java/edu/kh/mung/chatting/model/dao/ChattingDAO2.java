package edu.kh.mung.chatting.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.mung.chatting.model.dto.ChattingRoom;
import edu.kh.mung.chatting.model.dto.Message;
import edu.kh.mung.reservation.model.dto.Reservation;


@Repository
public class ChattingDAO2 {

	@Autowired
	private SqlSessionTemplate sqlSession;

	/** 메세지 전송(websocketHandler)
	 * @param msg
	 * @return
	 */
	public int insertMessage(Message msg) {
		
		return sqlSession.insert("chattingMapper2.insertMessage", msg);
	}
	
	/** 메세지 목록 0
	 * @param parseInt
	 * @return
	 */
	public List<Message> selectMessageList(int chatNo) {
		
		return sqlSession.selectList("chattingMapper2.selectMessageList", chatNo);
	}	

	/** 채팅 읽음 표시
	 * @param paramMap
	 * @return
	 */
	public int updateReadFlag(Map<String, Object> paramMap) {
		return sqlSession.update("chattingMapper2.updateReadFlag", paramMap);
	}
	
	// 채팅방 생성
	public int createChattingRoom(Map<String, Integer> map) {
		int result = sqlSession.insert("chattingMapper2.createChattingRoom", map);
	
	    return result;
	}
	// 채티방 체크
	public int checkChattingNo(Map<String, Integer> map) {
		return sqlSession.selectOne("chattingMapper2.checkChattingNo", map);
	}
	
	// 채팅 상대 조회
	public List<Reservation> chattingTarget(Map<String, Object> map) {
		
		return sqlSession.selectList("chattingMapper2.chattingTarget",map);
	}
	
	// 채팅 페이지
	public List<ChattingRoom> chatList(int memberNo) {
		
		return sqlSession.selectList("chattingMapper2.chatList",memberNo);
	}
	

}
