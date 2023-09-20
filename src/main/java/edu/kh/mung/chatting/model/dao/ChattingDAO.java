package edu.kh.mung.chatting.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.mung.chatting.model.dto.Message;

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
}
