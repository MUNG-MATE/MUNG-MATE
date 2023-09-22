package edu.kh.mung.chatting.model.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Message {

	private int messageNo;
	private String messageContent;
	private String readFlag;
	private int senderNo;
	private String sendTime;
	private int petSitterNo;

}
