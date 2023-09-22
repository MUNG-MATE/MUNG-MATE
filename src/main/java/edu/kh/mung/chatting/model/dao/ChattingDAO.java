package edu.kh.mung.chatting.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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

	/** 메세지 전송(websocketHandler)
	 * @param msg
	 * @return
	 */
	public int insertMessage(Message msg) {
		
		return sqlSession.insert("chattingMapper.insertMessage", msg);
		
		
	}
	
	/** 메세지 목록
	 * @param parseInt
	 * @return
	 */
	public List<Message> selectMessageList(int petSitterNo) {
		
		return sqlSession.selectList("chattingMapper.selectMessageList", petSitterNo);
	}	

	/** 채팅 읽음 표시
	 * @param paramMap
	 * @return
	 */
	public int updateReadFlag(Map<String, Object> paramMap) {
		return sqlSession.update("chattingMapper.updateReadFlag", paramMap);
	}

	public int selectPetsitterNo(int memberNo) {
	
		return sqlSession.selectOne("chattingMapper.selectPetsitterNo", memberNo);
	}

	/** 채팅회원번호
	 * @param memberNo
	 * @return
	 */
	public int selectChattingMemberNo(int memberNo) {
		return sqlSession.selectOne("chattingMapper.selectChattingMemberNo", memberNo);
	}

}
