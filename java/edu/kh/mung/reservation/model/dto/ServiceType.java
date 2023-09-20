package edu.kh.mung.reservation.model.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ServiceType {
	
	private int serviceNo;
	private String serviceType;
	private int serviceTime;
	private int servicePrice;

}
