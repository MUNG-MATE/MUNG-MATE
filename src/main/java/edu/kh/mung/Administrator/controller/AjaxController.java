package edu.kh.mung.Administrator.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import edu.kh.mung.Administrator.model.service.AdministratorService;
import edu.kh.mung.member.model.dto.Member;

@RestController

public class AjaxController {
	
	@Autowired
	private AdministratorService service;
	
	// 리스트 조회
	@GetMapping(value="/Administrator/management/delete", produces="application/json; charset=UTF-8" )
	public List<Member> select(){
		
		return service.select();
	}
	
	@PutMapping(value="/Administrator/petManagement", produces="application/text")
	public int petsitterDelete(@RequestBody int petNo) {
		
		return service.petsitterDelete(petNo);
	}
}
