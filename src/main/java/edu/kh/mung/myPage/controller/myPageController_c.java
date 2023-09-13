package edu.kh.mung.myPage.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import edu.kh.mung.myPage.model.service.myPageService_c;

@Controller
@SessionAttributes({"loginMember","loginMemberPet"})
public class myPageController_c {
	
	@Autowired
	private myPageService_c service;
	
	@RequestMapping("/myPage/petInfo")
	public String petInfo() {
		return "myPage/petInfo";
	}

}
