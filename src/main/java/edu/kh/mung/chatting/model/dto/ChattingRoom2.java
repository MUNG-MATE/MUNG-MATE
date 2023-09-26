package edu.kh.mung.chatting.model.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ChattingRoom2 {
	
    private int chatNo;
    private String lastMessage;
    private String sendTime;
    private int targetNo;
    private String targetNickName;
    private String targetProfile;
    private int notReadCount;
    
}
