package edu.kh.mung.board.model.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class BoardImage {
	private int imageNo;
	private String imagePath;
	private String imageReName;
	private int imageOrder;
	private int boardNo;
}
