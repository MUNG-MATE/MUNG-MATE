package edu.kh.mung.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.SessionAttributes;

import edu.kh.mung.board.model.service.ReplyService_p;

@Controller
@SessionAttributes("loginMember")
public class ReplyController_p {
	
	@Autowired
	private ReplyService_p service;

}
