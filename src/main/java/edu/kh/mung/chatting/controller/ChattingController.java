package edu.kh.mung.chatting.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import edu.kh.mung.chatting.model.dto.ChattingRoom;
import edu.kh.mung.chatting.model.service.ChattingService;
import edu.kh.mung.member.model.dto.Member;

@SessionAttributes("loginMember")
@Controller
public class ChattingController {

	@Autowired
	private ChattingService service;

	// 채팅 페이지
	@GetMapping("/chatting")
	public String chatting(@SessionAttribute("loginMember") Member loginMember, Model model) {

		
		return "chatting/chatting";
	}
}
