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
    private int petsitterNo;
    private String petsitterNickName;
    private String petsitterProfile;
    private int notReadCount;
    
}
