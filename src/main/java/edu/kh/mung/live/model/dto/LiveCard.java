package edu.kh.mung.live.model.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class LiveCard {

	private int liveNo;
	private String liveImage;
	private String liveContent;
	private int rsNo;
	private int memberNo;
	private int petsitterNo;
	
}
