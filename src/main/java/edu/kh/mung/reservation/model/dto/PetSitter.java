package edu.kh.mung.reservation.model.dto;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class PetSitter {
	
	private int petSitterNo;
	private String location;
	private String career;
	private int memberNo;
	private String memberEmail;
	private String memberTel;
	private String profileImg;
	private String memberNm;
	private int wishListCount;

}
