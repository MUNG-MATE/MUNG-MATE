package edu.kh.mung.chatting.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.SessionAttributes;

import edu.kh.mung.chatting.model.service.ChattingService;

@SessionAttributes("loginMember")
@Controller
public class ChattingController {
	
	@Autowired
	private ChattingService service;
}
