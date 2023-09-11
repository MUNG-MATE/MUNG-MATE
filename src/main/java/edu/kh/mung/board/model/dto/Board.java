package edu.kh.mung.board.model.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Board {

	private int boardNo;
	private String boardTitle;
	private String boardContent;
	private String boardDate;
	private String boardState;
	private int reviewStar;
	private int boardCode;
	
}
