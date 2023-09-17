package edu.kh.mung.myPage.model.dto;

import java.util.List;

import edu.kh.mung.reservation.model.dto.PetSitter;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class rList_p {

	//회원정보
	private int memberNo;
	private String memberName;
	private String memberNickname;
	private String profileImage;

	//회원이 예약시 입력한 정보
	private int rsNo;	// 예약번호
	private String rsDate;	// 방문 날짜
	private String rsStartDate;	// 방문 시간
	private int petSitterNo;	// 펫시터 번호
	private int serviceNo;	// 서비스 번호
	private String rsAddress; // 입력한 주소
	private String serviceType; // 타입
	private String serviceTime; // 시간
	private int servicePrice;  // 금액
	
	// 펫
	private int petNo;	// 반려견 번호
	private String petName;	// 반려견 이름
	private String petType;	// 품종
	private String petBirth;	// 생년월
	private String petGender; // 성별
	private String petProfile; // 반려견 프로필 사진
	private String petOption;	// 반려견 특이사항
	
	private List<rList_p> reservationList;
}
