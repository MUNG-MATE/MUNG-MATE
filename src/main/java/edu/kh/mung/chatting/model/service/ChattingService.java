package edu.kh.mung.chatting.model.service;

import edu.kh.mung.chatting.model.dto.Message;

public interface ChattingService {

	
	/** 메세지 삽입( websocketHandler 에서 보낸거!)
	 * @param msg
	 * @return
	 */
	int insertMessage(Message msg);

}
