package edu.kh.mung.reservation.model.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Pet2 {
	
	private int petNo;	// 반려견 번호
	private String petName;	// 반려견 이름
	private String petType;	// 품종
	private String petBirth;	// 생년월
	private String petGender; // 성별
	private String petProfile; // 반려견 프로필 사진
	private String petOption;	// 반려견 특이사항
	private int memberNo; // 회원 번호
	
}
