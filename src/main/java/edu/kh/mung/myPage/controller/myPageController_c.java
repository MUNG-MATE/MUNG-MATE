package edu.kh.mung.myPage.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import edu.kh.mung.member.model.dto.Member;
import edu.kh.mung.myPage.model.dto.Pet;
import edu.kh.mung.myPage.model.service.myPageService_c;

@Controller
@SessionAttributes({"loginMember","loginMemberPet"})
public class myPageController_c {
	
	@Autowired
	private myPageService_c service;
	
	@RequestMapping("/myPage/petInfo")
	public String petInfo(@SessionAttribute("loginMemberPet")List<Pet> loginMemberPetList) {
		System.out.println(loginMemberPetList);
		return "myPage/petInfo";
	}

}
