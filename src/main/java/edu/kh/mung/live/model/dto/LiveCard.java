package edu.kh.mung.live.model.dto;

import java.util.List;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class LiveCard {

	private int liveNo;
	private String liveContent;
	private int rsNo;
	private int memberNo;
	private int petsitterNo;
	private String startTime;
	private String endTime;
	
	private List<LiveCardImage> imageList;
	
}
