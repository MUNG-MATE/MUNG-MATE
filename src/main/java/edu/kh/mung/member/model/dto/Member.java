package edu.kh.mung.member.model.dto;

import java.sql.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor

public class Member {
	
	private int memberNo;
	private String memberName;
	private String memberEmail;
	private String memberNickname;
	private String memberPw;
	private String memberTel;
	private String memberAddress;
	private String enrollDate;
	private String sessionFlag;
	private String adminFlag;
	private String petsitterFlag;
	private String profileImage;
	private int authority;
	
	
	// 예약관리/신고 (광민)
	private int rsNo;
	private String rsDate;
	private String rsStartDate;
	private String servicePrice;
	private String serviceTime;
	private String serviceSt;
	private int petsitterNo;
	
	

	
}
