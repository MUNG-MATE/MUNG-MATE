package edu.kh.mung.Administrator.model.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Administrator {
	
	private int boardNo;
	private String title;
	private String Content;
	private String boardDate;
	private String boardSt;
	private int boardCode;
	private int memberNo;

}
