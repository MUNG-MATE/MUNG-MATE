package edu.kh.mung.myPage.model.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class Application {
	
	private int appNo;
	private String appContent;
	private String appDate;
	private String appLocation;
	private String appEx;
	private int memberNo;
	private String appCd;
	
}
