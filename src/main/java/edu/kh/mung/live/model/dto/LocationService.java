package edu.kh.mung.live.model.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class LocationService {
	
	private int rsNo; // 예약 번호
	private double lat; // 위도
	private double lon; // 경도
	
}
