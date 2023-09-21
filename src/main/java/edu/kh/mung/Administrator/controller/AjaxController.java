package edu.kh.mung.Administrator.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import edu.kh.mung.Administrator.model.service.AdministratorService;
import edu.kh.mung.member.model.dto.Member;

@RestController

public class AjaxController {
	
	@Autowired
	private AdministratorService service;
	
	// 회원관리 삭제
	@PutMapping("/Administrator/management")
	@ResponseBody 
	public int delete(@RequestBody String[] check) {

		return service.delete(check);
	}
	// 리스트 조회
	@GetMapping(value="/Administrator/management/delete", produces="application/json; charset=UTF-8" )
	public List<Member> select(){
		
		return service.select();
	}
	
	// 펫시터 삭제 
	@PutMapping("/Administrator/petManagement")
	public int petsitterDelete(@RequestBody int petNo) {
		
		return service.petsitterDelete(petNo);
	}
	
	// 신고펫시터 조회
	@PostMapping(value="/Administrator/declaration/pesitter", produces="application/json; charset=UTF-8" )
	public List<Member> declarationPesitter(@RequestBody int petsitterNo) {
		
		
		return service.declarationPesitter(petsitterNo);
	}
	
}
