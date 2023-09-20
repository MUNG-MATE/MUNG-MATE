package edu.kh.mung.myPage.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import edu.kh.mung.myPage.model.dto.rList_p;
import edu.kh.mung.myPage.model.service.PetSitterService_p;

@Controller
@SessionAttributes("{loginMember}")
@RequestMapping("/petsitter")
public class PetSitterController_p {
	
	@Autowired
	private PetSitterService_p service;
	
//	//화면 전환
//	@GetMapping("/reservationList_p")
//	public String reservationList() {
//		
//		return "petsitter/reservationList_p";
//	}
	
	
	//예약번호로 펫시터 예약목록 조회
	@GetMapping("/reservationList_p")
	public String select(Model model) {
		
		List<rList_p> rList = service.select();

		System.out.println(rList);
		
		model.addAttribute("rList", rList);
		
		return "petsitter/reservationList_p";
	}
	
	// 해당 예약번호 예약 수락하기
	@GetMapping(value="/agree", produces="application/json; charset=UTF-8")
	@ResponseBody
	public String update(@RequestBody rList_p rsNo) {
		
		int result = service.update(rsNo);
		
		return "petsitter/reservationList_p";
	}

}
