package edu.kh.mung.myPage.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;

import edu.kh.mung.myPage.model.dto.rList_p;
import edu.kh.mung.myPage.model.service.PetSitterService_p;

@RestController
@SessionAttributes("{loginMember}")
@RequestMapping("/petsitter")
public class PetSitterController_p {
	
	@Autowired
	private PetSitterService_p service;
	
	//화면 전환
	@GetMapping("/reservationList_p")
	public String reservationList() {
		
		return "petsitter/reservationList_p";
	}
	
	
	//펫시터 예약목록 조회 ( 비동기 )
	@GetMapping(value="/selectList", produces="application/json; charset=UTF-8")
	public List<rList_p> select(Integer rsNo) {
		
		
		return service.select(rsNo);
	}

}
