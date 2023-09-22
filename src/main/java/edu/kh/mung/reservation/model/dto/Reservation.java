package edu.kh.mung.reservation.model.dto;

import java.util.List;

import edu.kh.mung.myPage.model.dto.Pet;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Reservation {
	
	private int rsNo;	// 예약번호
	private String rsDate;	// 방문 날짜
	private String rsStartDate;	// 방문 시간
	private int petSitterNo;	// 펫시터 번호
	private int memberNo;	// 회원 번호
	private int serviceNo;	// 서비스 번호
	
	private String rsAddress; // 입력한 주소
	private String serviceType; // 타입
	private String serviceTime; // 시간
	private int servicePrice;  // 금액
	private String serviceState; // 서비스 상태
	
	// 펫
	private List<Pet2> petList;
	
	// 펫시터
	private List<PetSitter> petSitterList;
}
