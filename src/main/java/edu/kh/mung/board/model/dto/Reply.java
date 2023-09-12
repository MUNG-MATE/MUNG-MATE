package edu.kh.mung.board.model.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Reply {

	private int replyNo;
	private String replyContent;
	private String replyCreateDate;
	private int boardNo;
	private int memberNo;
	private String replyState;
	private int parentNo;
	private String memberNickname;
	private String profileImage;
}
