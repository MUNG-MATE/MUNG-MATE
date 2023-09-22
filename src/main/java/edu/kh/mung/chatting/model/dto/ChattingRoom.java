package edu.kh.mung.chatting.model.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ChattingRoom {

	private int chattingNo;
	private String lastMessage;
	private String sendTime;
	private String targetNickName;
	private String targetProfile;
	private int notReadCount;
}
