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
	private String memberPw;
	private String memberNickname;
	private String memberTel;
	private String memberAddress;
	private String profileImage;
	private String enrollDate;
	private String sessionFlag;
	private String adminFlag;
	private String petsitterFlag;
	private int authority;
	
	
	// 예약관리 (광민)
	private int rsNo;
	private Date rsDate;
	private String paySt;
	private String petsitterSt;
	private String servicePrice;
	
	
}
